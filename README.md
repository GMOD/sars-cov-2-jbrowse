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

Thanks to Michael Levy for writing much of the following.

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
  $ git clone https://github.com/GMOD/sars-cov-2-jbrowse.git
  $ cd sars-cov-2-jbrowse
  $ docker build --no-cache -t sars-cov-2-jbrowse -f ./Dockerfile .
  $ docker run -d -p 8080:80 sars-cov-2-jbrowse
```
and browse to http://localhost:8080/jbrowse.  Technically the `--no-cache` 
isn't required here but will be necessary for future executions if
you want to pull in changes in this repo.

## Making changes for yourself or other

That starts to get a little more complicated, but the best way to do that
is to fork this repo, make the changes you'd like to make, modify the
Dockerfile to pull your forked version and build away. If you'd like to see
those change make it back into this repo, feel free to issue a pull request.

## Making suggestions or corrections

Please either file an issue at https://github.com/GMOD/sars-cov-2-jbrowse/issues or contact Scott Cain directly at scott@scottcain.net.
