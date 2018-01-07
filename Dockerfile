# References :
# https://raspberrypi.stackexchange.com/questions/48303/install-nodejs-for-all-raspberry-pi#48313
FROM resin/rpi-raspbian:latest

# Install usefull utilities
RUN apt-get update && \
    apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apt-utils curl wget sudo unzip iproute2 iputils-ping dnsutils net-tools nmap build-essential python-rpi.gpio python-picamera git

# 
# Install NodeJS from ARM tarball
#
RUN cd /tmp
#RUN wget https://nodejs.org/dist/v6.11.3/node-v6.11.3-linux-armv7l.tar.xz  && tar xvf node-v6.11.3-linux-armv7l.tar.xz
RUN wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-armv7l.tar.xz && \
    tar xvf node-v8.9.4-linux-armv7l.tar.xz && \
    rm node-v8.9.4-linux-armv7l.tar.xz && \
    cd node-v8.9.4-linux-armv7l && \
    cp -R * /usr/local/ && \
    rm -rf node-v8.9.4-linux-armv7l

#ENTRYPOINT ["/usr/local/bin/node","--max-old-space-size=256","red.js","-p","7777"]
#CMD ["/usr/local/bin/node-red","-p","7777"]

