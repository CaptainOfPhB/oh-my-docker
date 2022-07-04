# Oh-My-Docker

A easy way to create an isolate development environment.

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
docker tag <image_id> captainofphb/oh-my-docker:latest
# push to registry
docker push captainofphb/oh-my-docker:latest
```
