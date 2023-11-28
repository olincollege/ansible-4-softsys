# Build an image to test an Ansible playbook for installing whisper.cpp.
FROM ubuntu:22.04
ARG ADMIN=admin
ARG PLAYBOOK=main.yml
RUN apt-get update && apt-get install -y \
    sudo \
    ansible 
RUN adduser --gecos "" ${ADMIN} && \
    passwd -d ${ADMIN} && \ 
    usermod -aG sudo ${ADMIN}
USER ${ADMIN}
WORKDIR /home/${ADMIN}
COPY $PLAYBOOK /home/${ADMIN}
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /home/${ADMIN}

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]