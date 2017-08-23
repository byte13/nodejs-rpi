# nodejs-rpi
NodeJS on Raspbian

This Docker file creates adds NodeJS on resin/rpi-raspbian:latest
as well as a few utilities.

According to https://forums.docker.com/t/automated-build-raspberry-pi-based-image-on-docker-hub/4155/7
it cannot be used as a source for auto-build on Docker Hub or Docker Store because 
the base image is for ARM architecture.
