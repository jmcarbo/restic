FROM ubuntu-debootstrap:14.04
RUN apt-get update && apt-get -y install openssh-client
ADD restic.linux /bin/restic
RUN chmod +x /bin/restic
RUN useradd -m deploy
USER deploy
WORKDIR /home/deploy
