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
CMD ansible-playbook -K $PLAYBOOK -e "git_user_name=Alan Turing git_user_email=alan@turing.org"