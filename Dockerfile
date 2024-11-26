# Start from the official Ubuntu image as the base image
FROM ubuntu:latest

# Metadata: Add maintainer information
LABEL maintainer="Ashutosh"

# Metadata: Define the version of the image
LABEL version="1.0.0"

# Update the package list and install required packages in a single RUN command
# This reduces the number of layers in the final image, improving build efficiency
RUN apt-get update -y && apt-get install -y apache2 wget unzip

# Set the working directory to /tmp to download and unzip the website files
WORKDIR /tmp

# Download the static website zip file from the GitHub repository
RUN wget https://github.com/AshutoshKumar99/Dockerize_Static_Website/archive/refs/heads/main.zip

# Unzip the downloaded file to extract the website files
RUN unzip main.zip

# Copy the extracted website files to the Apache server's web directory (/var/www/html)
# Dockerize_Static_Website-main is the extracted folder from main.zip
RUN cp -r Dockerize_Static_Website-main/* /var/www/html

# Expose port 80 so the Apache web server can be accessed externally
EXPOSE 80

# Start the Apache web server in the foreground (keeps the container running)
CMD ["apachectl", "-D", "FOREGROUND"]
