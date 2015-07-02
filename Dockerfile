FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y s3cmd

WORKDIR /
ENTRYPOINT [ "s3cmd", "--config=/config" ]
CMD [ "--help" ]
