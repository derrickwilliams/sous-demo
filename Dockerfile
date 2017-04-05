FROM golang:1.7

ARG APP_VERSION=0.0.0
ARG APP_REVISION=unknown
ENV SOUS_BUILD_MANIFEST=/manifest.json

COPY manifest.json ${SOUS_BUILD_MANIFEST}
COPY . /go/src/github.com/opentable/sous-demo
RUN \
  cd src/github.com/opentable/sous-demo; \
  go build -ldflags \
    "-X 'main.CustomString=$(cat customstring)' -X 'main.Version=${APP_VERSION}' -X 'main.Revision=${APP_REVISION}'" .; \
  mkdir /built; \
  cp sous-demo /built
