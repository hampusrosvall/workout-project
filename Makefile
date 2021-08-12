build:
	env GOOS=linux GOARCH=amd64 go build -o bin/ ./...

nodeinstall:
	npm install --no-audit
