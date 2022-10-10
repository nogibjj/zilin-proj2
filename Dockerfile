FROM python:3

RUN sudo apt-get update && add-apt-repository ppa:openjdk-r/ppa && apt-get -y install update openjdk-11-jdk python3-pip zip unzip
RUN pip install -r requirements.txt

RUN export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
