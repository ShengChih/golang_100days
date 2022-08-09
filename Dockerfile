FROM golang:latest
RUN apt-get update -qq \
    && apt-get install -y build-essential \
        sudo \
    && useradd -ms /bin/bash ec2-user \
    && sudo usermod -aG sudo ec2-user \
    && echo "root:`tr -dc A-Za-z0-9 </dev/urandom | head -c 13`" > /home/ec2-user/root_passwd \
    && cat /home/ec2-user/root_passwd | chpasswd \
    && mkdir -p /home/ec2-user/workspace/ && chown ec2-user: /home/ec2-user/workspace/ \
    && echo "ec2-user:`tr -dc A-Za-z0-9 </dev/urandom | head -c 13`" > /home/ec2-user/ec2-user_passwd
USER ec2-user
WORKDIR /home/ec2-user/workspace/
