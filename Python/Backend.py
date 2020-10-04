# from webScrape import WebScrape
# from flask import Flask, redirect, url_for, request, redirect
# import json

# app = Flask(__name__)

# @app.route('/internships')
# def run():
#     webscraper = WebScrape()
#     webscraper.run()
#     with open('C:/Users/ajayj/Desktop/Github/jobU/JSONWebServer/internships.json') as f:
#         data = json.load(f)
#     return json.dumps(data)

# @app.route('/', methods = ['GET'])
# def called():
#     return redirect("/internships")

# if __name__ == '__main__':
#     app.run()
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
        with open('C:/Users/ajayj/Desktop/Github/jobU/JSONWebServer/internships.json') as f:
            data = json.load(f)
        return data

api.add_resource(HelloWorld, '/')

if __name__ == '__main__':
    app.run(debug=True)