
package br.com.livraria.Models;

public class SetorModel {
    private int IdSetor;
    private String Setor_Nome;
    private String Descricao;
    private boolean Status;

    public int getIdSetor() {
        return IdSetor;
    }

    public void setIdSetor(int IdSetor) {
        this.IdSetor = IdSetor;
    }

    public String getSetor_Nome() {
        return Setor_Nome;
    }

    public void setSetor_Nome(String Setor_Nome) {
        this.Setor_Nome = Setor_Nome;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }
}