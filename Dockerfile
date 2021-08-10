FROM golang:alpine

LABEL maintainer="Antonius Cahyo <antoniuscahyo18@gmail.com>"

WORKDIR /app

COPY . .

# Expose port :3000 dari container
EXPOSE 3000

CMD [ "go", "run", "/app/main.go" ]