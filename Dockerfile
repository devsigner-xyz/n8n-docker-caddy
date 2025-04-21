FROM docker.n8n.io/n8nio/n8n

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV GENERIC_TIMEZONE=UTC

# Expose the port
EXPOSE 5678

# Healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5678/rest/health || exit 1

# Start n8n
CMD ["n8n", "start"] 