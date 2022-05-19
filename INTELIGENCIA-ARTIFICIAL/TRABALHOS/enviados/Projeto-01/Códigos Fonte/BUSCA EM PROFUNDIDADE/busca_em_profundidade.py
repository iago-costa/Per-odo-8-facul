from concurrent.futures import process
import pdb
from time import process_time, time

cidades = {

0: 'arad',
1: 'timisoara',
2: 'sibiu',
3: 'zerind',
4: 'lugoj',
5: 'fagaras',
6: 'oradea',
7: 'mehadia',
8: 'dobreta',
9: 'craiova',
10: 'pitesti',
11: 'remnicu',
12: 'bucharest',
13: 'giurgiu',
14: 'urziceni',
15: 'varslui',
16: 'hirsova',
17: 'iasi',
18: 'eforie',
19: 'neamt'

}

grafo = [

	 [1, 2, 3], # vizinhos de arad
	 [4],  # vizinhos de timisoara
	 [5, 6, 11], #vizinhos de sibiu
	 [1, 6], #vizinhos de zerind
	 [1, 7], #vizinhos de lugoj
	 [2, 12], #vizinhos de fagaras
	 [2, 3], #vizinhos de oradea
	 [4, 8], #vizinhos de mehadia
	 [7, 9], #vizinhos de dobreta
	 [8, 10, 11], #vizinhos de craiova
	 [9, 11, 12], #vizinhos de pitesti
	 [2, 9, 10], #vizinhos de remnicu
	 [5, 10, 13, 14], #vizinhos de bucharest
	 [12], #vizinhos de giurgiu
	 [12, 15, 16], #vizinhos urziceni
	 [14, 17], #vizinhos de varslui
	 [14, 18], #vizinhos de hirsova
	 [15, 19], #vizinhos de iasi
	 [16], #vizinhos de eforie
	 [17] #vizinhos de neamt

	 ] 
	 
nohsVisitados = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,] #  lista com seq de nohs que já foram visitados ou não
nohPartida = 0 
nohChegada = 19

#---------------------------------------------------------------------------------------------------------------------------------------

def busca_em_profundidade(nohPartida, nohChegada):

	start = time()

	pilha = [] # implementando pilha atraves de uma lista, pilha vazia
	#pdb.set_trace()
	pilha.append(nohPartida) #equivale ao push, setando o noh de partida na pilha

	while len(pilha) > 0:    #enquanto a pilha tiver algum noh
		nohDaVez = pilha.pop() # pego esse noh da pilha e desempilho 

		if nohsVisitados[nohDaVez] == 0: # verifico se esse noh já foi visitado
			nohsVisitados[nohDaVez] = 1 # se ele não foi marca ela como visitado
			print(cidades[nohDaVez]) # imprimindo pra dizer que el já foi visitado

			if nohDaVez == nohChegada: # verifico se esse noh é o noh de destino
				print("Chegou ao destino") # se for imprimo que cheguei ao destino
				end = time()
				print(end-start)
				break                       # e paro meu  lopp
			else:                           # se não for eu pego todos os vizinhos desse noh e empilho 
				for noh in grafo[nohDaVez]: # pegando todos os vizinhos desse
					pilha.append(noh)        # empilhando  todos
				
					
busca_em_profundidade(nohPartida, nohChegada)
