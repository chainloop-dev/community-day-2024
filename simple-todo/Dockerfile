FROM golang:1.18

COPY . /app
WORKDIR /app

RUN go build -o server .

EXPOSE 12345
ENTRYPOINT [ "/app/server" ]