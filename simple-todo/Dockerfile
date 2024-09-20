FROM golang:1.22 AS builder

COPY . /app
WORKDIR /app

RUN go build -o server .

EXPOSE 12345
ENTRYPOINT [ "/app/server" ]