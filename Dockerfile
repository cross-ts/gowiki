# Build for alpine
FROM golang:1.11.4-alpine3.8 AS build-env
COPY . /build
WORKDIR /build
RUN go build -o app wiki.go

# Run in alpine
FROM alpine:3.8
COPY --from=build-env /build/app /usr/local/bin/app
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/app"]
