FROM ubuntu:latest

RUN apt-get update && apt-get -y install curl git-core cmake make build-essential sudo

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
