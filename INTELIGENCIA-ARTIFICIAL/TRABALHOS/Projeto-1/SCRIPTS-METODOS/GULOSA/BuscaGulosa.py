distanceToNeamt = {}
with open("StraightLineDistanceToNeamt.txt","r") as file:
    for line in file:
        line  = "".join(line.split())
        (key,value) = line.split("-")        
        distanceToNeamt[key] = value

class City:
    def __init__(self,name):
        self.name = name
        self.neighbours = []
        

Neamt  = City("Neamt")
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

Neamt.neighbours.extend([Iasi])
Iasi.neighbours.extend([Neamt,Vaslui])
Vaslui.neighbours.extend([Iasi,Urziceni])
Urziceni.neighbours.extend([Vaslui,Hirsova,Bucharest])
Hirsova.neighbours.extend([Urziceni,Eforie])
Eforie.neighbours.extend([Hirsova])
Bucharest.neighbours.extend([Urziceni,Giurgiu,Fagaras,Pitesti])
Pitesti.neighbours.extend([Bucharest,Craiova,RimnicuVilcea])
Fagaras.neighbours.extend([Sibiu,Bucharest])
Sibiu.neighbours.extend([RimnicuVilcea,Fagaras,Oradea,Arad])
RimnicuVilcea.neighbours.extend([Craiova,Pitesti,Sibiu])
Craiova.neighbours.extend([RimnicuVilcea,Pitesti,Dobreta])
Dobreta.neighbours.extend([Mehadia,Craiova])
Mehadia.neighbours.extend([Dobreta,Lugoj])
Lugoj.neighbours.extend([Mehadia,Timisoara])
Timisoara.neighbours.extend([Arad,Lugoj])
Arad.neighbours.extend([Timisoara,Sibiu,Zerind])
Zerind.neighbours.extend([Arad,Oradea])

start = Arad
end = Neamt

def BuscaGulosa(start,end,lastCity):
    if start==end:
        print("Chegou")

    lowest = 99999999999
    for neighbours in start.neighbours:
        print(distanceToNeamt[neighbours.name])
        if int(distanceToNeamt[neighbours.name]) < lowest:
            if lastCity == None or neighbours.name != lastCity.name:
                lowest = int(distanceToNeamt[neighbours.name])

    for neighbours in start.neighbours:
        if int(distanceToNeamt[neighbours.name]) == lowest:
            print(neighbours.name)
            BuscaGulosa(neighbours,end,start)

BuscaGulosa(start,end,None)
