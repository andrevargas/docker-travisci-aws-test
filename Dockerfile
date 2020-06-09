FROM node:alpine AS build

WORKDIR /app

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . .

RUN yarn build

FROM nginx:alpine

EXPOSE 80

COPY --from=build /app/build /usr/share/nginx/html