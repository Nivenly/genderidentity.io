FROM starefossen/ruby-node

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock /usr/src/app/
RUN yarn
RUN gem install jekyll
# RUN gem install bundler
# RUN gem install minima
# RUN gem install jekyll-feed

# Bundle app source
COPY . /usr/src/app

EXPOSE 3000
CMD [ "npm", "start" ]
