
package br.com.livraria.Models;

public class PermissaoModel {
    private int IdPerm;
    private int IdModulo;
    private int IdCargo;

    public int getIdPerm() {
        return IdPerm;
    }

    public void setIdPerm(int IdPerm) {
        this.IdPerm = IdPerm;
    }

    public int getIdModulo() {
        return IdModulo;
    }

    public void setIdModulo(int IdModulo) {
        this.IdModulo = IdModulo;
    }

    public int getIdCargo() {
        return IdCargo;
    }

    public void setIdCargo(int IdCargo) {
        this.IdCargo = IdCargo;
    }
}