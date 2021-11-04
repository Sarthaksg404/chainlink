FROM node:12 as build

WORKDIR /app

ADD . /app/

ARG REACT_APP_BACKEND_URL

# ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

RUN yarn

RUN yarn build

FROM nginx

COPY --from=build /app/build /usr/share/nginx/html