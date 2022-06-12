# -*- coding: cp1252 -*-

# Modelagem de Redes Petri Interpretadas para Controle (CIPN)
# Por Anderson Linhares de Souza


'''Pc <M> -> Numero de lugares
Tc <N> -> Numero de transicoes
Prec(pi, tj) <[MxN]> -> Peso dos arcos de chegada do lugar i na transicao j
Postc(tj, pi) <[NxM]> -> Peso dos arcos de saída da transicao j para o lugar i
x0c <[M]> -> Estado inicial
Inc(pi, tj) <[MxN]> -> Peso dos arcos inibidores, 0 é mesmo que nao ter arco
C <[K bool]> -> Condicoes
Ec <[L bool]> -> Eventos
lc <[Nx2]> -> Mapeamento das transicoes a condicoes e eventos
D <[N]> -> Atraso dos disparos de transicoes
ld <[N]> -> Mapeamento dos atrasos
A <[J bool]> -> Acoes
la <[MxR]> -> Mapeamento dos lugares a R acoes (precisa de lista em cada) ou None
'''

# É de responsabilidade do projetista que nao hajam conflitos e que
# acoes sejam associadas apenas a lugares seguros



from threading import Thread
from time import sleep
from tkMessageBox import *


class TimerAct(Thread):
    def __init__(self, act):
        Thread.__init__(self)
        self.act = act
        act.timer = self
    def run(self):
        self.act.acender()
        sleep(0.7)
        if self.act.timer == self:
            self.act.apagar()
            
class Delay(Thread):
    def __init__(self, pn, t):
        Thread.__init__(self)
        self.pn, self.t, self.d = pn, t, pn.D[pn.ld[t]]
    def run(self):
        d, t, pn = self.d, self.t, self.pn
        self.stop = 0
        sleep(d)
        if not self in self.pn.timers[t]:
            return
        else:
            pn.timers[t].remove(self)
        for i in range(pn.Pc):
            if pn.x[i]<pn.Prec[i][t]:
                return
            if pn.Inc[i][t]:
                if pn.x[i]>=pn.Inc[i][t]:
                    return
            if not pn.C[pn.lc[t][0]]:
                return
        xAntes = pn.x[:]
        while not self.stop:
            for p in range(pn.Pc):
                pn.x[p] -= pn.Prec[p][t]
                pn.x[p] += pn.Postc[t][p]
                if pn.x[p]>0 and xAntes[p]==0:
                    if pn.la[p]:
                        for j in pn.la[p]:
                            pn.A[j]=True
                            self.pn.parent.acoes[j].timer = TimerAct(self.pn.parent.acoes[j])
                            self.pn.parent.acoes[j].timer.start()
                pn.parent.update_state()
            for p in range(pn.Pc):
                if pn.x[p] < pn.Prec[p][t]:
                    self.stop = 1
                if pn.Inc[p][t]:
                    if pn.x[p]>=pn.Inc[p][t]:
                        self.stop = 1
            if pn.lc[t][1] != len(pn.Ec)-1:
                break
        pn.setFireable()
        pn.run()

class CIPN():
    def __init__(self, Pc, Tc, Prec, Postc, x0c, Inc, C, Ec, lc, D, ld, A, la, parent=None):
        self.parent = parent
        self.x0c = x0c
        self.Pc, self.Tc = Pc, Tc
        self.Prec, self.Postc, self.Inc = Prec, Postc, Inc
        self.C, self.Ec, self.lc, self.D = C, Ec, lc, D
        self.ld, self.A, self.la = ld, A, la
        self.x, self.toFire = x0c, [False]*Tc
        self.timers = []
        for t in range(Tc):
            self.timers.append([])
        self.eimpulse = [1]*len(Ec)
    def setImpulse(self, e, x):
        self.eimpulse[e]=x
    def isFireable(self, t):
        for i in range(self.Pc):
            if self.x[i]<self.Prec[i][t]:
                return False
            if self.Inc[i][t]:
                if self.x[i]>=self.Inc[i][t]:
                    return False
        if not self.C[self.lc[t][0]] or not self.Ec[self.lc[t][1]]:
            return False
        return True
    def setFireable(self):
        for t in range(self.Tc):
            self.check_timers(t)
        self.toFire = [False]*self.Tc
        for t in range(self.Tc):
            if self.isFireable(t) and not self.timers[t]:
                self.toFire[t]=True
    def setCondition(self, c, b):
        self.C[c]=b
        self.setFireable()
        self.run()
    def initialize(self):
        for i in range(self.Pc):
            if self.x[i]>0:
                if self.la[i]:
                    for j in self.la[i]:
                        self.A[j]=True
        self.setFireable()
        self.run()
    def fire(self, t):
        xAntes = self.x[:]
        for p in range(self.Pc):
            self.x[p] -= self.Prec[p][t]
            self.x[p] += self.Postc[t][p]
            if self.x[p]>0 and xAntes[p]==0:
                if self.la[p]:
                    for j in self.la[p]:
                        self.A[j]=True
                        self.parent.acoes[j].timer = TimerAct(self.parent.acoes[j])
                        self.parent.acoes[j].timer.start()
        self.parent.update_state()
    def event(self, e):
        self.Ec[e] = True
        self.setFireable()
        self.Ec[e] = False
        self.run()
    def run(self):
        contador=0
        while self.toFire != [0]*self.Tc:
            contador += 1
            if contador > 2000:
                abortar = askquestion('Looping infinito detectado','O PETRILab realizou 2000 iterações sem a intervenção do '
                                                         'usuário. É provável que haja um looping infinito na rede. '
                                                         'Deseja abortar a simulação?',)
                if abortar=='yes':
                    self.parent.parar()
                    contador=0
                    break
                else:
                    contador=0
            for t in range(self.Tc):
                if self.toFire[t] and self.D[self.ld[t]]==0:
                    self.fire(t)
                elif self.toFire[t] and self.D[self.ld[t]] !=0:
                    self.timers[t]+=[Delay(self, t)]
                    self.timers[t][-1].start()
            self.setFireable()
    def check_timers(self, t): #EXPERIMENTAL
        keep = True
        for i in range(self.Pc):
            if self.x[i]<self.Prec[i][t]:
                keep = False
            if self.Inc[i][t]:
                if self.x[i]>=self.Inc[i][t]:
                    keep = False
        if not self.C[self.lc[t][0]]:
            keep = False
        if not keep:
            self.timers[t] = []
            
    def __str__(self):
        txt = 'Estado: '+str(self.x)
        txt += '\nCondicoes: '+str(self.C)
        txt += '\nAcoes: '+str(self.A)
        return txt
    def __repr__(self):
        return self.__str__()

