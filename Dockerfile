FROM golang:1.23 AS hellogo

WORKDIR /usr/src/app

COPY hello.go .

RUN go build -ldflags="-s -w" hello.go

FROM scratch
COPY --from=hellogo /usr/src/app/hello /bin/hello

CMD [ "hello" ]
