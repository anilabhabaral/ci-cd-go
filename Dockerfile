# FROM --platform="linux/amd64" quay.io/rhn_support_abaral1/go:1.21
FROM --platform="linux/x86_64" registry.access.redhat.com/ubi8/go-toolset:latest as build

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./


# RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ci_cd_go

# EXPOSE 8080
go build -o ci-cd-go

# CMD ["./ci_cd_go"]

FROM ubi8/ubi-micro
COPY --from=build /ci-cd-go .
CMD ./ci-cd-go
