# Use ubuntu 22.04 as base image
FROM ubuntu:22.04
# Install Ansible and sudo
RUN apt-get update && apt-get install -y \
    sudo \
    ansible 
# Set the user to add to the sudo group
ARG ADMIN=admin
RUN adduser --gecos "" ${ADMIN} && \
    passwd -d ${ADMIN} && \ 
    usermod -aG sudo ${ADMIN}
USER ${ADMIN}
WORKDIR /home/${ADMIN}
# Copy the playbook to the container from the local directory
ARG PLAYBOOK=main.yml
COPY $PLAYBOOK /home/${ADMIN}
# Set the playbook as an environment variable to be used in the CMD
ENV PLAYBOOK=${PLAYBOOK}
# Run the playbook with variables passed in
CMD ansible-playbook $PLAYBOOK -K -e "git_user_name=Alan Turing git_user_email=alan@turing.org skip_ssh=true"