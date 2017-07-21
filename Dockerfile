FROM node:alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock /usr/src/app/
RUN yarn

# Bundle app source
COPY . /usr/src/app

# Hugo stuff
ENV HUGO_VERSION 0.25.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit
ENV HUGO_TARBALL ${HUGO_BINARY}.tar.gz

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_TARBALL} /usr/local/
RUN mkdir /usr/local/${HUGO_BINARY} \
    && tar xzf /usr/local/${HUGO_TARBALL} -C /usr/local/${HUGO_BINARY} \
    && ln -s /usr/local/${HUGO_BINARY}/hugo /usr/local/bin/hugo \
    && rm /usr/local/${HUGO_TARBALL}

# Off we go
EXPOSE 80
CMD [ "npm", "start" ]