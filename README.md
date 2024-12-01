# netconf-console2 container image

This is a multi-stage Dockerfile that packages the [`netconf-console2`](https://pypi.org/project/netconf-console2/) CLI tool in an Alpine-based container image running with python3.11.

> [!NOTE]  
> This repo has been renamed from `netconf-console-docker` to `netconf-console2-container` with the switch to the new package name.  
> The container image is named `ghcr.io/hellt/netconf-console2:3.0.1` according to the new package name. The old image is still available as `ghcr.io/hellt/netconf-console:latest`.

Details and instructions are provided in this [blog post](https://netdevops.me/2020/netconf-console-in-a-docker-container/).

## Usage

```bash
docker run --rm -i -t ghcr.io/hellt/netconf-console2:3.0.1 \
--host=srl --port 830 -u admin -p 'NokiaSrl1!' \
--hello
```

## Build

```bash
# considering 3.0.1 is the intended version
bash build.sh 3.0.1
```

The build step aslo includes the push action, so on successful build the linux/arm64 and linux/amd64 images will be pushed to the ghcr.io repository.
