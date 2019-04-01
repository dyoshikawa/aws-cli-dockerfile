FROM python:2.7

RUN pip install --user awscli
ENV PATH=$PATH:/root/.local/bin
RUN aws configure set aws_access_key_id dummy && \
    aws configure set aws_secret_access_key dummy && \
    aws configure set default.region us-east-1 && \
    aws configure set default.output json

ENTRYPOINT []
CMD []