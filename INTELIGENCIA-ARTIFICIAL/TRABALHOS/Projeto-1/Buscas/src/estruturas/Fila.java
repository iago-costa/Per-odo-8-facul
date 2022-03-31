/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estruturas;

import grafocidades.Cidade;
import grafocidades.Mapa;

/**
 *
 * @author Elton Alves
 */
public class Fila {

    private int tamanho;
    private Cidade[] cidades; //vetor de cidades, fila de cidades
    private int inicio;
    private int fim;
    private int numeroElementos;

    public Fila(int tamanho) { //construtor que recebe o tamanho
        this.tamanho = tamanho;
        cidades = new Cidade[tamanho]; //instanciando
        inicio = 0;
        fim = -1;//posição invalida do vetor
        numeroElementos = 0;
    }

    public void enfileirar(Cidade cidade) {//cidade como parametro
        if (!filaCheia()) {
            if (fim == tamanho - 1) {//esgoto o vetor, faz a circulação da fila.
                fim = -1;
            }

            cidades[++fim] = cidade; //adicionando um elemento no inicio da fila
            numeroElementos++;
        } else {
            System.out.println("A fila já está cheia");
        }
    }

    public Cidade desenfileirar() { //sempre tira um elemento do inicio da fila
        if (!filaVazia()) {
            Cidade temp = cidades[inicio++]; //qual cidade está sendo desenfileirada
            if (inicio == tamanho) {
                inicio = 0;
            }

            numeroElementos--;
            return temp; //cidade que acabou de desenfileirar
        } else {
            System.out.println("A fila já está vazia");
            return null;
        }
    }

    public Cidade getPrimeiro() { //retorna o primeiro elemento da fila
        return cidades[inicio];
    }

    public boolean filaVazia() {
        return (numeroElementos == 0);
    }

    public boolean filaCheia() {
        return (numeroElementos == tamanho);
    }

    public int getNumeroElementos() {
        return numeroElementos;
    }
    
    public static void main(String args[]) {
        Fila fila = new Fila(5);
        Mapa mapa = new Mapa();//acesso a todas as cidades
        
        fila.enfileirar(mapa.getAraucaria());
        fila.enfileirar(mapa.getBalsaNova());
        fila.enfileirar(mapa.getContenda());
        
        System.out.println(fila.getPrimeiro().getNome());
        
        fila.desenfileirar();
        fila.desenfileirar();
        
        fila.enfileirar(mapa.getCanoinhas());
        fila.enfileirar(mapa.getIrati());
        fila.enfileirar(mapa.getPalmeira());
        fila.enfileirar(mapa.getPortoUniao());
        
        System.out.println(fila.getPrimeiro().getNome());
    }
}
