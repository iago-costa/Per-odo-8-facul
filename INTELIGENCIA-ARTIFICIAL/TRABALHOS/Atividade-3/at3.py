# -*- coding: utf-8 -*-
import logging
import math
import numpy as np


logging.basicConfig(filename='resultRNA-MLP.log', level=logging.DEBUG, format='%(asctime)s %(message)s',
                    datefmt='%m/%d/%Y %I:%M:%S %p')


def sigmoid(soma):
    return 1 / (1 + np.exp(-soma))


def sigmoidDerivada(sig):
    return sig * (1 - sig)

#a = sigmoid(0.5)
#b = sigmoidDerivada(a)

#a = sigmoid(-1.5)
#b = np.exp(0)

entradas = []
saidas = []

file = open("sin.txt", "r")
for line in file:
    line = line.split(" ")
    entradas.append([float(line[0])])
    saidas.append([float(line[1])])

entradas = np.array(entradas)
saidas = np.array(saidas)

# print("entradas: "+ str(entradas) + "\n" + "saidas: " + str(saidas) + "\n") 

#pesos0 = np.array([[-0.424, -0.740, -0.961],
#                   [0.358, -0.577, -0.469]])
    
#pesos1 = np.array([[-0.017], [-0.893], [0.148]])

pesos0 = 2*np.random.random((1,len(entradas))) - 1
# print(pesos0)
pesos1 = 2*np.random.random((len(entradas),1)) - 1
# print(pesos1)
# print("linha 74"+str(pesos0) +"\n"+ str(pesos1) +"\n")


# peso0novo = 0
# peso1novo = 0

epocas = 30000
taxa_aprendizagem = 0.5
momento = 1

for j in range(epocas):
    camadaEntrada = entradas
    somaSinapse0 = np.dot(camadaEntrada, pesos0)
    camadaOculta = sigmoid(somaSinapse0)
    
    somaSinapse1 = np.dot(camadaOculta, pesos1)
    camadaSaida = sigmoid(somaSinapse1)
    
    erroCamadaSaida = saidas - camadaSaida
    mediaAbsoluta = np.mean(np.abs(erroCamadaSaida))
    # print("Erro: " + str(mediaAbsoluta))
    
    derivadaSaida = sigmoidDerivada(camadaSaida)
    deltaSaida = erroCamadaSaida * derivadaSaida
    
    pesos1Transposta = pesos1.T
    deltaSaidaXPeso = deltaSaida.dot(pesos1Transposta)
    deltaCamadaOculta = deltaSaidaXPeso * sigmoidDerivada(camadaOculta)
    
    camadaOcultaTransposta = camadaOculta.T
    pesosNovo1 = camadaOcultaTransposta.dot(deltaSaida)
    pesos1 = (pesos1 * momento) + (pesosNovo1 * taxa_aprendizagem)
    peso1novo = pesos1 
    
    camadaEntradaTransposta = camadaEntrada.T
    pesosNovo0 = camadaEntradaTransposta.dot(deltaCamadaOculta)
    pesos0 = (pesos0 * momento) + (pesosNovo0 * taxa_aprendizagem)
    peso0novo = pesos0
    # print("linha 73"+str(pesos0) +"\n"+ str(pesos1) +"\n")

# print("linha 74"+str(pesos0) +"\n"+ str(pesos1) +"\n")
# print("linha 75"+str(peso0novo) +"\n"+ str(peso1novo) +"\n")

print("Erro mínimo após "+str(epocas)+" épocas: " + str(mediaAbsoluta))
numero_de_testes = 100 


for i in range(numero_de_testes):
    angulo = input("Defina seno do angulo: ")
    valor_esperado = math.sin(math.radians(float(angulo)))
    
    camadaEntrada = np.array([float(angulo)])
    somaSinapse0 = np.dot(camadaEntrada, pesos0)
    camadaOculta = sigmoid(somaSinapse0)
    
    somaSinapse1 = np.dot(camadaOculta, pesos1)
    camadaSaida = sigmoid(somaSinapse1)
    print(str(pesos0) +"\n"+ str(pesos1) +"\n")

    print("Entrada: " + str(camadaEntrada) + " - Saída pela MLP: " + str(camadaSaida) + " - Valor esperado: " + str(valor_esperado))
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


