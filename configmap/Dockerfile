FROM golang:1.14 as builder
WORKDIR /app
ADD go.mod go.sum /app/
RUN go mod download
ADD main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o app ./main.go

FROM alpine:3
WORKDIR /app
COPY --from=builder /app/app .
CMD "./app"