FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -tags netgo -ldflags="-s -w" -o /roproxy-lite .

FROM alpine:3.20

RUN apk add --no-cache ca-certificates

WORKDIR /app

COPY --from=builder /roproxy-lite /app/roproxy-lite

ENV PORT=8080
ENV TIMEOUT=5
ENV RETRIES=5

EXPOSE 8080

CMD ["/app/roproxy-lite"]
