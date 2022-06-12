# -*- coding: cp1252 -*-

# Conversao de CIPN para Ladder
# Por Anderson Linhares de Souza

# Colocaria possibilidade de diversos eventos/condicoes por
# transicao, mas tanto no artigo quanto nos livros, so existe
# um evento e condicao por transicao, entao fiz assim. Pode ser
# modificado, com certo trabalho

from CIPN import *
from ladder import *

# labels = [[plabels],[tlabels],[elabels],[clabels],[alabels]]

def convert(pn, labels=None):
    # Modulo de eventos externos
    m1 = Ladder()
    l = Linha()
    for i in range(len(pn.Ec)-1):
        if True in map(lambda x: x[1]==i, pn.lc):
            if labels:
                l += Contato(labels[2][i], 1)
            else:
                l += Contato('S'+str(i), 1)
            if pn.eimpulse[i] == 1:
                l += Borda(1)
                if labels:
                    l += Bobina(labels[2][i]+'r', 1)
                else:
                    l += Bobina('S'+str(i)+'r', 1)
            else:
                l += Borda(0)
                if labels:
                    l += Bobina(labels[2][i]+'f', 1)
                else:
                    l += Bobina('S'+str(i)+'f', 1)
            m1 += l
            l = Linha()
        
    # Modulo de condicoes de disparo
    m2 = Ladder()
    for t in range(pn.Tc):
        if pn.Postc[t] == [0]*pn.Pc:
            if list(zip(*pn.Prec)[t]) == [0]*pn.Pc:
                    continue
        if pn.lc[t][1] != (len(pn.Ec)-1):
            if pn.eimpulse[pn.lc[t][1]] == 1:
                if labels:
                    l += Contato(labels[2][pn.lc[t][1]]+'r',1)
                else:
                    l += Contato('S'+str(pn.lc[t][1])+'r',1)
            else:
                if labels:
                    l += Contato(labels[2][pn.lc[t][1]]+'f',1)
                else:
                    l += Contato('S'+str(pn.lc[t][1])+'f',1)
        if pn.lc[t][0] != (len(pn.C)-1):
            if labels:
                l += Contato(labels[3][pn.lc[t][0]],1)
            else:
                l += Contato('C'+str(pn.lc[t][0]),1)
        for p in range(pn.Pc):
            if pn.Prec[p][t] != 0:
                if labels:
                    l += Comp(labels[0][p],2,pn.Prec[p][t])
                else:
                    l += Comp('X'+str(p),2,pn.Prec[p][t])
            if pn.Inc[p][t] != 0:
                if labels:
                    l += Comp(labels[0][p],0,pn.Inc[p][t])
                else:
                    l += Comp('X'+str(p),0,pn.Inc[p][t])
        if pn.D[pn.ld[t]] == 0:
            if labels:
                l += Bobina(labels[1][t],1)
            else:
                l += Bobina('B'+str(t),1)
        else:
            if labels:
                l += Atraso(pn.D[pn.ld[t]],t,labels[1][t])
            else:
                l += Atraso(pn.D[pn.ld[t]], t)
        m2 += l
        l = Linha()

    # Modulo da dinamica da Petri Net
    m3 = Ladder()
    for t in range(pn.Tc):
        if pn.Postc[t] == [0]*pn.Pc:
            if list(zip(*pn.Prec)[t]) == [0]*pn.Pc:
                    continue
        if pn.D[pn.ld[t]] == 0:
            if labels:
                l += Contato(labels[1][t],1)
            else:
                l += Contato('B'+str(t),1)
        else:
            if labels:
                l += Contato(labels[1][t],1)
            else:
                l += Contato('TDN'+str(t),1)
        par = []
        for p in range(pn.Pc):
            if pn.Prec[p][t] != 0:
                if labels:
                    par += [Dinamica(labels[0][p],0,pn.Prec[p][t])]
                else:
                    par += [Dinamica('X'+str(p),0,pn.Prec[p][t])]
        for p in range(pn.Pc):
            if pn.Postc[t][p] !=0:
                if labels:
                    par += [Dinamica(labels[0][p],1,pn.Postc[t][p])]
                else:
                    par += [Dinamica('X'+str(p),1,pn.Postc[t][p])]
        if len(par)!=0:
            l += Paralelo(par)
        m3 += l
        l = Linha()

    #Modulo da inicializacao
    m4 = Ladder()
    l += Contato('B',0)
    par = []
    for p in range(pn.Pc):
        if pn.x0c[p] != 0:
            if labels:
                par += [Move(labels[0][p], pn.x0c[p])]
            else:
                par += [Move('X'+str(p), pn.x0c[p])]
    l += Paralelo(par+[Bobina('B',0)])
    m4 += l
    l = Linha()

    # Modulo das acoes
    m5 = Ladder()
    for p in range(pn.Pc):
        par = []
        if pn.la[p]:
            for a in range(len(pn.la[p])):
                if labels:
                    par += [Bobina(labels[4][pn.la[p][a]],1)]
                else:
                    par += [Bobina('A'+str(pn.la[p][a]),1)]
        if len(par) !=0:
            if labels:
                l += Comp(labels[0][p],1,1)
            else:
                l += Comp('X'+str(p),1,1)
            l += Borda(1)
            l += Paralelo(par)
        if l.x:
            m5 += l
        l = Linha()
        
    return [m1,m2,m3,m4,m5]
            
    
        
