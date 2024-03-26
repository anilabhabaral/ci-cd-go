FROM --platform="linux/amd64" quay.io/rhn_support_abaral1/go:1.21


WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./


RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ci-cd-go

EXPOSE 8080

CMD ["./ci-cd-go"]
