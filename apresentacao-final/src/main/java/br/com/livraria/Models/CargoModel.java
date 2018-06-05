
package br.com.livraria.Models;


public class CargoModel {
 
    private int IdCargo;
    public SetorModel Setor;
    private String Cargo_Nome;
    private String Descricao;
    private boolean Status;
 
    public boolean isStatus() {
        return Status;
    }
 
    public void setStatus(boolean Status) {
        this.Status = Status;
    }
 
    public int getIdCargo() {
        return IdCargo;
    }
 
    public void setIdCargo(int IdCargo) {
        this.IdCargo = IdCargo;
    }
 
    public SetorModel getSetor() {
        return Setor;
    }
 
    public void setSetor(SetorModel Setor) {
        this.Setor = Setor;
    }

    public String getCargo_Nome() {
        return Cargo_Nome;
    }

    public void setCargo_Nome(String Cargo_Nome) {
        this.Cargo_Nome = Cargo_Nome;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }
}