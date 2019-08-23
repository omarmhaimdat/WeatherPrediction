import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.externals import joblib
from sklearn.tree import DecisionTreeRegressor


column_names = ['DATE', 'MAX_TEMPERATURE_C']


def train():

    data_set = './export-casablanca-3.csv'

    data = pd.read_csv(data_set, sep=',', names=column_names)

    x = data['DATE']
    y = data['MAX_TEMPERATURE_C']

    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.5, random_state=123)

    x_train = x_train.values.reshape(-1, 1)

    tree_model = DecisionTreeRegressor()

    tree_model.fit(x_train, y_train)
    joblib.dump(tree_model, 'weather_prediction.pkl')
    print("Done training")


if __name__ == "__main__":
    train()
