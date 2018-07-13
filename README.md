AWS CONTAINERIZED CLI
====

This project is to provide a Containerized implementation of the AWS CLI that will allow you to execute the aws-cli easily in any environment capable of running OCI compliant container images. 

The image will install the latest CLI and create a new user using UID `1000` called `aws-user`. The user's home folder will be `/home/aws-user` and the `~/.aws` folder will be created and the correct permissions assigned. The container `WORKDIR` will be set as `/home/aws-user/workspace`

### Usage
The easiest implementation is to create an alias that will mount two volumes in the container:
- The current path `[pwd]` to the `/home/aws-user/workspace` folder in the container. This will allow you to easily pass files to the CLI tool. 
- The AWS Config folder found in `/home/aws-user/.aws'


```bash
alias aws='docker run --rm -ti -v $HOME/.aws:/home/aws-user/.aws -v `pwd`:/home/aws-user aws-cli:latest'
```

#### Example
`aws s3 ls`

### Build the Image
```bash
docker build -t aws-cli
```

