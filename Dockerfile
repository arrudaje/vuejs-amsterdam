ARG NODE_ENV
ARG VUE_APP_COMMIT_SHA


FROM docker.jfrog.booking.com/projects/bplatform/booking-nodejs:18-builder as builder
ARG NODE_ENV
ARG VUE_APP_COMMIT_SHA
ENV NODE_OPTIONS=--max_old_space_size=4096
# Copy the server and build
COPY server /app/server
# Build the server
RUN cd /app/server \
    && yarn install --pure-lockfile --production=true
# Copy .npmrc, package.json and yarn.lock
COPY client/package.json client/yarn.lock client/.npmrc /app/client/
# Build the client dependencies
RUN cd /app/client \
    && yarn install --pure-lockfile --production=false
# Copy the client and build
COPY client /app/client
# Build the client app
RUN cd /app/client \
    && yarn build --mode $NODE_ENV


FROM docker.jfrog.booking.com/projects/bplatform/booking-nodejs:18
ARG NODE_ENV
ARG VUE_APP_COMMIT_SHA
# @bookingcom/nodejs-events
# nodejs-events expects commit SHA from process.env.GIT_TAG by default
# https://gitlab.booking.com/nodejs/nodejs-events/blob/2f0cd76ef04805f73d8ff514ae65e7c6474db262/src/EventsRepo.ts?r=h.d.b.c#L130
ENV GIT_TAG ${VUE_APP_COMMIT_SHA}
# Copy built files from builder
COPY --from=builder /app/client/build /app/client/build
COPY --from=builder /app/server /app/server
# Copy the start script
COPY run.sh /app/
# Start the app
WORKDIR /app
CMD ["sh", "run.sh"]
