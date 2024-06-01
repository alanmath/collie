# Collie

Esse serviço tem como objetivo registrar os microsserviços de cada squad das empresas para que depois seja realizada uma análise desses microsserviços em relação as vulnerabilidades presentes neles. No momento, o serviço tem a infraestrutura inicial geral do projeto, cobrindo os microsserviços, as squads e as empresas (company).

|Microsserviço|Implementação|Resource|Swagger|
|---|---|---|---|
|Microsservices|[collie.service](https://github.com/alanmath/collie.service) | [collie.service-resource](https://github.com/alanmath/collie.service-resource) |[doc](http://localhost:8080/microservices/swagger-ui/index.html#/) |
| Squad | [collie.squad](https://github.com/alanmath/collie.squad) | [collie.squad-resource](https://github.com/alanmath/collie.squad-resource) | [doc](http://localhost:8080/squad/swagger-ui/index.html#/) |
| Company | [collie.company](https://github.com/alanmath/collie.company) | [collie.company-resource](https://github.com/alanmath/collie.company-resource) | [doc](http://localhost:8080/company/swagger-ui/index.html#/) |
| Account | [collie.account](https://github.com/alanmath/collie.account) | [collie.account-resource](https://github.com/alanmath/collie.account-resource) | [doc](http://localhost:8080/accounts/swagger-ui/index.html#/) |
| Auth | [collie.auth](https://github.com/alanmath/collie.auth) | [collie.auth-resource](https://github.com/alanmath/collie.auth-resource) | [doc](http://localhost:8080/auth/swagger-ui/index.html#/) |

|Outros|
|---|
|[collie.discovery](https://github.com/alanmath/collie.discovery)|
|[collie.gateway](https://github.com/alanmath/collie.gateway)|
|[collie.docker-api](https://github.com/alanmath/collie.docker-api)|

# Microsserviços
## Microservices
Microsserviço que mantém registro dos microsserviços que serão analisados pela plataforma. Os atrelando a alguma squad.

## Squad
Microsserviço que mantém registro das squads que compõem as suas respectivas empresas. 

## Company
Microsserviço que mantém registro das empresas que utilizam o serviço.

# Apresentação Slides

https://www.canva.com/design/DAGGGf9LyD0/7Z_buP9QCz8Xg5CTeYrJkg/edit