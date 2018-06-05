
package br.com.livraria.Servlets;

import br.com.livraria.DAOs.ProdutoDAO;
import br.com.livraria.Models.ProdutoModel;
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

@WebServlet(name = "Exclusao", urlPatterns = {"/Exclusao"})
public class Exclusao extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher requestDispatcher;
        
            if(!request.getParameter("idProduto").isEmpty()){
                List<ProdutoModel> listaProduto = null;
                int idProduto = Integer.parseInt(request.getParameter("idProduto"));

                try {
                   ProdutoDAO.excluir(idProduto);
                   listaProduto = ProdutoDAO.listar();

                   request.setAttribute("pesquisa", listaProduto);
                   requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/listarProduto.jsp");
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
