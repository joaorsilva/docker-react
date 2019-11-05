#Build fase
FROM node:alpine as builder
WORKDIR './app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

#Server fase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
