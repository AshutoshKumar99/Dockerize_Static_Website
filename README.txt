# Dockerized Static Website

This repository contains a Dockerfile for deploying a static website using Apache HTTP Server. The website files are fetched from a GitHub repository, extracted, and served through an Apache server running in a Docker container.

## Dockerfile Overview

The Dockerfile automates the process of creating a Docker container that:

1. **Uses Ubuntu as a base image**.
2. **Installs Apache2**, `wget`, and `unzip` packages.
3. **Downloads a static website** from a GitHub repository.
4. **Extracts the downloaded website files** and moves them to the Apache web server’s document root.
5. **Starts Apache2 in the foreground** so the container remains running.

## Features

- Based on **Ubuntu:latest**.
- Installs **Apache2** web server.
- Downloads and extracts the static website files directly from GitHub.
- Exposes **port 80** for HTTP traffic.
- Automatically runs Apache2 when the container starts.

## Requirements

- Docker installed on your local machine or server.

## How to Build the Docker Image

1. **Clone this repository** to your local machine or server:

   ```bash
   git clone https://github.com/AshutoshKumar99/Dockerize-Static-Website.git
   cd Dockerize-Static-Website

2. **Build the Docker image from the Dockerfile
bash: 
   docker build -t static-website .   
    Note:This command will build the image and tag it as static-website

3. **Once the image is built, you can run the container using the following command:
docker run -d -p 80:80 static-website
Note: This will Start the container in detached mode (-d).
Map port 80 on your local machine to port 80 in the container (-p 80:80), allowing you to access the website from your browser.

4. **Accessing the Website
After running the container, open your browser and visit http://localhost (or the IP address of your machine if running on a remote server). You should see the static website served by Apache. 
