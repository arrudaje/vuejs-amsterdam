FROM docker.jfrog.booking.com/projects/bplatform/booking-nodejs:18-builder as builder
COPY * /app/
COPY src /app/src
COPY public /app/public
WORKDIR /app
RUN yarn install --pure-lockfile
RUN yarn build


FROM docker.jfrog.booking.com/projects/bplatform/booking-nodejs:18
COPY --from=builder /app/dist /app
