FROM node:lts-alpine as build

WORKDIR /usr/src/app

COPY package.json .


RUN npm install --only=Production

COPY . .

RUN npx prisma generate

RUN npm run build

#---------------------------------------------------------------------------------------
FROM node:lts-slim

RUN apt update && apt install libssl-dev dumb-init -y --no-install-recommends

WORKDIR /usr/src/app

ENV NODE_ENV production

COPY --chown=node:node --from=build /usr/src/app/dist ./dist
# COPY --chown=node:node --from=build /usr/src/app/.env .env
COPY --chown=node:node --from=build /usr/src/app/package.json .
COPY --chown=node:node --from=build /usr/src/app/prisma ./prisma
COPY --chown=node:node --from=build /usr/src/app/node_modules/.prisma/client  ./node_modules/.prisma/client

RUN yarn install --only=Production

CMD ["dumb-init", "npm","run", "start:prod"]
