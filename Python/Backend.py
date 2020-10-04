from flask import Flask, redirect, url_for, request, redirect
from flask_restful import Resource, Api
from webScrape import WebScrape
import json

app = Flask(__name__)
api = Api(app)

class HelloWorld(Resource):
    def get(self):
        webscraper = WebScrape()
        webscraper.run()

api.add_resource(HelloWorld, '/')

if __name__ == '__main__':
    app.run(debug=True)