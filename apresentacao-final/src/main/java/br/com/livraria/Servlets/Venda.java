
package br.com.livraria.Servlets;

import br.com.livraria.DAOs.ClienteDAO;
import br.com.livraria.DAOs.PedidoDAO;
import br.com.livraria.DAOs.ProdutoDAO;
import br.com.livraria.Models.ClienteModel;
import br.com.livraria.Models.ItemPedidoModel;
import br.com.livraria.Models.LoginModel;
import br.com.livraria.Models.PedidoModel;
import br.com.livraria.Models.ProdutoModel;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Venda", urlPatterns = {"/Venda", "/AdicionarItem", "/ExcluirItem", "/Finaliza"})
public class Venda extends HttpServlet {
    
    boolean flag = true;
    int countItem = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destino = request.getServletPath();
        
        switch(destino){
            case "/Venda":
                if(!request.getParameter("idCliente").isEmpty()) {
                    ClienteModel cliente = null;
                    try {
                        cliente = ClienteDAO.obter(Integer.parseInt(request.getParameter("idCliente")));
                    } catch (Exception ex) {
                        Logger.getLogger(Venda.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    PedidoModel pedido = new PedidoModel();
                    pedido.setCliente(cliente);

                    HttpSession sessao = request.getSession();
                    LoginModel usuario = (LoginModel)sessao.getAttribute("usuario");
                    pedido.setFilial(usuario.getFilial());
                    sessao.setAttribute("pedido", pedido);

                    flag = false;
                }
            break;
            case "/ExcluirItem":
                if(!request.getParameter("idItem").isEmpty()) {
                    int idItem = Integer.parseInt(request.getParameter("idItem"));
                    HttpSession sessao = request.getSession();
                    PedidoModel pedido = (PedidoModel)sessao.getAttribute("pedido");
                    for(int i = 0; i < pedido.getItens().size(); i++){
                        if(idItem == pedido.getItens().get(i).getId()){
                            pedido.setValorTotal(pedido.getValorTotal()-pedido.getItens().get(i).getValorParcial());
                            pedido.getItens().remove(i);
                        }
                    }

                    sessao.removeAttribute("pedido");
                    sessao.setAttribute("pedido", pedido);
                }
            break;
            case "/Finaliza":
                HttpSession sessao = request.getSession();
                PedidoModel pedido = (PedidoModel)sessao.getAttribute("pedido");
                
                if(pedido.getItens().size() > 0){
                    Date data = new Date();
                    pedido.setDataVenda(data);
                    
                    RequestDispatcher requestDispatcher;
                    try {
                        PedidoDAO.inserir(pedido);
                        
                        requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/vendaSucess.jsp");
                        requestDispatcher.forward(request, response);
                    } catch (Exception e) {
                        System.out.println("Erro" + e);

                        request.setAttribute("msg", e);
                        requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cadastroDanger.jsp");
                        requestDispatcher.forward(request, response);
                    }
                } else {
                    
                }
            break;
        }

        RequestDispatcher requestDispatcher;

        List<ProdutoModel> listaProduto = null;
        try {
            listaProduto = ProdutoDAO.listar();
        } catch (Exception e) {
            Logger.getLogger(Rotas.class.getName()).log(Level.SEVERE, null, e);
        }

        request.setAttribute("produtos", listaProduto);
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/venda.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        PedidoModel pedido = (PedidoModel)sessao.getAttribute("pedido");
        
        int idProduto = Integer.parseInt(request.getParameter("produto"));
        int qtd = Integer.parseInt(request.getParameter("qtd"));
        
        ProdutoModel produto = null;
        try {
            produto = ProdutoDAO.obter(idProduto);
        } catch (Exception ex) {
            Logger.getLogger(Venda.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        for(ItemPedidoModel item:  pedido.getItens()) {
            if(item.getProduto().getId().equals(produto.getId())) {
                produto.setQtdProduto(produto.getQtdProduto() - item.getQtd());
            }
        }
        
        boolean prodExiste = false;
        if(produto.getQtdProduto() >= qtd) {
            for(ItemPedidoModel item:  pedido.getItens()) {
                if(item.getProduto().getId().equals(produto.getId())) {
                    item.setQtd(item.getQtd() + qtd);
                    prodExiste = true;
                }
            }
            
            if(!prodExiste) {
                ItemPedidoModel item = new ItemPedidoModel();
                item.setProduto(produto);
                item.setQtd(qtd);
                item.setValorParcial(qtd*produto.getValorProduto());
                item.setId(countItem);
                countItem++;

                pedido.setItem(item);
            }

            float valorTotal = 0;
            for(int i = 0; i < pedido.getItens().size(); i++) {
                valorTotal += pedido.getItens().get(i).getValorParcial();
            }

            pedido.setValorTotal(valorTotal);

            sessao.removeAttribute("pedido");
            sessao.setAttribute("pedido", pedido);
            sessao.setAttribute("alertQTD", "false");
        } else {
            sessao.setAttribute("alertQTD", "true");
        }

        doGet(request, response);
    }
}