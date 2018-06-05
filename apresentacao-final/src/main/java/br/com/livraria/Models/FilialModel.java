
package br.com.livraria.Models;

public class FilialModel {
    private int IdFilial;
    private String Filial_Nome;
    private String Estado;
    private String Cidade;
    private boolean Status;

    public int getIdFilial() {
        return IdFilial;
    }

    public void setIdFilial(int IdFilial) {
        this.IdFilial = IdFilial;
    }

    public String getFilial_Nome() {
        return Filial_Nome;
    }

    public void setFilial_Nome(String Filial_Nome) {
        this.Filial_Nome = Filial_Nome;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getCidade() {
        return Cidade;
    }

    public void setCidade(String Cidade) {
        this.Cidade = Cidade;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }
}