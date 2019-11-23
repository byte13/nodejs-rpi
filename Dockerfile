# References :
# https://raspberrypi.stackexchange.com/questions/48303/install-nodejs-for-all-raspberry-pi#48313
# FROM resin/rpi-raspbian:latest
FROM balenalib/raspberry-pi:latest

# Install usefull utilities
RUN apt-get update && \
    apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apt-utils curl wget libudev-dev sudo unzip iproute2 iputils-ping dnsutils net-tools nmap build-essential python-rpi.gpio python-picamera git

# 
# Install NodeJS from ARM tarball
#
RUN cd /tmp
#RUN wget https://nodejs.org/dist/v6.11.3/node-v6.11.3-linux-armv7l.tar.xz  && tar xvf node-v6.11.3-linux-armv7l.tar.xz
RUN wget https://nodejs.org/dist/v13.2.0/node-v13.2.0-linux-armv7l.tar.gz && \
    tar zxvf node-v13.2.0-linux-armv7l.tar.gz && \
    rm node-v13.2.0-linux-armv7l.tar.gz && \
    cd node-v13.2.0-linux-armv7l && \
    cp -R * /usr/local/ && \
    rm -rf node-v13.2.0-linux-armv7l

# Install Open-Zwave 
RUN cd /tmp && \
    wget "https://github.com/ekarak/openzwave-debs-raspbian/blob/master/v1.4.79/openzwave_1.4.79.gfaea7dd_armhf.deb" && \
    wget "https://github.com/ekarak/openzwave-debs-raspbian/blob/master/v1.4.79/libopenzwave-doc_1.4.79.gfaea7dd_all.deb" && \
    wget "https://github.com/ekarak/openzwave-debs-raspbian/blob/master/v1.4.79/libopenzwave1.3_1.4.79.gfaea7dd_armhf.deb" && \
    wger "https://github.com/ekarak/openzwave-debs-raspbian/blob/master/v1.4.79/libopenzwave1.3-dev_1.4.79.gfaea7dd_armhf.deb" && \ 
    sudo dpkg -i *openzwave*.deb
RUN npm install -g openzwave-shared
