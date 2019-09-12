FROM node:12.2.0-alpine
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json

RUN yarn install
RUN yarn global add react-scripts@3.0.1

CMD ["yarn", "start"]


# ### STAGE 1: Build ###
# FROM node:12.2.0-alpine as build
# RUN mkdir /usr/src/app
# WORKDIR /usr/src/app
# ENV PATH /usr/src/app/node_modules/.bin:$PATH
# COPY package.json /usr/src/app/package.json
# RUN yarn install
# RUN yarn global add react-scripts -g
# COPY . /usr/src/app
# RUN yarn run build

# ### STAGE 2: Production Environment ###
# FROM nginx:1.17.3-alpine
# COPY --from=build /usr/src/app/build /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]