#1
FROM node:20.11-alpine3.19

RUN addgroup dia-backend -g 1001 && \
    adduser dia-backend-usr -u 1002

USER dia-backend

#2
RUN mkdir -p /backend
WORKDIR /backend

# SHELL ["/bin/bash", "-c", "pwd"]

#3
COPY ./package.json /backend
COPY ./package-lock.json /backend
COPY .env /backend

#4
RUN npm install -g npm@10.5.2
RUN npm install --silent

#5
COPY . /backend

#6
CMD [ "npm", "start"]
