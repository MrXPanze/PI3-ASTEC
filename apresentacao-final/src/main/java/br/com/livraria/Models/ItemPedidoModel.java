
package br.com.livraria.Models;

public class ItemPedidoModel {
     // Atributos
    private Integer id;
    private ProdutoModel produto;
    private float valorParcial;
    private int qtd;

    public ProdutoModel getProduto() {
        return produto;
    }

    public void setProduto(ProdutoModel produto) {
        this.produto = produto;
    }

    public float getValorParcial() {
        return valorParcial;
    }

    public void setValorParcial(float valorParcial) {
        this.valorParcial = valorParcial;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}