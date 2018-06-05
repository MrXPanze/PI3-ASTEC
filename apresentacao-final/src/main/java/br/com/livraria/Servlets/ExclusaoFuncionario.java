
package br.com.livraria.Servlets;

import br.com.livraria.DAOs.FuncionarioDAO;
import br.com.livraria.Models.FuncionarioModel;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ExclusaoFuncionario", urlPatterns = {"/ExclusaoFuncionario"})
public class ExclusaoFuncionario extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        
        if(!request.getParameter("idUsuario").isEmpty()){
                 List<FuncionarioModel> listaUsuarios = null;
                int idFuncionario = Integer.parseInt(request.getParameter("idUsuario"));

                try {
                   FuncionarioDAO.excluir(idFuncionario);
                   listaUsuarios = FuncionarioDAO.listar();

                   request.setAttribute("pesquisa", listaUsuarios);
                   requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/listarUsuario.jsp");
                   requestDispatcher.forward(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(Exclusao.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
