/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Buscas;

import estrutura.VetorOrdenadoAdjacente;
import grafocidades.Adjacente;
import grafocidades.Cidade;
import grafocidades.Mapa;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Elton Alves
 */
public class AEstrela {
  private VetorOrdenadoAdjacente fronteira;
	private Cidade objetivo;
	private boolean achou;
//	public List<String> caminhoCidades = new ArrayList<>();

	public AEstrela(Cidade objetivo) {
		this.objetivo = objetivo;
		achou = false;
	}

	public void buscar(Cidade atual) {
        System.out.println("\nAtual:"+ atual.getNome());
		atual.setVisitado(true);

		if (atual == objetivo) {
			achou = true;
		} else {
			fronteira = new VetorOrdenadoAdjacente(atual.getAdjacentes().size()); //percorre os adjacentes
			for (Adjacente a : atual.getAdjacentes()) {
				if (!a.getCidade().isVisitado()) {
					a.getCidade().setVisitado(true);
					fronteira.inserir(a);
				}
			}
			fronteira.mostrar();
			buscar(fronteira.getPrimeiro());
		}
     // return null;
        }
    public static void main(String args[]){
        Mapa mapa = new Mapa(); //acesso a toda as cidades
        AEstrela a = new AEstrela(mapa.getCuritiba()); 
        a.buscar(mapa.getPortoUniao());
          
          
      }  
}
