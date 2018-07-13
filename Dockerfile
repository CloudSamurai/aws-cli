FROM python:3-alpine

# Let's Update Pip and Install the AWSCLI
RUN pip install --upgrade pip awscli

# Create a New Home and User for the CLI User
RUN adduser -D -h /home/aws-user -u 1000 aws-user && mkdir -p /home/aws-user/.aws && mkdir -p /home/aws-user/workspace && chown -R 1000:1000 /home/aws-user/

USER aws-user
VOLUME /home/aws-user/workspace
WORKDIR /home/aws-user/workspace

ENTRYPOINT ["/usr/local/bin/aws"]
CMD []