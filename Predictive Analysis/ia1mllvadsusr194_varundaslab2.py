# -*- coding: utf-8 -*-
"""IA1mlLVADSUSR194_VarunDaslab2.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/14TrT4A-zLdjGQTxjXHx75HHxw1cym63l
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.preprocessing import MinMaxScaler,StandardScaler,LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score,mean_squared_error
from sklearn.preprocessing import LabelEncoder
le=LabelEncoder()

from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, confusion_matrix, classification_report

df1=pd.read_csv('/content/booking.csv')

df1.head()

df1.dtypes

df1.info()

df1.shape

df1.describe(include='all')

df1.dtypes

df1.duplicated().sum()

"""**Univariant analysis**"""

for column in df1.select_dtypes(include={'float64','int64'}).columns:
  plt.figure(figsize=(10,5))
  sns.histplot(df1[column])
  plt.title(f'Histogram of {column}')
  plt.xlabel(column)
  plt.ylabel('Frequency')
  plt.show()

"""**Bivariant**"""

#scatter plot

numerical_columns=df1.select_dtypes(include={'float64','int64'}).columns

for i in range(len(numerical_columns)):
    for j in range(i + 1, len(numerical_columns)):
        plt.figure(figsize=(10, 6))
        sns.scatterplot(data=df1, x=numerical_columns[i], y=numerical_columns[j])
        plt.title(f'Scatter Plot between {numerical_columns[i]} and {numerical_columns[j]}')
        plt.show()

#heatmap
#correlation matrix
numerical_columns = df1.select_dtypes(include=['float64', 'int64']).columns
correlation_matrix = df1[numerical_columns].corr()
print("Correlation matrix:\n", correlation_matrix)

#heatmap
plt.figure(figsize=(14, 8))
sns.heatmap(correlation_matrix, annot=True, fmt=".2f", cmap='coolwarm')
plt.title('Heatmap of Correlation Matrix')
plt.show()

df1.dtypes

df1.isnull().sum()

df1['average price']=df1['average price'].fillna(df1['average price'].median())

df1['special requests']=df1['special requests'].fillna(df1['special requests'].median())

df1['booking status']=df1['booking status'].fillna(df1['booking status'].mode())

#Outlier boxplot
# Identify numerical columns by data type
numerical_columns = df1.select_dtypes(include=['float64', 'int64']).columns

# Create a box plot for each numerical column
for column in numerical_columns:
    plt.figure(figsize=(10, 6))  # Set the figure size for better readability
    sns.boxplot(x=df1[column])
    plt.title(f'Box Plot of {column}')
    plt.xlabel(column)
    plt.show()

df1.dtypes

df1["type of meal"]=le.fit_transform(df1["type of meal"])
df1["room type"]=le.fit_transform(df1["room type"])
df1["market segment type"]=le.fit_transform(df1["market segment type"])
df1["date of reservation"]=le.fit_transform(df1["date of reservation"])
df1["booking status"]=le.fit_transform(df1["booking status"])
df1.rename(columns={'booking status':'booking_status'}, inplace=True)

x1 = df1.drop(columns = ['booking_status','Booking_ID','date of reservation'])
y1 = df1[['booking_status']]

x1_train, x1_test, y1_train, y1_test=train_test_split(x1,y1,test_size=0.2)

#min max for category
scaler=MinMaxScaler()
x1_train = scaler.fit_transform(x1_train)
x1_test = scaler.transform(x1_test)

# Create and train logistic regression model
model = LogisticRegression()
model.fit(x1_train, y1_train)
# Predictions
y1_pred = model.predict(x1_test)

# Evaluation
print("Confusion Matrix:")
print(confusion_matrix(y1_test, y1_pred))
print("\nClassification Report:")
print(classification_report(y1_test, y1_pred))
# Accuracy
accuracy = accuracy_score(y1_test, y1_pred)
print("Accuracy:", accuracy)

# Precision
precision = precision_score(y1_test, y1_pred)
print("Precision:", precision)

# Recall
recall = recall_score(y1_test, y1_pred)
print("Recall:", recall)

# F1-score
f1_score = f1_score(y1_test, y1_pred)
print("F1-score:", f1_score)