# Build stage can be referred as 0
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Run stage using 0 
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

