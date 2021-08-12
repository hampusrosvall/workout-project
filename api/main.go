package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context, event events.APIGatewayV2HTTPRequest) (string, error) {
	return fmt.Sprint(event.Body), nil
}

func main() {
	lambda.Start(HandleRequest)
}
