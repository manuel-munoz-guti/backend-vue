FROM debian:10-slim
WORKDIR /app
RUN apt-get update \
  && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs
RUN npm install -g json-server
COPY . .
ENTRYPOINT ["json-server", "db.json", "--port", "3333", "--host", "0.0.0.0"]