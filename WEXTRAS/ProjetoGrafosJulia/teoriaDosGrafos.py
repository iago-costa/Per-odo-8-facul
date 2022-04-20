import numpy
# import numpy.random.common
# import numpy.random.bounded_integers
# import numpy.random.entropy
import sys

import igraph
from igraph import *
#Para rodar o programa é preciso instalar as duas bibliotecas abaixo
#pip install python-igraph
#pip install pycairo
#Mas para executar pelo .exe não é necessário

#leitura Grafo do txt
#O arquivo precisa estar na mesma pasta do .exe
grafo = open('entrada.txt', 'r')

#salvar dados
tipo = "x"
listaAdjacencia = []
listaVertices = []
for line in grafo:
    line = line.strip()
    if tipo == "x":
        print("Tipo:", line)
        tipo = line
    else:
        v = line.split(",")
        print(v[0], " + ", v[1])
        listaAdjacencia.append([v[0], v[1]])
        if v[0] not in listaVertices:
            listaVertices.append(v[0])
        if v[1] not in listaVertices:
            listaVertices.append(v[1])
            
print(listaAdjacencia)
print(listaVertices)

#criando Matriz Adjacencia a partir dos dados
quantidadeVertices = len(listaVertices)
matrizAdjacencia = numpy.zeros(shape=(quantidadeVertices,quantidadeVertices))

for v0 in listaVertices:
    #matrizAdjacencia
    print(v0)
    for l in listaAdjacencia:
        if v0 == l[0]:
            print(l[0], l[1])
            if tipo == "D":
                matrizAdjacencia[listaVertices.index(l[0])][listaVertices.index(l[1])] = 1
            if tipo == "ND":
                matrizAdjacencia[listaVertices.index(l[0])][listaVertices.index(l[1])] = 1
                matrizAdjacencia[listaVertices.index(l[1])][listaVertices.index(l[0])] = 1

print(matrizAdjacencia)

#realizando Tarefas propostas na atividade
continuar = '1'
while continuar == '1':
    print("\n\nTarefas:")
    print("\n1 - Verificar se são adjacentes\n2 - Calcular grau\n3 - Buscar vizinhos\n4 - Visitar arestas do grafo\n5 - Visualizar o Grafo graficamente a partir de uma imagem")
    print("\n\nSelecione uma opção:")
    opcao = input()
    #Verificando se são adjacentes
    if opcao == '1':
        print("\nInsira o vértice 1:")
        v1 = input()

        if v1 in listaVertices:
            l1 = listaVertices.index(v1)

            print("\nInsira o vértice 2:")
            v2 = input()
            
            if v2 in listaVertices:
                l2 = listaVertices.index(v2)

                if l1 != l2:
                    adjacente = 0;
                    for m in range(len(matrizAdjacencia)):
                        if m == l1:
                            for n in range(len(matrizAdjacencia[m])):
                                if (n == l2) & ((matrizAdjacencia[m][n] == 1) | (matrizAdjacencia[n][m] == 1)):
                                    adjacente = 1
                    if adjacente == 1:
                        print("\nSão adjacentes")
                    else:
                        print("\nNão são adjacentes")
                else:
                    print("\nOs dois vértices são iguais")
            else:
                print("\nVertice não está no grafo")
            
        else:
            print("\nVertice não está no grafo")

    #Calculando Grau do Vértice    
    elif opcao == '2':
        print("\nInsira o vértice:")
        v = input()

        if v in listaVertices:
            l = listaVertices.index(v)

            grau = 0
            for l in listaAdjacencia:
                if (l[0] == v) | (l[1] == v):
                    grau = grau + 1
            print("\nGrau: ", grau)
        else:
            print("\nVertice não está no grafo")

    #Buscando vizinhos Grafos
    elif opcao == '3':
        print("\nInsira o vértice:")
        v = input()

        if v in listaVertices:
            l = listaVertices.index(v)

            for m in range(len(matrizAdjacencia)):
                if m == l:
                    for n in range(len(matrizAdjacencia[m])):
                        if (m != n) & ((matrizAdjacencia[m][n] == 1) | (matrizAdjacencia[n][m] == 1)):
                            print(listaVertices[n])
        else:
            print("\nVertice não está no grafo")

    #Visitando arestas
    elif opcao == '4':
        print("\nArestas:\n")
        for l in listaAdjacencia:
            print("De ", l[0], "Para", l[1])

    #Visualizar graficamente
    elif opcao == '5':
        print("\n\nAguarde. Preparando a visualização gráfica do Grafo...")
        print("\nA imagem será aberta em aplicativo do computador...")
        if tipo == "D":
            g = Graph(directed=True)
        else:
            g = Graph()
        g.add_vertices(len(listaVertices))
        g.vs["name"] = listaVertices

        for l in listaAdjacencia:
            g.add_edges([(listaVertices.index(l[0]),listaVertices.index(l[1]))])

        g.vs["label"] = g.vs["name"]
        plot(g, vertex_color = "blue", vertex_label_color = "white")
        
    else:
        print("\nOpção não encontrada")

    print("\nRealizar outra operação?")
    print("1 - Sim\n2 - Não")
    continuar = input()

print("Obrigado por utilizar a aplicação")
