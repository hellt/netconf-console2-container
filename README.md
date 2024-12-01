# netconf-console2 container image

This is a multi-stage Dockerfile that packages the [`netconf-console2`](https://pypi.org/project/netconf-console2/) CLI tool in an Alpine-based container image running with python3.11.

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
