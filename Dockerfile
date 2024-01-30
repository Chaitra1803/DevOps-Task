# Use a base image with a web server (e.g., Nginx)
FROM nginx:alpine

# Copy the index.html file to the default Nginx web server directory
COPY index.html /usr/share/nginx/html/

# Expose port 8081 for the web application
EXPOSE 8081
