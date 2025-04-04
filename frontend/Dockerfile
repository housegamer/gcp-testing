#1
FROM node:20.11-alpine3.19

#2
RUN mkdir -p /frontend
WORKDIR /frontend

# SHELL ["/bin/bash", "-c", "pwd"]

#3
COPY ./package.json /frontend
COPY ./package-lock.json /frontend
# COPY .env .

#4
RUN npm install -g npm@10.5.2
RUN npm install --silent

#5
COPY . /frontend

#6
CMD [ "npm", "start"]
