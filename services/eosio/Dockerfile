FROM ubuntu:latest

# Update apps on the base image
RUN apt-get -y update && apt-get install -y

RUN apt-get -y install build-essential \
  cmake \
  make \
  clang \
  gcc \
  g++ \
  sudo \
  git-core \
  wget \
  curl \
  vim \
  tmux \
  tree

# Copy files from host to image
COPY ./ /opt/application

# Install EOS Contract Development Toolkit
RUN apt install /opt/application/utils/eosio.cdt-1.4.1.x86_64.deb

# Define working directory
WORKDIR /opt/application

## Add the wait script to the image
ADD ./utils/wait /wait
RUN chmod +x /wait

# Used by start.sh
ENV DATA_DIR /root/data-dir
ENV CONFIG_DIR /opt/application/config

## Launch the wait tool and then start nodeos ( see docker compose, we are waiting for mongo)
CMD /wait && /opt/application/scripts/start.sh
