# Use an official Node.js runtime as the base image
FROM node:latest

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json ./

RUN chown -R $(whoami) /usr/local/lib/node_modules
RUN chown -R $(whoami) /usr/local/bin
RUN chown -R $(whoami) ~/.npm

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 8080 for the application
EXPOSE 8080

# Define the command to run the application
CMD [ "npm", "start" ]