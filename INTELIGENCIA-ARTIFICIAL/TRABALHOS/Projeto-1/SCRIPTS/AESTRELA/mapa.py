from cidade import Cidade


class Mapa:
    
    def __init__(self):
        self.Arad = Cidade('Arad', [['Zerind', 75], ['Sibiu', 140], ['Timisoara', 118]])
        self.Bucharest = Cidade('Bucharest', [['Giurgiu', 90], ['Urziceni', 85], ['Fagaras', 211], ['Pitesti', 101]])
        self.Craiova = Cidade('Craiova', [['Drobeta', 120], ['RimnicuVilcea', 146], ['Pitesti', 138]])
        self.Dobreta = Cidade('Dobreta', [['Mehadia', 75], ['Craiova', 120]])
        self.Eforie = Cidade('Eforie', [['Hirsova', 86]])
        self.Fagaras = Cidade('Fagaras', [['Sibiu', 99], ['Bucharest', 211]])
        self.Giurgiu = Cidade('Giurgiu', ['Bucharest', 90])
        self.Hirsova = Cidade('Hirsova', [['Urziceni', 98], ['Eforie', 86]])
        self.Iasi = Cidade('Iasi', [['Neamt', 87], ['Vaslui', 92]])
        self.Lugoj = Cidade('Lugoj', [['Timisoara', 111], ['Mehadia', 70]])
        self.Mehadia = Cidade('Mehadia', [['Dobreta', 75], ['Lugoj', 70]])
        self.Neamt = Cidade('Neamt', [['Iasi', 87]])
        self.Oradea = Cidade('Oradea', [['Sibiu', 151], ['Zerind', 71]])
        self.Pitesti = Cidade('Pitesti', [['RimnicuVilcea', 97], ['Craiova', 138], ['Bucharest', 101]])
        self.RimnicuVilcea = Cidade('RimnicuVilcea', [['Sibiu', 80], ['Pitesti', 97], ['Craiova', 146]]) 
        self.Sibiu = Cidade('Sibiu', [['Arad', 140], ['Oradea', 151], ['RimnicuVilcea', 80], ['Fagaras', 99]])
        self.Timisoara = Cidade('Timisoara', [['Arad', 118], ['Lugoj', 111]])
        self.Urziceni = Cidade('Urziceni', [['Vaslui', 142], ['Hirsova', 98], ['Bucharest', 85]])
        self.Vaslui = Cidade('Vaslui', [['Iasi', 92], ['Urziceni', 142]])
        self.Zerind = Cidade('Zerind', [['Arad', 75], ['Oradea', 71]])
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
        
        