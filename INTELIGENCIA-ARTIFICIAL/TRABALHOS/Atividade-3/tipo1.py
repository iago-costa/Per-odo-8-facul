# -*- coding: utf-8 -*-
import logging
import math
from matplotlib import pyplot as plt
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

x = np.linspace(-2*np.pi, 2*np.pi,100)
# print(x)

# file = open("sin.txt", "r")
# for line in file:
#     line = line.split(" ")
#     entradas.append([float(line[0])])
#     saidas.append([float(line[1])])

for i in range(len(x)):
    entradas.append([x[i]])
    saidas.append([np.sin(x[i])])

entradasReais = entradas
saidasReais = saidas

entradas = np.array(entradas)
saidas = np.array(saidas)

# print("entradas: "+ str(entradas) + "\n" + "saidas: " + str(saidas) + "\n") 

pesos0 = 2*np.random.random((1,len(entradas))) - 1
pesos1 = 2*np.random.random((len(entradas),1)) - 1

# peso0novo = 0
# peso1novo = 0

epocas = 10000
taxa_aprendizagem = 0.1
momento = 1

for j in range(epocas):    
    camadaEntrada = entradas
    somaSinapse0 = np.dot(camadaEntrada, pesos0)
    camadaOculta = sigmoid(somaSinapse0)
    
    somaSinapse1 = np.dot(camadaOculta, pesos1) # combinação linear entradas x pesos
    camadaSaida = sigmoid(somaSinapse1) # função sigmoid ativação do neuronio g(z)
    
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
# numero_de_testes = 100 


# for i in range(numero_de_testes):
#     # angulo = input("Defina seno do angulo: ")
#     # valor_esperado = math.sin(math.radians(float(angulo)))
    
#     camadaEntrada = np.array(entradas)
#     somaSinapse0 = np.dot(camadaEntrada, pesos0)
#     camadaOculta = sigmoid(somaSinapse0)
    
#     somaSinapse1 = np.dot(camadaOculta, pesos1)
#     camadaSaida = sigmoid(somaSinapse1)
#     # print(str(pesos0) +"\n"+ str(pesos1) +"\n")
#     # print("Entrada: " + str(camadaEntrada) + " - Saída pela MLP: " + str(camadaSaida) + " - Valor esperado: " + str(valor_esperado))

camadaEntrada = np.array(entradas)
somaSinapse0 = np.dot(camadaEntrada, pesos0)
camadaOculta = sigmoid(somaSinapse0)

somaSinapse1 = np.dot(camadaOculta, pesos1)
camadaSaida = sigmoid(somaSinapse1)

# print('\n')
# print(entradas)
# print('\n')
# print(camadaSaida)
# print('\n')

entradasPlot = []
saidasPlot = []

for i in range(len(entradas)):
    entradasPlot.append(entradas[i][0])
    
for j in range(len(camadaSaida)):
    saidasPlot.append(saidas[j][0])


# print('\n')
# print(entradasPlot)
# print('\n')
# print(saidasPlot)

# for i in range(len(entradasPlot)):
    # plt.plot(entradasReais[i], saidasReais[i], color='black', label='valores reais')
    # plt.scatter(entradasPlot[i], saidasPlot[i], color='red', label='valores RNA')
    # plt.plot([entradas[0], camadaSaida[0]],'ro')
    #plt.ylabel('some numbers')
    #plt.show()
    # plt.scatter(camadaSaida[i],'*b')
    # plt.plot(camadaSaida[i],'*b')
    
plt.plot(entradasReais, saidasReais, color='black', label='valores reais')
plt.plot(entradasReais, saidasPlot, color='red', label='valores RNA')
 
    
plt.show()             
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



