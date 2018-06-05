
package br.com.livraria.Servlets;

import br.com.livraria.DAOs.CargoDAO;
import br.com.livraria.DAOs.FilialDAO;
import br.com.livraria.DAOs.FuncionarioDAO;
import br.com.livraria.Models.CargoModel;
import br.com.livraria.Models.FilialModel;
import br.com.livraria.Models.FuncionarioModel;
import br.com.livraria.Services.CadastraUsuarioService;
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

@WebServlet(name = "CadastrarUsuario", urlPatterns = {"/CadastrarUsuario"})
public class CadastrarUsuario extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(!request.getParameter("idUsuario").isEmpty()) {
            int idFunc = Integer.parseInt(request.getParameter("idUsuario"));

            FuncionarioModel usuario = null;
            try {
                usuario = FuncionarioDAO.obter(idFunc);
            } catch (Exception ex) {
                Logger.getLogger(CadastrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

            List<CargoModel> listaCargos = null;
            try {
                listaCargos = CadastraUsuarioService.getCargos();
            } catch (Exception ex) {
                Logger.getLogger(CadastrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

            for(int i = 0; i < listaCargos.size(); i++) {
                String cargoNome = listaCargos.get(i).getCargo_Nome();
                String setorNome = listaCargos.get(i).Setor.getSetor_Nome();
                String temp = cargoNome + " - " + setorNome;
                listaCargos.get(i).setCargo_Nome(temp);
            }

            List<FilialModel> listaFiliais = null;
            try {
                listaFiliais = FilialDAO.listar();
            } catch (Exception ex) {
                Logger.getLogger(Rotas.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("filiais", listaFiliais);
            request.setAttribute("cargos", listaCargos);
            request.setAttribute("usuarioEditar", usuario);
            
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastrarUsuario.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // pego a url chamada pelo menuPrincipal
        String destino = request.getServletPath();
        RequestDispatcher requestDispatcher;
        
        FuncionarioDAO daoFuncionario = new FuncionarioDAO();
        List<FuncionarioModel> funcionarios;
        FuncionarioModel funcionario;   
        
        if(request.getParameter("idFunc").isEmpty()) {
            try{
                String nomeUsuario = request.getParameter("Nome");
                String login = request.getParameter("login");
                String password = request.getParameter("password");
                int idFilial = Integer.parseInt(request.getParameter("filial"));
                int idCargo = Integer.parseInt(request.getParameter("Cargo"));

                funcionario = new FuncionarioModel(
                          FilialDAO.obter(idFilial), CargoDAO.obter(idCargo), nomeUsuario, login, password
                );

                FuncionarioDAO.inserir(funcionario);

                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroSucess.jsp");
                requestDispatcher.forward(request, response);

            } catch (ClassNotFoundException | IllegalArgumentException | SQLException e) {
                System.out.println("Erro" + e);

                request.setAttribute("msg", e);
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroDanger.jsp");
                requestDispatcher.forward(request, response);

            } catch (Exception ex) {    
                Logger.getLogger(CadastrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }    
        } else {
            try{
                
                String nomeUsuario = request.getParameter("Nome");
                String login = request.getParameter("login");
                String password = request.getParameter("password");
                int idFilial = Integer.parseInt(request.getParameter("filial"));
                int idCargo = Integer.parseInt(request.getParameter("Cargo"));

                funcionario = new FuncionarioModel(
                          FilialDAO.obter(idFilial), CargoDAO.obter(idCargo), nomeUsuario, login, password
                );
                funcionario.setIdFunc(Integer.parseInt(request.getParameter("idFunc")));

                FuncionarioDAO.atualizar(funcionario);

                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroSucess.jsp");
                requestDispatcher.forward(request, response);

            } catch (ClassNotFoundException | IllegalArgumentException | SQLException e) {
                System.out.println("Erro" + e);

                request.setAttribute("msg", e);
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroDanger.jsp");
                requestDispatcher.forward(request, response);

            } catch (Exception ex) {    
                Logger.getLogger(CadastrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}