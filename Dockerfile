# Start with Debian Slim (reliable for builds)
FROM node:lts-slim

WORKDIR /app

# 1. Force Development mode so tools install correctly
# This overrides any settings from Portainer during the build
ENV NODE_ENV=development

# 2. Install system tools
RUN apt-get update && apt-get install -y git wget python3 make g++ && rm -rf /var/lib/apt/lists/*

# 3. Copy ONLY package.json (ignore old lockfiles)
COPY package.json ./

# 4. Install ALL dependencies
RUN npm install

# 5. Copy source code
COPY . .

# 6. Build the project
# This will now work because NODE_ENV is 'development'
RUN npm run build

# 7. Switch to Production for the actual running app
ENV NODE_ENV=production

EXPOSE 4173

# 8. Start the app
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
