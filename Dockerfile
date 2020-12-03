FROM python:3.8.6

# Add files
RUN mkdir /server
ADD example /server/example
ADD requirements.txt /server/
WORKDIR /server

# Install dependencies
RUN pip install -r requirements.txt

# Start server
EXPOSE 80/tcp
ENV SERVER_PORT=80
CMD ["python", "-m", "example.server"]
