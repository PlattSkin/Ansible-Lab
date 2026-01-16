FROM almalinux:latest

# Ansible Base

RUN dnf -y update && dnf -y install \
    openssh-server \
    python3 \
    sudo \
    passwd \
    && dnf clean all

#SSH runtime directory

RUN mkdir /var/run/sshd

# Root password for emergencies

RUN echo "root:ansible" | chpasswd

#Generate host SSH keys
RUN ssh-keygen -A

# Root SSH key trust 
RUN mkdir -p /root/.ssh
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys

#Expose SSH
EXPOSE 22

#Start SSH
CMD ["/usr/sbin/sshd","-D"]