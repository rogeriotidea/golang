FROM golang:1.15-alpine

WORKDIR /go/src

COPY . .

ENTRYPOINT [ "go","run","main.go" ]
