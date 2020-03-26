# JBrowse for SARS-Cov-2 (coronavirus causing covid-19)

This project is used as one of the foundations of http://covbrowser.org/,  
a pastebin for SARS-CoV-2 genomes. It's a way to get a permanent, shareable
URL for a coronavirus isolate, displayed in a genome browser alongside the
reference strain, with variants highlighted and annotations that are
dynamically updated.

This repo contains the configuration files for a SARS-CoV-2 JBrowse instance
with several tracks as well as a Dockerfile for running that instance. A 
running version of that intance is at

  http://covid19.jbrowse.org/

and the Docker image can be obtained from Docker Hub:

  https://hub.docker.com/r/gmod/sars-cov-2-jbrowse

## Running from Docker

Thanks to Michael for writing much of the following.

1) Download docker -- this is a useful way to write code so it can run many places and install appropriate dependencies that don't mess with code and packages already on the system.

Here's how to do it on ubuntu:
```
  $ sudo apt-get update
  $ sudo apt-get install docker-engine
  $ sudo service docker start
  $ sudo docker run hello-world
```
If this works then you get a little print out saying welcome to docker. If not, at the moment, Google is your friend.

For Macs, install Docker from 

  https://docs.docker.com/docker-for-mac/install/

and Windows:

  https://docs.docker.com/docker-for-windows/install/

2) Now type:
```
  $ sudo docker pull gmod/sars-cov-2-jbrowse
  $ docker run -d -p 8080:80 gmod/sars-cov-2-jbrowse
```
to download the code and start up your docker instance.

3) Point your web browser to http://localhost:8080/jbrowse/ 

## Building a Docker container yourself

If you would like to build this container yourself, it's pretty easy.
After installing Docker, checkout the GitHub repo:
```
  $ git clone 
```
