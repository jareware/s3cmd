FROM python:2.7.10

# Install deps
RUN wget "https://github.com/s3tools/s3cmd/releases/download/v1.5.2/s3cmd-1.5.2.tar.gz"
RUN tar -xvf s3cmd-1.5.2.tar.gz
RUN cd s3cmd-1.5.2 && python setup.py install

# Configure work area
RUN mkdir /data
WORKDIR /data

# Add a non-root default user
RUN adduser --disabled-password --gecos "" s3cmd
USER s3cmd

# Configure container
ENTRYPOINT [ "s3cmd", "--config=/config" ]
CMD [ "--help" ]
