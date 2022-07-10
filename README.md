# Oh-My-Docker

A easy way to create an isolate development environment, based on [Arch Linux](https://hub.docker.com/_/archlinux).

## Usage

```bash
# build image locally
docker build --build-arg HOST_PROXY_PORT=1234 -t oh-my-docker .
# run container
docker run -it oh-my-docker
```

## Publish

```bash
# rebuild image locally if Dockerfile changed
docker build --build-arg HOST_PROXY_PORT=1234 -t oh-my-docker .
# add tag
docker tag <image_id> <your_dockerhub_username>/oh-my-docker:latest
# push to registry
docker push <your_dockerhub_username>/oh-my-docker:latest
```

## FAQ

### What is the build arg `HOST_PROXY_PORT`?

It's your host **http** proxy port. You can use it to speed up building image (e.g. speed up git clone).
