

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar de Funcionario</title>
        <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css"  href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css"  href="css/menuPrincipal.css">
        <link rel="stylesheet" type="text/css"  href="css/cadastrarUsuario.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default" style="margin-bottom:2px; ">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Astec</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="sair"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                </ul>
            </div>
        </nav>
        <nav class="navbar navbar-default sidebar" role="navigation">
            <div class="container-fluid">
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">
                        ${sessionScope.usuario.nome}
                    </div>
                    <div class="profile-usertitle-job">
                        ${sessionScope.usuario.cargo} - ${sessionScope.usuario.setor}
                    </div>
                </div>
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active format-active"><a href="${pageContext.request.contextPath}/menuPrincipal">Home<span style="font-size:16px;" class="pull-right showopacity glyphicon glyphicon-home"></span></a></li>
                                <c:forEach items="${sessionScope.usuario.modulos}" var="modulo">
                                    <c:if test="${modulo.getModuloNome() eq 'funcionario'}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuarios <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
                                    <ul class="dropdown-menu forAnimate" role="menu">
                                        <c:forEach items="${modulo.getSubNome()}" var="subNome">
                                            <c:if test="${subNome eq 'cadastro'}">
                                                <li><a href="${pageContext.request.contextPath}/formUsuario">Cadastrar</a></li>
                                                </c:if>
                                                <c:if test="${subNome eq 'consulta'}">
                                                <li><a href="${pageContext.request.contextPath}/listarUsuario">Consultar</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${modulo.getModuloNome() eq 'cliente'}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Clientes <span class="caret"></span><span style="font-size:16px;" class="pull-right showopacity glyphicon glyphicon-list-alt"></span></a>
                                    <ul class="dropdown-menu forAnimate" role="menu">
                                        <c:forEach items="${modulo.getSubNome()}" var="subNome">
                                            <c:if test="${subNome eq 'cadastro'}">
                                                <li><a href="${pageContext.request.contextPath}/formCliente">Cadastrar</a></li>
                                                </c:if>
                                                <c:if test="${subNome eq 'consulta'}">
                                                <li><a href="${pageContext.request.contextPath}/listarCliente">Consultar</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${modulo.getModuloNome() eq 'produto'}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Produtos <span class="caret"></span><span style="font-size:16px;" class="pull-right showopacity glyphicon glyphicon-th-list"></span></a>
                                    <ul class="dropdown-menu forAnimate" role="menu">
                                        <c:forEach items="${modulo.getSubNome()}" var="subNome">
                                            <c:if test="${subNome eq 'cadastro'}">
                                                <li><a href="${pageContext.request.contextPath}/formProduto">Cadastrar</a></li>
                                                </c:if>
                                                <c:if test="${subNome eq 'consulta'}">
                                                <li><a href="${pageContext.request.contextPath}/listarProduto">Consultar</a></li>
                                                </c:if>         
                                            </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${modulo.getModuloNome() eq 'venda'}">
                                <li ><a href="${pageContext.request.contextPath}/SelecioneCliente">Vender Produto<span style="font-size:16px;" class="pull-right showopacity glyphicon glyphicon-tags"></span></a></li>
                                    </c:if>
                                    <c:if test="${modulo.getModuloNome() eq 'relatorio'}">
                                <li ><a href="${pageContext.request.contextPath}/RelatorioVendas">Relatorio Vendas<span style="font-size:16px;" class="pull-right showopacity glyphicon glyphicon-tags"></span></a></li>
                                    </c:if>
                                </c:forEach>
                    </ul>
                </div>

            </div>
        </nav>
        <main id="page-content-wrapper" role="main">
            <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/AdicionarItem">
                <fieldset>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Venda</div>
                        <div class="panel-body">
                        <!--<img src="../../img/venda.jpg" class="img-responsive">-->
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-2 control-label">Cliente:</label>
                                <div class="col-md-8">
                                    <label class="col-md-2 control-label">${sessionScope.pedido.getCliente().getNome()}</label>
                                </div>
                            </div>

                            <!-- Seção login -->
                            <div id="newpost">
                                <div class="form-group">
                                    <div class="col-md-3 control-label">
                                        <h3>Selecione os Produtos:</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-5">
                                    <select required id="produto" name="produto" class="form-control" multiple>
                                        <c:forEach items="${produtos}" var="produto">
                                            <option value="${produto.getId()}">${produto.getNome()} - R$ ${produto.valorProduto} - Quantidade: ${produto.getQtdProduto()}</option>
                                        </c:forEach> 
                                    </select>
                                </div>
                                <label class="col-md-2 control-label">Quantidade:</label>
                                <div class="col-md-1">
                                    <input id="qtd" name="qtd" class="form-control input-md" type="number" required>
                                </div>
                                <button id="add" name="add" class="btn btn-success" type="Submit">Adicionar</button>
                            </div>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome Produto</th>
                                        <th>Fabricante</th>
                                        <th>Tipo Produto</th>
                                        <th>Qtd</th>
                                        <th>Valor Parcial</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <c:if test="${not empty msgErroBusca}">
                                    <h2><c:out value="${msgErroBusca}" /></h2>
                                </c:if>
                                <tbody> 

                                    <c:forEach items="${sessionScope.pedido.getItens()}" var="item">
                                        <tr>
                                            <td><c:out value="${item.produto.id}" /></td>
                                            <td><c:out value="${item.produto.nome}" /></td>
                                            <td><c:out value="${item.produto.fabricante}" /></td>
                                            <td><c:out value="${item.produto.tipoProduto}" /></td>
                                            <td><c:out value="${item.qtd}" /></td>
                                            <td><c:out value="${item.valorParcial}" /></td>
                                            <td><a class="btn btn-danger" href="${pageContext.request.contextPath}/ExcluirItem?idItem=${item.getId()}">Excluir</a></td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td><b><c:out value="Valor Total" /></b></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><c:out value="${sessionScope.pedido.getValorTotal()}" /></td>
                                    </tr>
                                </tbody>    
                            </table>

                            <div class="form-group">
                                <label class="col-md-2 control-label" for="Cadastrar"></label>
                                <div class="col-md-8">
                                    <a class="btn btn-success" href="${pageContext.request.contextPath}/Finaliza">FinalizarVenda</a>
                                    <button id="Cancelar" name="Cancelar" class="btn btn-danger" type="Reset">Cancelar</button>
                                </div>
                            </div>
                        </div>    
                    </div> 
                </fieldset>
            </form>        
        </main>
    </body>
    <c:if test="${sessionScope.alertQTD eq 'true'}">
        <script type="text/javascript">
            alert("Quantidade de produto excedida!");
        </script> 
    </c:if>
    <script src="js/cadastrarUsuario.js"></script>
</html>