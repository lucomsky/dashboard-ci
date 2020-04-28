FROM ubuntu:18.04

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y apt-utils python python-dev python-pip git build-essential openssh-client curl libffi-dev \
      apt-transport-https gnupg2 unzip gnupg-agent software-properties-common \
    && pip install dump-env docker-compose httpie

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
      && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
         $(lsb_release -cs) stable" \
      && apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
      && unzip awscliv2.zip && ./aws/install && rm -rf ./aws awscliv2.zip

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y kubectl

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
