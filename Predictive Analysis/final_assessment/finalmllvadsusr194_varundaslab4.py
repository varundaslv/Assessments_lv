# -*- coding: utf-8 -*-
"""finalmllvadsusr194_varundaslab4.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1gZqU7u2j2FId17Dt17rKU4fzS9u7z6Gx
"""

import pandas as pd
import numpy as np
from sklearn.ensemble import IsolationForest
import warnings
warnings.filterwarnings('ignore')
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder
le=LabelEncoder()

df = pd.read_csv("/content/anomaly_train.csv")

df.head()

df.dtypes

df.Location=le.fit_transform(df.Location)

# Select the features to be used for anomaly detection
features = ["Amount", "Time", "Location"]

# Create a new dataframe with the selected features
X = df[features]

# Fit an Isolation Forest model to the data
model = IsolationForest(n_estimators=100, contamination=0.1)
model.fit(X)

# Predict the anomalies in the data
y_pred = model.predict(X)

y_pred

# Add the predicted anomaly scores to the original dataframe
df["anomaly_score"] = model.decision_function(X)

anomalies = df.loc[df["anomaly_score"] < 0]

df_test= pd.read_csv("/content/anomaly_train.csv")

df_test.Location=le.fit_transform(df_test.Location)

x=df_test[["Amount", "Time", "Location"]]
df_values=x.values

find=df_values
result=[]
for i in find:
  z=model.predict([i])
  if z==[1]:
    result.append('no')
  elif z==[-1]:
    result.append('yes')

df_test['Anomaly']=result

# Create a scatter plot of suspicious activity vs social connections
plt.scatter(df["User"], df["anomaly_score"], label="Normal")
plt.scatter(anomalies["User"], anomalies["anomaly_score"], color="r", label="Anomaly")
plt.xlabel("Social User")
plt.ylabel("anomaly_score")
plt.legend()
plt.show()

print("************************************************************************************")
print("")
df_test.head()

