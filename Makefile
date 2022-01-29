step1:
	export GOPATH=$HOME/go/bin
	go install \
        github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway \
        github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2 \
        google.golang.org/protobuf/cmd/protoc-gen-go \
        google.golang.org/grpc/cmd/protoc-gen-go-grpc
gen_stub:
	protoc -I . \
		--go_out ./gen/go/ --go_opt paths=source_relative \
		--go-grpc_out ./gen/go/ --go-grpc_opt paths=source_relative \
		./proto/hello/hello.proto

gen_gw:
	protoc -I . --grpc-gateway_out ./gen/go \
		--grpc-gateway_opt logtostderr=true \
		--grpc-gateway_opt paths=source_relative \
		--grpc-gateway_opt generate_unbound_methods=true \
    	./proto/hello/hello.proto

gen_test:
	protoc -I . --grpc-gateway_out ./gen/go \
        --grpc-gateway_opt logtostderr=true \
        --grpc-gateway_opt paths=source_relative \
        --grpc-gateway_opt standalone=true \
        ./proto/hello/hello.proto