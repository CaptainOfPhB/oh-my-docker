# Oh-My-Docker

A easy way to create an isolate development environment.

## Usage

1. Build image.
  
    ```bash
    docker build --build-arg HOST_PROXY_PORT=1234 -t oh-my-docker .
    ```

2. start container.

    ```bash
    docker run -it oh-my-docker /bin/bash
    ```

3. Initialize your environment.

    ```bash
    # in your container
    sh /root/init.sh
    ```
