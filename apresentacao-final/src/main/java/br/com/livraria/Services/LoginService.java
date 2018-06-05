
package br.com.livraria.Services;

import br.com.livraria.DAOs.LoginDAO;
import br.com.livraria.Models.LoginModel;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginService {
  public LoginModel autenticar(String username, String senha) throws Exception {
    // 1) Verifica se username existe
    LoginModel usuario = null;
    try {
        usuario = LoginDAO.DoLogin(username, senha);
    } catch (SQLException ex) {
        Logger.getLogger(LoginService.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    if (usuario != null) {
	return usuario;
    }

    // Usuario nao existe ou senha esta incorreta
    return null;
  }
}