FROM node:10.12

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install webpack
RUN npm install -g webpack webpack-cli webpack-dev-server extract-text-webpack-plugin

# install project dependencies
RUN npm install --save dev
RUN npm install
