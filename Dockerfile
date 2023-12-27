FROM golang:1.21-alpine AS builder

WORKDIR /app

RUN go mod init github.com/guipalm4/desafio-docker

COPY main.go ./
RUN go build main.go

FROM scratch

WORKDIR /
COPY --from=builder /app / 
CMD ["./main"]