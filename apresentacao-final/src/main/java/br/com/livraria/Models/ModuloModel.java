
package br.com.livraria.Models;

import java.util.ArrayList;
import java.util.List;

public class ModuloModel {
    
    private int idModulo;
    private String moduloNome;
    private List<String> subNomes = new ArrayList<String>();

    public List<String> getSubNome() {
        return subNomes;
    }

    public void setSubNome(String subNome) {
        this.subNomes.add(subNome);
    }
    
    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }

    public String getModuloNome() {
        return moduloNome;
    }

    public void setModuloNome(String moduloNome) {
        this.moduloNome = moduloNome;
    }
}