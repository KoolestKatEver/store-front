# Use the official Node.js image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the Vue.js app for production
RUN npm run build

# Expose port 8080 (or whatever port your app runs on)
EXPOSE 8080

# Define environment variables for the API URLs
ENV VUE_APP_ORDER_SERVICE_URL=https://order-service.fake.net/
ENV VUE_APP_PRODUCT_SERVICE_URL=https://product-service.fake.net/

# Start the application
CMD [ "npm", "run", "serve" ]
