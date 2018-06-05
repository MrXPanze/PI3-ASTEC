
package br.com.livraria.Servlets;

import br.com.livraria.DAOs.ClienteDAO;
import br.com.livraria.Models.ClienteModel;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Cliente", urlPatterns = {"/cadastrarCliente","/excluirCliente"})
public class Cliente extends HttpServlet {
    
    String data;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(!request.getParameter("idCliente").isEmpty()) {
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            
            ClienteModel cliente = null;
            try {
                cliente = ClienteDAO.obter(idCliente);
            } catch (Exception ex) {
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            SimpleDateFormat dt1 = new SimpleDateFormat("dd/MM/yyyy");
            data = dt1.format(cliente.getData());
            
            request.setAttribute("cliente", cliente);
            request.setAttribute("data", data);

            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastrarCliente.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher requestDispatcher;

        ClienteModel cliente;
        
        if(request.getParameter("idCli").isEmpty()) {
            try{
                String nomeCliente = request.getParameter("Nome");
                String sexo = request.getParameter("sexo");
                Date dataNasc = Date.valueOf(request.getParameter("dtnasc"));
                String estadoCivil = request.getParameter("estadoCivil");
                String cpf = request.getParameter("cpf");
                String telefone = request.getParameter("telefone");
                String celular =  request.getParameter("celular");       
                String email = request.getParameter("email");
                String cep = request.getParameter("cep");
                String rua = request.getParameter("rua");
                String numero = request.getParameter("numero");
                String bairro = request.getParameter("bairro");
                String estado = request.getParameter("cidade");
                String cidade = request.getParameter("estado"); 

                cliente = new ClienteModel(
                        nomeCliente, sexo, dataNasc, estadoCivil, cpf, telefone, celular,
                        email, cep, rua, numero, bairro, estado, cidade
                );

                ClienteDAO.inserir(cliente);

                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroSucess.jsp");
                requestDispatcher.forward(request, response);

            } catch (ClassNotFoundException | IllegalArgumentException | SQLException e) {
                System.out.println("Erro" + e);

                request.setAttribute("msg", e);
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroDanger.jsp");
                requestDispatcher.forward(request, response);
            }
        } else {
            try{
                SimpleDateFormat dt1 = new SimpleDateFormat("dd/MM/yyyy");
                            
                String nomeCliente = request.getParameter("Nome");
                String sexo = request.getParameter("sexo");
                String dataNasc;
                if(!request.getParameter("dtnasc").isEmpty()){
                    dataNasc = request.getParameter("dtnasc");
                } else {
                    dataNasc = data;
                }
                String estadoCivil = request.getParameter("estadoCivil");
                String cpf = request.getParameter("cpf");
                String telefone = request.getParameter("telefone");
                String celular =  request.getParameter("celular");       
                String email = request.getParameter("email");
                String cep = request.getParameter("cep");
                String rua = request.getParameter("rua");
                String numero = request.getParameter("numero");
                String bairro = request.getParameter("bairro");
                String estado = request.getParameter("cidade");
                String cidade = request.getParameter("estado"); 

                cliente = new ClienteModel(
                        nomeCliente, sexo, dt1.parse(dataNasc), estadoCivil, cpf, telefone, celular,
                        email, cep, rua, numero, bairro, estado, cidade
                );

                cliente.setId(Integer.parseInt(request.getParameter("idCli")));

                ClienteDAO.atualizar(cliente);

                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroSucess.jsp");
                requestDispatcher.forward(request, response);

            } catch (ClassNotFoundException | IllegalArgumentException | SQLException e) {
                System.out.println("Erro" + e);

                request.setAttribute("msg", e);
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroDanger.jsp");
                requestDispatcher.forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}