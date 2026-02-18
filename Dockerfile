# Node Alpine -- multi-arch (amd64 + arm64)
FROM node:lts-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y wget python3 make g++ && rm -rf /var/lib/apt/lists/*

# Copy ONLY package.json (We intentionally SKIP package-lock.json)
COPY package.json ./

# Install dependencies FRESH (generates a new lockfile for Debian)
RUN npm install

# Copy the rest of the project
COPY . .

# Build the project
RUN npm run build

# Expose Vite preview port
EXPOSE 4173

# Run the built project
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
