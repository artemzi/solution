FROM ubuntu:16.04
LABEL maintainer="Artem Z."

# set env variables
ENV TERM xterm
ENV EDITOR nano

# install packages
RUN apt-get update && apt-get install -y \
    nano

# add new user & set work dir
ARG UNAME=stepik
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME
USER $UNAME
CMD /bin/bash
WORKDIR /home/stepik

# create volume
VOLUME ["/home/stepik"]

# open editor on start and get filename from host
# if provided
ENTRYPOINT ["nano"]
CMD ["test"]

