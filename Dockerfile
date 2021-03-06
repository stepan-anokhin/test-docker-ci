FROM python:3.8.6 AS prod

# Add files
RUN mkdir /server
ADD example /server/example
ADD requirements.txt /server/
WORKDIR /server

# Install dependencies
RUN pip install -r requirements.txt

# Label the image with commit information
ARG GIT_HASH=unspecified
LABEL git_hash=$GIT_HASH

# Start server
EXPOSE 80/tcp
ENV SERVER_PORT=80
CMD ["python", "-m", "example.server"]

FROM prod AS tests

ADD test /server/test
RUN ["python", "-m", "tornado.testing", "test.example.server"]
