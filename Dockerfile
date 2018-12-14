FROM node:10-alpine AS build-env

WORKDIR /build
COPY package.json package-lock.json ./
RUN npm i

COPY src/ src/
COPY test/ test/
COPY tsconfig* jest.config.js tslint.json ./
RUN npm run build && \
    npm prune --production

FROM gcr.io/distroless/nodejs:debug

ARG NAME
ARG DESCRIPTION
ARG VERSION
ARG COMMIT_SHA
ARG BUILD_TIMESTAMP
ARG VCS_URL

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date="$BUILD_TIMESTAMP"
LABEL org.label-schema.name="$NAME"
LABEL org.label-schema.description="$DESCRIPTION"
LABEL org.label-schema.vcs-url="$VCS_URL"
LABEL org.label-schema.vcs-ref="$COMMIT_SHA"
LABEL org.label-schema.vendor="Koenighotze"
LABEL org.label-schema.docker.cmd="docker run --rm=true -ti --init -p 3000:3000 koenighotze/techdemo-service"

LABEL org.koenighotze.version=$VERSION
LABEL maintainer=koenighotze@gmail.com

WORKDIR /app
COPY --from=build-env /build/dist ./
COPY --from=build-env /build/package.json ./
COPY --from=build-env /build/node_modules ./node_modules

CMD ["server.js"]