# docker-rsync
---
This repository built to address the different version between the server and client rsync version. Just mount your SSH key to the docker using `-v` and execute the `rsync` command.

# HOW TO BUILD
```shell
docker build -t rsync \
  --build-arg UBUNTU_VERSION=latest \
  --build-arg RSYNC_VERSION=3.4.1 \
  -f Dockerfile .
```

# HOW TO USE
```shell
docker run -it -v ./output:/output -v ./keypair:/.ssh rsync -avzP --inplace --compress-level=9 -e 'ssh -i /.ssh/id_rsa -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new -T -c aes128-gcm@openssh.com -o Compression=no' user@host:/path/to/source/file /output/
```
