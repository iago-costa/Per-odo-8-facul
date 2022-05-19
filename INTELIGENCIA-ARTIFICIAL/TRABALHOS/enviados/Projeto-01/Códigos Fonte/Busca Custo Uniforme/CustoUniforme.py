import time

class City:
    def __init__(self, name):
        self.name = name
        self.neighbours = {}


class QueuePath:
    def __init__(self, start, end, path, distance):
        self.start = start
        self.end = end
        self.path = path
        self.distance = distance
        

# class NodeBacklog:
#     def __init__(self,start,end):
#         self.start = start
#         self.end = end


Neamt = City("Neamt")
Iasi = City("Iasi")
Vaslui = City("Vaslui")
Urziceni = City("Urziceni")
Hirsova = City("Hirsova")
Eforie = City("Eforie")
Bucharest = City("Bucharest")
Giurgiu = City("Giurgiu")
Pitesti = City("Pitesti")
Fagaras = City("Fagaras")
Sibiu = City("Sibiu")
RimnicuVilcea = City("RimnicuVilcea")
Craiova = City("Craiova")
Dobreta = City("Dobreta")
Mehadia = City("Mehadia")
Lugoj = City("Lugoj")
Timisoara = City("Timisoara")
Arad = City("Arad")
Zerind = City("Zerind")
Oradea = City("Oradea")

Arad.neighbours = {Timisoara: 118, Sibiu: 140, Zerind: 75}
Timisoara.neighbours = {Lugoj: 111}
Lugoj.neighbours = {Mehadia: 70}
Mehadia.neighbours = {Dobreta: 75}
Craiova.neighbours = {RimnicuVilcea: 146, Pitesti: 138}
Dobreta.neighbours = {Craiova: 120}
RimnicuVilcea.neighbours = {Pitesti:97}
Pitesti.neighbours = {Bucharest: 101}
Zerind.neighbours = {Oradea: 71}
Oradea.neighbours = {Sibiu: 151}
Sibiu.neighbours = {Fagaras: 99,RimnicuVilcea:80}
Fagaras.neighbours = {Bucharest: 211}
Bucharest.neighbours = {Urziceni: 85, Giurgiu: 90}
Urziceni.neighbours = {Vaslui: 142, Hirsova: 98}
Vaslui.neighbours = {Iasi: 92}
Iasi.neighbours = {Neamt: 87}
Hirsova.neighbours = {Eforie: 86}

inicio = Arad
fim = Neamt

steps = 0
queue = []
results = {}

t0 = time.time()  
def BuscaUniforme(start, end, custo, pathBacklog,pathBacklogLocal):
    global results
    pathBacklog += "{} -> ".format(start.name)
    lowest = 99999999999
    menor = None
    if start == end:
        print("chegou")
        print("Caminho percorrido processando:",pathBacklog)
        print("Caminho encontrado",pathBacklogLocal+" {}".format(start.name)," ",custo)  
        results[custo]=pathBacklogLocal+" {}".format(start.name)
        
    for item in start.neighbours:
        print(item.name,start.neighbours[item],start.neighbours[item]+custo)
        queue.extend([QueuePath(start,item,pathBacklogLocal+"{} ->".format(start.name),start.neighbours[item]+custo)])
    for items in queue:
        if items.distance <  lowest:
            lowest= items.distance
            menor=items 
    if menor != None:
        print("Escolhido: ",menor.end.name,menor.distance)
        queue.remove(menor)
        BuscaUniforme(menor.end,end,menor.distance,pathBacklog,menor.path)


print("Total de rotas obtidas:",len(results))  
BuscaUniforme(inicio, fim, 0,"","")
lowest = 99999999999
smallestPath = None
index = 0
for distance in results:
    index+=1
    print("Rota {}:".format(index),results[distance])
    print(distance)  
    if distance < lowest:
        lowest = distance
        smallestPath = results[distance]

      
print("Menor rota encontrada: ",smallestPath," Distância: ",lowest)
t1 = time.time()
print(t1-t0)