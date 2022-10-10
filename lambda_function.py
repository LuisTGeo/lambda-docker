import sys
sys.path.append('libs')

import pandas as pd
import requests
import json

def lambda_handler(event, context):
    d = {'col1': [1,2], 'col2': [3,4]}
    df = pd.Dataframe(data=d)
    print(df)
    print('----- Done -----')

    