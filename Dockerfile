# References :
# https://raspberrypi.stackexchange.com/questions/48303/install-nodejs-for-all-raspberry-pi#48313
FROM resin/rpi-raspbian:latest

MAINTAINER admin@byte13.org

# Install usefull utilities
RUN apt-get update && \
    apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apt-utils curl wget sudo unzip iputils-ping dnsutils net-tools nmap build-essential python-rpi.gpio git

# 
# Install NodeJS from ARM tarball
#
 RUN cd /tmp
# RUN https://nodejs.org/dist/v8.4.0/node-v8.4.0-linux-armv7l.tar.xz && tar xvf node-v8.4.0-linux-armv7l.tar.xz
RUN wget https://nodejs.org/dist/v6.11.2/node-v6.11.2-linux-armv7l.tar.xz  && tar xvf node-v6.11.2-linux-armv7l.tar.xz
RUN cd node-v6.11.2-linux-armv7l && cp -R * /usr/local/
RUN rm -rf node-v6.11.2-linux-armv7l
RUN rm node-v6.11.2-linux-armv7l.tar.xz

#ENTRYPOINT ["/usr/local/bin/node","--max-old-space-size=256","red.js","-p","7777"]
#CMD ["/usr/local/bin/node-red","-p","7777"]

