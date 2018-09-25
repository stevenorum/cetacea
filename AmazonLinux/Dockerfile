FROM amazonlinux:latest

RUN yum update -y && yum install -y aws-cli python36 python36-devel python3-pip tree unzip wget which

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade awscli
COPY scripts /root/scripts
