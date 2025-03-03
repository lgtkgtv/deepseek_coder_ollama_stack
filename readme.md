# DeepSeek Coder 1.3B with Ollama and Open WebUI

## Quick Start

1. Install Docker if needed:
    sudo apt-get update
    sudo apt-get install docker.io docker-compose

2. Start the stack:
    docker-compose up -d

3. Pull the model:
    ./pull_model.sh

4. Open your browser:
    http://localhost:3000

5. Chat away!

## To Stop:
    docker-compose down

## Security
- All services bound to localhost.
- Uses a private Docker network.
