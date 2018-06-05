package br.com.livraria.Servlets;

import br.com.livraria.DAOs.FuncionarioDAO;
import br.com.livraria.Models.FuncionarioModel;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ListarUsuario", urlPatterns = {"/exibirUsuario","/listarTodosUsuario"})
public class ListarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // pego a url chamada pelo menuPrincipal
        String destino = request.getServletPath();
        RequestDispatcher requestDispatcher;
        
        FuncionarioDAO daoFuncionario = new FuncionarioDAO();
        List<FuncionarioModel> funcionarios;
        FuncionarioModel funcionario;   
        
        // direciono a url chamada para a classe correta
            switch(destino){
                case "/exibirUsuario":
                    try{
                        
                        String nomePesquisaCliente = request.getParameter("Nome");
                        
                        if(!nomePesquisaCliente.isEmpty()){
                            funcionarios = daoFuncionario.procurar(nomePesquisaCliente);
                            request.setAttribute("pesquisa", funcionarios);

                        }else{
                            request.setAttribute("msgErroBusca", "Sua busca não gerou resultados!");
                                   
                        }
                        
                        request.getRequestDispatcher("/WEB-INF/jsp/listarUsuario.jsp").forward(request, response);
                        
                    }catch(SQLException | ServletException | IOException e){
                        System.out.println("Erro -> " + e);
                    } catch (Exception ex) {
                        Logger.getLogger(Produto.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    break;
                case "/listarTodosUsuario":
                    
                    try{
                        funcionarios = FuncionarioDAO.listar();
                         
                        if(funcionarios != null){
                            request.setAttribute("pesquisa", funcionarios);
                            
                        }else{
                            request.setAttribute("msgErroBusca", "Sua busca no gerou resuldato");
                            
                        }
                        
                        request.getRequestDispatcher("/WEB-INF/jsp/listarUsuario.jsp").forward(request, response);
                    
                    } catch(SQLException | ServletException | IOException e){
                        System.out.println("Erro -> " + e);
                    } catch (Exception ex) {
                        Logger.getLogger(Produto.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    break;
            }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}