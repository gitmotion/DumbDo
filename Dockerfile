FROM node:18-slim

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Create data directory
RUN mkdir -p data

# Environment variables
ENV PORT=3000
# Don't set a default for DUMBDO_PIN as it will override docker-compose values
# ENV DUMBDO_PIN=

# Expose port (use the PORT env variable)
EXPOSE ${PORT}

# Start the application
CMD ["node", "server.js"] 