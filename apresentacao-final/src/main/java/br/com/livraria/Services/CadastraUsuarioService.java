
package br.com.livraria.Services;

import br.com.livraria.DAOs.CargoDAO;
import br.com.livraria.DAOs.SetorDAO;
import br.com.livraria.Models.CargoModel;
import br.com.livraria.Models.SetorModel;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CadastraUsuarioService {
    public static List<SetorModel> getSetores() throws Exception {
        List<SetorModel> listaSetores = null;
        try {
            listaSetores = SetorDAO.listar();
        } catch (SQLException ex) {
            Logger.getLogger(LoginService.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (listaSetores != null) {
            return listaSetores;
        }

        // Usuario nao existe ou senha esta incorreta
        return null;
    }
    
    public static List<CargoModel> getCargos() throws Exception {
        List<CargoModel> listaCargos = null;
        try {
            listaCargos = CargoDAO.listar();
        } catch (SQLException ex) {
            Logger.getLogger(LoginService.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (listaCargos != null) {
            return listaCargos;
        }

        // Usuario nao existe ou senha esta incorreta
        return null;
    }
}