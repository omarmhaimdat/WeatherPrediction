from flask import Flask
from flask_restful import Resource, Api
from predict import predict_weather

app = Flask(__name__)
api = Api(app)


class WeatherPrediction(Resource):

    def get(self, date: str):
        print(date)
        prediction = predict_weather(date)
        print(prediction)
        return {'prediction': prediction}


api.add_resource(WeatherPrediction, '/<string:date>')

if __name__ == '__main__':
    app.run(debug=True)
