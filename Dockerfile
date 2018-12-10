FROM node:10-alpine AS build-env

WORKDIR /build
ADD package.json package-lock.json ./
RUN npm i

COPY src/ src/
COPY test/ test/
COPY tsconfig* jest.config.js tslint.json ./
RUN npm run build && \
    npm prune --production

FROM gcr.io/distroless/nodejs:debug
WORKDIR /app
COPY --from=build-env /build/dist ./
COPY --from=build-env /build/package.json ./
COPY --from=build-env /build/node_modules ./node_modules
CMD ["server.js"]