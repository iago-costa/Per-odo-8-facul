/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grafocidades;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Elton Alves
 */
public class Cidade {
    private String nome;
    private boolean visitado;
    private List<Adjacente> adjacentes;

    public Cidade(String nome) {
        this.nome = nome;
        visitado = false;
        adjacentes = new ArrayList<Adjacente>();
    }
    
    public void addCidadeAdjacente(Adjacente cidade) {
        adjacentes.add(cidade);
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public boolean isVisitado() {
        return visitado;
    }

    public void setVisitado(boolean visitado) {
        this.visitado = visitado;
    }

    public List<Adjacente> getAdjacentes() {
        return adjacentes;
    }
    
    
    
}
