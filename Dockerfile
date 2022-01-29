FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build <--- all the stuff run app in prod need is here

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html