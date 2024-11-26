# Start from the official Ubuntu image as the base image
FROM ubuntu 

# Metadata: Add maintainer information
LABEL Maintainer="Ashutosh"

# Metadata: Define the version of the image
LABEL version="1.0.0"

# Update the package list and upgrade installed packages
RUN apt-get update -y

# Install Apache web server
RUN apt-get install apache2 -y

# Install wget for downloading files from the internet
RUN apt-get install wget -y

# Install unzip to extract .zip files
RUN apt-get install unzip -y

# Set the working directory to /tmp to download and unzip the website files
WORKDIR /tmp

# Download the static website zip file from the GitHub repository
RUN wget https://github.com/AshutoshKumar99/Dockerize_Static_Website/archive/refs/heads/main.zip

# Unzip the downloaded file to extract the website files
RUN unzip main.zip 

# Copy the extracted website files to the Apache server's web directory (/var/www/html), unzipped folder is Dockerize_Static_Website-main
RUN cp -r Dockerize_Static_Website-main/* /var/www/html

# Expose port 80 so the Apache web server can be accessed externally
EXPOSE 80

# Start the Apache web server in the foreground (keeps the container running)
CMD ["apachectl", "-D", "FOREGROUND"]
