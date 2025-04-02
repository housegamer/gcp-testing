FROM ubuntu:24.04

RUN mkdir -p /backend
WORKDIR /backend

RUN echo 'hello world' > test.txt

RUN echo test.txt
RUN ls -la
