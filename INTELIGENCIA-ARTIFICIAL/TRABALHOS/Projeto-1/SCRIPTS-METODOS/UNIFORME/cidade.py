


class Cidade:
    
    def __init__(self, nome, verticesAlvo, distanciaObjetivo):
        self.nome = nome
        self.verticesAlvo = list(verticesAlvo)
        self.distanciaObjetivo = distanciaObjetivo
        self.visitada = False
    
        
        