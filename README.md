# n8n-docker-caddy

Get up and running with n8n on the following platforms:

* [DigitalOcean tutorial](https://docs.n8n.io/hosting/server-setups/digital-ocean/)
* [Hetzner Cloud tutorial](https://docs.n8n.io/hosting/server-setups/hetzner/)
* [Railway deployment](#railway-deployment)

## Prerequisites

Self-hosting n8n requires technical knowledge, including:

* Setting up and configuring servers and containers
* Managing application resources and scaling
* Securing servers and applications
* Configuring n8n

n8n recommends self-hosting for expert users. Mistakes can lead to data loss, security issues, and downtime. If you aren't experienced at managing servers, n8n recommends [n8n Cloud](https://n8n.io/cloud/).

## Getting Started

### 1. Environment Setup

Create a `.env` file in the root directory with the following variables:

```bash
# For local development
DATA_FOLDER=/path/to/your/data/folder
GENERIC_TIMEZONE=UTC

# For Railway deployment
N8N_HOST=0.0.0.0
N8N_PORT=5678
N8N_PROTOCOL=https
WEBHOOK_URL=https://your-railway-url.up.railway.app/
```

### 2. Start the Services

#### Local Development
To start the services locally, run:

```bash
docker-compose up -d
```

This will:
- Create necessary volumes automatically
- Start n8n on port 5678 (internal)
- Start Caddy as a reverse proxy handling SSL/TLS termination on port 443

#### Railway Deployment
1. Connect your GitHub repository to Railway
2. Railway will automatically detect the Dockerfile and railway.toml
3. Set the following environment variables in Railway's dashboard:
   ```bash
   N8N_HOST=0.0.0.0
   N8N_PORT=5678
   N8N_PROTOCOL=https
   WEBHOOK_URL=https://your-railway-url.up.railway.app/
   GENERIC_TIMEZONE=UTC
   ```
4. Deploy the application

### 3. Access n8n

#### Local Development
Once the services are running locally, you can access n8n at:
```
https://localhost
```

Note: Your browser might show a security warning because of the self-signed certificate. This is normal for local development.

#### Railway Deployment
Access n8n through your Railway URL:
```
https://your-railway-url.up.railway.app
```

### 4. Stopping the Services

#### Local Development
To stop the services:

```bash
docker-compose down
```

To remove volumes (this will delete all data):
```bash
docker-compose down -v
```

#### Railway Deployment
Use Railway's dashboard to stop or restart the service.

## Configuration

### Caddy Configuration

The Caddy configuration is located in `caddy_config/Caddyfile`. It includes:
- SSL/TLS termination with automatic certificate generation
- Reverse proxy configuration
- Gzip compression (disabled for SSE)
- HTTPS on port 443

### n8n Configuration

n8n is configured through environment variables. Key settings include:
- Host and port configuration
- HTTPS protocol
- Timezone configuration
- Webhook URL setup

## Railway Deployment

When deploying to Railway:
1. Railway will automatically handle SSL/TLS termination
2. The application will be built using the provided Dockerfile
3. Set the environment variables in Railway's dashboard
4. Railway will provide a random URL for your deployment
5. You can add a custom domain in Railway's dashboard if needed

## Troubleshooting

If you encounter issues:
1. Check the logs: `docker-compose logs` (local) or Railway dashboard logs
2. Verify environment variables are set correctly
3. Ensure ports 443 and 5678 are not in use by other services (local only)
4. Check volume permissions (local only)
5. For local development, accept the self-signed certificate in your browser

## Support

If you have questions after trying the tutorials, check out the [forums](https://community.n8n.io/).
