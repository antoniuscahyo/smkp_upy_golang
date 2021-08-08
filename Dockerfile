FROM golang:alpine

WORKDIR /app

COPY . .

# Expose port :3000 dari container
EXPOSE 3000

CMD [ "go", "run", "/app/main.go" ]