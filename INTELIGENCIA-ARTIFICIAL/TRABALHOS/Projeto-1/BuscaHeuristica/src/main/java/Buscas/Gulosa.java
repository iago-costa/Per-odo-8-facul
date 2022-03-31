/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Buscas;


//import java.util.ArrayList;
//import java.util.List;

import estrutura.VetorOrdenado;
import grafocidades.Adjacente;
import grafocidades.Cidade;
import grafocidades.Mapa;

/**
 *
 * @author Elton Alves
 */
public class Gulosa {
	private VetorOrdenado fronteira;
	private Cidade objetivo;
	private boolean achou;
	//public List<String> caminhoCidades = new ArrayList<>();

	public Gulosa(Cidade objetivo) {
		this.objetivo = objetivo;
		achou = false;
	}

	//public List<String> buscar(Cidade atual)
        public void buscar (Cidade atual){
        System.out.println("\nAtual:" + atual.getNome());
		atual.setVisitado(true);

		if (atual == objetivo) {
			achou = true;
		} else {
			fronteira = new VetorOrdenado(atual.getAdjacentes().size());
			for (Adjacente a : atual.getAdjacentes()) {
				if (!a.getCidade().isVisitado()) {
					a.getCidade().setVisitado(true);
					fronteira.inserir(a.getCidade());
				}
			}
			fronteira.mostrar();
			if (fronteira.getPrimeiro() != null) {
				//caminhoCidades.add(fronteira.getPrimeiro().getNome());
				buscar(fronteira.getPrimeiro());
			}
		}

		//return caminhoCidades;
	}
public static void main(String args[]){
Mapa mapa = new Mapa();
Gulosa g = new Gulosa(mapa.getCuritiba());
g.buscar(mapa.getPortoUniao());
        

}

}

