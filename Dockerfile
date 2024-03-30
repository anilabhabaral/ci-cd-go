# # FROM --platform="linux/amd64" quay.io/rhn_support_abaral1/go:1.21
# FROM registry.access.redhat.com/ubi8/go-toolset:latest as build

# WORKDIR /app

# COPY go.mod go.sum ./
# RUN go mod download

# COPY *.go ./


# # RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ci_cd_go

# # EXPOSE 8080
# go build .

# # CMD ["./ci_cd_go"]

# FROM ubi8/ubi-micro
# COPY --from=build /app/ci-cd-go .
# EXPOSE 8080

# CMD ./ci-cd-go



FROM ubi8/go-toolset as build
COPY ./src .

RUN go mod init my_app && \
    go mod tidy && \
    go build .

FROM ubi8/ubi-micro
COPY --from=build /opt/app-root/src/my_app .
CMD ./my_app
