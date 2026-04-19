# RoProxy Lite
A modified version of RoProxy made for self-hosting.

Setup is easy, simply deploy with the button below and configure environment variables. The KEY variable is optional, leave blank to not require an auth key.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/halffalse/roproxy-lite)
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/fV9Lxm)
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

When "KEY" environment variable is populated, a matching "PROXYKEY" header must be present. Requests must be made in the format /subdomain/path. E.g. https://games.roblox.com/docs -> https://roproxytest.heroku.com/games/docs

## Docker

Build and run:

```bash
docker build -t roproxy-lite .
docker run -p 8080:8080 -e KEY=your_secret_key roproxy-lite
```

Optional environment variables:

- `PORT` (default: `8080`)
- `TIMEOUT` (default: `5`)
- `RETRIES` (default: `5`)
- `KEY` (optional)

## Docker Compose

```bash
docker compose up -d --build
```

Then access the proxy at `http://localhost:8080`.

Health check endpoint: `GET /health` (also `/healthz`) returns `200 ok`.

## Coolify

1. Create a new service in Coolify from this repository.
2. Select Dockerfile-based deployment.
3. Keep port `8080` (or set `PORT` to your preferred value).
4. Set environment variables (`TIMEOUT`, `RETRIES`, optional `KEY`) in Coolify.
5. Deploy.
