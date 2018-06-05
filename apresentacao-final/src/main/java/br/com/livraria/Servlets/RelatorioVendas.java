
package br.com.livraria.Servlets;

import br.com.livraria.DAOs.FilialDAO;
import br.com.livraria.DAOs.PedidoDAO;
import br.com.livraria.Models.FilialModel;
import br.com.livraria.Models.ItemPedidoModel;
import br.com.livraria.Models.PedidoModel;
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

@WebServlet(name = "RelatorioVendas", urlPatterns = {"/RelatorioVendas", "/Itens", "/Filtrar"})
public class RelatorioVendas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destino = request.getServletPath();
        RequestDispatcher requestDispatcher;
        
        switch(destino){
            case "/RelatorioVendas":
                List<PedidoModel> listaPedidos = null;
                try {
                    listaPedidos = PedidoDAO.listar();
                } catch (Exception ex) {
                    Logger.getLogger(RelatorioVendas.class.getName()).log(Level.SEVERE, null, ex);
                }

                List<FilialModel> listaFilial = null;
                try {
                    listaFilial = FilialDAO.listar();
                } catch (Exception ex) {
                    Logger.getLogger(RelatorioVendas.class.getName()).log(Level.SEVERE, null, ex);
                }

                request.setAttribute("pedidos", listaPedidos);
                request.setAttribute("filiais", listaFilial);

                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/relatorioVendas.jsp");
                requestDispatcher.forward(request, response);

                break;
            case "/Itens":
                int idPedido = Integer.parseInt(request.getParameter("idPedido"));
                List<ItemPedidoModel> listaItens = null;
                try {
                    listaItens = PedidoDAO.listarItem(idPedido);
                } catch (Exception ex) {
                    Logger.getLogger(RelatorioVendas.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("itens", listaItens);

                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/relatorioVendasItens.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "/Filtrar":
                int idFilial = Integer.parseInt(request.getParameter("filial"));
                
                List<PedidoModel> pedidos = null;
                try {
                    pedidos = PedidoDAO.listarPorFilial(idFilial);
                } catch (Exception ex) {
                    Logger.getLogger(RelatorioVendas.class.getName()).log(Level.SEVERE, null, ex);
                }

                List<FilialModel> filial = null;
                try {
                    filial = FilialDAO.listar();
                } catch (Exception ex) {
                    Logger.getLogger(RelatorioVendas.class.getName()).log(Level.SEVERE, null, ex);
                }

                request.setAttribute("pedidos", pedidos);
                request.setAttribute("filiais", filial);

                requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/relatorioVendas.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}