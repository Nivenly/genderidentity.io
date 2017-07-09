FROM starefossen/ruby-node

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock /usr/src/app/
RUN yarn
RUN gem install jekyll jekyll-paginate-v2 jekyll-paginate jekyll-sitemap jekyll-gist jekyll-feed jemoji

# Bundle app source
COPY . /usr/src/app

EXPOSE 80
CMD [ "npm", "start" ]
