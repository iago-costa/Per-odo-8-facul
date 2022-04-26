# -*- coding: utf-8 -*-
"""
Created on Sun Jul 11 21:12:06 2021

@author: Elton Alves
"""

import numpy as np
from sklearn.neural_network import MLPClassifier
from sklearn import datasets

iris=datasets.load_iris()
# entradas = iris.data
# print(entradas)
# saida = iris.target
# print(saida)
# entradas = np.array([[30], [60], [90], [120]])
# print(entradas)
# saidas = np.array([[0.5],[0.8660254],[1],[0.8660254]])
# print(saidas)

entradas = []
saidas = []

file = open("sin copy.txt", "r")
for line in file:
    line = line.split(" ")
    entradas.append([float(line[1])])
    saidas.append([float(line[0])])

# entradas = np.array(entradas)
print(entradas)
# saidas = np.array(saidas)

redeNeural = MLPClassifier() #cria a RNA
redeNeural = MLPClassifier(verbose=(True), 
                           max_iter=1000,
                           tol=0.001,
                          activation='logistic',
                           learning_rate_init=0.1,
                           solver='sgd') #cria a RNA

#verbose mostra o erro gerado pela RNA
#max_iter é o número máximo de épocas
#tol é a tolerância
# activation é a função de ativação
#learning_rate_init=0.3 é a taxa de aprendizagem
#Solver é o algoritmo utilizado para atualização dos pesos
redeNeural.fit(entradas, saidas)#Treinamento da RNA
print("\n")

while True:
    angulo = input("Valor do seno: \n")
    result = redeNeural.predict(np.array([[float(angulo)]]))#fazer a previsão
    print("result:"+str(result)+"\n")