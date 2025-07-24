#!/bin/bash

DOCKER_DIR="./docker"
API_DIR="./api"
APP_DIR="./app"

setup() {
  echo "🔧 Setting up environment..."

  # Laravel .env
  if [ ! -f "$API_DIR/.env" ]; then
    cp "$API_DIR/.env.example" "$API_DIR/.env"
    echo "✅ Laravel .env created"
  fi

  # Vue .env
  if [ ! -f "$APP_DIR/.env" ] && [ -f "$APP_DIR/.env.example" ]; then
    cp "$APP_DIR/.env.example" "$APP_DIR/.env"
    echo "✅ Vue .env created"
  fi

  echo "📦 Installing Laravel dependencies..."
  docker compose -f "$DOCKER_DIR/docker-compose.yml" run --rm api composer install

  echo "📦 Installing Vue dependencies..."
  docker compose -f "$DOCKER_DIR/docker-compose.yml" run --rm app npm install

  echo "🔨 Building containers..."
  docker compose -f "$DOCKER_DIR/docker-compose.yml" build

  echo "✅ Setup complete"
}

start() {
  echo "🚀 Starting containers..."
  docker compose -f "$DOCKER_DIR/docker-compose.yml" up -d
}

stop() {
  echo "🛑 Stopping containers..."
  docker compose -f "$DOCKER_DIR/docker-compose.yml" down
}

case "$1" in
  setup)
    setup
    ;;
  start)
    start
    ;;
  stop)
    stop
    ;;
  *)
    echo "Usage: ./dev.sh {setup|start|stop}"
    ;;
esac
