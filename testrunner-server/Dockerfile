FROM node:8.12.0

RUN mkdir /app
WORKDIR /app
ADD package.json yarn.lock ./
ADD __tests__ ./__tests__
RUN yarn

CMD ["yarn", "test"]
