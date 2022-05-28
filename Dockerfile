FROM ubuntu:latest

LABEL name="nodedev"
LABEL version="latest"

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# prevent dialog during apt install
ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
    && apt install -y \
    sudo \
    dialog \
    && apt autoremove -y \
    && apt clean -y \
    && apt autoclean -y

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# add user "dev" as non-root user
RUN useradd -ms /bin/bash dev

# Set sudoer for "dev"
RUN echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# set permission for dev directory
RUN chown dev:dev -R "home/dev"

# Switch to user "dev" from now
USER dev

RUN mkdir /home/dev/nodejs-developer

COPY ./install.sh /home/dev

RUN exec /home/dev/install.sh

WORKDIR /home/dev

CMD ["/bin/zsh"]