# syntax=docker/dockerfile:1

FROM golang:1.19

# Build the server
WORKDIR /src/hakstore-server
COPY cmd/hakstore-server/* ./
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o /hakstore-server

# Build the client
WORKDIR /src/hakstore-client
COPY cmd/hakstore-client/* ./
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o /hakstore-client

EXPOSE 80

CMD ["/hakstore-server"]