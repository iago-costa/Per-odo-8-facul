# -*- coding: utf-8 -*-

import numpy as np

def sigmoid(soma):
    return 1 / (1 + np.exp(-soma))

def sigmoidDerivada(sig):
    return sig * (1 - sig)

#a = sigmoid(0.5)
#b = sigmoidDerivada(a)

#a = sigmoid(-1.5)
#b = np.exp(0)

entradas = np.array([[0,0],
                     [0,1],
                     [1,0],
                     [1,1]])

saidas = np.array([[0],[1],[1],[0]])

#pesos0 = np.array([[-0.424, -0.740, -0.961],
#                   [0.358, -0.577, -0.469]])
    
#pesos1 = np.array([[-0.017], [-0.893], [0.148]])

pesos0 = 2*np.random.random((2,3)) - 1
pesos1 = 2*np.random.random((3,1)) - 1

epocas = 10000
taxaAprendizagem = 0.5
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
    pesos1 = (pesos1 * momento) + (pesosNovo1 * taxaAprendizagem)
    
    camadaEntradaTransposta = camadaEntrada.T
    pesosNovo0 = camadaEntradaTransposta.dot(deltaCamadaOculta)
    pesos0 = (pesos0 * momento) + (pesosNovo0 * taxaAprendizagem)
    

numero_de_testes = 100
    
for i in range(numero_de_testes):
    valor_teste = input("digite aqui exemplo: 0 0 - 0: \n")
    valor_teste = valor_teste.split("-")
    valor = valor_teste[0].split(" ")
    valor_esperado = int(valor_teste[1])
    
    camadaEntrada = np.array([int(valor[0]), int(valor[1])])
    somaSinapse0 = np.dot(camadaEntrada, pesos0)
    camadaOculta = sigmoid(somaSinapse0)
    
    somaSinapse1 = np.dot(camadaOculta, pesos1)
    camadaSaida = sigmoid(somaSinapse1)
    print(str(pesos0) +"\n"+ str(pesos1) +"\n")

    print("Entrada: " + str(camadaEntrada) + " - Sa??da pela MLP: " + str(camadaSaida) + " - Valor esperado: " + str(valor_esperado))
    
    
    
    # https://www.deeplearningbook.com.br/construindo-uma-rede-neural-com-linguagem-python/
    
    
    
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


