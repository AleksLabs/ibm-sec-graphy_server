FROM node:18-alpine
RUN apk update && \
    apk add --no-cache openssl=3.1.4-r6 libcrypto3=3.1.4-r6 && \
    rm -rf /var/cache/apk/*
COPY graphserver.js .
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
EXPOSE  4000
CMD node graphserver.js
