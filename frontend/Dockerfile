#1
FROM node:20.11-alpine3.19

RUN addgroup dia-frontend -g 1001 && \
    adduser dia-frontend-usr -u 1002 -D -G dia-frontend

#2
RUN mkdir -p /frontend
WORKDIR /frontend

#3
COPY ./package.json /frontend
COPY ./package-lock.json /frontend
COPY .env ./frontend

#4
RUN npm install -g npm@10.5.2
RUN npm install --silent

#5
COPY . /frontend

USER dia-frontend-usr

#6
CMD [ "npm", "start"]
