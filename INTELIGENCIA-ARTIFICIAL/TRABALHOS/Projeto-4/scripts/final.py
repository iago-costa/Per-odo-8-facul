import random
import math
import matplotlib
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
sns.set(style="white", color_codes=True)

#Inicialização das variaveis (construtor)
class Algoritmo_Genetico2:
    def __init__(self, numGeracao, tamPopulacao, taxaMutacao, taxaCrossover, tamCromossomo, interv_inicial, interv_final):
        self.numGeracao    = numGeracao
        self.tamPopulacao  = tamPopulacao
        self.taxaMutacao   = taxaMutacao
        self.taxaCrossover = taxaCrossover
        self.tamCromossomo = tamCromossomo
        self.interv_incial = interv_inicial
        self.inverv_final  = interv_final
        self.geracao       = 1
        self.populacao     = []
        self.pai1          = []
        self.pai2          = []
        self.cromossomo    = []
                
    # função cria_cromossomo é responsável por criar um vetor e 
    #retornar um cromossomo, com os genes setados aleatoriamente com probabilidade de 50%.   
    def cria_cromossomos(self): 
        self.cromossomo = []
        for x in range(self.tamCromossomo):
            if(random.random() < 0.5):
                self.cromossomo.append(0)
            else:
                self.cromossomo.append(1)
        return self.cromossomo
    
    #função cria o número de cromossomos setados no construtor e grama na variável população.
    def inicializa_populacao(self):
        for x in range(self.tamPopulacao):
            self.populacao.append(ag.cria_cromossomos())
    
    #A função mostra_população faz a varredura da variável população e imprime os bits que o cromossomo possui.
    def mostra_populacao(self):
        tan = len(self.populacao)
        print("Populacao da geraçao",self.geracao)
        for x in range(tan):
            print(self.populacao[x])
        ag.melhor()
      
    #ela retorna a constante de linearidade para manter a resolução real da função provocada pelo número alto (em binário) que será utilizado para representar o intervalo.
    def calcula_fator(self):
        return (abs(self.interv_incial)
                +abs(self.inverv_final))/pow(2,self.tamCromossomo)    


    #conversão direta da base binária para a base decimal. Essa função é utilizada para ajudar a encontrar o valor que o binário tenta representar.
    def binario_decimal(self,posicao):
        decimal = 0
        aux = self.tamCromossomo - 1
        for x in range(self.tamCromossomo):
            if(self.populacao[posicao][x] == 1):
                decimal += 2**aux
            aux -= 1                
        return decimal
    
    #usa a função binário_decimal para encontrar o valor que o binário possui, usa o fator para trazer para a escala da função e soma com o intervalo inicial para trazer para o ponto real que queremos representar.   
    def posicao(self,posicao):
        num = ag.binario_decimal(posicao)
        num *= ag.calcula_fator()
        num += self.interv_incial
        return num
    
    #fitness para encontrar o resultado da função.    
    def fitness(self, posicao):
        return ag.funcao(ag.posicao(posicao))
    
    #Seleção por torneio
    def torneio(self):
        pai1 = random.randint(0,self.tamPopulacao-1)
        pai2 = random.randint(0,self.tamPopulacao-1)

        while(pai1 == pai2):
            pai1 = random.randint(0,self.tamPopulacao-1)
            pai2 = random.randint(0,self.tamPopulacao-1)
        if(ag.fitness(pai1) < ag.fitness(pai2)):
            return pai1
        else:
            return pai2
        
    #crossover de um ponto
    def crossover(self, pai1, pai2, ponto):
        filho = []
        c = ponto
        for x in range(c):
            filho.append(self.populacao[pai1][x])
        for x in range(c,self.tamCromossomo):
            filho.append(self.populacao[pai2][x])
        return filho

    #Mutação
    def mutacao(self, cromossomo):
        for x in range(self.tamCromossomo):
            if(random.random() <= self.taxaMutacao):
                if(cromossomo[x] == 1):
                    cromossomo[x] = 0
                else:
                    cromossomo[x] = 1
        return cromossomo
    
    #evita o problema de pais iguais e assim tornar uma população sem diversidade.    
    def paiDiferentes(self):
        aux1 = ag.torneio()
        aux2 = ag.torneio()
        while(aux1 == aux2):
            aux1 = ag.torneio()
            aux2 = ag.torneio()
        return aux1, aux2
    
    #Ela faz integração de diversos métodos, verificação da ocorrência (ou não) de mutação e calcula o ponto de corte do crossover.
    def novaPopulacao(self):
        ponto = random.randint(0,self.tamCromossomo-1)
        self.pai1, self.pai2 = ag.paiDiferentes()
        if(random.random() < self.taxaCrossover):
            
            self.populacao.append(ag.mutacao(ag.crossover(self.pai1,
                                                          self.pai2, ponto)))
            self.populacao.append(ag.mutacao(ag.crossover(self.pai2,
                                                          self.pai1, ponto)))
   
        aux1, aux2 = ag.paiDiferentes()
        while((aux1 == self.pai1) and (aux2 == self.pai2) or
              (aux2 == self.pai1) and (aux1 == self.pai2)):
            aux1, aux2 = ag.paiDiferentes()
            
        if(random.random() < self.taxaCrossover):

            self.populacao.append(ag.mutacao(ag.crossover(self.pai1, 
                                                          self.pai2, ponto)))
            self.populacao.append(ag.mutacao(ag.crossover(self.pai2, 
                                                          self.pai1, ponto)))

        ag.remove()
        
    def funcao(self, num):
        return (math.pow(num,2) + (3*num) + 4)
    
    def melhor(self):
        melhor = 0
        for x in range(self.tamPopulacao):
            if(ag.fitness(x) > ag.fitness(melhor)):
                melhor = x
        return melhor
    
    def pior(self):
        pior = 0
        for x in range(self.tamPopulacao):
            if(ag.fitness(x) < ag.fitness(pior)):
                pior = x
        return pior
    
    def mostra(self):
        for x in range(self.tamPopulacao):
            print('Posição em x {0:.2f}' .format(ag.posicao(x)))
        print('O melhor cromossomo esta na posição: {0:.2f} na geração:'
              .format(ag.posicao(ag.pior())) , ag.geracao)

    def remove(self):
        while(len(self.populacao) >self.tamPopulacao):
            self.populacao.pop(ag.melhor())
            
#PROGRAMA
            
'''            
Prototipo do construtor
(Numero de gerações,tamanho da populacao, taxa de mutacao, taxa de crossover,tamamnho do cromossomo, intervalo inicial, intervalo final)
'''   
numero_de_geracoes = 100
tamanho_da_populacao = 100
taxa_de_mutacao = 0.01
taxa_de_crossover = 0.8
tamanho_do_cromossomo = 10
intervalo_inicial = -10
intervalo_final = 10

ag = AlgoritmoGenetico(numero_de_geracoes,tamanho_da_populacao,taxa_de_mutacao,taxa_de_crossover,tamanho_do_cromossomo,intervalo_inicial,intervalo_final)
# ag = Algoritmo_Genetico2(100,4,0.01,0.6,100,-10,10)
ag.inicializa_populacao()

for x in range(ag.numGeracao):
    ag.novaPopulacao()
    ag.geracao+=1

t = ag.posicao(ag.pior())
s = ag.fitness(ag.pior())

x = np.linspace(-10,10,1000)
y = []
for i in range(len(x)):
    y.append(pow(x[i],2) + x[i]*3 + 4)

fig = plt.figure(figsize=(5,3))
ax = fig.add_axes([0,0,1,1])
ax.plot(x, (pow(x,2) + x*3 + 4) , s)
plt.plot(t, s, 'o', markersize=8)
ax.grid(True)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_title('Método do torneio x = {0:.2f} f(x) = {1:.2f}'
             .format(t,s))