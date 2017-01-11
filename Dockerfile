FROM golang:1.7

COPY . /go/src/github.com/opentable/sous-demo
RUN \
  cd src/github.com/opentable/sous-demo; \
  # [ -f customstring ] && CUSTOMSTRING=$(< customstring); \
  go build -ldflags "-X 'main.CustomString=$(cat customstring)'" .

ENTRYPOINT ["sh"]
CMD ["-c", "/go/src/github.com/opentable/sous-demo/sous-demo"]
