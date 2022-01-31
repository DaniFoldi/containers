FROM atmoz/sftp:alpine as base
RUN mkdir -p /home/sftp \
   chmod -R 007 /home/sftp \
  ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key < /dev/null \
  ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key < /dev/null
VOLUME /etc/ssh
EXPOSE 22

FROM base as server
CMD ["sftp:password:1001"]