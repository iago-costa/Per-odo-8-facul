
import logging
import time
from mapa import Mapa

logging.basicConfig(filename='resultAEstrela.log', level=logging.DEBUG, format='%(asctime)s %(message)s',
                    datefmt='%m/%d/%Y %I:%M:%S %p')


class Aestrela:
    
    def __init__(self, mapaGrafo, cidadeInicial, cidadeObjetivo) :
        self.mapaGrafo = mapaGrafo
        self.cidadeInicial = cidadeInicial
        self.cidadeObjetivo = cidadeObjetivo
        
    # Resumo do método:
    # 1. Inicializa a cidade inicial como visitada
    # 2. Enquanto a cidade atual não for a cidade objetivo:
    # 3.1. Para cada cidade adjacente:
    # 3.2.1. Se a cidade adjacente não foi visitada:
    #
        # Função de avaliação: f(n) = g(n) + h(n)
        # g(n) = custo para alcançar n
        # h(n) = custo estimado de n até o objetivo
        # f(n) = custo total estimado do caminho através de n até o objetivo.

        # Tempo = 
        # Memória = 
        # Completude = sim
        # Ser ótimo (Garantido encontrar a melhor solução) = não
        # Irrevogabilidade (nunca voltar atrás) = não
        # Admissibilidade = não

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
            logging.info("Nós percorridos: " + str(nosPercorridos))
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
            
            logging.info("Definindo próxima cidade na rota...")
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
    logging.info('Tempo de execução Busca AEstrela: ' + str(end - start) + ' segundos')