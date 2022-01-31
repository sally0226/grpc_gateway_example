# grpc_gateway_example
grpc gateway 예시 코드

## 서버 구조
- grpc gateway 서버 / :8081
- grpc 서버 (helloService 제공) / :9090

- client가 `localhost:8081/특정url`로 요청을 보내면, grpc gateway 서버가 해당 url을 처리하는 grpc 서버로 요청을 넘기고, grpc 서버가 요청을 처리하고, grpc gateway가 client에게 응답한다.
	- 여러 서버가 통신을 통해 client에게 서비스? api?를 제공하고 있지만, client는 제일 앞단에 있는 grpc gateway 서버밖에 모른다. (내부에서 어떤 서버들이 있고, 어떻게 통신하는지 알 수 없음)

- grpc gateway를 열기 위해 gin gonic 프레임워크를 사용하였다.


## reference

[grpc gateway github tutorial](https://github.com/grpc-ecosystem/grpc-gateway#usage)

[grpc server github tutorial](https://grpc.io/docs/languages/go/basics/)