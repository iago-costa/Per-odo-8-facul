/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package buscas;

import estruturas.Fila;
import grafocidades.Adjacente;
import grafocidades.Cidade;
import grafocidades.Mapa;

/**
 *

 */
public class Largura {

    private Fila fronteira;
    private Cidade inicio;
    private Cidade objetivo;
    private boolean achou;

    public Largura(Cidade inicio, Cidade objetivo) {
        this.inicio = inicio;
        this.inicio.setVisitado(true); //evitar estado repetido
        this.objetivo = objetivo;

        fronteira = new Fila(20); //fronteira é uma fila
        fronteira.enfileirar(inicio); //enfileirar a cidade inicio
        achou = false;
    }

    public void buscar() {
        Cidade primeiro = fronteira.getPrimeiro(); //primeiro elemento da fila
        System.out.println("Primeiro: " + primeiro.getNome());

        if (primeiro == objetivo) { 
            achou = true;
        } else {
            System.out.println("Desenfileirou: " + fronteira.desenfileirar().getNome());
            for (Adjacente a : primeiro.getAdjacentes()) { //
                System.out.println("Verificando se já visitado: " + a.getCidade().getNome());
                if (!a.getCidade().isVisitado()) { //caso cidade não tenha sido visitada
                    a.getCidade().setVisitado(true); //seta como visitado
                    fronteira.enfileirar(a.getCidade()); //chama a fronteira enfileira a cidade não visitada
                }
            }
            if (fronteira.getNumeroElementos() > 0) { // n elementos da fila >0
                buscar();//metodo recursivo
            }
        }
    }

    public static void main(String args[]) {
        Mapa mapa = new Mapa();
        Largura l = new Largura(mapa.getPortoUniao(), mapa.getCuritiba());
        l.buscar();
    }
}
