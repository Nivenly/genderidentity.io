# This is a multi-stage Dockerfile and requires >= Docker 17.05
# https://docs.docker.com/engine/userguide/eng-image/multistage-build/
FROM gobuffalo/buffalo:v0.9.2 as builder

RUN mkdir -p $GOPATH/src/github.com/nivenly/genderidentity
WORKDIR $GOPATH/src/github.com/nivenly/genderidentity

# this will cache the npm install step, unless package.json changes
ADD package.json .
RUN npm install
ADD . .
# RUN buffalo build --static -o /bin/app
#
# FROM alpine:3.6
# RUN apk add --no-cache \
#     bash \
#     ca-certificates \
#     wget

# Hugo stuff
ENV HUGO_VERSION 0.25.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit
ENV HUGO_TARBALL ${HUGO_BINARY}.tar.gz
RUN set -xe; \
  cd  /usr/local/; \
  wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_TARBALL}; \
  mkdir /usr/local/${HUGO_BINARY}; \
  tar xzf /usr/local/${HUGO_TARBALL} -C /usr/local/${HUGO_BINARY}; \
  ln -s /usr/local/${HUGO_BINARY}/hugo /usr/local/bin/hugo; \
  rm /usr/local/${HUGO_TARBALL}

# Comment out to run the binary in "production" mode:
# ENV GO_ENV=production

#WORKDIR /bin/

#COPY --from=builder /bin/app .
#COPY hugo/ /bin/hugo/

EXPOSE 3000

# Comment out to run the migrations before running the binary:
# CMD /bin/app migrate; /bin/app
CMD ["buffalo", "dev"]
