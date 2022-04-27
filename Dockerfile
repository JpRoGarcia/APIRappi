FROM node:14-alpine
RUN mkdir /my_app
COPY package.json .
WORKDIR /my_app
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start" ]

