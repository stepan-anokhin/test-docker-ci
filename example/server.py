import os

import tornado.ioloop as ioloop
import tornado.web as web
from tornado.escape import json_encode


class MainHandler(web.RequestHandler):
    """Web Application root handler."""

    def get(self):
        """Handle GET request."""
        self.set_header("Content-Type", "application/json")
        self.write(json_encode({"hello": self.request.uri}))


def make_application():
    """Initialize web application."""
    return web.Application([(r"/.*", MainHandler)])


if __name__ == "__main__":
    app = make_application()
    server_port = int(os.environ.get("SERVER_PORT", 8888))
    app.listen(port=server_port)
    ioloop.IOLoop.current().start()
