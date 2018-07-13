FROM python:3-alpine

# Let's Update Pip and Install the AWSCLI
RUN pip install --upgrade pip awscli

# Create a New Home and User for the CLI User
RUN adduser -D -h /home/aws-user -u 1000 aws-user && mkdir -p /home/aws-user/.aws && chown -R 1000:1000 /home/aws-user/.aws

USER aws-user
VOLUME /home/aws-user/
WORKDIR /home/aws-user

ENTRYPOINT ["/usr/local/bin/aws"]
CMD []