FROM ubi8/go-toolset as build
COPY * .

RUN go build .
CMD ./ci-cd-go

