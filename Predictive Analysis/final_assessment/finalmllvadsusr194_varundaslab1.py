# -*- coding: utf-8 -*-
"""finalmllvadsusr194_varundaslab1.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/15gFY9dZI-Af_Acb-cTngkvGSSd1xznm6
"""

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from scipy.cluster.hierarchy import dendrogram, linkage
from scipy.cluster.hierarchy import fcluster
from sklearn.cluster import KMeans
from sklearn.preprocessing import MinMaxScaler,LabelEncoder
le=LabelEncoder()
from sklearn.metrics import silhouette_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler,LabelEncoder
from sklearn.cluster import KMeans
from sklearn.metrics import accuracy_score, precision_score, recall_score, confusion_matrix, classification_report, f1_score
from sklearn.ensemble import RandomForestRegressor
from xgboost import XGBClassifier
from sklearn.ensemble import AdaBoostRegressor
from imblearn.over_sampling import SMOTE
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression,LinearRegression
from xgboost import XGBRegressor

from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, confusion_matrix, classification_report,r2_score,mean_squared_error

import warnings
warnings.filterwarnings("ignore")

df = pd.read_csv("/content/Fare prediction.csv")
df.head(10)

df.shape

df.info()

df.describe(include='all')

df.dtypes

df.isnull().sum()

df.duplicated().sum()

# #Univariate Histogram
# for column in df.select_dtypes(include=['float64','int64']).columns:
#   plt.figure(figsize=(10,5))
#   sns.histplot(df[column])
#   plt.title(f'Histogram of {column}')
#   plt.xlabel(column)
#   plt.ylabel('Frequency')
#   plt.show()

# #Univariate Categorical Bar graph
# for column in df.select_dtypes(include=['object']).columns:
#   plt.figure(figsize=(10,5))
#   df[column].value_counts().plot(kind='bar')
#   plt.title(f'Bar graph of {column}')
#   plt.xlabel(column)
#   plt.ylabel('Count')
#   plt.show()

df.isnull().sum()

df.dtypes

df["key"]=pd.to_numeric(df['key'],errors='coerce')

df.columns

df.head()

df=df.drop(columns=['key','pickup_datetime'])

#Boxplot to treat outliers
for column in df.select_dtypes(include=['float64','int64']).columns:
  plt.figure(figsize=(10,5))
  sns.boxplot(x=df[column])
  plt.title(f'Boxplot of {column}')
  plt.xlabel(column)
  plt.show()

#Outlier Identification
q1 = np.percentile(df['pickup_longitude'],25)
q3 = np.percentile(df['pickup_longitude'],75)
iqr = q3-q1

lower_bound = q1 - (1.5*iqr)
upper_bound = q3 + (1.5*iqr)
print(lower_bound)
print(upper_bound)

outliers_pickup_longitude = [i for i in df['pickup_longitude'] if i<lower_bound or i>upper_bound]
print("Outliers in pickup_longitude :",outliers_pickup_longitude)

df.loc[df['pickup_longitude']>-73.929,'pickup_longitude']=-73.929
df.loc[df['pickup_longitude']<-74.029,'pickup_longitude']=-74.029

q1 = np.percentile(df['pickup_latitude'],25)
q3 = np.percentile(df['pickup_latitude'],75)
iqr = q3-q1

lower_bound = q1 - (1.5*iqr)
upper_bound = q3 + (1.5*iqr)
print(lower_bound)
print(upper_bound)

outliers_pickup_latitude = [i for i in df['pickup_latitude'] if i<lower_bound or i>upper_bound]
print("Outliers in pickup_latitude :",outliers_pickup_latitude)

df.loc[df['pickup_longitude']>40.81515,'pickup_longitude']=40.81515
df.loc[df['pickup_longitude']<40.6883,'pickup_longitude']=40.6883

q1 = np.percentile(df['dropoff_longitude'],25)
q3 = np.percentile(df['dropoff_longitude'],75)
iqr = q3-q1

lower_bound = q1 - (1.5*iqr)
upper_bound = q3 + (1.5*iqr)
print(lower_bound)
print(upper_bound)

outliers_dropoff_longitude = [i for i in df['dropoff_longitude'] if i<lower_bound or i>upper_bound]
print("Outliers in dropoff_longitude :",outliers_dropoff_longitude)

df.loc[df['dropoff_longitude']>-73.929,'dropoff_longitude']=-73.929
df.loc[df['dropoff_longitude']<-74.029,'dropoff_longitude']=-74.029

q1 = np.percentile(df['dropoff_latitude'],25)
q3 = np.percentile(df['dropoff_latitude'],75)
iqr = q3-q1

lower_bound = q1 - (1.5*iqr)
upper_bound = q3 + (1.5*iqr)
print(lower_bound)
print(upper_bound)

outliers_dropoff_latitude = [i for i in df['dropoff_latitude'] if i<lower_bound or i>upper_bound]
print("Outliers in dropoff_latitude :",outliers_dropoff_latitude)

df.loc[df['dropoff_latitude']>40.81790,'dropoff_latitude']=40.81790
df.loc[df['dropoff_latitude']<40.68582,'dropoff_latitude']=40.68582

#Bivariate Analysis
#Correlation Matrix and HeatMap
num = df.select_dtypes(include=['float64','int64']).columns
correlation_matrix = df[num].corr()
print(correlation_matrix)

#Heatmap
sns.heatmap(correlation_matrix,annot=True)

for i in range(len(num)):
  for j in range(i+1,len(num)):
    sns.scatterplot(data=df,x=num[i],y=num[j])
    plt.title(f"Scatter plot between {num[i]} and {num[j]}")
    plt.xlabel(f"{num[i]}")
    plt.ylabel(f"{num[j]}")
    plt.show()

df.dtypes

#Duplicate treatment
df.duplicated().sum()

df.drop_duplicates(inplace=True)

df.duplicated().sum()

d = df
X = d.drop(columns=['fare_amount'])
y = d['fare_amount']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

scaler = MinMaxScaler()
#min max scaler linear
X_train=pd.DataFrame(scaler.fit_transform(X_train[list(X.columns)]),
                                    columns=X.columns)
X_test=pd.DataFrame(scaler.transform(X_test[list(X.columns)]),
                                    columns=X.columns)

"""## **XGBRegressor**"""

xgbmodel =  XGBRegressor()
xgbmodel.fit(X_train,y_train)
# Predictions
y_pred = xgbmodel.predict(X_test)
# Evaluation
mse = mean_squared_error(y_test,y_pred)
print("Mean Squared Error: ",mse)
rmse = mean_squared_error(y_test,y_pred,squared=False)
print("Root Mean Squared Error: ",rmse)
r2_s = r2_score(y_test,y_pred)
print("R2 Score",r2_s)
