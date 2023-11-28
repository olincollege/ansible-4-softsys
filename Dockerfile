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
ENV PLAYBOOK=${PLAYBOOK}
CMD ansible-playbook $PLAYBOOK --extra-vars "git_user_name=some_user git_user_email=some_email@some_domain.com"