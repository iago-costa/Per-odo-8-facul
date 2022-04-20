# -*- coding: utf-8 -*-
"""
Created on Sun Jul 11 21:12:06 2021

@author: Elton Alves
"""

from sklearn.neural_network import MLPClassifier
from sklearn import datasets

iris=datasets.load_iris()
entradas = iris.data
saída = iris.target

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
redeNeural.fit(entradas, saída)#Treinamento da RNA

redeNeural.predict([[5,7.2,5.1,2.2]])#fazer a previsão