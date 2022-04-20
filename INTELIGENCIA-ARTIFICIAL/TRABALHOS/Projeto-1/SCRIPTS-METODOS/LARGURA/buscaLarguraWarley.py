import pdb
dicionarioCidades = { #dicionario de cidades (mapa)
    0: 'dobreta',
    1: 'mehadia',
    2: 'lugoj',
    3: 'timisoara',
    4: 'arad',
    5: 'zerind',
    6: 'oradea',
    7: 'sibiu',
    8: 'rimnicu',
    9: 'fagaras',
    10: 'craiova',
    11: 'pitesti',
    12: 'bucharest',
    13: 'giurgiu',
    14: 'urziceni',
    15: 'eforie',
    16: 'hirsova',
    17: 'vaslui',
    18: 'iasi',
    19: 'neamt'}

grafoCidades = [ [10,1], # vizinhos do noh 0
	 [0,2],  # vizinhos do no 1
	 [1,3], #vizinhos do no 2
	 [2,4], #vizinhos do no 3
	 [3,5], #vizinhos do no 4
	 [4,6,7], #vizinhos do no 5
	 [5,7], #vizinhos do no 6
	 [5,6,8,9], #vizinhos do no 7
	 [7,10,11], #vizinhos do no 8
	 [7,12], #vizinhos do no 9
	 [0,8], #vizinhos do no 10
	 [8,12], #vizinhos do no 11
     [11,9,13,14], #vizinhos do no 12
     [12], #vizinhos do no 13
     [12,16,17], #vizinhos do no 14
     [16], #vizinhos do no 15
     [15,14], #vizinhos do no 16
     [14,18], #vizinhos do no 17
     [17,19], #vizinhos do no 18
     [18]] #vizinhos do no 19

def enfileira(noPartida, fila):
    fila.append(noPartida)
    return fila
    
def desenfileira(fila):
    no = fila.pop(0)
    return no      
               
def busca(noPartida, noChegada, fila):  #implementado de forma iterativa
    #fila = [] 
    fila = enfileira(noPartida, fila) #enfileira cidade de partida
    #fila.append(noPartida)
    while len(fila) > 0: #verifica se a fila está vazia
        no = desenfileira(fila)  #desenfileira o primeiro elemento da fila
        #no = fila.pop(0)
        cidadesVisitadas[no] = 1 #marca o nó(cidade) para indicar que ja foi visitado
        print(dicionarioCidades[no]) #imprime na tela a cidade que foi visitada
        if no == noChegada: #verifica se a cidade visitada é a cidade de destino
            print("Destino alcançado") #imprime o destino encontrado caso o no visitado seja o objetivo
            break
        for n in grafoCidades[no]: #percorre os vizinhos do nó que foi retirado na fila na linha 58
            if cidadesVisitadas[n] == 0: #verifica se os vizinhos ja foram visitados
                cidadesVisitadas[n] = 1 #marca a cidade como visitada caso a cidade não tenha sido visitada antes
                fila = enfileira(n, fila) #enfileira a cidade visitada ao final da fila
                #fila.append(n)
              
noPartida = 4 #seta cidade de partida
noChegada = 19 #seta o destino desejado
cidadesVisitadas = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] #lista de cidades que ja foram visitadas
fila = [] #fila representada por uma lista

busca(noPartida,noChegada, fila)