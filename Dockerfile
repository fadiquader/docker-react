FROM node:alpine AS builder

WORKDIR '/app'

RUN npm install -g yarn

COPY package.json .
RUN yarn install

COPY . .
RUN yarn build

#CMD ["npm", "run", "start"]

#EXPOSE 3000

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
