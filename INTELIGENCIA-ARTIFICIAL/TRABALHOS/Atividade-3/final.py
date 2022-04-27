# -*- coding: utf-8 -*-
from matplotlib import pyplot as plt
import numpy as np

def sigmoid(soma):
    return 1 / (1 + np.exp(-soma))

def sigmoidDerivada(sig):
    return sig * (1 - sig)

entradas = []
saidas = []

x = np.linspace(-2*np.pi, 2*np.pi,100)

for i in range(len(x)):
    entradas.append([x[i]])
    saidas.append([np.sin(x[i])])

entradasReais = np.array(entradas)
saidasReais = np.array(saidas)

entradas = np.array(entradas)
saidas = np.array(saidas)

pesos0 = 2*np.random.random((1,len(entradas))) - 1
pesos1 = 2*np.random.random((len(entradas),1)) - 1

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

print("Erro após "+str(epocas)+" épocas: " + str(mediaAbsoluta))

camadaEntrada = np.array(entradas)
somaSinapse0 = np.dot(camadaEntrada, pesos0)
camadaOculta = sigmoid(somaSinapse0)

somaSinapse1 = np.dot(camadaOculta, pesos1)
camadaSaida = sigmoid(somaSinapse1)

entradasPlot = []
saidasPlot = []

for i in range(len(entradas)):
    entradasPlot.append(entradas[i][0])
    
for j in range(len(camadaSaida)):
    saidasPlot.append(saidas[j][0])

plt.plot(entradasReais, saidasReais, color='black', label='valores reais')
plt.plot(entradasReais, saidasPlot, color='red', label='valores RNA')
plt.show()             
    
# https://towardsdatascience.com/the-maths-behind-back-propagation-cf6714736abf

# https://matheusfacure.github.io/2017/03/10/backprop/
    
# https://emgotas.com/2016/11/14/o-que-e-fuzificacao-e-defuzificacao-de-um-valor-numerico/#:~:text=A%20defuzifica%C3%A7%C3%A3o%20transforma%20o%20resultado,centroide%2C%20bissetor%2C%20entre%20outros.&text=Fuzzy%20Reasoning%20ou%20approximate%20reasoning,se%2Dent%C3%A3o%20e%20fatos%20conhecidos.
        
# https://www.slideshare.net/VinciusPrates1/backpropagation-a-intuio-matemtica-e-algumas-provas-212912655
    
    
    
    
    
    
    
    
    
    
    
    



