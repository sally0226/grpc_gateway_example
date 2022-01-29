package main

import (
	"context"
	"fmt"
	"google.golang.org/grpc"
	pb "grpc_gateway_test/gen/go/proto/hello"
	"log"
	"net"
)

const portNumber = "9090"

type helloServer struct {
	pb.UnimplementedHelloServiceServer
}

func (s *helloServer) Echo(ctx context.Context, message *pb.StringMessage) (*pb.StringMessage, error) {
	fmt.Println(message)
	return &pb.StringMessage{Name: "Hello " + message.Name + "!"}, nil
}
func newServer() *helloServer {
	s := &helloServer{}
	return s
}

func main() {
	lis, err := net.Listen("tcp", ":"+portNumber)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer()

	log.Printf("start gRPC server on %s port", portNumber)
	pb.RegisterHelloServiceServer(grpcServer, newServer())
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}
}
