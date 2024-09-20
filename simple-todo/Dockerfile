FROM golang:1.18 AS builder

COPY . /app
WORKDIR /app

RUN go build -o server .

FROM scratch

COPY --from=builder /app/server /app/server

EXPOSE 12345
ENTRYPOINT [ "/app/server" ]