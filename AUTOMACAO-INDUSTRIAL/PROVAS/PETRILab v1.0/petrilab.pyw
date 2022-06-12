# -*- coding: cp1252 -*-

from CIPN import *
from ladder import *
from conversao import *
from Tkinter import *
from tkSimpleDialog import *
from tkFileDialog import *
from diagrama import *
from tkMessageBox import *
from math import sin, cos, tan, asin, acos, atan, pi, radians, degrees
import webbrowser
from sys import exit

# Interface de inser��o de PN e simula��o

CANVASSIZEX, CANVASSIZEY = 2000, 2000

class Lugar:
    def __init__(self, parent):
        self.x0, self.x = 0, 0
        self.acoes = []
        self.text = 'p'+str(parent.maxlugares)
        self.parent = parent
        if self.parent.exibirrot.get():
            self.fill='black'
        else:
            self.fill=''
        self.canvas = parent.c
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        self.oval = self.canvas.create_oval(x-15+xb,y-15+yb,x+15+xb,y+15+yb, fill='white')
        self.label = self.canvas.create_text(x+xb,y-16+yb, text=self.text, anchor=S,fill=self.fill)
        self.elabel = self.canvas.create_text(x+xb,y+yb,text=str(self.x0))
        self.actlabels = []
        self.inarcs, self.outarcs = [], []
        self.items = [self.label, self.oval, self.elabel] + self.actlabels
    def follow(self, e,add=0):
        parent=self.parent
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        self.canvas.coords(self.elabel, (x+xb, y+yb+add))
        self.canvas.coords(self.oval, (x-15+xb,y-15+yb+add,x+15+xb, y+15+yb+add))
        self.canvas.coords(self.label, (x+xb, y-16+yb+add))
    def mover(self,add=0,xs=None,ys=None):
        self.parent.saved=False
        parent=self.parent
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        if xs is not None and ys is not None:
            x,y = xs+15, ys+15
            xb,yb = 0,0
        self.canvas.coords(self.oval, (x-15+xb,y-15+yb+add,x+15+xb, y+15+yb+add))
        self.canvas.coords(self.elabel, (x+xb, y+yb+add))
        self.canvas.coords(self.label, (x+xb, y-16+yb+add))
        self.update_moving()
        for i in self.parent.arcos+self.parent.inibidores:
            i.redraw()
    def place(self, e):
        self.parent.saved=False
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        if CANVASSIZEX-16>e.x+xb>16 and CANVASSIZEY-16>e.y+yb>30:
            self.parent.unbind('<Motion>')
            self.parent.unbind('<B1-Motion>')
            self.parent.unbind('<Escape>')
            self.parent.unbind('<ButtonRelease-1>')
            self.canvas.unbind('<Button-1>')
            self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
            self.parent.bind('<Double-Button-1>', self.parent.editbuts)
            self.parent.bind('<Button-3>', self.parent.removebuts)
            self.parent.c.bind('<Button-3>', self.parent.flip)
            self.parent.c.bind('<B1-Motion>', self.parent.mover2)
            if not self in self.parent.lugares:
                self.parent.lugares += [self]
            self.parent.inserindo=None
            self.parent.maxlugares+=1
    def placem(self,e):
        for i in self.parent.arcos+self.parent.inibidores:
            i.redraw()
    def cancel(self, e):
        self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
        self.parent.bind('<Double-Button-1>', self.parent.editbuts)
        self.parent.bind('<Button-3>', self.parent.removebuts)
        self.parent.c.bind('<Button-3>', self.parent.flip)
        self.parent.unbind('<Motion>')
        self.canvas.unbind('<Button-1>')
        self.canvas.delete(self.oval)
        self.canvas.delete(self.label)
        self.canvas.delete(self.elabel)
        self.parent.inserindo=None
    def getpos(self, arc):
        if arc.desenhavel:
            if self is arc.init:
                ponto=arc.pontoi
            else:
                ponto=arc.pontof
            tpos=ponto
        else:
            tpos = arc.tpos
        cent = (self.canvas.coords(self.oval)[0]+15, self.canvas.coords(self.oval)[1]+15)
        hip = ((cent[0]-tpos[0])**2+(cent[1]-tpos[1])**2)**0.5
        sen, cos = (tpos[1]-cent[1])/hip, (tpos[0]-cent[0])/hip
        return (cent[0]+15*cos, cent[1]+15*sen)
    def update_labels(self):
        self.canvas.itemconfigure(self.label, text=self.text)
        self.canvas.itemconfigure(self.elabel, text=self.x)
        coords = self.canvas.coords(self.oval)
        for i in self.actlabels:
            self.canvas.delete(i)
        self.actlabels = []
        for i in range(len(self.acoes)):
            self.actlabels += [self.canvas.create_text(coords[0]+13, coords[3]+11*i,
                                                      anchor=N, text='*'+self.acoes[i].text)]
        for i in self.actlabels:
            if not i in self.items:
                self.items.append(i)
    def update_moving(self):
        self.canvas.itemconfigure(self.label, text=self.text)
        self.canvas.itemconfigure(self.elabel, text=self.x)
        coords = self.canvas.coords(self.oval)
        for i in range(len(self.acoes)):
            self.canvas.coords(self.actlabels[i], coords[0]+13,coords[3]+11*i)
    def delete(self):
        self.parent.saved=False
        self.parent.lugares.remove(self)
        for i in self.inarcs+self.outarcs:
            i.delete()
        for i in self.items:
            self.parent.c.delete(i)

class Transicao:
    def __init__(self, parent):
        self.text = 't'+str(parent.maxtransicoes)
        self.parent, self.canvas = parent, parent.c
        if self.parent.exibirrot.get():
            self.fill='black'
        else:
            self.fill=''
        self.horizontal = False
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        self.rect = self.canvas.create_rectangle(x-3+xb,y-23+yb,x+3+xb,y+23+yb, fill='black')
        self.label = self.canvas.create_text(x+xb, y-24+yb, text=self.text, anchor=S,fill=self.fill)
        self.inarcs, self.outarcs = [], []
        self.nl, self.nr = [], []
        self.event, self.condicao, self.delay = None, None, 0
        self.eimg = self.canvas.create_image(0,0,image='')
        self.levent = self.canvas.create_text(0,0,text='',anchor=N)
        self.lcond =  self.canvas.create_text(0,0,text='',anchor=N)
        self.ldelay = self.canvas.create_text(0,0,text='',anchor=N)
        self.items = [self.label, self.rect, self.levent, self.lcond, self.ldelay, self.eimg]
    def update_labels(self):
        self.canvas.itemconfigure(self.label, text=self.text)
        coords = self.canvas.coords(self.rect)
        labels = []
        self.canvas.itemconfigure(self.ldelay, text='')
        self.canvas.itemconfigure(self.lcond, text='')
        self.canvas.itemconfigure(self.levent, text='')
        if not self.event is None:
            labels += [self.levent]
        if not self.condicao is None:
            labels += [self.lcond]
        if self.delay:
            labels += [self.ldelay]

        def sorte(x,y):
            px, py = 0,0
            if x == self.levent: px = 3
            if x == self.lcond: px = 2
            if x == self.ldelay: px = 1
            if y == self.levent: py = 3
            if y == self.lcond: py = 2
            if y == self.ldelay: py = 1
            return px>py

        labels.sort(cmp=sorte)
        if self.horizontal:
            if not self.levent in labels: self.canvas.itemconfigure(self.eimg, image='')
            if labels:
                def text(label):
                    if label == self.levent:
                        return self.event.text
                    elif label == self.lcond:
                        return self.condicao.text
                    elif label == self.ldelay:
                        return str(self.delay)+'s'
                texto = text(labels[0])
                for i in labels[1:]:
                    texto += ','+text(i)
                self.canvas.itemconfigure(labels[0], text=texto)
                self.canvas.itemconfigure(labels[0], anchor=W)
                if not self.levent in labels:
                    self.canvas.itemconfigure(self.eimg, image='')
                    self.canvas.coords(labels[0], (coords[2]+3, (coords[1]+coords[3])/2.))
                else:
                    if self.event.borda:
                        self.canvas.itemconfigure(self.eimg, image=self.parent.upc)
                    else:
                        self.canvas.itemconfigure(self.eimg, image=self.parent.downc)
                    self.canvas.itemconfigure(self.eimg, anchor=W)
                    self.canvas.coords(self.eimg, (coords[2]+3, (coords[1]+coords[3])/2.))
                    self.canvas.coords(labels[0], (coords[2]+3+7, (coords[1]+coords[3])/2.))

        else:
            if not self.levent in labels:
                self.canvas.itemconfigure(self.eimg, image='')
            for i in labels:
                if i == self.levent and not self.event is None:
                    if self.event.borda:
                        self.canvas.itemconfigure(self.eimg, image=self.parent.upc)
                    else:
                        self.canvas.itemconfigure(self.eimg, image=self.parent.downc)
                    self.canvas.itemconfigure(i, text=self.event.text)
                    self.canvas.itemconfigure(i, anchor=N)
                    self.canvas.coords(i, (coords[0]+3+4, coords[3]+10*labels.index(i)))
                    self.canvas.itemconfigure(self.eimg, anchor=E)
                    x,y = self.canvas.bbox(i)[0], (self.canvas.bbox(i)[1]+self.canvas.bbox(i)[3])/2.
                    self.canvas.coords(self.eimg, (x,y-1))
                elif i == self.lcond and not self.condicao is None:
                    self.canvas.itemconfigure(i, text=self.condicao.text)
                    self.canvas.itemconfigure(i, anchor=N)
                    self.canvas.coords(i, (coords[0]+3, coords[3]+10*labels.index(i)))
                elif i == self.ldelay and self.delay:
                    self.canvas.itemconfigure(i, text=str(self.delay)+'s')
                    self.canvas.itemconfigure(i, anchor=N)
                    self.canvas.coords(i, (coords[0]+3, coords[3]+10*labels.index(i)))
    def flip(self, e=None):
        self.horizontal = not self.horizontal
        x0,y0,x1,y1 = self.canvas.coords(self.rect)
        xm,ym = (x1+x0)/2., (y1+y0)/2.
        if self.horizontal:
            self.canvas.coords(self.rect, xm-23,ym-3,xm+23,ym+3)
            self.canvas.coords(self.label, xm-25,ym)
            self.canvas.itemconfig(self.label, anchor=E)
        else:
            self.canvas.coords(self.rect, xm-3,ym-23,xm+3,ym+23)
            self.canvas.coords(self.label, xm,ym-24)
            self.canvas.itemconfig(self.label, anchor=S)
        self.update_labels()
        self.parent.redraw_arcs()
    def follow(self, e):
        parent=self.parent
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        if self.horizontal:
            self.canvas.coords(self.rect, (x-23+xb,y-3+yb,x+23+xb,y+3+yb))
            self.canvas.itemconfig(self.label, anchor=E)
            self.canvas.coords(self.label, (x-25+xb, y+yb))
        else:
            self.canvas.coords(self.rect, (x-3+xb,y-23+yb,x+3+xb,y+23+yb))
            self.canvas.itemconfig(self.label, anchor=S)
            self.canvas.coords(self.label, (x+xb, y-24+yb))
        self.update_labels()
    def mover(self,xs=None,ys=None):
        self.parent.saved=False
        parent=self.parent
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        if self.horizontal:
            if xs is not None and ys is not None:
                x,y = xs+23, ys+3
                xb,yb = 0,0
            self.canvas.coords(self.rect, (x-23+xb,y-3+yb,x+23+xb,y+3+yb))
            self.canvas.itemconfig(self.label, anchor=E)
            self.canvas.coords(self.label, (x-25+xb, y+yb))
        else:
            if xs is not None and ys is not None:
                x,y = xs+3, ys+23
                xb,yb = 0,0
            self.canvas.coords(self.rect, (x-3+xb,y-23+yb,x+3+xb,y+23+yb))
            self.canvas.itemconfig(self.label, anchor=S)
            self.canvas.coords(self.label, (x+xb, y-24+yb))
        self.update_labels()
        for i in self.parent.arcos+self.parent.inibidores:
            i.redraw()
    def place(self, e,movendo=False):
        self.parent.saved=False
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        parent = self.parent
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        if CANVASSIZEX-10>e.x+xb>10 and CANVASSIZEY-25>e.y+yb>40:
            self.parent.unbind('<Motion>')
            self.parent.unbind('<B1-Motion>')
            self.parent.unbind('<ButtonRelease-1>')
            self.canvas.unbind('<Button-1>')
            self.parent.unbind('<Escape>')
            self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
            self.parent.bind('<Double-Button-1>', self.parent.editbuts)
            self.parent.bind('<Button-3>', self.parent.removebuts)
            self.parent.c.bind('<B1-Motion>', self.parent.mover2)
            self.parent.c.bind('<Button-3>', self.parent.flip)
            if not self in self.parent.transicoes:
                self.parent.transicoes += [self]
            self.parent.inserindo=None
            if not movendo: self.parent.maxtransicoes+=1
    def placem(self,e):
        for i in self.parent.arcos+self.parent.inibidores:
            i.redraw()
    def cancel(self, e):
        self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
        self.parent.bind('<Double-Button-1>', self.parent.editbuts)
        self.parent.bind('<Button-3>', self.parent.removebuts)
        self.parent.c.bind('<Button-3>', self.flip)
        self.parent.unbind('<Motion>')
        self.canvas.unbind('<Button-1>')
        self.canvas.delete(self.rect)
        self.canvas.delete(self.label)
        self.parent.inserindo=None
    def updatepos(self, arc):
        if self.horizontal:
            self.nu, self.nd = [], []
            for i in self.inarcs+self.outarcs:
                if i.desenhavel:
                    if i.init is self:
                        ponto = i.pontoi
                    else:
                        ponto = i.pontof
                    if ponto[1]<self.canvas.coords(self.rect)[1]+3:
                        self.nu += [i]
                    else:
                        self.nd += [i]
                else:
                    if self.canvas.coords(i.p.oval)[1]+15 < self.canvas.coords(self.rect)[1]+3:
                        self.nu += [i]
                    else:
                        self.nd += [i]
            def cos(x):
                if x.desenhavel:
                    if x.init is self:
                        ponto = x.pontoi
                    else:
                        ponto = x.pontof
                    pc = ponto
                    tc = self.canvas.coords(self.rect)
                else:
                    pc = x.p.canvas.coords(x.p.oval)
                    tc = x.t.canvas.coords(x.t.rect)
                return (pc[0]-tc[0])/((pc[1]-tc[1])**2+(pc[0]-tc[0])**2)**0.5
            self.nu.sort(key=lambda x: cos(x))
            self.nd.sort(key=lambda x: cos(x))
            if arc in self.nu:
                i = self.nu.index(arc)
                return (False, len(self.nu), i)
            else:
                i = self.nd.index(arc)
                return (True, len(self.nd), i)
        else:
            self.nl, self.nr = [], []
            for i in self.inarcs+self.outarcs:
                if i.desenhavel:
                    if i.init is self:
                        ponto = i.pontoi
                    else:
                        ponto = i.pontof
                    if ponto[0] < self.canvas.coords(self.rect)[0]+3:
                        self.nl += [i]
                    else:
                        self.nr += [i]
                else:
                    if self.canvas.coords(i.p.oval)[0]+15 < self.canvas.coords(self.rect)[0]+3:
                        self.nl += [i]
                    else:
                        self.nr += [i]
            def sen(x):
                if x.desenhavel:
                    if x.init is self:
                        ponto = x.pontoi
                    else:
                        ponto = x.pontof
                    pc = ponto
                    tc = self.canvas.coords(self.rect)
                else:
                    pc = x.p.canvas.coords(x.p.oval)
                    tc = x.t.canvas.coords(x.t.rect)
                return (pc[1]-tc[1])/((pc[1]-tc[1])**2+(pc[0]-tc[0])**2)**0.5
            self.nl.sort(key=lambda x: sen(x))
            self.nr.sort(key=lambda x: sen(x))
            if arc in self.nl:
                i = self.nl.index(arc)
                return (False, len(self.nl), i)
            else:
                i = self.nr.index(arc)
                return (True, len(self.nr), i)
    def getpos(self, arc):
        x = self.updatepos(arc)
        if self.horizontal:
            if x[0]:
                return (self.canvas.coords(self.rect)[0]+(x[2]+1)*46/(x[1]+1), self.canvas.coords(self.rect)[3])
            else:
                return (self.canvas.coords(self.rect)[0]+(x[2]+1)*46/(x[1]+1), self.canvas.coords(self.rect)[1])
        else:
            if x[0]:
                return (self.canvas.coords(self.rect)[2], self.canvas.coords(self.rect)[1]+(x[2]+1)*46/(x[1]+1))
            else:
                return (self.canvas.coords(self.rect)[0], self.canvas.coords(self.rect)[1]+(x[2]+1)*46/(x[1]+1))
    def delete(self):
        self.parent.saved=False
        self.parent.transicoes.remove(self)
        for i in self.inarcs+self.outarcs:
            i.delete()
        for i in self.items:
            self.parent.c.delete(i)

class Arco:
    def __init__(self, init, end, peso, parent, desenhavel=False,xs=None,ys=None):
        self.desenhavel=desenhavel
        self.items=[]
        if desenhavel:
            self.segmentos=[]
            self.parent=parent
            self.oval, self.tpeso =None,None
            self.init, self.end, self.peso = init, end, 1
            a, b = self.parent.sh.get()
            perch = a/(1-b+a)
            a, b = self.parent.sv.get()
            percv = a/(1-b+a)
            x,y = parent.winfo_pointerx(), parent.winfo_pointery()
            x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
            xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
            yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
            x,y=x+xb,y+yb
            if xs is not None and ys is not None:
                x,y = xs, ys
            self.lastx,self.lasty = x,y
            self.pontoi=[x,y]
            self.pontof=None
            self.init.outarcs += [self]
            self.segmentos += [self.parent.c.create_line(self.init.getpos(self)[0], self.init.getpos(self)[1],self.pontoi[0],
                                                         self.pontoi[1])]
            self.parent.redraw_arcs()
            self.items=self.segmentos
        else:
            self.parent=parent
            self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
            self.parent.bind('<Double-Button-1>', self.parent.editbuts)
            self.parent.bind('<Button-3>', self.parent.removebuts)
            self.parent.c.bind('<Button-3>', self.parent.flip)
            self.parent.c.bind('<B1-Motion>', self.parent.mover2)
            self.ang, self.r = ANG, R = 20., 10.
            self.init, self.end, self.peso = init, end, peso
            self.init.outarcs += [self]
            self.end.inarcs += [self]
            if isinstance(self.init, Transicao):
                self.t, self.p = self.init, self.end
            else:
                self.t, self.p = self.end, self.init
            self.tpos = self.t.getpos(self)
            self.ppos = self.p.getpos(self)
            if self.t == self.init:
                self.initpos = self.tpos
                self.endpos = self.ppos
            else:
                self.initpos = self.ppos
                self.endpos = self.tpos
            num = self.endpos[1]-self.initpos[1]
            den = self.endpos[0]-self.initpos[0]
            if den==0 and num ==0:
                alpha= pi -radians(ANG)
            elif den == 0 and num >=0:
                alpha = pi-radians(ANG)-(pi/2.0)
            elif den==0 and num <0:
                alpha = pi-radians(ANG)+(pi/2.0)
            else:
                alpha = pi-radians(ANG)-atan(num/den)
            if self.endpos[0] >= self.initpos[0]:
                self.s1 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha), self.endpos[1]-R*sin(alpha))
                self.s2 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha+2*radians(ANG)), self.endpos[1]-R*sin(alpha+2*radians(ANG)))
            else:
                self.s1 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha), self.endpos[1]+R*sin(alpha))
                self.s2 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha+2*radians(ANG)), self.endpos[1]+R*sin(alpha+2*radians(ANG)))
            self.l = self.init.canvas.create_line(self.tpos[0], self.tpos[1], self.ppos[0], self.ppos[1])
            self.init.parent.redraw_arcs()
            meio = ((self.tpos[0]+self.ppos[0])/2.,(self.tpos[1]+self.ppos[1])/2.)
            self.oval, self.tpeso = None, None
            self.items = [self.l, self.s1, self.s2]
        if self.peso>1:
            self.oval = self.init.canvas.create_rectangle(meio[0]-6,meio[1]-6,
                                                          meio[0]+6,meio[1]+6,
                                          outline='white', fill='white')
            self.tpeso = self.init.canvas.create_text(meio[0], meio[1],text=str(self.peso))
            self.items += [self.oval, self.tpeso]
    def redraw(self):
        if self.desenhavel:
            R, ANG = self.r, self.ang
            self.tpos = self.t.getpos(self)
            self.ppos = self.p.getpos(self)
            if self.t == self.init:
                self.spos = self.tpos
                self.initpos = self.pontof
                self.endpos = self.ppos
            else:
                self.spos = self.ppos
                self.initpos = self.pontof
                self.endpos = self.tpos
            num = self.endpos[1]-self.initpos[1]
            den = self.endpos[0]-self.initpos[0]
            if den==0 and num ==0:
                alpha= pi -radians(ANG)
            elif den == 0 and num >0:
                alpha = pi-radians(ANG)-(pi/2.0)
            elif den==0 and num <0:
                alpha = pi-radians(ANG)+(pi/2.0)
            else:
                alpha = pi-radians(ANG)-atan(num/den)
            if self.endpos[0] >= self.initpos[0]:
                self.init.canvas.coords(self.s1, self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha), self.endpos[1]-R*sin(alpha))
                self.init.canvas.coords(self.s2, self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha+2*radians(ANG)), self.endpos[1]-R*sin(alpha+2*radians(ANG)))
            else:
                self.init.canvas.coords(self.s1, self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha), self.endpos[1]+R*sin(alpha))
                self.init.canvas.coords(self.s2, self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha+2*radians(ANG)), self.endpos[1]+R*sin(alpha+2*radians(ANG)))

            self.init.canvas.coords(self.segmentos[-1], (self.initpos[0],self.initpos[1],self.endpos[0],self.endpos[1]))
            self.init.canvas.coords(self.segmentos[0], (self.spos[0],self.spos[1],self.pontoi[0],self.pontoi[1]))
            ttotal=0
            for i in self.segmentos:
                b = self.parent.c.coords(i)
                t = ((b[0]-b[2])**2+(b[1]-b[3])**2)**0.5
                ttotal += t
            tmed=0
            for i in range(len(self.segmentos)):
                b = self.parent.c.coords(self.segmentos[i])
                t = ((b[0]-b[2])**2+(b[1]-b[3])**2)**0.5
                tmed += t
                if tmed >= ttotal/2.0:
                    p = abs((t-(tmed-ttotal/2.0))/t)
                    mx = b[0]+(b[2]-b[0])*p
                    my = b[1]+(b[3]-b[1])*p
                    meio=[mx,my]
                    break
            if self.peso==1:
                if self.oval:
                    self.init.canvas.delete(self.oval)
                    self.init.canvas.delete(self.tpeso)
                    self.items.remove(self.oval)
                    self.items.remove(self.tpeso)
                    self.oval, self.tpeso = None, None
                self.items=[self.s1,self.s2]+self.segmentos
            if self.peso>1:
                if self.oval:
                    self.init.canvas.coords(self.oval, meio[0]-5,meio[1]-5,
                                                                  meio[0]+5,meio[1]+5)
                    self.init.canvas.itemconfig(self.oval, outline='white', fill='white')
                    self.init.canvas.coords(self.tpeso, meio[0], meio[1])
                    self.init.canvas.itemconfig(self.tpeso, text=str(self.peso))
                else:
                    self.oval = self.init.canvas.create_rectangle(meio[0]-6,meio[1]-6,
                                                              meio[0]+6,meio[1]+6,
                                              outline='white', fill='white')
                    self.tpeso = self.init.canvas.create_text(meio[0], meio[1],text=str(self.peso))
                self.items = [self.oval, self.tpeso, self.s1, self.s2]+self.segmentos
        else:
            R, ANG = self.r, self.ang
            self.tpos = self.t.getpos(self)
            self.ppos = self.p.getpos(self)
            if self.t == self.init:
                self.initpos = self.tpos
                self.endpos = self.ppos
            else:
                self.initpos = self.ppos
                self.endpos = self.tpos

            num = self.endpos[1]-self.initpos[1]
            den = self.endpos[0]-self.initpos[0]
            if den==0 and num ==0:
                alpha= pi -radians(ANG)
            elif den == 0 and num >=0:
                alpha = pi-radians(ANG)-(pi/2.0)
            elif den==0 and num <0:
                alpha = pi-radians(ANG)+(pi/2.0)
            else:
                alpha = pi-radians(ANG)-atan(num/den)
            if self.endpos[0] >= self.initpos[0]:
                self.init.canvas.coords(self.s1, self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha), self.endpos[1]-R*sin(alpha))
                self.init.canvas.coords(self.s2, self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha+2*radians(ANG)), self.endpos[1]-R*sin(alpha+2*radians(ANG)))
            else:
                self.init.canvas.coords(self.s1, self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha), self.endpos[1]+R*sin(alpha))
                self.init.canvas.coords(self.s2, self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha+2*radians(ANG)), self.endpos[1]+R*sin(alpha+2*radians(ANG)))

            meio = ((self.tpos[0]+self.ppos[0])/2.,(self.tpos[1]+self.ppos[1])/2.)
            self.init.canvas.coords(self.l, (self.tpos[0], self.tpos[1], self.ppos[0], self.ppos[1]))
            if self.peso==1:
                if self.oval:
                    self.init.canvas.delete(self.oval)
                    self.init.canvas.delete(self.tpeso)
                    self.items.remove(self.oval)
                    self.items.remove(self.tpeso)
                    self.oval, self.tpeso = None, None
                self.items=[self.l,self.s1,self.s2]
            if self.peso>1:
                if self.oval:
                    self.init.canvas.coords(self.oval, meio[0]-5,meio[1]-5,
                                                                  meio[0]+5,meio[1]+5)
                    self.init.canvas.itemconfig(self.oval, outline='white', fill='white')
                    self.init.canvas.coords(self.tpeso, meio[0], meio[1])
                    self.init.canvas.itemconfig(self.tpeso, text=str(self.peso))
                else:
                    self.oval = self.init.canvas.create_rectangle(meio[0]-6,meio[1]-6,
                                                              meio[0]+6,meio[1]+6,
                                              outline='white', fill='white')
                    self.tpeso = self.init.canvas.create_text(meio[0], meio[1],text=str(self.peso))
                self.items = [self.l, self.oval, self.tpeso, self.s1, self.s2]
    def delete(self):
        self.parent.saved=False
        if self in self.parent.arcos:
            self.parent.arcos.remove(self)
        if self in self.init.outarcs:
            self.init.outarcs.remove(self)
        if self.end:
            if self in self.end.inarcs:
                self.end.inarcs.remove(self)
        self.parent.redraw_arcs()
        for i in self.items:
            self.parent.c.delete(i)
    def add_segment(self,xs=None,ys=None):
        parent=self.parent
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        x,y=x+xb,y+yb
        if xs is not None and ys is not None:
            x,y = xs, ys
        self.segmentos += [self.parent.c.create_line(self.lastx,self.lasty,x,y)]
        self.lastx, self.lasty = x,y
        self.items=self.segmentos
    def finish(self, aend):
        self.parent.saved=False
        self.end=aend
        self.end.inarcs += [self]
        self.pontof = [self.lastx,self.lasty]
        self.segmentos += [self.parent.c.create_line(self.lastx,self.lasty,self.end.getpos(self)[0],self.end.getpos(self)[1])]
        self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
        self.parent.bind('<Double-Button-1>', self.parent.editbuts)
        self.parent.bind('<Button-3>', self.parent.removebuts)
        self.parent.c.bind('<Button-3>', self.parent.flip)
        self.parent.c.bind('<B1-Motion>', self.parent.mover2)
        self.ang, self.r = ANG, R = 20., 10.
        if isinstance(self.init, Transicao):
            self.t, self.p = self.init, self.end
        else:
            self.t, self.p = self.end, self.init
        self.tpos = self.t.getpos(self)
        self.ppos = self.p.getpos(self)
        if self.t == self.init:
            self.initpos = self.pontof
            self.endpos = self.ppos
        else:
            self.initpos = self.pontof
            self.endpos = self.tpos
        num = self.endpos[1]-self.initpos[1]
        den = self.endpos[0]-self.initpos[0]
        if den==0 and num ==0:
            alpha= pi -radians(ANG)
        elif den == 0 and num >=0:
            alpha = pi-radians(ANG)-(pi/2.0)
        elif den==0 and num <0:
            alpha = pi-radians(ANG)+(pi/2.0)
        else:
            alpha = pi-radians(ANG)-atan(num/den)
        if self.endpos[0] >= self.initpos[0]:
            self.s1 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha), self.endpos[1]-R*sin(alpha))
            self.s2 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]+R*cos(alpha+2*radians(ANG)), self.endpos[1]-R*sin(alpha+2*radians(ANG)))
        else:
            self.s1 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha), self.endpos[1]+R*sin(alpha))
            self.s2 = self.init.canvas.create_line(self.endpos[0], self.endpos[1], self.endpos[0]-R*cos(alpha+2*radians(ANG)), self.endpos[1]+R*sin(alpha+2*radians(ANG)))
        self.init.parent.redraw_arcs()
        self.parent.desenhando=None
        self.parent.arcos += [self]
        self.items = self.segmentos+[self.s1,self.s2]

class ArcoInibidor:
    def __init__(self, init, end, peso,parent,desenhavel=False,xs=None,ys=None):
        self.desenhavel = desenhavel
        self.items=[]
        if desenhavel:
            self.segmentos=[]
            self.r = R = 3
            self.parent=parent
            self.oval, self.tpeso =None,None
            self.init, self.end, self.peso = init, end, 1
            a, b = self.parent.sh.get()
            perch = a/(1-b+a)
            a, b = self.parent.sv.get()
            percv = a/(1-b+a)
            x,y = parent.winfo_pointerx(), parent.winfo_pointery()
            x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
            xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
            yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
            x,y=x+xb,y+yb
            if xs is not None and ys is not None:
                x,y = xs, ys
            self.lastx,self.lasty = x,y
            self.pontoi=[x,y]
            self.pontof=None
            self.init.outarcs += [self]
            self.segmentos += [self.parent.c.create_line(self.init.getpos(self)[0], self.init.getpos(self)[1],self.pontoi[0],
                                                         self.pontoi[1])]
            self.parent.redraw_arcs()
            self.items=self.segmentos
        else:
            self.parent=parent
            self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
            self.parent.bind('<Double-Button-1>', self.parent.editbuts)
            self.parent.bind('<Button-3>', self.parent.removebuts)
            self.parent.c.bind('<Button-3>', self.parent.flip)
            self.parent.c.bind('<B1-Motion>', self.parent.mover2)
            self.r = R = 3
            self.init, self.end, self.peso = init, end, peso
            self.init.outarcs += [self]
            self.end.inarcs += [self]
            if isinstance(self.init, Transicao):
                self.t, self.p = self.init, self.end
            else:
                self.t, self.p = self.end, self.init
            self.tpos = self.t.getpos(self)
            self.ppos = self.p.getpos(self)
            self.l = self.init.canvas.create_line(self.tpos[0], self.tpos[1], self.ppos[0], self.ppos[1])
            self.init.parent.redraw_arcs()
            meio = ((self.tpos[0]+self.ppos[0])/2.,(self.tpos[1]+self.ppos[1])/2.)
            self.oval, self.tpeso = None, None
            dx,dy = self.tpos[0]-self.ppos[0], self. tpos[1]-self.ppos[1]
            hip = (dx**2+dy**2)**0.5
            center = (self.tpos[0]-R*dx/hip, self.tpos[1]-R*dy/hip)
            self.circ = self.init.canvas.create_oval(center[0]-R,center[1]-R, center[0]+R, center[1]+R, fill='white')
            self.items = [self.l, self.circ]
            if self.peso>1:
                self.oval = self.init.canvas.create_rectangle(meio[0]-6,meio[1]-6,
                                                              meio[0]+6,meio[1]+6,
                                              outline='white', fill='white')
                self.tpeso = self.init.canvas.create_text(meio[0], meio[1],text=str(self.peso))
                self.items += [self.oval,self.tpeso]
    def redraw(self):
        if self.desenhavel:
            R = self.r
            self.tpos = self.t.getpos(self)
            self.ppos = self.p.getpos(self)
            if self.t == self.init:
                self.spos = self.tpos
                self.initpos = self.pontof
                self.endpos = self.ppos
            else:
                self.spos = self.ppos
                self.initpos = self.pontof
                self.endpos = self.tpos
            self.init.canvas.coords(self.segmentos[-1], (self.initpos[0],self.initpos[1],self.endpos[0],self.endpos[1]))
            self.init.canvas.coords(self.segmentos[0], (self.spos[0],self.spos[1],self.pontoi[0],self.pontoi[1]))
            self.ppos=self.pontof
            dx,dy = self.tpos[0]-self.ppos[0], self. tpos[1]-self.ppos[1]
            hip = (dx**2+dy**2)**0.5
            center = (self.tpos[0]-R*dx/hip, self.tpos[1]-R*dy/hip)
            self.init.canvas.coords(self.circ, center[0]-R,center[1]-R, center[0]+R, center[1]+R)
            ttotal=0
            for i in self.segmentos:
                b = self.parent.c.coords(i)
                t = ((b[0]-b[2])**2+(b[1]-b[3])**2)**0.5
                ttotal += t
            tmed=0
            for i in range(len(self.segmentos)):
                b = self.parent.c.coords(self.segmentos[i])
                t = ((b[0]-b[2])**2+(b[1]-b[3])**2)**0.5
                tmed += t
                if tmed >= ttotal/2.0:
                    p = abs((t-(tmed-ttotal/2.0))/t)
                    mx = b[0]+(b[2]-b[0])*p
                    my = b[1]+(b[3]-b[1])*p
                    meio=[mx,my]
                    break
            if self.peso==1:
                if self.oval:
                    self.init.canvas.delete(self.oval)
                    self.init.canvas.delete(self.tpeso)
                    self.items.remove(self.oval)
                    self.items.remove(self.tpeso)
                    self.oval, self.tpeso = None, None
                self.items=[self.circ]+self.segmentos
            if self.peso>1:
                if self.oval:
                    self.init.canvas.coords(self.oval, meio[0]-5,meio[1]-5,
                                                                  meio[0]+5,meio[1]+5)
                    self.init.canvas.itemconfig(self.oval, outline='white', fill='white')
                    self.init.canvas.coords(self.tpeso, meio[0], meio[1])
                    self.init.canvas.itemconfig(self.tpeso, text=str(self.peso))
                else:
                    self.oval = self.init.canvas.create_rectangle(meio[0]-6,meio[1]-6,
                                                              meio[0]+6,meio[1]+6,
                                              outline='white', fill='white')
                    self.tpeso = self.init.canvas.create_text(meio[0], meio[1],text=str(self.peso))
                self.items = [self.oval, self.tpeso, self.circ]+self.segmentos
        else:
            R = self.r
            self.tpos = self.t.getpos(self)
            self.ppos = self.p.getpos(self)
            dx,dy = self.tpos[0]-self.ppos[0], self. tpos[1]-self.ppos[1]
            hip = (dx**2+dy**2)**0.5
            center = (self.tpos[0]-R*dx/hip, self.tpos[1]-R*dy/hip)
            self.init.canvas.coords(self.circ, center[0]-R,center[1]-R, center[0]+R, center[1]+R)
            meio = ((self.tpos[0]+self.ppos[0])/2.,(self.tpos[1]+self.ppos[1])/2.)
            self.init.canvas.coords(self.l, (self.tpos[0], self.tpos[1], self.ppos[0], self.ppos[1]))
            if self.peso==1:
                if self.oval:
                    self.init.canvas.delete(self.oval)
                    self.init.canvas.delete(self.tpeso)
                    self.items.remove(self.oval)
                    self.items.remove(self.tpeso)
                    self.oval, self.tpeso = None, None
                self.items=[self.l,self.circ]
            if self.peso>1:
                if self.oval:
                    self.init.canvas.coords(self.oval, meio[0]-5,meio[1]-5,
                                                                  meio[0]+5,meio[1]+5)
                    self.init.canvas.itemconfig(self.oval, outline='white', fill='white')
                    self.init.canvas.coords(self.tpeso, meio[0], meio[1])
                    self.init.canvas.itemconfig(self.tpeso, text=str(self.peso))
                else:
                    self.oval = self.init.canvas.create_rectangle(meio[0]-6,meio[1]-6,
                                                              meio[0]+6,meio[1]+6,
                                              outline='white', fill='white')
                    self.tpeso = self.init.canvas.create_text(meio[0], meio[1],text=str(self.peso))
                self.items = [self.oval, self.tpeso, self.l, self.circ]
    def delete(self):
        self.saved=False
        if self in self.parent.inibidores:
            self.parent.inibidores.remove(self)
        if self in self.init.outarcs:
            self.init.outarcs.remove(self)
        if self.end:
            if self in self.end.inarcs:
                self.end.inarcs.remove(self)
        self.parent.redraw_arcs()
        for i in self.items:
            self.parent.c.delete(i)
    def add_segment(self,xs=None,ys=None):
        parent=self.parent
        a, b = self.parent.sh.get()
        perch = a/(1-b+a)
        a, b = self.parent.sv.get()
        percv = a/(1-b+a)
        x,y = parent.winfo_pointerx(), parent.winfo_pointery()
        x,y = x-parent.canv.winfo_rootx(), y-parent.canv.winfo_rooty()
        xb = perch*(CANVASSIZEX-self.parent.c.winfo_width())
        yb = percv*(CANVASSIZEY-self.parent.c.winfo_height())
        x,y=x+xb,y+yb
        if xs is not None and ys is not None:
            x,y = xs, ys
        self.segmentos += [self.parent.c.create_line(self.lastx,self.lasty,x,y)]
        self.lastx, self.lasty = x,y
        self.items=self.segmentos
    def finish(self, aend):
        self.saved=False
        self.end=aend
        self.end.inarcs += [self]
        self.pontof = [self.lastx,self.lasty]
        self.segmentos += [self.parent.c.create_line(self.lastx,self.lasty,self.end.getpos(self)[0],self.end.getpos(self)[1])]
        self.parent.c.bind('<Double-Button-1>', self.parent.doubleclick)
        self.parent.bind('<Double-Button-1>', self.parent.editbuts)
        self.parent.bind('<Button-3>', self.parent.removebuts)
        self.parent.c.bind('<Button-3>', self.parent.flip)
        self.parent.c.bind('<B1-Motion>', self.parent.mover2)
        self.r = R = 3.
        if isinstance(self.init, Transicao):
            self.t, self.p = self.init, self.end
        else:
            self.t, self.p = self.end, self.init
        self.tpos = self.t.getpos(self)
        self.ppos = self.p.getpos(self)
        if self.t == self.init:
            self.initpos = self.pontof
            self.endpos = self.ppos
        else:
            self.initpos = self.pontof
            self.endpos = self.tpos
        self.ppos=self.pontof
        dx,dy = self.tpos[0]-self.ppos[0], self. tpos[1]-self.ppos[1]
        hip = (dx**2+dy**2)**0.5
        center = (self.tpos[0]-R*dx/hip, self.tpos[1]-R*dy/hip)
        self.circ = self.init.canvas.create_oval(center[0]-R,center[1]-R, center[0]+R, center[1]+R, fill='white')
        self.parent.redraw_arcs()
        self.parent.desenhando=None
        self.parent.inibidores += [self]
        self.items = self.segmentos+[self.circ]

class AdicionarEvento:
    def __init__(self, parent):
        self.parent = parent
        self.top = Toplevel(parent)
        self.top.transient(parent)
        self.top.grab_set()
        self.top.focus_set()
        self.top.resizable(False,False)
        x = parent.winfo_x() + (parent.winfo_width()-176)/2.
        y = parent.winfo_y() + (parent.winfo_height()-61)/2.
        self.top.geometry('176x61+'+str(int(x))+'+'+str(int(y)))
        self.top.title('Adicionar evento')
        self.top.bind('<Return>', lambda x: self.ok())
        self.top.bind('<Escape>', lambda x: self.cancel())
        f1 = Frame(self.top); f1.pack(side=TOP)
        f2 = Frame(self.top); f2.pack(side=TOP)
        Label(f1, text='Borda: ').pack(side=LEFT)
        self.v = IntVar()
        self.v.set(1)
        Radiobutton(f1, text='Subida', variable=self.v, value=1).pack(side=LEFT)
        Radiobutton(f1, text='Descida', variable=self.v, value=0).pack(side=LEFT)
        Button(f2, text='Ok', command=self.ok, width=7).pack(side=LEFT, pady=5)
        Button(f2, text='Cancelar', command=self.cancel).pack(side=LEFT)
    def ok(self):
        if len(self.parent.eventos)+1>self.parent.maxeventos:
            self.parent.maxeventos += 1
        self.parent.eventos += [Evento(self.parent, self.v.get())]
        self.top.destroy()
    def cancel(self):
        self.top.destroy()

class EditarEvento:
    def __init__(self, parent, evento):
        self.evento = evento
        self.parent = parent
        self.top = Toplevel(parent)
        self.top.transient(parent)
        self.top.grab_set()
        self.top.focus_set()
        self.top.resizable(False,False)
        x = parent.winfo_x() + (parent.winfo_width()-176)/2.
        y = parent.winfo_y() + (parent.winfo_height()-82)/2.
        self.top.geometry('176x82+'+str(int(x))+'+'+str(int(y)))
        self.top.title('Editar evento')
        self.top.bind('<Return>', lambda x: self.ok())
        self.top.bind('<Escape>', lambda x: self.cancel())
        f3 = Frame(self.top); f3.pack(side=TOP)
        f1 = Frame(self.top); f1.pack(side=TOP)
        f2 = Frame(self.top); f2.pack(side=TOP)
        Label(f3, text='R�tulo: ').pack(side=LEFT)
        self.rot=StringVar()
        self.rot.set(evento.text)
        Entry(f3, textvariable=self.rot).pack(side=LEFT)
        Label(f1, text='Borda: ').pack(side=LEFT)
        self.v = IntVar()
        if evento.borda==1:
            self.v.set(1)
        else:
            self.v.set(0)
        self.r1=Radiobutton(f1, text='Subida', variable=self.v, value=1)
        self.r1.pack(side=LEFT)
        self.r2=Radiobutton(f1, text='Descida', variable=self.v, value=0)
        self.r2.pack(side=LEFT)
        self.r1.focus_set()
        self.r1.bind('<Right>', lambda x: self.setdescida())
        self.r2.bind('<Left>', lambda x: self.setsubida())
        Button(f2, text='Ok', command=self.ok, width=7).pack(side=LEFT, pady=5)
        Button(f2, text='Cancelar', command=self.cancel).pack(side=LEFT)
    def setdescida(self):
        self.v.set(0)
        self.r2.focus_set()
    def setsubida(self):
        self.r1.focus_set()
        self.v.set(1)
    def ok(self):
        for i in '!@#$%�&*(),.;:':
            if i in self.rot.get() or self.rot.get()=='':
                showinfo('R�tulo inv�lido','O r�tulo possui caracteres inv�lidos ou est� vazio.')
                return
        self.parent.saved=False
        if self.rot.get():
            self.evento.text=self.rot.get()
            self.evento.but.configure(text=self.rot.get())
        if self.v.get():
            self.evento.borda=1
            self.evento.but.configure(image=self.parent.up)
        else:
            self.evento.borda=0
            self.evento.but.configure(image=self.parent.down)
        self.evento.borda=self.v.get()
        for i in self.parent.transicoes:
            i.update_labels()
        self.top.destroy()
    def cancel(self):
        self.top.destroy()

class EditarLugar:
    def __init__(self, parent, lugar):
        self.top = Toplevel(parent)
        self.top.transient(parent)
        self.top.grab_set()
        self.top.focus_set()
        self.top.resizable(False, False)
        x = parent.winfo_x() + (parent.winfo_width()-372)/2.
        y = parent.winfo_y() + (parent.winfo_height()-267)/2.
        self.top.geometry('372x267+'+str(int(x))+'+'+str(int(y)))
        self.top.title('Editar lugar')
        self.top.bind('<Return>', lambda x: self.ok())
        self.top.bind('<Escape>', lambda x: self.cancel())
        self.parent = parent
        self.lugar = lugar
        f1 = Frame(self.top); f1.pack(side=TOP, fill=X)
        f2 = Frame(self.top); f2.pack(side=TOP, fill=X)
        f3 = Frame(self.top); f3.pack(side=TOP)
        f4 = Frame(self.top); f4.pack(side=TOP)

        scrollact = Scrollbar(f3)

        Label(f1, text='R�tulo:').pack(side=LEFT)
        self.newrot = StringVar()
        self.rot = Entry(f1, textvariable=self.newrot); self.rot.pack(side=LEFT)
        self.newrot.set(self.lugar.text)

        Label(f2, text='Estado Inicial:').pack(side=LEFT)
        self.newx0 = StringVar()
        self.x0 = Entry(f2, textvariable=self.newx0); self.x0.pack(side=LEFT)
        self.newx0.set(str(self.lugar.x0))
        self.x0.focus_set()
        self.x0.selection_range(0, END)


        Label(f3, text='A��es').pack(side=TOP)
        self.acts = Listbox(f3, selectmode=MULTIPLE, exportselection=0,
                             yscrollcommand=scrollact.set); self.acts.pack(side=LEFT)
        scrollact.config(command=self.acts.yview)
        scrollact.pack(side=LEFT, fill=Y)
        for i in parent.acoes:
            self.acts.insert(END, i.text)
        for i in self.lugar.acoes:
            self.acts.selection_set(self.parent.acoes.index(i))


        Button(f4, text='Ok', command=self.ok, width=7).pack(side=LEFT, pady=5)
        Button(f4, text='Cancelar', command=self.cancel).pack(side=LEFT)
    def ok(self):
        for i in '!@#$%´&*(),.;:':
            if i in self.newrot.get() or self.newrot.get()=='':
                showinfo('Rótulo inválido','O rótulo possui caracteres inválidos ou está vazio.')
                return
        self.parent.saved=False
        self.lugar.text = self.newrot.get()
        try:
            if int(self.x0.get()) <0:
                showinfo('Marcação inicial inválida','A marcação inicial deve ser um número inteiro positivo.')
                return
            self.lugar.x0 = int(self.x0.get())
            self.lugar.x = int(self.x0.get())
        except:
            showinfo('Marcação inicial inválida','A marcação inicial deve ser um número inteiro positivo.')
            return
        self.lugar.acoes = []
        for i in self.acts.curselection():
            if not i in self.lugar.acoes:
                self.lugar.acoes += [self.parent.acoes[int(i)]]
        self.lugar.acoes.sort()
        self.lugar.update_labels()
        self.top.destroy()
    def cancel(self):
        self.top.destroy()

class EditarTransicao:
    def __init__(self, parent, trans):
        self.top = Toplevel(parent)
        self.top.transient(parent)
        self.top.grab_set()
        self.top.focus_set()
        self.top.resizable(False, False)
        x = parent.winfo_x() + (parent.winfo_width()-435)/2.
        y = parent.winfo_y() + (parent.winfo_height()-245)/2.
        self.top.geometry('435x245+'+str(int(x))+'+'+str(int(y)))
        self.top.title('Editar transição')
        self.top.bind('<Return>', lambda x: self.ok())
        self.top.bind('<Escape>', lambda x: self.cancel())
        self.parent = parent
        self.trans = trans
        f1 = Frame(self.top); f1.pack(side=TOP, fill=X)
        fx = Frame(self.top); fx.pack(side=TOP)
        f2 = Frame(fx); f2.pack(side=LEFT)
        f3 = Frame(fx); f3.pack(side=LEFT)
        fy = Frame(fx); fy.pack(side=LEFT, fill=Y)
        f4 = Frame(fy); f4.pack(side=TOP)
        f5 = Frame(fy); f5.pack(side=TOP)
        f6 = Frame(self.top); f6.pack(side=TOP)

        scrollev = Scrollbar(f2)
        scrollcond = Scrollbar(f3)

        Label(f1, text='Rótulo:').pack(side=LEFT)
        self.newrot = StringVar()
        self.rot = Entry(f1, textvariable=self.newrot); self.rot.pack(side=LEFT)
        self.newrot.set(self.trans.text)

        Label(f2, text='Evento').pack(side=TOP)
        self.events = Listbox(f2, selectmode=SINGLE, exportselection=0,
                              yscrollcommand=scrollev.set); self.events.pack(side=LEFT)
        scrollev.config(command=self.events.yview)
        scrollev.pack(side=LEFT, fill=Y)
        self.events.insert(END, '<Nenhum>')
        for i in parent.eventos:
            if i.borda:
                tex=u'\u2b06'+i.text
            else:
                tex=u'\u2b07'+i.text
            self.events.insert(END, tex)
        if not trans.event is None:
            self.events.selection_set(self.parent.eventos.index(trans.event)+1)
        else:
            self.events.selection_set(0)

        Label(f3, text='Condição').pack(side=TOP)
        self.conds = Listbox(f3, selectmode=SINGLE, exportselection=0,
                             yscrollcommand=scrollcond.set); self.conds.pack(side=LEFT)
        scrollcond.config(command=self.conds.yview)
        scrollcond.pack(side=LEFT, fill=Y)
        self.conds.insert(END, '<Nenhuma>')
        for i in parent.condicoes:
            self.conds.insert(END, i.text)
        if not trans.condicao is None:
            self.conds.selection_set(self.parent.condicoes.index(trans.condicao)+1)
        else:
            self.conds.selection_set(0)

        Label(f4, text='Atraso').pack(side=TOP)
        self.newdelay=StringVar()
        self.delay = Entry(f5, textvariable=self.newdelay); self.delay.pack(side=LEFT)
        Label(f5, text='s').pack(side=LEFT)
        self.newdelay.set(trans.delay)
        self.delay.focus_set()
        self.delay.selection_range(0, END)
        Button(f6, text='Ok', command=self.ok, width=7).pack(side=LEFT, pady=5)
        Button(f6, text='Cancelar', command=self.cancel).pack(side=LEFT)
    def ok(self):
        for i in '!@#$%�&*(),.;:':
            if i in self.newrot.get() or self.newrot.get()=='':
                showinfo('Rótulo inválido','O rótulo possui caracteres inválidos ou está vazio.')
                return
        self.parent.saved=False
        if int(self.events.curselection()[0]) != 0:
            self.trans.event = self.parent.eventos[int(self.events.curselection()[0])-1]
        else:
            self.trans.event = None
        if int(self.conds.curselection()[0]) != 0:
            self.trans.condicao = self.parent.condicoes[int(self.conds.curselection()[0])-1]
        else:
            self.trans.condicao = None
        try:
            if float(self.newdelay.get())<0:
                showinfo('Atraso inválido','O atraso deve ser um número positivo.')
                return
            self.trans.delay = float(self.newdelay.get())
        except:
            showinfo('Atraso inválido','O atraso deve ser um número positivo.')
            return
        self.trans.text = self.newrot.get()
        self.trans.update_labels()
        self.top.destroy()
    def cancel(self):
        self.top.destroy()

class Evento:
    def __init__(self, parent, borda):
        parent.saved=False
        self.borda = borda
        self.parent = parent
        self.text = 'S' + str(parent.maxeventos-1)
        self.but = Button(parent.eve, text=self.text, image=parent.up,
                     compound=LEFT, command=self.event, state=DISABLED)
        if borda:
            self.but.config(image=parent.up, compound=LEFT)
        else:
            self.but.config(image=parent.down, compound=LEFT)
        self.but.pack(side=TOP, fill=X)
    def event(self):
        self.parent.cipn.event(self.parent.eventos.index(self))
    def delete(self):
        self.parent.saved=False
        self.parent.eventos.remove(self)
        for t in self.parent.transicoes:
            if t.event is self:
                t.event=None
                t.update_labels()
        self.but.destroy()

class Condicao:
    def __init__(self, parent):
        parent.saved=False
        self.state = 0
        self.parent=parent
        self.text = 'C' + str(parent.maxcondicoes-1)
        self.but = Button(parent.cond, text=self.text, image=parent.condoff,
                          compound=BOTTOM, command=self.condicao, state=DISABLED)
        self.but.pack(side=LEFT)
    def condicao(self):
        if self.state:
            self.state = 0
            self.parent.cipn.setCondition(self.parent.condicoes.index(self),0)
            self.but.config(image=self.parent.condoff)
        else:
            self.state = 1
            self.parent.cipn.setCondition(self.parent.condicoes.index(self), 1)
            self.but.config(image=self.parent.condon)
    def delete(self):
        self.parent.saved=False
        self.parent.condicoes.remove(self)
        for t in self.parent.transicoes:
            if t.condicao is self:
                t.condicao=None
                t.update_labels()
        self.but.destroy()

class Acao:
    def __init__(self, parent):
        self.parent=parent
        self.parent.saved=False
        self.timer = None
        self.parent=parent
        self.acesa = False
        self.text = 'A' + str(parent.maxacoes-1)
        self.but = Label(parent.act, text=self.text, image=parent.actoff,
                         compound=BOTTOM, state=DISABLED)
        self.but.pack(side=TOP)
    def acender(self):
        self.acesa = True
        self.but.configure(image=self.parent.acton)
    def apagar(self):
        self.acesa = False
        self.but.configure(image=self.parent.actoff)
    def delete(self):
        self.parent.saved=False
        self.parent.acoes.remove(self)
        for t in self.parent.lugares:
            if self in t.acoes:
                t.acoes.remove(self)
                t.update_labels()
        self.but.destroy()

class Helper:
    def __init__(self, parent):
        self.parent=parent
    def cancel(self, e=None):
        self.parent.acancel()

class Programa(Tk):
    def __init__(self):
        Tk.__init__(self)
        self.p, self.t, self.a, self.c, self.e, self.ac = [], [], [], [], [], []
        self.dialog = ''
        self.desenhando = None
        self.seg = []
        self.ultseg = [0,0]
        self.multiarc = False
        self.saved = True
        self.inserindoin = False
        self.filename = None
        self.inserindo = None
        self.simulando = False
        self.cipn = None
        self.arcstart=None

        #Configurações
        self.exibirrot = IntVar(self)
        self.exibirrot.set(1)
        self.uselabels = IntVar(self)
        self.uselabels.set(1)

        #Definição das propriedades da janela
        self.protocol("WM_DELETE_WINDOW", self.sairc)
        self.title('PETRILab v1.0')
        self.geometry('800x600')
        self.minsize(400,300)
        self.icon=PhotoImage(file='.\grafico\icon.gif')
        self.tk.call('wm', 'iconphoto', self._w, self.icon)

        #Inicialização de variáveis
        self.lugares = []; self.maxlugares = 0
        self.transicoes = []; self.maxtransicoes = 0
        self.arcos = []
        self.inibidores = []
        self.eventos, self.maxeventos = [], 0
        self.condicoes, self.maxcondicoes = [], 0
        self.acoes, self.maxacoes = [], 0
        self.ainit, self.aend = None, None

        #Criação de Menus
        menubar = Menu(self)
        self.mfile = Menu(menubar, tearoff=0)
        self.mfile.add_command(label="Novo (CTRL+N)", command=self.novoc)
        self.mfile.add_command(label="Abrir (CTRL+A)", command=self.abrirc)
        self.mfile.add_command(label="Salvar (CTRL+S)", command=self.salvar)
        self.mfile.add_command(label="Salvar como...", command=self.salvarcomo)
        self.mfile.add_command(label="Salvar Imagem do Grafo", command=self.salvargrafo)
        self.mfile.add_separator()
        self.mfile.add_command(label="Sair (CTRL+Q)", command=self.sairc)
        menubar.add_cascade(label="Arquivo", menu=self.mfile)

        self.medit = Menu(menubar, tearoff=0)
        self.medit.add_command(label="Selecionar (Q)", command=self.rcancel, state=DISABLED)
        self.medit.add_command(label="Deletar (X)", command=self.deletar)
        #self.medit.add_command(label="Mover (M)", command=self.mover)
        menubar.add_cascade(label="Editar", menu=self.medit)

        self.mexibir = Menu(menubar, tearoff=0)
        self.mexibir.add_checkbutton(label="Rótulos", variable=self.exibirrot,
                                     onvalue=1, offvalue=0, command=self.alternarrot)
        menubar.add_cascade(label="Exibir", menu=self.mexibir)

        self.minsert = Menu(menubar, tearoff=0)
        self.minsert.add_command(label="Lugar (L)", command=self.lugar)
        self.minsert.add_command(label="Transição (T)", command=self.transicao)
        self.minsert.add_command(label="Arco (A)", command=self.arco)
        self.minsert.add_command(label="Arco Inibidor (I)", command=self.inibidor)
        self.minsert.add_separator()
        self.minsert.add_command(label="Evento (E)", command=self.evento)
        self.minsert.add_command(label="Condicao (C)", command=self.condicao)
        self.minsert.add_command(label="Ação (K)", command=self.acao)
        menubar.add_cascade(label="Inserir", menu=self.minsert)

        self.mladder = Menu(menubar, tearoff=0)
        self.mladder.add_command(label="Gerar Diagrama (G)", command=self.ladder)
        #self.mladder.add_command(label="Tabela de Equivalencia", command=self.equiv)
        #self.mladder.add_separator()
        #self.mladder.add_checkbutton(label="Utilizar r�tulos", variable=self.uselabels,
        #                        onvalue=1, offvalue=0)
        menubar.add_cascade(label="Ladder", menu=self.mladder)

        self.msimu = Menu(menubar, tearoff=0)
        self.msimu.add_command(label="Iniciar (S)", command=self.simular)
        self.msimu.add_command(label="Parar (Z)", command=self.parar, state=DISABLED)
        menubar.add_cascade(label="Simulação", menu=self.msimu)

        self.majuda = Menu(menubar,tearoff=0)
        self.majuda.add_command(label="Guia do usuário", command=self.guia)
        self.majuda.add_command(label="Informar Bug/Sugestões", command=self.contato)
        self.majuda.add_separator()
        self.majuda.add_command(label="Sobre", command=self.sobre)
        menubar.add_cascade(label="Ajuda", menu=self.majuda)

        self.config(menu=menubar)

        # Criação dos Frames
        self.but = Frame(self)
        self.eve = Frame(self)
        self.cond = Frame(self)
        self.act = Frame(self)
        self.canv = Frame(self)
        self.vscroll = Frame(self)
        self.hscroll = Frame(self)
        self.but.pack(side=TOP, expand=0, fill=X)
        self.cond.pack(side=TOP, expand=0, fill=X)
        self.eve.pack(side=LEFT, expand=0, fill=Y)
        self.act.pack(side=RIGHT, expand=0, fill=Y)
        self.vscroll.pack(side=RIGHT, expand=0, fill=Y)
        self.hscroll.pack(side=BOTTOM, expand=0, fill=X)
        self.canv.pack(side=TOP, expand=1, fill=BOTH)
        Frame(self.eve, width=0,height=0).pack(side=TOP)
        Frame(self.cond,width=0,height=0).pack(side=LEFT)
        Frame(self.act,width=0,height=0).pack(side=TOP)

        # Cria��o dos bot�es fixos
        self.nimg=PhotoImage(file='.\grafico\\new.gif')
        self.oimg=PhotoImage(file='.\grafico\open.gif')
        self.simg=PhotoImage(file='.\grafico\save.gif')
        self.aimg=PhotoImage(file='.\grafico\\arc.gif')
        self.limg=PhotoImage(file='.\grafico\place.gif')
        self.timg=PhotoImage(file='.\grafico\\trans.gif')
        self.inbimg=PhotoImage(file='.\grafico\inb.gif')
        self.eveimg=PhotoImage(file='.\grafico\even.gif')
        self.actimg=PhotoImage(file='.\grafico\\act.gif')
        self.condimg=PhotoImage(file='.\grafico\cond.gif')
        self.condoff=PhotoImage(file='.\grafico\condoff.gif')
        self.condon=PhotoImage(file='.\grafico\condon.gif')
        self.acton=PhotoImage(file='.\grafico\\acton.gif')
        self.actoff=PhotoImage(file='.\grafico\\actoff.gif')
        self.lad=PhotoImage(file='.\grafico\lad.gif')
        self.up=PhotoImage(file='.\grafico\\up.gif')
        self.down=PhotoImage(file='.\grafico\down.gif')
        self.play=PhotoImage(file='.\grafico\play.gif')
        self.stop=PhotoImage(file='.\grafico\stop.gif')
        self.delete=PhotoImage(file='.\grafico\delete.gif')
        self.arrow=PhotoImage(file='.\grafico\\arrow.gif')
        self.move=PhotoImage(file='.\grafico\move.gif')
        self.sgrafo=PhotoImage(file='.\grafico\saverpic.gif')
        self.upc=PhotoImage(file='.\grafico\\upc.gif')
        self.downc=PhotoImage(file='.\grafico\downc.gif')
        Button(self.but, image=self.nimg, command=self.novoc).pack(side=LEFT)
        Button(self.but, image=self.oimg, command=self.abrirc).pack(side=LEFT)
        Button(self.but, image=self.simg, command=self.salvar).pack(side=LEFT)
        Button(self.but, image=self.sgrafo, command=self.salvargrafo).pack(side=LEFT)
        Label(self.but).pack(side=LEFT)
        self.lugarb=Button(self.but, image=self.limg, command=self.lugar)
        self.lugarb.pack(side=LEFT)
        self.transicaob=Button(self.but, image=self.timg, command=self.transicao)
        self.transicaob.pack(side=LEFT)
        self.arcob=Button(self.but, image=self.aimg, command=self.arco)
        self.arcob.pack(side=LEFT)
        self.inibidorb=Button(self.but, image=self.inbimg, command=self.inibidor)
        self.inibidorb.pack(side=LEFT)
        Label(self.but).pack(side=LEFT)
        self.eventob=Button(self.but, image=self.eveimg, command=self.evento)
        self.eventob.pack(side=LEFT)
        self.condicaob=Button(self.but, image=self.condimg, command=self.condicao)
        self.condicaob.pack(side=LEFT)
        self.acaob=Button(self.but, image=self.actimg, command=self.acao)
        self.acaob.pack(side=LEFT)
        Label(self.but).pack(side=LEFT)
        Button(self.but, image=self.lad, command=self.ladder).pack(side=LEFT)
        Label(self.but).pack(side=LEFT)
        self.simu = Button(self.but, image=self.play, command=self.simular)
        self.simu.pack(side=LEFT)
        self.pararb = Button(self.but, image=self.stop, command=self.parar,
                            state=DISABLED)
        self.pararb.pack(side=LEFT)
        Label(self.but).pack(side=LEFT)
        self.arrowb=Button(self.but, image=self.arrow,relief=SUNKEN, command=self.rcancel)
        self.arrowb.pack(side=LEFT)
        self.deleteb=Button(self.but, image=self.delete, command=self.deletar)
        self.deleteb.pack(side=LEFT)
        #self.moveb=Button(self.but, image=self.move, command=self.mover)
        #self.moveb.pack(side=LEFT)

        # Teclas de atalho
        self.bind('l', lambda x: self.lugar())
        self.bind('t', lambda x: self.transicao())
        self.bind('a', lambda x: self.arco())
        self.bind('i', lambda x: self.inibidor())
        self.bind('e', lambda x: self.evento())
        self.bind('c', lambda x: self.condicao())
        self.bind('k', lambda x: self.acao())
        self.bind('g', lambda x: self.ladder())
        self.bind('s', lambda x: self.simular())
        self.bind('z', lambda x: self.parar())
        self.bind('L', lambda x: self.lugar())
        self.bind('T', lambda x: self.transicao())
        self.bind('A', lambda x: self.arco())
        self.bind('I', lambda x: self.inibidor())
        self.bind('E', lambda x: self.evento())
        self.bind('C', lambda x: self.condicao())
        self.bind('K', lambda x: self.acao())
        self.bind('G', lambda x: self.ladder())
        self.bind('S', lambda x: self.simular())
        self.bind('Z', lambda x: self.parar())
        self.bind('q', lambda x: self.rcancel())
        self.bind('Q', lambda x: self.rcancel())
        self.bind('x', lambda x: self.deletar())
        self.bind('X', lambda x: self.deletar())
        self.bind('<Control-s>', lambda x: self.salvar())
        self.bind('<Control-S>', lambda x: self.salvar())
        self.bind('<Control-a>', lambda x: self.abrirc())
        self.bind('<Control-A>', lambda x: self.abrirc())
        self.bind('<Control-n>', lambda x: self.novoc())
        self.bind('<Control-N>', lambda x: self.novoc())
        self.bind('<Control-q>', lambda x: self.sairc())
        self.bind('<Control-Q>', lambda x: self.sairc())


        # Cria��o do Canvas e scrollbars
        self.c = Canvas(self.canv, width=CANVASSIZEX, height=CANVASSIZEY, bg='white')
        self.c.pack(expand=1,fill=BOTH)
        self.sh = Scrollbar(self.hscroll, orient=HORIZONTAL)
        self.sh.pack(expand=1, fill=X)
        self.sv = Scrollbar(self.vscroll)
        self.sv.pack(expand=1, fill=Y)
        self.sh.config(command=self.c.xview)
        self.sv.config(command=self.c.yview)
        self.c.configure(xscrollcommand=self.sh.set)
        self.c.configure(yscrollcommand=self.sv.set)
        self.c.configure(scrollregion=(0,0,CANVASSIZEX,CANVASSIZEY))
        self.bind('<MouseWheel>', self.scroll)

        # Binds de edi��o
        self.c.bind('<Double-Button-1>', self.doubleclick)
        self.bind('<Double-Button-1>', self.editbuts)
        self.bind('<Button-3>', self.removebuts)
        self.c.bind('<Button-3>', self.flip)
        self.c.bind('<B1-Motion>', self.mover2)
    def salvargrafo(self):
        if self.filename:
            ind = len(self.filename)-self.filename[::-1].find('/')
            dir=self.filename[:ind]
        else: dir='./'
        arq=dir+'RPIC.eps'
        self.c.update()
        self.c.postscript(file=arq,width=CANVASSIZEX,height=CANVASSIZEY, colormode='color',x=0,y=0,pageanchor=NW,
                          pagex=0,pagey=850)
    def guia(self):
        r = askquestion('Guia do usuário','O guia do usuário encontra-se disponível em PDF na página de downloads do '
                                          'site do projeto.\n\nDeseja baixar diretamente o arquivo PDF através de'
                                          'seu navegador?')
        if r == 'yes':
            webbrowser.open('http://downloads.sourceforge.net/project/petrilab/docs/guia_do_usuario.pdf?r=&ts=1422569811&use_mirror=master')
    def contato(self):
        r = askquestion('Informar Bug/Sugest�es','Bugs e sugest�es podem ser enviados por e-mail para petrilab10@gmail.com.\n\n'
                                                 'Alternativamente, � poss�vel enviar um Ticket de suporte no site do projeto,'
                                                 'sendo necess�rio para isso um cadastro gratuito no Sourceforge. Deseja abrir'
                                                 'a pagina de Tickets do projeto?')
        if r=='yes':
            webbrowser.open('http://sourceforge.net/p/petrilab/tickets/')
    def sobre(self):
        showinfo('PETRILab v1.0', 'PETRILab v.10\nhttps://sourceforge.net/projects/petrilab/\n\nDesenvolvido por Anderson Linhares de Souza @ UFRJ\nanderson.linhares@poli.ufrj.br')
    def cancelall(self):
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.parar()
        self.rcancel()
        self.mcancel()
    def alternarrot(self):
        if not self.exibirrot.get():
            self.ocultarrot()
        else:
            self.exibirrotf()
    def ocultarrot(self):
        self.exibirrot.set(0)
        for i in self.lugares+self.transicoes:
            self.c.itemconfig(i.label,fill='')
    def exibirrotf(self):
        self.exibirrot.set(1)
        for i in self.lugares+self.transicoes:
            self.c.itemconfig(i.label,fill='black')
    def flip(self, e):
        obj = self.c.find_withtag(CURRENT)
        if isinstance(self.inserindo, Transicao):
            self.inserindo.flip()
        elif obj:
            for i in self.transicoes:
                if obj[0] in i.items:
                    i.flip()
    def removebuts(self, e):
        cx, cy = self.c.winfo_rootx(), self.c.winfo_rooty()
        #CONDICOES
        x, y = self.winfo_pointerx(), self.winfo_pointery()
        x0, y0 = self.cond.winfo_rootx(), self.cond.winfo_rooty()
        w, h = self.cond.winfo_width(), self.cond.winfo_height()
        if x0<x<x0+w and y0<y<y0+h:
            for i in self.condicoes:
                if i.but is self.winfo_containing(x,y):
                    i.delete()
        #ACOES
        x, y = self.winfo_pointerx(), self.winfo_pointery()
        x0, y0 = self.act.winfo_rootx(), self.act.winfo_rooty()
        w, h = self.act.winfo_width(), self.act.winfo_height()
        if x0<x<x0+w and y0<y<y0+h:
            for i in self.acoes:
                if i.but is self.winfo_containing(x,y):
                    i.delete()
        #EVENTOS
        x, y = self.winfo_pointerx(), self.winfo_pointery()
        x0, y0 = self.eve.winfo_rootx(), self.eve.winfo_rooty()
        w, h = self.eve.winfo_width(), self.eve.winfo_height()
        if x0<x<x0+w and y0<y<y0+h:
            for i in self.eventos:
                if i.but is self.winfo_containing(x,y):
                    i.delete()
    def editbuts(self, e):
        cx, cy = self.c.winfo_rootx(), self.c.winfo_rooty()
        #CONDICOES
        x, y = self.winfo_pointerx(), self.winfo_pointery()
        x0, y0 = self.cond.winfo_rootx(), self.cond.winfo_rooty()
        w, h = self.cond.winfo_width(), self.cond.winfo_height()
        if x0<x<x0+w and y0<y<y0+h:
            for i in self.condicoes:
                if i.but is self.winfo_containing(x,y):
                    self.editarcondicao(i)
        #ACOES
        x, y = self.winfo_pointerx(), self.winfo_pointery()
        x0, y0 = self.act.winfo_rootx(), self.act.winfo_rooty()
        w, h = self.act.winfo_width(), self.act.winfo_height()
        if x0<x<x0+w and y0<y<y0+h:
            for i in self.acoes:
                if i.but is self.winfo_containing(x,y):
                    self.editaracao(i)
        #ACOES
        x, y = self.winfo_pointerx(), self.winfo_pointery()
        x0, y0 = self.eve.winfo_rootx(), self.eve.winfo_rooty()
        w, h = self.eve.winfo_width(), self.eve.winfo_height()
        if x0<x<x0+w and y0<y<y0+h:
            for i in self.eventos:
                if i.but is self.winfo_containing(x,y):
                    EditarEvento(self, i)
    def equiv(self):
        pass
    def doubleclick(self, e):
        obj = self.c.find_withtag(CURRENT)
        if obj:
            for i in self.transicoes:
                if obj[0] in i.items:
                    d = EditarTransicao(self, i)
                    self.wait_window(d.top)
            for i in self.lugares:
                if obj[0] in i.items:
                    d = EditarLugar(self, i)
                    self.wait_window(d.top)
            for i in self.arcos+self.inibidores:
                if obj[0] in i.items:
                    self.editararco(i)
    def scroll(self, event):
        self.c.yview_scroll(-1*(event.delta/120),'units')
        if isinstance(self.inserindo,Lugar) or isinstance(self.inserindo,Transicao):
            self.inserindo.follow(None)
    def novo(self):
        self.cancelall()
        for i in self.arcos+self.inibidores:
            i.delete()
        for i in self.eventos+self.condicoes+self.acoes:
            i.delete()
        for i in self.lugares+self.transicoes:
            i.delete()
        self.maxlugares,self.maxtransicoes,self.maxacoes,self.maxeventos,self.maxcondicoes=0,0,0,0,0
        self.dialog = ''
        self.desenhando = None
        self.seg = []
        self.ultseg = [0,0]
        self.multiarc = False
        self.saved = True
        self.inserindoin = False
        self.filename = None
        self.inserindo = None
        self.simulando = False
        self.cipn = None
        self.arcstart=None
        self.title('PETRILab v1.0')
    def update_state(self):
        for l in range(len(self.lugares)):
            if self.lugares[l] and self.cipn:
                self.lugares[l].x = self.cipn.x[l]
                self.lugares[l].update_labels()
    def simular(self):
        if self.simulando:
            return
        for t in self.transicoes:
            arco=False
            for i in t.inarcs:
                if isinstance(i,Arco): arco=True
            if t.event is None and t.condicao is None and not arco:
                showinfo('Rede inválida', 'Todas as transições da rede precisam ter ao menos um limitador para sua ocorrência.')
                return
        self.rcancel()
        self.mcancel()
        #Unbinds
        self.c.unbind('<Double-Button-1>')
        self.c.unbind('<Button-3>')
        self.unbind('<Button-3>')
        self.unbind('<Double-Button-1>')
        self.unbind('l')
        self.unbind('t')
        self.unbind('a')
        self.unbind('i')
        self.unbind('e')
        self.unbind('c')
        self.unbind('k')
        self.unbind('g')
        self.unbind('s')
        self.unbind('L')
        self.unbind('T')
        self.unbind('A')
        self.unbind('I')
        self.unbind('E')
        self.unbind('C')
        self.unbind('K')
        self.unbind('G')
        self.unbind('S')
        self.unbind('x')
        self.unbind('X')
        #ButDisables
        self.arrowb.configure(state=DISABLED)
        self.deleteb.configure(state=DISABLED)
        #self.moveb.configure(state=DISABLED)
        self.lugarb.configure(state=DISABLED)
        self.transicaob.configure(state=DISABLED)
        self.arcob.configure(state=DISABLED)
        self.inibidorb.configure(state=DISABLED)
        self.eventob.configure(state=DISABLED)
        self.condicaob.configure(state=DISABLED)
        self.acaob.configure(state=DISABLED)
        #MenuDisables
        self.minsert.entryconfig(0,state=DISABLED)
        self.minsert.entryconfig(1,state=DISABLED)
        self.minsert.entryconfig(2,state=DISABLED)
        self.minsert.entryconfig(3,state=DISABLED)
        self.minsert.entryconfig(5,state=DISABLED)
        self.minsert.entryconfig(6,state=DISABLED)
        self.minsert.entryconfig(7,state=DISABLED)

        self.msimu.entryconfig(0,state=DISABLED)
        self.msimu.entryconfig(1,state=NORMAL)
        for i in self.acoes+self.condicoes+self.eventos:
            i.but.configure(state=NORMAL)
        self.simu.configure(state=DISABLED)
        self.pararb.configure(state=NORMAL)
        self.simulando = True
        self.cipn = self.gerar_cipn()
        self.cipn.setFireable()
        self.cipn.run()
    def parar(self):
        #Rebinds
        self.c.bind('<Double-Button-1>', self.doubleclick)
        self.bind('<Double-Button-1>', self.editbuts)
        self.bind('<Button-3>', self.removebuts)
        self.c.bind('<Button-3>', self.flip)
        self.c.bind('<B1-Motion>', self.mover2)
        self.bind('l', lambda x: self.lugar())
        self.bind('t', lambda x: self.transicao())
        self.bind('a', lambda x: self.arco())
        self.bind('i', lambda x: self.inibidor())
        self.bind('e', lambda x: self.evento())
        self.bind('c', lambda x: self.condicao())
        self.bind('k', lambda x: self.acao())
        self.bind('g', lambda x: self.ladder())
        self.bind('s', lambda x: self.simular())
        self.bind('z', lambda x: self.parar())
        self.bind('L', lambda x: self.lugar())
        self.bind('T', lambda x: self.transicao())
        self.bind('A', lambda x: self.arco())
        self.bind('I', lambda x: self.inibidor())
        self.bind('E', lambda x: self.evento())
        self.bind('C', lambda x: self.condicao())
        self.bind('K', lambda x: self.acao())
        self.bind('G', lambda x: self.ladder())
        self.bind('S', lambda x: self.simular())
        self.bind('Z', lambda x: self.parar())
        self.bind('x', lambda x: self.deletar())
        self.bind('X', lambda x: self.deletar())

        #ButEnables
        self.arrowb.configure(state=NORMAL)
        #self.moveb.configure(state=NORMAL)
        self.deleteb.configure(state=NORMAL)
        self.lugarb.configure(state=NORMAL)
        self.transicaob.configure(state=NORMAL)
        self.arcob.configure(state=NORMAL)
        self.inibidorb.configure(state=NORMAL)
        self.eventob.configure(state=NORMAL)
        self.condicaob.configure(state=NORMAL)
        self.acaob.configure(state=NORMAL)
        #MenuEnables
        self.minsert.entryconfig(0,state=NORMAL)
        self.minsert.entryconfig(1,state=NORMAL)
        self.minsert.entryconfig(2,state=NORMAL)
        self.minsert.entryconfig(3,state=NORMAL)
        self.minsert.entryconfig(5,state=NORMAL)
        self.minsert.entryconfig(6,state=NORMAL)
        self.minsert.entryconfig(7,state=NORMAL)

        self.msimu.entryconfig(0,state=NORMAL)
        self.msimu.entryconfig(1,state=DISABLED)
        for i in self.acoes+self.condicoes+self.eventos:
            i.but.configure(state=DISABLED)
        if not self.simulando:
            return
        for i in self.lugares:
            i.x=i.x0
            i.update_labels()
        for i in self.condicoes:
            i.state=0
            i.but.configure(image=self.condoff)
        for t in self.cipn.timers:
            for i in t:
                t.remove(i)
        for a in self.acoes:
            a.apagar()
            a.timer = None
        self.cipn = None
        self.simulando = False
        self.simu.configure(state=NORMAL)
        self.pararb.configure(state=DISABLED)
    def gerar_cipn(self):
        pc = len(self.lugares)
        tc = len(self.transicoes)
        prec, postc, inc = [], [], []
        for i in range(len(self.lugares)):
            prec.append([0]*len(self.transicoes))
        for i in range(len(self.lugares)):
            inc.append([0]*len(self.transicoes))
        for i in range(len(self.transicoes)):
            postc.append([0]*len(self.lugares))
        for i in self.arcos:
            if i.init == i.p:
                prec[self.lugares.index(i.init)][self.transicoes.index(i.end)]=i.peso
            else:
                postc[self.transicoes.index(i.init)][self.lugares.index(i.end)]=i.peso
        for i in self.inibidores:
            inc[self.lugares.index(i.init)][self.transicoes.index(i.end)]=i.peso
        x0c = [i.x0 for i in self.lugares]
        c = [False]*len(self.condicoes)+[True]
        e = [False]*len(self.eventos)+[True]
        lc = []
        for i in range(len(self.transicoes)):
            lc.append([len(self.condicoes), len(self.eventos)])
        d = [0]
        for i in self.transicoes:
            if not i.delay in d:
                d += [i.delay]
        ld = [0]*len(self.transicoes)
        for i in self.transicoes:
            if not i.event is None:
                lc[self.transicoes.index(i)][1] = self.eventos.index(i.event)
            if not i.condicao is None:
                lc[self.transicoes.index(i)][0] = self.condicoes.index(i.condicao)
            if i.delay:
                ld[self.transicoes.index(i)]=d.index(i.delay)

        a = [False]*len(self.acoes)
        la = [None]*len(self.lugares)
        for i in range(len(self.lugares)):
            acts = []
            for j in self.lugares[i].acoes:
                acts += [self.acoes.index(j)]
            if acts:
                la[i] = acts
        return CIPN(pc,tc,prec,postc,x0c,inc,c,e,lc,d,ld,a,la, self)
    def ladder(self):
        cipn = self.gerar_cipn()
        for i in range(len(cipn.Ec)-1):
            cipn.setImpulse(i, self.eventos[i].borda)
        for t in self.transicoes:
            arco=False
            for i in t.inarcs:
                if isinstance(i,Arco): arco=True
            if t.event is None and t.condicao is None and not arco:
                showinfo('Rede inválida', 'Todas as transições da rede precisam ter ao menos um limitador para sua ocorrência.')
                return
        if cipn.Pc == 0 or cipn.Tc == 0:
            showinfo('Rede insuficiente', 'A rede precisa ter ao menos um lugar, uma transição e um arco.')
            return
        if not True in map(lambda x: not x == [0]*cipn.Tc, cipn.Prec) and not True in map(lambda x: not x == [0]*cipn.Pc, cipn.Postc):
            showinfo('Rede insuficiente', 'A rede precisa ter ao menos um lugar, uma transição e um arco.')
            return
        labels = [[],[],[],[],[]]
        for i in self.lugares:
            labels[0] += [i.text]
        for i in self.transicoes:
            labels[1] += [i.text]
        for i in self.eventos:
            labels[2] += [i.text]
        for i in self.condicoes:
            labels[3] += [i.text]
        for i in self.acoes:
            labels[4] += [i.text]
        if self.uselabels.get():
            gerar(cipn,self, labels)
        else:
            gerar(cipn,self)
    def redraw_arcs(self):
        for i in self.arcos+self.inibidores:
            i.redraw()
    def novoc(self):
        while True:
            if self.saved:
                self.novo()
                break
            q = askquestion('Novo','Deseja salvar o arquivo atual?',type=YESNOCANCEL)
            if q == 'yes':
                if self.salvar():
                    self.novo()
                    break
            elif q == 'no':
                self.novo()
                break
            else:
                break
    def abrirc(self):
        while True:
            if self.saved:
                self.abrir()
                break
            q = askquestion('Abrir','Deseja salvar o arquivo atual?',type=YESNOCANCEL)
            if q == 'yes':
                if self.salvar():
                    self.abrir()
                    break
            elif q == 'no':
                self.abrir()
                break
            else:
                break
    def abrir(self):
        fi = askopenfilename(filetypes=[('Arquivo PETRILab', '.pl')])
        if not fi: return
        self.novo()
        self.filename = fi
        self.title('PETRILab v1.0 - '+self.filename)
        self.c.bind('<Double-Button-1>', self.doubleclick)
        self.bind('<Double-Button-1>', self.editbuts)
        self.bind('<Button-3>', self.removebuts)
        self.c.bind('<Button-3>', self.flip)
        self.c.bind('<B1-Motion>', self.mover2)
        try:
            f = file(fi,'r')
            f.seek(0)
            #Carregar Eventos
            while True:
                l = f.readline().rstrip('\n')
                if '#' in l: break
                b = int(l[:l.find(';')])
                tex = l[l.find(';')+1:]
                e = Evento(self, b)
                e.text=tex
                e.but.configure(text=tex)
                self.eventos += [e]
            self.maxeventos = int(l[:l.find('#')])
            #Carregar Condicoes
            while True:
                l = f.readline().rstrip('\n')
                if '#' in l: break
                c = Condicao(self)
                c.text = l
                c.but.configure(text=l)
                self.condicoes += [c]
            self.maxcondicoes = int(l[:l.find('#')])
            #Carregar Acoes
            while True:
                l = f.readline().rstrip('\n')
                if '#' in l: break
                a = Acao(self)
                a.text = l
                a.but.configure(text=l)
                self.acoes += [a]
            self.maxacoes = int(l[:l.find('#')])
            #Carregar Transicoes
            while True:
                l = f.readline().rstrip('\n')
                if '#' in l: break
                t = Transicao(self)
                self.transicoes += [t]
                s1=l.find(';')
                s2=l.find(';',s1+1)
                s3=l.find(';',s2+1)
                s4=l.find(';',s3+1)
                s5=l.find(';',s4+1)
                s6=l.find(';',s5+1)
                tex=l[:s1]
                if l[s1+1:s2]=='None':
                    ev=None
                else:
                    ev=self.eventos[int(l[s1+1:s2])]
                if l[s2+1:s3]=='None':
                    cond=None
                else:
                    cond=self.condicoes[int(l[s2+1:s3])]
                delay = float(l[s3+1:s4])
                hor = bool(int(l[s4+1:s5]))
                x = float(l[s5+1:s6])
                y = float(l[s6+1:])
                if hor: t.flip()
                t.mover(x,y)
                t.event=ev
                t.condicao=cond
                t.delay=delay
                t.text=tex
                t.update_labels()
            self.maxtransicoes=int(l[:l.find('#')])
            #Carregar Lugares
            while True:
                l = f.readline().rstrip('\n')
                if '#' in l: break
                p = Lugar(self)
                self.lugares += [p]
                s1=l.find(';')
                s2=l.find(';',s1+1)
                s3=l.find(';',s2+1)
                s4=l.find(';', s3+1)
                tex=l[:s1]
                x=float(l[s1+1:s2])
                y=float(l[s2+1:s3])
                x0=int(l[s3+1:s4])
                acts = l[s4:].split(';')
                for i in acts:
                    if i:
                        p.acoes += [self.acoes[int(i)]]
                p.text=tex
                p.x0, p.x=x0, x0
                p.update_labels()
                p.mover(xs=x,ys=y)

            self.maxlugares=int(l[:l.find('#')])
            #Carregar Arcos
            while True:
                l = f.readline().rstrip('\n')
                if '#' in l: break
                s1=l.find(';')
                s2=l.find(';',s1+1)
                s3=l.find(';',s2+1)
                s4=l.find(';', s3+1)
                s5=l.find(';', s4+1)
                s6=l.find(';', s5+1)
                p = int(l[:s1])
                desenhavel=bool(int(l[s1+1:s2]))
                tinit=int(l[s2+1:s3])
                iinit=int(l[s3+1:s4])
                tend=int(l[s4+1:s5])
                if s6!=-1: iend=int(l[s5+1:s6])
                else: iend=int(l[s5+1:])
                if tinit: init = self.transicoes[iinit]
                else: init = self.lugares[iinit]
                if tend: end = self.transicoes[iend]
                else: end = self.lugares[iend]
                if desenhavel:
                    cords=l[s6+1:].split(';')
                    x,y=float(cords[0]),float(cords[1])
                    arc = Arco(init,None,None,self,desenhavel=True,xs=x,ys=y)
                    for i in range((len(cords)-2)/2):
                        arc.add_segment(xs=float(cords[i*2+2]),ys=float(cords[i*2+3]))
                    arc.finish(end)
                    arc.peso=p
                else:
                    arc=Arco(init,end,1,self)
                    self.arcos += [arc]
                    arc.peso=p
                self.redraw_arcs()
            #Carregar Arcos Inibidores
            while True:
                l = f.readline().rstrip('\n')
                if '#' in l: break
                s1=l.find(';')
                s2=l.find(';',s1+1)
                s3=l.find(';',s2+1)
                s4=l.find(';', s3+1)
                s5=l.find(';', s4+1)
                s6=l.find(';', s5+1)
                p = int(l[:s1])
                desenhavel=bool(int(l[s1+1:s2]))
                tinit=int(l[s2+1:s3])
                iinit=int(l[s3+1:s4])
                tend=int(l[s4+1:s5])
                if s6!=-1: iend=int(l[s5+1:s6])
                else: iend=int(l[s5+1:])
                if tinit: init = self.transicoes[iinit]
                else: init = self.lugares[iinit]
                if tend: end = self.transicoes[iend]
                else: end = self.lugares[iend]
                if desenhavel:
                    cords=l[s6+1:].split(';')
                    x,y=float(cords[0]),float(cords[1])
                    arc = ArcoInibidor(init,None,None,self,desenhavel=True,xs=x,ys=y)
                    for i in range((len(cords)-2)/2):
                        arc.add_segment(xs=float(cords[i*2+2]),ys=float(cords[i*2+3]))
                    arc.finish(end)
                    arc.peso=p
                else:
                    arc=ArcoInibidor(init,end,1,self)
                    self.inibidores += [arc]
                    arc.peso=p
                self.redraw_arcs()
            self.saved=True
        except:
            showerror('Falha ao carregar arquivo','O PETRILab falhou ao tentar carregar o arquivo. O arquivo possivelmente'
                                                  'está corrompido ou foi alterado. É recomendado que você reinicie o programa.'
                                                  '\n\nSe você acredita que isso seja um bug, por favor, reporte-o através do'
                                                  'menu Ajuda -> Informar Bug/Sugestao.')
    def salvar(self):
        if self.filename:
            f = file(self.filename, 'w')
        else:
            return self.salvarcomo()
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.title('PETRILab v1.0 - '+self.filename)
        self.saved=True
        #Salvar Eventos
        for i in self.eventos:
            f.write(str(i.borda)+';'+i.text+'\n')
        f.write(str(self.maxeventos)+'#\n')
        #Salvar Condicoes
        for i in self.condicoes:
            f.write(str(i.text)+'\n')
        f.write(str(self.maxcondicoes)+'#\n')
        #Salvar Acoes
        for i in self.acoes:
            f.write(str(i.text)+'\n')
        f.write(str(self.maxacoes)+'#\n')
        #Salvar Transicoes
        for i in self.transicoes:
            f.write(i.text+';')
            if i.event:
                f.write(str(self.eventos.index(i.event))+';')
            else:
                f.write('None;')
            if i.condicao:
                f.write(str(self.condicoes.index(i.condicao))+';')
            else:
                f.write('None;')
            f.write(str(i.delay)+';')
            f.write(str(int((i.horizontal)))+';')
            f.write(str(self.c.coords(i.rect)[0])+';')
            f.write(str(self.c.coords(i.rect)[1])+'\n')
        f.write(str(self.maxtransicoes)+'#\n')
        #Salvar Lugares
        for i in self.lugares:
            f.write(i.text+';')
            f.write(str(self.c.coords(i.oval)[0])+';')
            f.write(str(self.c.coords(i.oval)[1])+';')
            f.write(str(i.x0)+';')
            for x in i.acoes:
                f.write(str(self.acoes.index(x))+';')
            f.write('\n')
        f.write(str(self.maxlugares)+'#\n')
        #Salvar Arcos
        for i in self.arcos:
            f.write(str(i.peso)+';')
            f.write(str(int(i.desenhavel))+';')
            f.write(str(int(isinstance(i.init,Transicao)))+';')
            if isinstance(i.init,Transicao): f.write(str(self.transicoes.index(i.init))+';')
            else: f.write(str(self.lugares.index(i.init))+';')
            f.write(str(int(isinstance(i.end,Transicao)))+';')
            if isinstance(i.end,Transicao): f.write(str(self.transicoes.index(i.end)))
            else: f.write(str(self.lugares.index(i.end)))
            if i.desenhavel:
                for x in i.segmentos[1:]:
                    f.write(';'+str(self.c.coords(x)[0])+';'+str(self.c.coords(x)[1]))
            f.write('\n')
        f.write('#\n')
        #Salvar Arcos Inibidores
        for i in self.inibidores:
            f.write(str(i.peso)+';')
            f.write(str(int(i.desenhavel))+';')
            f.write(str(int(isinstance(i.init,Transicao)))+';')
            if isinstance(i.init,Transicao): f.write(str(self.transicoes.index(i.init))+';')
            else: f.write(str(self.lugares.index(i.init))+';')
            f.write(str(int(isinstance(i.end,Transicao)))+';')
            if isinstance(i.end,Transicao): f.write(str(self.transicoes.index(i.end)))
            else: f.write(str(self.lugares.index(i.end)))
            if i.desenhavel:
                for x in i.segmentos[1:]:
                    f.write(';'+str(self.c.coords(x)[0])+';'+str(self.c.coords(x)[1]))
            f.write('\n')
        f.write('#')
        return 1




        f.close()
    def salvarcomo(self):
        if self.filename: init=self.filename
        else: init = ''
        f = asksaveasfilename(defaultextension='.pl',filetypes=[('Arquivo PETRILab','.pl')],initialfile=init)
        if f:
            self.filename = f
            return self.salvar()
        else: return 0
    def sairc(self):
        while True:
            if self.saved:
                self.sair()
                break
            q = askquestion('Novo','Deseja salvar o arquivo atual?',type=YESNOCANCEL)
            if q == 'yes':
                if self.salvar():
                    self.sair()
                    break
            elif q == 'no':
                self.sair()
                break
            else:
                break
    def sair(self):
        self.quit()
        sys.exit()
    def lugar(self):
        self.rcancel()
        self.c.unbind('<Double-Button-1>')
        self.c.unbind('<Button-3>')
        self.unbind('<Button-3>')
        self.unbind('<Double-Button-1>')
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.l = Lugar(self)
        self.inserindo = self.l
        self.bind('<Motion>', self.l.follow)
        self.bind('<Escape>', self.l.cancel)
        self.c.bind('<Button-1>', self.l.place)
    def transicao(self):
        self.rcancel()
        self.c.unbind('<Double-Button-1>')
        self.unbind('<Button-3>')
        self.unbind('<Double-Button-1>')
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.t = Transicao(self)
        self.inserindo = self.t
        self.bind('<Motion>', self.t.follow)
        self.bind('<Escape>', self.t.cancel)
        self.c.bind('<Button-1>', self.t.place)
    def acancel(self, e=None):
        self.c.bind('<Double-Button-1>', self.doubleclick)
        self.bind('<Double-Button-1>', self.editbuts)
        self.bind('<Button-3>', self.removebuts)
        self.c.bind('<Button-3>', self.flip)
        self.c.bind('<B1-Motion>', self.mover2)
        self.configure(cursor='')
        self.c.unbind('<Button-1>')
        self.c.unbind('<Escape>')
        self.inserindo=None
        if self.desenhando:
            self.desenhando.delete()
            self.desenhando=None
    def arco(self):
        self.rcancel()
        self.c.unbind('<Double-Button-1>')
        self.c.unbind('<Button-3>')
        self.unbind('<Button-3>')
        self.unbind('<Double-Button-1>')
        self.c.unbind('<B1-Motion>')
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.inserindo=Helper(self)
        self.inserindoin = False
        self.configure(cursor='tcross')
        self.c.bind('<Button-1>', self.inita)
        self.bind('<Escape>', self.acancel)
    def inibidor(self):
        self.rcancel()
        self.c.unbind('<Double-Button-1>')
        self.c.unbind('<Button-3>')
        self.unbind('<Button-3>')
        self.unbind('<Double-Button-1>')
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.inserindo=Helper(self)
        self.inserindoin = True
        self.configure(cursor='tcross')
        self.c.bind('<Button-1>', self.inita)
        self.bind('<Escape>', self.acancel)
    def inita(self, e):
        self.c.unbind('<Double-Button-1>')
        self.c.unbind('<Button-3>')
        self.unbind('<Button-3>')
        self.unbind('<Double-Button-1>')
        self.c.unbind('<B1-Motion>')
        obj = self.c.find_withtag(CURRENT)
        if obj:
            for i in self.transicoes+self.lugares:
                if obj[0] in i.items:
                    if self.inserindoin and isinstance(i, Transicao):
                        return
                    self.arcstart = i
                    self.ainit=i
                    self.configure(cursor='plus')
                    self.c.bind('<Button-1>', self.enda)
                    return
    def enda(self, e):
        obj = self.c.find_withtag(CURRENT)
        if obj:
            for i in self.transicoes+self.lugares:
                if obj[0] in i.items:
                    for j in self.ainit.outarcs:
                        if j.end == i and ((isinstance(j,ArcoInibidor) and self.inserindoin) or (isinstance(j,Arco) and not self.inserindoin)):
                            return
                    if isinstance(i, Lugar) and isinstance(self.arcstart, Lugar):
                        return
                    if isinstance(i, Transicao) and isinstance(self.arcstart, Transicao):
                        return
                    if self.inserindoin and isinstance(i, Lugar):
                        return
                    self.aend=i
                    self.configure(cursor='')
                    p = 1
                    if p:
                        if self.inserindoin:
                            if self.desenhando:
                                self.desenhando.finish(self.aend)
                            else:
                                self.inibidores += [ArcoInibidor(self.ainit, self.aend, p,self)]
                                self.saved=False
                        else:
                            if self.desenhando:
                                self.desenhando.finish(self.aend)
                            else:
                                self.arcos += [Arco(self.ainit, self.aend, p,self)]
                                self.saved=False
                    self.c.unbind('<Button-1>')
                    return
        if self.desenhando:
            self.desenhando.add_segment()
        else:
            if self.inserindoin:
                self.desenhando = ArcoInibidor(self.ainit,None,None,self,desenhavel=True)
            else:
                self.desenhando = Arco(self.ainit,None,None,self,desenhavel=True)
    def mover(self):
        self.medit.entryconfig(0,state=NORMAL)
        self.medit.entryconfig(1,state=NORMAL)
        self.medit.entryconfig(2,state=DISABLED)
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.configure(cursor='fleur')
        self.c.unbind('<Button-1>')
        self.c.bind('<B1-Motion>', self.mover2)
        self.bind('<Escape>', self.mcancel)
        self.c.unbind('<Double-Button-1>')
        self.c.unbind('<Button-3>')
        self.unbind('<Button-3>')
        self.arrowb.config(relief=RAISED)
        self.deleteb.config(relief=RAISED)
        #self.moveb.config(relief=SUNKEN)
    def mover2(self, e):
        obj = self.c.find_withtag(CURRENT)
        if obj:
            for i in self.transicoes+self.lugares:
                if obj[0] in i.items:
                    #self.bind('<ButtonRelease-1>', i.placem)
                    i.mover()
    def mcancel(self, e=None):
        self.medit.entryconfig(0,state=DISABLED)
        self.medit.entryconfig(1,state=NORMAL)
        self.medit.entryconfig(2,state=NORMAL)
        self.configure(cursor='')
        self.unbind('<ButtonRelease-1>')
        self.c.unbind('<B1-Motion>')
        self.c.bind('<Double-Button-1>', self.doubleclick)
        self.bind('<Double-Button-1>', self.editbuts)
        self.bind('<Button-3>', self.removebuts)
        self.c.bind('<Button-3>', self.flip)
        self.c.unbind('<Button-1>')
        self.c.unbind('<Escape>')
        self.arrowb.config(relief=SUNKEN)
        self.deleteb.config(relief=RAISED)
        #self.moveb.config(relief=RAISED)
    def deletar(self):
        self.medit.entryconfig(0,state=NORMAL)
        self.medit.entryconfig(1,state=DISABLED)
        if self.inserindo:
            self.inserindo.cancel(None)
            self.inserindo=None
        self.configure(cursor='hand2')
        self.c.bind('<Button-1>', self.remover)
        self.bind('<Escape>', self.rcancel)
        self.c.unbind('<B1-Motion>')
        self.c.unbind('<Double-Button-1>')
        self.unbind('<Button-3>')
        self.arrowb.config(relief=RAISED)
        self.deleteb.config(relief=SUNKEN)
        #self.moveb.config(relief=RAISED)
    def rcancel(self, e=None):
        self.medit.entryconfig(0,state=DISABLED)
        self.medit.entryconfig(1,state=NORMAL)
        self.configure(cursor='')
        self.unbind('<ButtonRelease-1>')
        self.c.bind('<Double-Button-1>', self.doubleclick)
        self.bind('<Double-Button-1>', self.editbuts)
        self.bind('<Button-3>', self.removebuts)
        self.c.bind('<Button-3>', self.flip)
        self.c.bind('<B1-Motion>', self.mover2)
        self.c.unbind('<Button-1>')
        self.c.unbind('<Escape>')
        self.arrowb.config(relief=SUNKEN)
        self.deleteb.config(relief=RAISED)
        #self.moveb.config(relief=RAISED)
    def remover(self,e):
        obj = self.c.find_withtag(CURRENT)
        if obj:
            for i in self.transicoes+self.lugares+self.arcos+self.inibidores:
                if obj[0] in i.items:
                    i.delete()
    def editararco(self, arco):
        p = askinteger('Editar arco', 'Peso', initialvalue=arco.peso,
                       minvalue=1)
        if p:
            arco.peso=p
            arco.redraw()
            self.saved=False
    def editarcondicao(self, condicao):
        while True:
            l = askstring('Editar condição', 'Rótulo', initialvalue=condicao.text)
            bad=False
            for i in '!@#$%�&*(),.;:':
                if i in l or l=='':
                    showinfo('Rótulo inválido','O rótulo possui caracteres inválidos ou está vazio.')
                    bad = True
                    break
            if not bad: break

        if l:
            condicao.text=l
            condicao.but.configure(text=l)
            for i in self.transicoes:
                i.update_labels()
            self.saved=False
    def editaracao(self, acao):
        while True:
            l = askstring('Editar a��o', 'Rótulo', initialvalue=acao.text)
            bad=False
            for i in '!@#$%�&*(),.;:':
                if i in l or l=='':
                    showinfo('Rótulo inválido','O rótulo possui caracteres inválidos ou está vazio.')
                    bad = True
                    break
            if not bad: break
        if l:
            acao.text=l
            acao.but.configure(text=l)
            for i in self.lugares:
                i.update_labels()
            self.saved=False
    def evento(self):
        self.maxeventos +=1
        self.eventos += [Evento(self, 1)]
        #AdicionarEvento(self)
    def condicao(self):
        self.maxcondicoes += 1
        self.condicoes += [Condicao(self)]
    def acao(self):
        self.maxacoes += 1
        self.acoes += [Acao(self)]

app = Programa()
app.mainloop()
