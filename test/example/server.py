from tornado.escape import json_decode
from tornado.testing import AsyncHTTPTestCase
from tornado.web import Application

from example.server import make_application


class TestApp(AsyncHTTPTestCase):
    def get_app(self) -> Application:
        return make_application()

    def test_main(self):
        request_uri = "/"
        response = self.fetch(request_uri)
        self.assertEqual(response.code, 200)
        self.assertEqual(response.headers["Content-Type"], "application/json")
        self.assertEqual(json_decode(response.body), {"hello": request_uri})
