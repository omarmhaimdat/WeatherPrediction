# Weather Prediction iOS Application
> Train a weather prediction model and create a Flask API

Prediting the daily max temperature for my Hometown Casablanca, Morocco.

![Final Results](final-result.png)

## Train the model

MacOS, Linux & Windows:

```sh
python train.py
```

## Usage example

Download a large dataset of temperatures (Max, min, average it is your call) from your hometown for example. (In this repo I used data for Casablanca, Morocco).

Clean up the data and add it to the API folder, make sure to use the column names that I have in my own csv file or you can change the script to fit your `csv` file in `train.py`.

Then you can call use the `train.py` to train the model and save it to the current directory.

Finally, you can predict the weather by running the Flask API or you can call the prediction function in `predict.py` file.

## Run the API
MacOS, Linux & Windows:

```sh
python app.py
```

## My Deployed API

Hosted on `Heroku`

```
http://weather-prediction-api.herokuapp.com/{day}{month}{year}
```
## API call example

**August 24, 2019**

```
http://weather-prediction-api.herokuapp.com/24082019
```

## About me

Omar MHAIMDAT – [Linkedin](https://www.linkedin.com/in/omarmhaimdat/) – omarmhaimdat@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[Look at the rest of my repos](https://github.com/omarmhaimdat/)
