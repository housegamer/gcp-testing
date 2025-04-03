#1
FROM node:20.11-alpine3.19

#2
RUN mkdir -p /backend
WORKDIR /backend

# SHELL ["/bin/bash", "-c", "pwd"]

#3
COPY ./backend/package.json .
COPY ./backend/package-lock.json .
# COPY .env .

#4
RUN npm install -g npm@10.5.2
RUN npm install --silent

#5
COPY . .

#6
CMD [ "npm", "start"]
