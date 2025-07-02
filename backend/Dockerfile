#1
FROM node:20.11-alpine3.19

RUN addgroup dia-backend -g 1001 && \
    adduser dia-backend-usr -u 1002 -D -G dia-backend

USER root

#2
RUN mkdir -p /backend
WORKDIR /backend

#3
COPY ./package.json /backend
COPY ./package-lock.json /backend
COPY .env /backend

#4
RUN npm install -g npm@10.5.2
RUN npm install --silent

#5
COPY . /backend

USER dia-backend-usr

#6
CMD [ "npm", "start"]
