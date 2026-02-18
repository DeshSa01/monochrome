# 1. Use the full Node.js image (Bookworm)
# This is larger (~1GB) but includes all system libraries, preventing 'missing library' errors.
FROM node:22-bookworm

WORKDIR /app

# 2. Install system updates
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 3. Copy package files
COPY package.json ./

# 4. Install dependencies with aggressive flags
# --include=dev: forces dev tools (Vite) to install
# -g vite: installs Vite globally just in case the local link fails
RUN npm install --include=dev && npm install -g vite

# 5. Copy the rest of the source code
COPY . .

# 6. Build the project
# We use 'npx vite build' to explicitly look for the binary
RUN npx vite build

# 7. Expose the port
EXPOSE 4173

# 8. Start the app
# We use 'npx vite preview' because the standard 'npm run preview' might fail if it can't find the local bin
CMD ["npx", "vite", "preview", "--host", "0.0.0.0"]
