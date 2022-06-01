from prophet import Prophet
import pandas as pd

# carrega o dataset
dataset = pd.read_csv('data.csv')
# remover linhas com colunas vazias
dataset = dataset.dropna()
# print dataset
print(dataset)

# m = Prophet()

# m.load_data('data.csv')

# m.fit(df)

# future = m.make_future_dataframe(periods=10)

# m.predict(future)