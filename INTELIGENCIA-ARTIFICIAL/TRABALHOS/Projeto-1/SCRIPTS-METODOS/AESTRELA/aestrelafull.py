import logging
import time
from mapa import Mapa


logging.basicConfig(filename='resultAEstrela.log', level=logging.DEBUG, format='%(asctime)s %(message)s',
                    datefmt='%m/%d/%Y %I:%M:%S %p')


class Cidade:
    
    def __init__(self, nome, verticesAlvo, distanciaObjetivo):
        self.nome = nome
        self.verticesAlvo = list(verticesAlvo)
        self.distanciaObjetivo = distanciaObjetivo
        self.visitada = False
    

class Mapa:
    
    def __init__(self):
    
        file = open('StraightLineDistanceToNeamt.txt', 'r')
        # file = open('StraightLineDistanceToBucharest.txt', 'r')
        
        fileDict = {}
        for line in file:
            line = line.split("-")
            fileDict[line[0].strip()] = int(line[1])
        file.close()
        self.Arad = Cidade('Arad', [['Zerind', 75], ['Sibiu', 140], ['Timisoara', 118]], fileDict['Arad'])
        self.Bucharest = Cidade('Bucharest', [['Giurgiu', 90], ['Urziceni', 85], ['Fagaras', 211], ['Pitesti', 101]], fileDict['Bucharest'])
        self.Craiova = Cidade('Craiova', [['Dobreta', 120], ['RimnicuVilcea', 146], ['Pitesti', 138]], fileDict['Craiova'])
        self.Dobreta = Cidade('Dobreta', [['Mehadia', 75], ['Craiova', 120]], fileDict['Dobreta'])
        self.Eforie = Cidade('Eforie', [['Hirsova', 86]], fileDict['Eforie'])
        self.Fagaras = Cidade('Fagaras', [['Sibiu', 99], ['Bucharest', 211]], fileDict['Fagaras'])
        self.Giurgiu = Cidade('Giurgiu', [['Bucharest', 90]], fileDict['Giurgiu'])
        self.Hirsova = Cidade('Hirsova', [['Urziceni', 98], ['Eforie', 86]], fileDict['Hirsova'])
        self.Iasi = Cidade('Iasi', [['Neamt', 87], ['Vaslui', 92]], fileDict['Iasi'])
        self.Lugoj = Cidade('Lugoj', [['Timisoara', 111], ['Mehadia', 70]], fileDict['Lugoj'])
        self.Mehadia = Cidade('Mehadia', [['Dobreta', 75], ['Lugoj', 70]], fileDict['Mehadia'])
        self.Neamt = Cidade('Neamt', [['Iasi', 87]], fileDict['Neamt'])
        self.Oradea = Cidade('Oradea', [['Sibiu', 151], ['Zerind', 71]], fileDict['Oradea'])
        self.Pitesti = Cidade('Pitesti', [['RimnicuVilcea', 97], ['Craiova', 138], ['Bucharest', 101]], fileDict['Pitesti'])
        self.RimnicuVilcea = Cidade('RimnicuVilcea', [['Sibiu', 80], ['Pitesti', 97], ['Craiova', 146]], fileDict['RimnicuVilcea']) 
        self.Sibiu = Cidade('Sibiu', [['Arad', 140], ['Oradea', 151], ['RimnicuVilcea', 80], ['Fagaras', 99]], fileDict['Sibiu'])
        self.Timisoara = Cidade('Timisoara', [['Arad', 118], ['Lugoj', 111]], fileDict['Timisoara']) 
        self.Urziceni = Cidade('Urziceni', [['Vaslui', 142], ['Hirsova', 98], ['Bucharest', 85]], fileDict['Urziceni'])
        self.Vaslui = Cidade('Vaslui', [['Iasi', 92], ['Urziceni', 142]], fileDict['Vaslui'])
        self.Zerind = Cidade('Zerind', [['Arad', 75], ['Oradea', 71]], fileDict['Zerind'])
        self.cidades = {
            'Arad': self.Arad,
            'Bucharest': self.Bucharest,
            'Craiova': self.Craiova,
            'Dobreta': self.Dobreta,
            'Eforie': self.Eforie,
            'Fagaras': self.Fagaras,
            'Giurgiu': self.Giurgiu,
            'Hirsova': self.Hirsova,
            'Iasi': self.Iasi,
            'Lugoj': self.Lugoj,
            'Mehadia': self.Mehadia,
            'Neamt': self.Neamt,
            'Oradea': self.Oradea,
            'Pitesti': self.Pitesti,
            'RimnicuVilcea': self.RimnicuVilcea,
            'Sibiu': self.Sibiu,
            'Timisoara': self.Timisoara,
            'Urziceni': self.Urziceni,
            'Vaslui': self.Vaslui,
            'Zerind': self.Zerind    
        }
        self.mapaGrafo = {
            'Arad': self.Arad.verticesAlvo,
            'Bucharest': self.Bucharest.verticesAlvo,
            'Craiova': self.Craiova.verticesAlvo,
            'Dobreta': self.Dobreta.verticesAlvo,
            'Eforie': self.Eforie.verticesAlvo,
            'Fagaras': self.Fagaras.verticesAlvo,
            'Giurgiu': self.Giurgiu.verticesAlvo,
            'Hirsova': self.Hirsova.verticesAlvo,
            'Iasi': self.Iasi.verticesAlvo,
            'Lugoj': self.Lugoj.verticesAlvo,
            'Mehadia': self.Mehadia.verticesAlvo,
            'Neamt': self.Neamt.verticesAlvo,
            'Oradea': self.Oradea.verticesAlvo,
            'Pitesti': self.Pitesti.verticesAlvo,
            'RimnicuVilcea': self.RimnicuVilcea.verticesAlvo,
            'Sibiu': self.Sibiu.verticesAlvo,
            'Timisoara': self.Timisoara.verticesAlvo,
            'Urziceni': self.Urziceni.verticesAlvo,
            'Vaslui': self.Vaslui.verticesAlvo,
            'Zerind': self.Zerind.verticesAlvo
        }
        
       
class Aestrela:
    
    def __init__(self, mapaGrafo, cidadeInicial, cidadeObjetivo) :
        self.mapaGrafo = mapaGrafo
        self.cidadeInicial = cidadeInicial
        self.cidadeObjetivo = cidadeObjetivo
        
    # Resumo do m??todo:
    # 1. Inicializa a cidade inicial como visitada
    # 2. Enquanto a cidade atual n??o for a cidade objetivo:
    # 3.1. Para cada cidade adjacente:
    # 3.2.1. Se a cidade adjacente n??o foi visitada:
    #
        # Fun????o de avalia????o: f(n) = g(n) + h(n)
        # g(n) = custo para alcan??ar n
        # h(n) = custo estimado de n at?? o objetivo
        # f(n) = custo total estimado do caminho atrav??s de n at?? o objetivo.

        # Tempo = 
        # Mem??ria = 
        # Completude = sim
        # Ser ??timo (Garantido encontrar a melhor solu????o) = n??o
        # Irrevogabilidade (nunca voltar atr??s) = n??o
        # Admissibilidade = n??o

    def _buscaAEstrela(self, mapaGrafo, cidadeAtual, cidadeObjetivo):
        cidadeAtual = self.cidadeInicial
        logging.info("===========================================================")
        logging.info("Cidade Inicial: " + self.cidadeInicial)
        logging.info("Cidade Objetivo: " + self.cidadeObjetivo)
        logging.info("===========================================================\n")
        nosPercorridos = 0
        while cidadeAtual != cidadeObjetivo:
            # print("\nCidade Atual: " + cidadeAtual)
            mapaGrafo.cidades[cidadeAtual].visitada = True
            nosPercorridos += 1
            logging.info("===========================================================")
            logging.info("N??s percorridos: " + str(nosPercorridos))
            logging.info("Cidade Atual: " + mapaGrafo.cidades[cidadeAtual].nome)
            logging.info("Cidades Adj: " + str(mapaGrafo.cidades[cidadeAtual].verticesAlvo))
            
            numeroAdjacentes = len(mapaGrafo.cidades[cidadeAtual].verticesAlvo)
            lista_custo = []
            logging.info("Numero de Adjacentes: " + str(numeroAdjacentes))
            logging.info("\n")
            for adjacente in range(numeroAdjacentes):
                logging.info("Cidade Adjacente: " + str(mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][0]))
                logging.info("Distancia: " + str(mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][1]))
                custo = mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][1] + int(mapaGrafo.cidades[mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][0]].distanciaObjetivo)
                logging.info("Custo: " + str(mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][1]) + " + " + str(int(mapaGrafo.cidades[mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][0]].distanciaObjetivo)) + " = " + str(custo))
                logging.info("Visitada: " + str(mapaGrafo.cidades[mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][0]].visitada))
                lista_custo.append([mapaGrafo.cidades[cidadeAtual].verticesAlvo[adjacente][0], custo])
                logging.info("\n")
            
            logging.info("Definindo pr??xima cidade na rota...")
            logging.info("Lista de Custo: " + str(lista_custo))
            for custo_atual in lista_custo:
                logging.info(str(custo_atual[1]))
                for custo_anterior in lista_custo:
                    if custo_atual[1] >= custo_anterior[1]:
                        custo_menor = custo_anterior[1]
                        
                        if mapaGrafo.cidades[custo_anterior[0]].visitada == False:
                            logging.info("Custo menor atual: " + str(custo_menor))
                            cidadeAtual = custo_anterior[0]
                            break
                        else:
                            logging.info("Removendo da lista: " + str(custo_anterior[0]))
                            lista_custo.remove(custo_anterior)
                            logging.info("Lista de Custo: " + str(lista_custo))
                            if lista_custo != []:
                                cidadeAtual = lista_custo[0][0]
                            else :
                                cidadeAtual = custo_anterior[0]
                                break

                    logging.info("\n")
            logging.info("===========================================================\n")

        logging.info("===========================================================")
        logging.info("Cidade Atual: " + mapaGrafo.cidades[cidadeAtual].nome)
        logging.info("Cidades Adj: " + str(mapaGrafo.cidades[cidadeAtual].verticesAlvo))
                                

if '__main__' == __name__:
    start = time.time()
    mapaGrafo = Mapa()
    # logging.info(mapaGrafo.mapaGrafo)
    metodoAEstrela = Aestrela(mapaGrafo, "Arad", "Neamt")
    metodoAEstrela._buscaAEstrela(mapaGrafo, metodoAEstrela.cidadeInicial, metodoAEstrela.cidadeObjetivo)
    end = time.time()
    logging.info('Tempo de execu????o Busca AEstrela: ' + str(end - start) + ' segundos')