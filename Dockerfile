FROM python:3.6-alpine

# Create uid 1000 user
RUN apk -U add bash shadow sudo
RUN groupadd -g 1000 dyoshikawa
RUN useradd -u 1000 -g 1000 dyoshikawa
RUN sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' \
    -i /etc/sudoers
RUN sed -e 's/^wheel:\(.*\)/wheel:\1,dyoshikawa/g' -i /etc/group
RUN mkdir /home/dyoshikawa && chown 1000:1000 -R /home/dyoshikawa
RUN mkdir /work && chown 1000:1000 -R /work
WORKDIR /home/dyoshikawa
USER dyoshikawa

RUN pip install --user awscli
ENV PATH $PATH:/home/dyoshikawa/.local/bin
RUN aws configure set aws_access_key_id dummy && \
    aws configure set aws_secret_access_key dummy && \
    aws configure set default.region us-east-1 && \
    aws configure set default.output json

ENTRYPOINT []
CMD []