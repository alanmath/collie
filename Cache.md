# In-Memory Database

Roteiro Individual - Livia Tanaka

Caching é uma técnica de otimização baseado na fato de que dados que são frequentemente acessados seram guardados em um cache para reduzir o tempo e a carga que envolve buscar o dado na base de dados original.

Com o objetivo de otimizar nosso serviço, foi implementado um sistema de cache nos microsserviços `squad`, `company` e `service`. Para demonstrar como ele foi implementado usarei o `squad de exemplo`.

## Em cada microsserviço que o cache foi implementado
### No `pom.xml`
Adicionar bibliotecas que serão utilizadas 

```xml
    <!-- cache em memória -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-cache</artifactId>
    </dependency>

    <!-- cache com redis -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-redis</artifactId>
    </dependency>
    <dependency>
        <groupId>redis.clients</groupId>
        <artifactId>jedis</artifactId>
    </dependency>
```

### No `application.yaml`
Definir o enderço do host do servidor Redis e a sua porta.

```yml
spring:
  application:
    name: collie-squad

  redis:
    host: redis
    port: 6379
```

### Criar classe de configuração do redis `RediConfig.java`

```java
package insper.collie.squad.config;

import org.springframework.context.annotation.Configuration;
...
import redis.clients.jedis.JedisPoolConfig;

@Configuration
public class RedisConfig {
    
    @Value("${spring.redis.host}")
    private String host;
    
    @Value("${spring.redis.port}")
    private int port;
    

    // referência: https://blog.devgenius.io/redis-spring-boot-docker-compose-722ea61d68e9
    @Bean
    public JedisConnectionFactory jedisConnectionFactory() {
        // configura a conexão com o Redis com o host e porta fornecidos
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration();
        redisStandaloneConfiguration.setHostName(host);
        redisStandaloneConfiguration.setPort(port);
        
        return new JedisConnectionFactory(redisStandaloneConfiguration);
    }
    
    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        // configura o template do Redis e os serializadores para as chaves e os valores
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(redisConnectionFactory);
        template.setValueSerializer(new JdkSerializationRedisSerializer());
        return template;
    }

    // referência https://dev.to/jackynote/a-guide-to-using-redis-in-spring-boot-custom-cachemanager-4e5k
    @Bean
    public CacheManager cacheManager(RedisConnectionFactory connectionFactory) {
        // Configura o gerenciador de cache do Redis
        return RedisCacheManagerBuilder
            .fromConnectionFactory(connectionFactory)
            .withCacheConfiguration("squads",
                RedisCacheConfiguration.defaultCacheConfig()
                    .entryTtl(Duration.ofMinutes(10)) // TTL set to 10 minutes
            )
            .build();
    }
}
```

### No `SquadApplication.java`
Adicionar anotação que habilita o uso de cache 

```java
@EnableCaching 
@SpringBootApplication
public class SquadApplication {
    ...
}
```

### Para as classes que definem o microsserviço
No caso, `SquadModel`, `SquadAllInfo` e `SquadInfo`. As classes devem ser serializadas, pois esse é o formato que o redis compreende. Por isso as classes devem implmentar `Serializable`

```java
public class SquadModel implements Serializable {...}
```

### No `SquadService.java`
Para cada rota que deseja utilizar o cache adicionar uma das seguintes anotações, considerando a função da rota.


**`@Cacheable`** - Métodos que se deseja cachear o seu retorno. Rotas de leitura
```java
@Cacheable(value="squads", key="#id")
public SquadAllInfo getSquad(String id) {...}
```

**`@CachePut`** - Serve para atualizar informações do cache, ou seja, para rotas que alteram de alguma maneira o cache sendo por criação ou edição
```java
@CachePut(value="squads", key = "#result.id()")
public Squad create(Squad in) {...}
```

**`@CacheEvict`** - Remove dados do cache. Rotas de deletar.
```java
@CacheEvict(value="squads", key = "#id", condition = "#result != null")
public void delete(String id) {...}
```

## No microsserviço docker-api

### No `docker-compose.yaml`
Configurar imagem do Redis.

```yaml
services:
  redis:
    image: redis:latest
    container_name: redis
    networks:
      - private-network
```




#### Referências
* [Aprenda a usar cache nos seus projetos Spring Boot!](https://youtu.be/YcI9b-lgi7w?si=EUlS85aYH6HNxt-6)
* [How to build an App with Redis, Spring Boot and Docker Compose](https://blog.devgenius.io/redis-spring-boot-docker-compose-722ea61d68e9)
* [A Guide to Using Redis in Spring Boot: Custom CacheManager](https://dev.to/jackynote/a-guide-to-using-redis-in-spring-boot-custom-cachemanager-4e5k)
* [Spring Boot Caching Mechanism](https://medium.com/vedity/spring-boot-caching-mechanism-8ef901147e60)
