FROM docker:19.03-dind

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python python-dev py-pip git build-base openssh-client curl libffi-dev openssl-dev \
    && pip install dump-env docker-compose httpie
