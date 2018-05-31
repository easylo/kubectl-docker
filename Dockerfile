FROM alpine

LABEL maintainer="Laurent RICHARD <easylo@gmail.com>"

ARG K8S_VERSION=v1.10.3

RUN apk update && apk add ca-certificates bash sed && rm -rf /var/cache/apk/* && \
    wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl && \
    chmod a+x /usr/local/bin/kubectl

CMD ["bash"]
