FROM docker:19.03-dind

RUN apk update \
    && apk upgrade \
    && apk add python python-dev py-pip git build-base openssh-client curl \
    && pip install dump-env docker-compose httpie
