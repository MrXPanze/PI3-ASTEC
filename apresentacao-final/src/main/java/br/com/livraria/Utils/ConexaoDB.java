
package br.com.livraria.Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConexaoDB {
    //Obtem uma conexao
    public static Connection getConnection(){
    
        // Conexao para abertura e fechamento
        Connection connection = null;
        try {
            // Só tenta abrir conecao caso nao exista nenhuma aberta
            String dbURL = Constants.DB_ADRESS;
            //Propriedades para guarda usuario e senha
            Properties properties = new Properties();
            properties.put("user", Constants.DB_USER);
            properties.put("password", Constants.DB_PASS);
            // realiza conexao com banco
            connection = DriverManager.getConnection(dbURL, properties);

        } catch(SQLException ex){
            ex.printStackTrace();
        }

        return connection;
    }
}