# Build stage
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Run stage
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

