FROM circleci/ruby:2.5.1

# Install EB CLI
RUN sudo apt-get update && \
    sudo apt-get -y upgrade && \
    sudo apt-get install python3-pip && \
    pip3 install awsebcli --upgrade --user

RUN sudo apt-get install \
    # for closure compiler
    default-jre \
    # for paperclip-av-transcoder
    ffmpeg

# Install Node.js and Yarn for Webpack(er)
RUN \
  sudo curl -sL https://deb.nodesource.com/setup_11.x | sudo bash - && \
  sudo apt-get install -y nodejs && \
  sudo curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
  sudo apt-get update && sudo apt-get install yarn    
      
ENTRYPOINT /bin/bash
ENV PATH="/home/circleci/.local/bin:${PATH}"
