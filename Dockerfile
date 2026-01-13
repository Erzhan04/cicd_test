FROM golang:1.25.5 as builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o test .
RUN chmod +x /app/test

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/test /app

CMD [ "/app/test" ]
