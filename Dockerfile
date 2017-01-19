FROM golang:1.7

ARG APP_VERSION=0.0.0
ARG APP_REVISION=unknown

COPY . /go/src/github.com/opentable/sous-demo
RUN \
  cd src/github.com/opentable/sous-demo; \
  go build -ldflags \
    "-X 'main.CustomString=$(cat customstring)' -X 'main.Version=${APP_VERSION}' -X 'main.Revision=${APP_REVISION}'" .

CMD ["sh", "-c", "/go/src/github.com/opentable/sous-demo/sous-demo"]
