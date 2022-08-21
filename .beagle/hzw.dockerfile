FROM centos:6

ARG AUTHOR
ARG VERSION

LABEL maintainer=mengkzhaoyun@gmail.com version=2021

RUN groupadd -g 500 pirate && \
useradd -u 500 -g pirate pirate && \
yum install -y memcached sudo epel-release dumb-init && \
yum install -y libmcrypt && \
echo 'pirate    ALL=(ALL)       NOPASSWD:ALL' >> /etc/sudoers

COPY --chown=pirate:pirate home/pirate /home/pirate

COPY --chown=pirate:pirate www /home/pirate/www

COPY --chown=pirate:pirate entrypoint.sh /home/pirate

RUN chmod +x /home/pirate/entrypoint.sh

USER pirate

ENTRYPOINT ["/home/pirate/entrypoint.sh"]