FROM node:alpine as base
RUN mkdir -p /srv/server
WORKDIR /srv/server
COPY package.json,package-lock.json,.npmrc /srv/server
RUN npm ci

FROM base as source
COPY . /srv/server

FROM target as app
ENTRYPOINT ["npm"]
CMD ["start"]