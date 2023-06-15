# Start with a minimal base image
FROM golang:1.17-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy go.mod and go.sum files to the container
COPY go-app/go.mod go-app/go.sum ./

# Download Go module dependencies
RUN go mod download

# Copy the rest of the source code
COPY go-app/ .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# Use a minimal base image for the final image
FROM alpine:latest

# Set the working directory
WORKDIR /root/

# Copy the built Go application from the previous stage
COPY --from=builder /app/app .

# Expose the necessary port
EXPOSE 9090

# Run the Go application
CMD ["./app"]
