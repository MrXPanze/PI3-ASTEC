
package br.com.livraria.Models;

import java.util.List;

public class LoginModel {
    
    private int idUsuario;
    private int idCargo;
    private FilialModel filial;
    private String login;
    private String nome;
    private String cargo;
    private String setor;
    private List<ModuloModel> modulos;
    
    public FilialModel getFilial() {
        return filial;
    }

    public void setFilial(FilialModel filial) {
        this.filial = filial;
    }
    
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

    public List<ModuloModel> getModulos() {
        return modulos;
    }

    public void setModulos(List<ModuloModel> modulos) {
        this.modulos = modulos;
    }
}
