FROM node:alpine

WORKDIR /app

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . .

RUN yarn build

FROM nginx:alpine

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html