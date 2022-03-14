FROM golang:latest as builder

WORKDIR /app

COPY . .

RUN go build codeeducation.go

FROM scratch as runner 

WORKDIR /app

COPY --from=builder /app/codeeducation .

ENTRYPOINT [ "./codeeducation" ]