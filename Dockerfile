# Build for alpine
FROM golang:1.11.4-alpine3.8 AS build-env
COPY . /build
WORKDIR /build
RUN go build -o server wiki.go

# Run in alpine
FROM alpine:3.8
WORKDIR app
COPY --from=build-env /build/server /build/view.html /build/edit.html ./
EXPOSE 8080
ENTRYPOINT ["./server"]
