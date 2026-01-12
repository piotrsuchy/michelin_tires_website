# Start from the official extended Hugo image which includes Node.js (needed for Tailwind)
# We use Alpine for a smaller footprint
FROM klakegg/hugo:ext-alpine AS base

# Switch to root to ensure we can install dependencies and write to directories
# The klakegg image defaults to a non-root user 'hugo'
USER root

WORKDIR /app

# Copy package files first to leverage Docker cache for npm install
COPY package.json package-lock.json ./

# --- Development Stage ---
FROM base AS dev
# In dev, we mount the volume, so we don't copy code. 
# We run npm install (to ensure node_modules exists/is up to date) then start the server.
# bind 0.0.0.0 is needed to access the server from outside the container
# We need to override the base image's ENTRYPOINT (which is 'hugo') to run shell commands
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["npm install && hugo server -D --bind 0.0.0.0"]

# --- Builder Stage ---
FROM base AS builder
# Install clean dependencies for production
RUN npm ci
# Copy the rest of the source code
COPY . .
# Build the static site (Minify and Garbage Collect)
RUN hugo --gc --minify

# --- Production Stage ---
FROM nginx:alpine AS prod
# Copy the build output from the builder stage to Nginx html directory
COPY --from=builder /app/public /usr/share/nginx/html
# Expose standard HTTP port
EXPOSE 80
# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
