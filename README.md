# Test Docker Hub CI

This is just a test of Docker Hub CI. 

## Usage

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

Build docker image:
```shell
sudo docker build . -t ci-example --target prod
```

Test docker image:
```shell
sudo docker build . --target tests
```

Run docker container:
```shell
sudo docker run -p 8888:80 ci-example
```
