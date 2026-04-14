FROM jenkins/jenkins:lts

USER root


RUN apt-get update && apt-get install -y \
curl \
unzip \
wget 


RUN wget http://releases.hashicorp.com/terraform/1.14.8/terraform_1.14.8_linux_amd64.zip && \
unzip terraform_1.14.8_linux_amd64.zip && \
mv terraform /usr/local/bin/ && \
rm terraform_1.14.8_linux_amd64.zip


EXPOSE 8080


USER jenkins


