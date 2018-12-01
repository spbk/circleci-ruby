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
  curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
  sudo apt-get install -y nodejs && \
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  sudo apt-get update && sudo apt-get install yarn    
      
ENTRYPOINT /bin/bash
ENV PATH="/home/circleci/.local/bin:${PATH}"
