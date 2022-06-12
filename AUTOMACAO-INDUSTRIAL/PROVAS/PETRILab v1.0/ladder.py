# -*- coding: cp1252 -*-

# Modelagem de Diagramas Ladder

from Tkinter import *


class Bobina:
    def __init__(self, l, t):
        self.l, self.t = l, t
    def __str__(self):
        if self.t == 1:
            return '('+self.l+')'
        if self.t == 0:
            return '(S-'+self.l+')'
    def draw(self, c, xy):
        R = 10
        c.create_oval(xy[0],xy[1]-R,xy[0]+2*R,xy[1]+R)
        c.create_text(xy[0]+R,xy[1]-2*R, text=self.l)
        c.create_rectangle(xy[0]+R/2.0,xy[1]-R-1,xy[0]+3*R/2.0,
                           xy[1]+R+1, fill='white', outline='white')
        if not self.t:
            c.create_text(xy[0]+R,xy[1], text='S')
        return [xy[0]+2*R,xy[1]]
    def size(self):
        R = 10
        return [2*R,2*R+5,R]
    
class Contato:
    def __init__(self, l, t):
        self.l, self.t = l, t
    def __str__(self):
        if self.t == 1:
            return '['+self.l+']'
        if self.t == 0:
            return '[*'+self.l+'*]'
    def draw(self, c, xy):
        R = 10
        c.create_line(xy[0],xy[1]-R,xy[0],xy[1]+R)
        c.create_line(xy[0]+R,xy[1]-R,xy[0]+R,xy[1]+R)
        c.create_text(xy[0]+R/2.0,xy[1]-2*R, text=self.l)
        if self.t == 0:
            c.create_line(xy[0],xy[1]+R,xy[0]+R,xy[1]-R)
        return [xy[0]+R,xy[1]]
    def size(self):
        return [R, 2*R+5,R]

class Dinamica:
    def __init__(self, l, t, q):
        self.l, self.t, self.q = l, t, q
        self.s = 'ADD'*int(self.t)+'SUB'*int(not self.t)
        if self.t:
            self.s2 = self.l+'='+self.l+'+'+str(self.q)
        else:
            self.s2 = self.l+'='+self.l+'-'+str(self.q)
    def __str__(self):
        if self.t == 1:
            return '<ADD '+self.l+'+='+str(self.q)+'>'
        if self.t == 0:
            return '<SUB '+self.l+'-='+str(self.q)+'>'
    def draw(self, c, xy):
        R = 20
        c.create_rectangle(xy[0],xy[1]-R,xy[0]+3*R,xy[1]+R)
        c.create_text(xy[0]+1.5*R,xy[1]-R/2., text=self.s)
        c.create_text(xy[0]+1.5*R,xy[1]+R/2., text=self.s2, font=('Purisa',8))
        c.create_line(xy[0]+3*R, xy[1],xy[0]+3*R+25,xy[1])
        return [xy[0]+3*R+25,xy[1]]
    def size(self):
        R=20
        return [3*R+25,R,R]
class Comp:
    def __init__(self, l, t, q):
        self.l, self.t, self.q = l, t, q
        self.s = 'COMP'
        if self.t == 0:
            self.s2 = self.l +'<'+str(q)
        if self.t == 1:
            self.s2 = self.l +'='+str(q)
        if self.t == 2:
            self.s2 = self.l+'>='+str(q)
    def __str__(self):
        if self.t == 0:
            return '<COMP '+self.l+'<'+str(self.q)+'>'
        if self.t == 1:
            return '<COMP '+self.l+'='+str(self.q)+'>'
        if self.t == 2:
            return '<COMP '+self.l+'>='+str(self.q)+'>'
    def draw(self, c, xy):
        R = 20
        c.create_rectangle(xy[0],xy[1]-R,xy[0]+3*R,xy[1]+R)
        c.create_text(xy[0]+1.5*R,xy[1]-R/2., text=self.s)
        c.create_text(xy[0]+1.5*R,xy[1]+R/2., text=self.s2, font=('Purisa',8))
        return [xy[0]+3*R,xy[1]]
    def size(self):
        R=20
        return [3*R,R,R]
class Move:
    def __init__(self, l, q):
        self.l, self.q = l, q
        self.s, self.s2 = 'MOVE', self.l+'='+str(self.q)
    def __str__(self):
        return '<MOVE '+self.l+'='+str(self.q)+'>'
    def draw(self, c, xy):
        R = 20
        c.create_rectangle(xy[0],xy[1]-R,xy[0]+3*R,xy[1]+R)
        c.create_text(xy[0]+1.5*R,xy[1]-R/2., text=self.s)
        c.create_text(xy[0]+1.5*R,xy[1]+R/2., text=self.s2, font=('Purisa',8))
        return [xy[0]+3*R,xy[1]]
    def size(self):
        R=20
        return [3*R,R,R]
class Atraso:
    def __init__(self, d, n, label=None):
        self.d, self.n = d, n
        self.label = label
        self.s = 'TIMER'
        if label:
            self.s2 = label + ' '+str(self.d)+'s'
        else:
            self.s2 = 'TDN'+str(self.n)+' '+str(self.d)+'s'
    def __str__(self):
        return '<TIMER '+str(self.d)+'s'+' TDN'+str(self.n)+'>'
    def draw(self, c, xy):
        R = 20
        c.create_rectangle(xy[0],xy[1]-R,xy[0]+3*R,xy[1]+R)
        c.create_text(xy[0]+1.5*R,xy[1]-R/2., text=self.s)
        c.create_text(xy[0]+1.5*R,xy[1]+R/2., text=self.s2, font=('Purisa',8))
        return [xy[0]+3*R,xy[1]]
    def size(self):
        return [3*R,R,R]
class Borda:
    def __init__(self, t):
        self.t = t
        if t == 1:
            self.s = '[P]'
        if t == 0:
            self.s = '[N]'
    def __str__(self):
        return self.s
    def draw(self, c, xy):
        s = 'P' if self.t ==1 else 'N'
        R = 10
        c.create_line(xy[0],xy[1]-R,xy[0],xy[1]+R)
        c.create_line(xy[0]+2*R,xy[1]-R,xy[0]+2*R,xy[1]+R)
        c.create_text(xy[0]+R,xy[1], text=s)
        return [xy[0]+2*R,xy[1]]
    def size(self):
        R = 10
        return [2*R,R,R]
class Paralelo:
    def __init__(self, e):
        self.e = e
        self.s = '('
        for i in e:
            self.s += '||'*(self.s!='(')+ i.__str__()
        self.s += ')'
    def __str__(self):
        return self.s
    def draw(self, c, xy):
        box, bob = False, False
        for i in self.e:
            if isinstance(i, (Dinamica, Move)): box = True
            else: bob = True
        if box and not bob:
            y0 = xy[1]
            c.create_line(xy[0],xy[1],xy[0]+15,xy[1])
            xy = [xy[0]+15, xy[1]]
            for i in range(len(self.e)):
                if i != 0:
                    xy[1] += self.e[i-1].size()[1] + 5
                    c.create_line(xy[0]-15,xy[1],xy[0],xy[1])
                c.create_line(xy[0]+60,xy[1],xy[0]+75,xy[1])
                self.e[i].draw(c, xy)
                xy = [xy[0], xy[1]+self.e[i].size()[2]]
            c.create_line(xy[0]-15,xy[1]-self.e[i].size()[2],xy[0]-15,y0)
        elif bob and not box:
            y0 = xy[1]
           # if len(self.e)>1:
                #c.create_line(xy[0],xy[1],xy[0]+15,xy[1])
                #xy = [xy[0]+15, xy[1]]
            for i in range(len(self.e)):
                if i != 0:
                    xy[1] += self.e[i-1].size()[1] + 5
                    c.create_line(xy[0]-15,xy[1],xy[0],xy[1])
                c.create_line(xy[0]+20,xy[1],xy[0]+45,xy[1])
                self.e[i].draw(c, xy)
                xy = [xy[0], xy[1]+self.e[i].size()[2]]
            c.create_line(xy[0]-15,xy[1]-self.e[i].size()[2],xy[0]-15,y0)
        else:
            y0 = xy[1]
            c.create_line(xy[0],xy[1],xy[0]+15,xy[1])
            xy = [xy[0]+15, xy[1]]
            for i in range(len(self.e)):
                if i != 0:
                    xy[1] += self.e[i-1].size()[1] + 5
                    if i != len(self.e)-1:
                        c.create_line(xy[0]-15,xy[1],xy[0],xy[1])
                    else:
                        c.create_line(xy[0]-15,xy[1]+5,xy[0],xy[1]+5)
                if i != len(self.e)-1:
                    c.create_line(xy[0]+60,xy[1],xy[0]+85,xy[1])
                else:
                    c.create_line(xy[0]+60,xy[1]+5,xy[0]+75,xy[1]+5)
                if i == len(self.e)-1:
                    c.create_line(xy[0],xy[1]+5,xy[0]+20,xy[1]+5)
                    xy = [xy[0]+20, xy[1]+5]
                    c.create_line(xy[0]+20,xy[1],xy[0]+65,xy[1])
                self.e[i].draw(c, xy)
                xy = [xy[0], xy[1]+self.e[i].size()[2]]
            c.create_line(xy[0]-35,xy[1]-self.e[i].size()[2],xy[0]-35,y0)
        return [xy[0], xy[1]]
    def size(self):
        box, bob = False, False
        for i in self.e:
            if isinstance(i, (Dinamica, Move)): box = True
            else: bob = True
        s = 0
        for i in self.e:
            if isinstance(i, (Move,Dinamica)):
                s += 25
            else:
                s += 40
        if box:
            s2 = 90
        else:
            s2 = 50
        return [s2, s/2.0,s/2.0]

class Linha:
    def __init__(self, l=None):
        '''l -> lista com componentes'''
        if l:
            self.x = l
        else:
            self.x = []
    def __add__(self, e):
        return Linha(self.x+[e])
    def __str__(self):
        x, s = self.x, ''
        for i in self.x:
            s += '----'*(s!='') + i.__str__()
        s = '|--'+s+'--|'
        return s
    def __repr__(self):
        return self.__str__()


class Ladder:
    def __init__(self, l=None):
        '''l -> lista com linhas'''
        if l:
            self.x = l
        else:
            self.x = []
    def __add__(self, i):
        if isinstance(i, Ladder):
            return Ladder(self.x + i.x)
        if isinstance(i, Linha):
            return Ladder(self.x + [i])
    def __str__(self):
        s = ''
        for i in self.x:
            s += '\n'*(s!='')+i.__str__()
        return s
    def __repr__(self):
        return self.__str__()

