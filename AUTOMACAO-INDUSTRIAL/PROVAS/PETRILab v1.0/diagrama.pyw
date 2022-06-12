# -*- coding: cp1252 -*-

from CIPN import *
from ladder import *
from conversao import *
from Tkinter import *
import sys

# VER TAMANHO DO CANVAS E ADICIONAR LINHA LATERAL
# CORRIGIR BUGS (VER PN1)

class Diagrama:
    def __init__(self, larg, parent):
        self.parent=parent
        w = larg+30
        self.w = w
        self.top = Toplevel(parent)
        menubar=Menu(self.top)
        self.mfile=Menu(menubar, tearoff=0)
        self.mfile.add_command(label='Salvar',command=self.salvar)
        menubar.add_cascade(label='Diagrama',menu=self.mfile)
        self.top.config(menu=menubar)
        f = Frame(self.top); f.pack()
        self.c = Canvas(f, background='white', width=w, height=1000, scrollregion=(0,0,w,1500))
        self.c.pack(side=LEFT)
        sc = Scrollbar(f, orient=VERTICAL)
        
        sc.pack(side=RIGHT,fill=Y)
        self.c.config(yscrollcommand=sc.set)
        self.top.title('Diagrama Ladder')
        x,y = parent.winfo_x()+100, parent.winfo_y()+100
        self.top.geometry(str(w+16)+'x700+'+str(x)+'+'+str(y))
        self.top.resizable(0,0)
        sc.config(command=self.c.yview)
        self.c.create_text(w/2.0,18,text='DIAGRAMA LADDER', font=('Verdana',12),
                           anchor=N)
        self.xy = [0,55]
        self.l=0
        self.top.bind('<Escape>', lambda x: self.close())
        self.top.bind('<MouseWheel>', self.scroll)
        self.top.focus_set()
    def salvar(self):
        self.c.update()
        w,h=self.c.cget('width'),self.c.cget('height')
        if self.parent.filename:
            ind = len(self.parent.filename)-self.parent.filename[::-1].find('/')
            dir=self.parent.filename[:ind]
        else: dir='./'
        arq=dir+'LADDER.eps'
        self.c.postscript(file=arq,width=w,height=h, colormode='color')
    def scroll(self, event):
        self.c.yview_scroll(-1*(event.delta/120),'units')
    def close(self):
        self.top.destroy()
    def add(self, e):
        xy = e.draw(self.c, self.xy)
        self.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
        self.xy = [xy[0]+25, xy[1]]
    def newline(self, E=45):
        self.c.create_line(15,self.xy[1]+E,40,self.xy[1]+E)
        self.xy = [40,self.xy[1]+E]
        
def gerar(pn, parent, labels=None):
    if labels:
        b = convert(pn, labels)
    else:
        b = convert(pn)


    # Contagem do Módulo 2

    cmax, compmax, atr = 0, 0, False
    nums = []
    for i in range(len(b[1].x)):
        nums.append([0,0])

    for l in range(len(b[1].x)):
        for i in b[1].x[l].x:
            if isinstance(i, Contato): nums[l][0] += 1
            if isinstance(i, Comp): nums[l][1] += 1
            if isinstance(i, Atraso): atr = True
        if nums[l][0] > cmax: cmax = nums[l][0]
        if nums[l][1] > compmax: compmax = nums[l][1]


    larg = 25 + cmax*(10+25)+ compmax*(60+25)+ atr*(60+25)+(not atr)*(20+25)
    if larg < 220: larg = 220
    app = Diagrama(larg, parent)
    app.newline()

    # Desenho do Módulo 1

    if b[0].x:
        k = 0
        for l in b[0].x:
            k += 1
            xy = app.xy
            xy = l.x[0].draw(app.c, xy)
            app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
            xy = [xy[0]+25, xy[1]]
            xy = l.x[1].draw(app.c, xy)
            app.c.create_line(xy[0], xy[1], larg+15-25-20, xy[1])
            xy = [larg+15-25-20, xy[1]]
            xy = l.x[2].draw(app.c, xy)
            app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
            app.xy = xy
            if k != len(b[0].x):
                app.newline(45)
        app.newline(75)
            

    # Desenho do Módulo 2

    if b[1].x:
        for l in range(len(b[1].x)):
            xy = app.xy
            for i in range(nums[l][0]):
                xy = b[1].x[l].x[i].draw(app.c,xy)
                app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
                xy = [xy[0]+25, xy[1]]
            for i in range(cmax-nums[l][0]):
                app.c.create_line(xy[0],xy[1],xy[0]+35,xy[1])
                xy = [xy[0]+35, xy[1]]

            for i in range(nums[l][1]):
                xy = b[1].x[l].x[i+nums[l][0]].draw(app.c,xy)
                app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
                xy = [xy[0]+25, xy[1]]
            for i in range(compmax-nums[l][1]):
                app.c.create_line(xy[0],xy[1],xy[0]+85,xy[1])
                xy = [xy[0]+85, xy[1]]
            if isinstance(b[1].x[l].x[-1], Atraso):
                xy = b[1].x[l].x[-1].draw(app.c,xy)
                app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
                xy = [xy[0]+25, xy[1]]
            else:
                app.c.create_line(xy[0], xy[1], larg+15-25-20, xy[1])
                xy = [larg+15-25-20, xy[1]]
                xy = b[1].x[l].x[-1].draw(app.c,xy)
                app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
            app.xy = xy
            if l != len(b[1].x)-1:
                app.newline(50)
        app.newline(75)


    # Desenho do Módulo 3

    if b[2].x:
        k = 0
        for l in b[2].x:
            k += 1
            xy = app.xy
            xy = l.x[0].draw(app.c, xy)
            app.c.create_line(xy[0], xy[1], larg+5-l.x[1].size()[0], xy[1])
            xy = [larg+5-l.x[1].size()[0], xy[1]]
            xy = l.x[1].draw(app.c, xy)
            app.xy = xy
            if k != len(b[2].x):
                app.newline(30)
        app.newline(70)  

    # Desenho do Módulo 4

    if len(b[3].x[0].x[1].e)>1:
        xy = app.xy
        xy = b[3].x[0].x[0].draw(app.c, xy)
        app.c.create_line(xy[0], xy[1], larg+5-b[3].x[0].x[1].size()[0], xy[1])
        xy = [larg+5-b[3].x[0].x[1].size()[0], xy[1]]
        xy = b[3].x[0].x[1].draw(app.c, xy)
        app.xy=xy
        if b[4].x:
            app.newline(70)


    # Desenho do Módulo 5

    if b[4].x:
        k = 0
        for l in b[4].x:
            k += 1
            xy = app.xy
            xy = l.x[0].draw(app.c, xy)
            app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
            xy = [xy[0]+25, xy[1]]
            xy = l.x[1].draw(app.c, xy)
            app.c.create_line(xy[0], xy[1], larg+15-25-20, xy[1])
            xy = [larg+15-25-20, xy[1]]
            xy = l.x[2].draw(app.c, xy)
            if not isinstance(l.x[2], Paralelo):
                app.c.create_line(xy[0],xy[1],xy[0]+25,xy[1])
            app.xy = xy
            if k != len(b[4].x):
                app.newline(45)


    app.c.config(height=(xy[1]+30), scrollregion=(0,0,app.w,xy[1]+30 ))
    if xy[1]<700:
        app.top.geometry(str(app.w+16)+'x'+str(xy[1]+35))
    app.c.create_line(15,xy[1]+15,15,75)
            
    app.c.create_line(larg+15,xy[1]+15,larg+15,75) #ZUADO
    mainloop()



