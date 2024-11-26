FROM ubuntu 
LABEL Maintainer = "Ashutosh"
LABEL version = 1.0.0
RUN apt-get update -y
RUN apt-get install apache2 -y
RUN 