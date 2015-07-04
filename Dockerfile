FROM ubuntu:14.04

# Install deps
RUN apt-get update -y
RUN apt-get install -y s3cmd

# Configure work area
RUN mkdir /data
WORKDIR /data

# Configure container
ENTRYPOINT [ "s3cmd", "--config=/config" ]
CMD [ "--help" ]
