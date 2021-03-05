FROM golang:alpine as builder

RUN apk update && apk add --no-cache git
WORKDIR /go/src
COPY . .
RUN go env -w GO111MODULE=auto
RUN CGO_ENABLED=0 GOOS=linux go build -a -o app .

FROM scratch
COPY --from=builder /go/src/app /src/app
CMD ["/src/app"]
