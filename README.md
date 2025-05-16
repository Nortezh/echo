```ascii
    _____ ____ _   _  ___  
   | ____/ ___| | | |/ _ \ 
   |  _|| |   | |_| | | | |
   | |__| |___|  _  | |_| |
   |_____\____|_| |_|\___/ 
                      
   by nortezh.com
```

# Echo by [nortezh.com](https://nortezh.com)

[![License: Unlicensed](https://img.shields.io/badge/license-Unlicensed-blue.svg)](LICENSE)

A simple HTTP request echo service built with NestJS. Echo returns information about incoming HTTP requests, helping developers debug and understand HTTP traffic.

## Features

- Returns HTTP request details in plain text format
- Displays request method, URL, and HTTP version
- Shows all request headers
- Includes IP information (X-Forwarded-For, X-Forwarded-Proto, X-Real-Ip)
- Containerized for easy deployment

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v18 or later)
- [Bun](https://bun.sh/) (v1.2 or later)
- [Docker](https://www.docker.com/) (optional, for containerized deployment)

### Installation

Clone the repository:

```bash
git clone https://github.com/Nortezh/echo.git
cd echo
```

Install dependencies:

```bash
bun install
```

### Development

Start the development server:

```bash
bun run start:dev
```

The server will be available at http://localhost:3000.

### Testing

Run tests:

```bash
bun run test
```

Run end-to-end tests:

```bash
bun run test:e2e
```

## Docker Deployment

Build and run using Docker Compose:

```bash
docker-compose up -d
```

Or build and run the Docker image directly:

```bash
docker build -t echo-service .
docker run -p 3000:3000 echo-service
```

## Usage

Send any HTTP request to the server, and it will respond with a plain text representation of your request:

```bash
curl http://localhost:3000
```

Example response:

```
GET / HTTP/1.1
Host: localhost:3000
User-Agent: curl/7.79.1
Accept: */*
X-Forwarded-For: 127.0.0.1
X-Forwarded-Proto: http
X-Real-Ip: 127.0.0.1
```

## Environment Variables

- `PORT`: The port on which the server will listen (default: 3000)

## Contributing

Please read our [Contributing Guide](CONTRIBUTING.md) for details on our development workflow, commit conventions, and pull request process.

## License

This project is currently unlicensed.

---
Brought to you by [nortezh.com](https://nortezh.com)
