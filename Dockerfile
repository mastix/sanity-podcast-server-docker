FROM node:alpine

LABEL maintainer="Sascha Sambale <mastixmc@gmail.com>" \
      org.label-schema.name="Sanity Podcast Server" \
      org.label-schema.description="Sanity Podcast Server containerized" \
      org.label-schema.vcs-url="https://github.com/mastix/sanity-podcast-server-docker‚" \
      org.label-schema.version=latest \
      org.label-schema.schema-version="1.0"

WORKDIR /opt/sanity-podcast-server

RUN apk add --no-cache git

RUN echo "unsafe-perm = true" >> ~/.npmrc
RUN npm cache clean --force
RUN npm cache verify
RUN git clone https://github.com/mastix/sanity-podcast-server.git /opt/sanity-podcast-server
RUN npm install

EXPOSE 8888

CMD ["npm", "run", "start"]
