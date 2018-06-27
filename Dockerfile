FROM circleci/ruby:2.5.1

# Install EB CLI
RUN sudo apt-get update && \
    sudo apt-get -y upgrade && \
    sudo apt-get install python3-pip && \
    pip3 install awsebcli --upgrade --user

ENV PATH="/home/circleci/.local/bin:${PATH}"
