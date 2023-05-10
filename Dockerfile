FROM node:alpine as builder
WORKDIR '/code'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /code/build /usr/share/nginx/html
