FROM node:alpine as base
RUN mkdir -p /srv/server
WORKDIR /srv/server
COPY package.json,package-lock.json /srv/server
RUN npm ci

FROM base as source
COPY . /srv/server

FROM source as target
RUN npm run build

FROM target as app
ENTRYPOINT ["npm"]
CMD ["start"]