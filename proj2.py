import pandas as pd
import numpy as np
import pyspark.pandas as ps
from pyspark.sql import SparkSession
import sys
 
# Validate argument
n = len(sys.argv)
print("Total arguments passed:", n)
if n != 2:
    print("Incorrect number of arguments, usage: ./proj2.py <proj_dir>\n")
dir = sys.argv[1]

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()

# A CSV dataset is pointed to by path.
# The path can be either a single CSV file or a directory of CSV files
path_train = "./{}/train.csv".format(dir)
path_test = "./{}/test.csv".format(dir)

# Exploratory data analysis
train = pd.read_csv(path_train)
train.info()
df_train = spark.read.csv(path_train)
df_train.show()
print(train.describe())

test = pd.read_csv(path_test)
test.info()
df_test = spark.read.csv(path_test)
df_test.show()
print(test.describe())