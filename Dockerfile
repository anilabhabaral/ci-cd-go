# FROM --platform="linux/amd64" quay.io/rhn_support_abaral1/go:1.21
FROM --platform="linux/x86_64" registry.access.redhat.com/ubi8/go-toolset:latest

WORKDIR /app

COPY go.mod go.sum ./
# RUN go mod download

COPY *.go ./


RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ci-cd-go

EXPOSE 8080

CMD ["./ci-cd-go"]
