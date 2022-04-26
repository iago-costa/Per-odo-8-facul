# -*- coding: utf-8 -*-
"""
Created on Sun Jul 11 21:12:06 2021

@author: Elton Alves
"""

from sklearn.neural_network import MLPClassifier
from sklearn import datasets

# iris=datasets.load_iris()
# entradas = iris.data
# saída = iris.target
entradas = []
saidas = []
file = open("/home/mestrezen/Documents/graduacao/Per-odo-8-facul/INTELIGENCIA-ARTIFICIAL/TRABALHOS/Projeto-3/Projeto/letter-recognition/letter-recognition.data", "r")

# 16 parametros entradas
# 1 parametro saida
i = 0
j = 0
for line in file:
    if i < 200:
        line = line.split(",")
        entradas[j].push(line[1:17])
        saidas[j].push(line[0])
    else:
        i = 0
        j += 1
    i +=1
    


file.close()

print(entradas)
print("\n")
print(saidas)

# redeNeural = MLPClassifier() #cria a RNA
# redeNeural = MLPClassifier(verbose=(True), 
#                            max_iter=1000,
#                            tol=0.001,
#                            activation='logistic',
#                            learning_rate_init=0.1,
#                            solver='sgd') #cria a RNA
# #verbose mostra o erro gerado pela RNA
# #max_iter é o número máximo de épocas
# #tol é a tolerância
# # activation é a função de ativação
# #learning_rate_init=0.3 é a taxa de aprendizagem
# #Solver é o algoritmo utilizado para atualização dos pesos
# redeNeural.fit(entradas[0], saidas[0]) #Treinamento da RNA
# redeNeural.predict([[5,7.2,5.1,2.2]]) #fazer a previsão


