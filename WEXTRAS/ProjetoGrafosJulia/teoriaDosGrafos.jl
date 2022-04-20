import Pkg; 

Pkg.add("PyCall")
Pkg.add("GraphPlot")
Pkg.add("Cairo")
Pkg.add("Compose")
Pkg.add("Graphs")
Pkg.add("Colors")
# Pkg.add("PackageCompiler")

using PyCall, GraphPlot, Cairo, Compose, Graphs, Colors;

np = pyimport("numpy")

function processandoDados()
    listaAdjacencia = []
    listaVertices = []
    tipo = ""
    open("entradatipo2.txt") do file
        line = 0
        while !eof(file)      
            s = readline(file)
            if cmp(string(s), string("D")) != 0
                s = split(s, ",")
                push!(listaAdjacencia, [s[1], s[2]])
                
                if in(s[1], listaVertices) == false
                    push!(listaVertices, s[1])
                end
                
                if in(s[2], listaVertices) == false
                    push!(listaVertices, s[2])
                end
                
                line += 1
            else
                tipo = s
            end
        end
    end

    println("Lista Vértices: ", listaVertices)
    println("Lista Adjacentes: ", listaAdjacencia)

    carregandoMatrizAdjacente(listaAdjacencia, listaVertices, tipo)

end


function carregandoMatrizAdjacente(listaAdjacencia, listaVertices, tipo)
    quantidadeVertices = size(listaVertices, 1)
    matrizAdjacencia = np.zeros(shape=(quantidadeVertices, quantidadeVertices), dtype=np.int)

    for i in listaVertices
        # println(i)
        for j in listaAdjacencia
            if cmp(i, j[1]) == 0
                # println(j[1]," ", j[2])
                if cmp(tipo, "D") == 0
                    # println(findall(x->x == j[2], listaVertices)[1])
                    matrizAdjacencia[ findall(x->x == j[1], listaVertices)[1], findall(x->x == j[2], listaVertices)[1] ] = 1
                end
                if cmp(tipo, "ND") == 0
                    matrizAdjacencia[ findall(x->x == j[1], listaVertices)[1], findall(x->x == j[2], listaVertices)[1] ] = 1
                    matrizAdjacencia[ findall(x->x == j[2], listaVertices)[1], findall(x->x == j[1], listaVertices)[1] ] = 1
                end
            end
        end
        
    end

    println("Matriz adjacentes: ", matrizAdjacencia)
    
    loopOpcoes(listaVertices, matrizAdjacencia, quantidadeVertices, tipo)
end


function loopOpcoes(listaVertices, matrizAdjacencia, quantidadeVertices, tipo)
    loopOn = true
    while loopOn
        println("\n=====================================================")
        println("Digite q para sair")
        println("\n1 - Verificar se são adjacentes\n2 - Calcular grau\n3 - Buscar vizinhos\n4 - Visitar arestas do grafo\n5 - Visualizar o Grafo graficamente a partir de uma imagem")
        println("=====================================================")

        s = readline()
        if cmp(s, "q") == 0
            loopOn = false
        end

        if cmp(s, "1") == 0
            println("Digite o primeiro vertice: ")
            v1 = readline()
            println("Digite o segundo vertice: ")
            v2 = readline()

            if matrizAdjacencia[ findall(x->x == v1, listaVertices)[1], findall(x->x == v2, listaVertices)[1] ] == 1
                println("São adjacentes")
            else
                println("Nao são adjacentes")
            end
        end


        if cmp(s, "2") == 0
            println("Digite o vertice: ")
            v = readline()
            grau = 0
            for i in listaVertices
                if matrizAdjacencia[ findall(x->x == v, listaVertices)[1], findall(x->x == i, listaVertices)[1] ] == 1
                    grau += 1
                end
            end
            println("O grau do vertice ", v, " eh ", grau)
        end


        if cmp(s, "3") == 0
            println("Digite o vertice: ")
            v = readline()
            vizinhos = []
            for i in listaVertices
                if matrizAdjacencia[ findall(x->x == v, listaVertices)[1], findall(x->x == i, listaVertices)[1] ] == 1
                    push!(vizinhos, i)
                end
            end
            println("Os vizinhos do vertice ", v, " sao: ", vizinhos)
        end


        if cmp(s, "4") == 0
            println("Digite o vertice: ")
            v = readline()
            arestas = []
            for i in listaVertices
                if matrizAdjacencia[ findall(x->x == v, listaVertices)[1], findall(x->x == i, listaVertices)[1] ] == 1
                    push!(arestas, [v, i])
                end
            end
            println("As arestas do vertice ", v, " sao: ", arestas)
        end


        if cmp(s, "5") == 0
            println("Plot gráfico - o grafo será salvo em grafo.png")
            g = SimpleGraph(quantidadeVertices)
            for i in listaVertices
                for j in listaVertices
                    if matrizAdjacencia[ findall(x->x == i, listaVertices)[1], findall(x->x == j, listaVertices)[1] ] == 1
                        add_edge!(g, findall(x->x == i, listaVertices)[1], findall(x->x == j, listaVertices)[1])
                    end
                end
            end
            if cmp(tipo, "D") == 0
                nodelabel = 1:nv(g)
                draw(PNG("grafo.png", 16cm, 16cm), gplot(g, nodelabel=nodelabel, arrowlengthfrac=0.1))
            
            elseif cmp(tipo, "ND") == 0
                nodelabel = 1:nv(g)
                draw(PNG("grafo.png", 16cm, 16cm), gplot(g, nodelabel=nodelabel))
            end
        end


    end
end


processandoDados()


