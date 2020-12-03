# Test Docker Hub CI

This is just a test of Docker Hub CI. 

## Usage

### Development

Install dependencies:
```shell
pip install -r requirements.txt
```

Run server:
```shell
python3 -m example.server
```

Run tests:
```shell
python3 -m tornado.testing test.example.server
```

### Docker

Build docker image:
```shell
sudo docker build . -t ci-example --build-arg GIT_HASH="$(git rev-parse --short HEAD)" --target prod
```

Test docker image:
```shell
sudo docker build . --build-arg GIT_HASH="$(git rev-parse --short HEAD)" --target tests
```

Run docker container:
```shell
sudo docker run -p 8888:80 ci-example
```

### Make

Build docker image
```shell
make build
```

Run tests in docker container
```
make test
```
