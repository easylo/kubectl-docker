FROM alpine

LABEL maintainer="Laurent RICHARD <easylo@gmail.com>"

ARG K8S_VERSION=v1.10.3

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/* && \
    wget -O /kubectl https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl && \
    chmod +x /kubectl
    
ENTRYPOINT ["/usr/local/bin/dumb-init","--","/usr/local/bin/docker-entrypoint.sh"]
CMD ["bash"]
