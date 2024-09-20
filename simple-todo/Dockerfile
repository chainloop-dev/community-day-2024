FROM golang:1.23.0 AS builder

COPY . /app
WORKDIR /app

RUN go build -o server .

EXPOSE 12345
ENTRYPOINT [ "/app/server" ]