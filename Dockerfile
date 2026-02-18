# Node Slim (Debian)
FROM node:lts-slim

WORKDIR /app

# 1. Install system tools (git is often needed for dependencies)
RUN apt-get update && apt-get install -y git wget python3 make g++ && rm -rf /var/lib/apt/lists/*

# 2. Copy package file
COPY package.json ./

# 3. FORCE install ALL dependencies (including dev tools like Vite)
# The --production=false flag is the critical fix here.
RUN npm install --production=false

# 4. Copy source code
COPY . .

# 5. Build the project (Vite should now be found)
RUN npm run build

# 6. Clean up: Now we can remove dev tools to save space (Optional, but good practice)
RUN npm prune --production

# 7. Setup runtime
ENV NODE_ENV=production
EXPOSE 4173

# 8. Start the app
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
