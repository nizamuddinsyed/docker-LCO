FROM node:alpine as teamAlpha

WORKDIR /var/app

COPY ./package.json .

RUN npm install

COPY ./ ./

RUN npm run build


FROM nginx as teamFinal
EXPOSE 80
COPY --from=teamAlpha /var/app/build /usr/share/nginx/html