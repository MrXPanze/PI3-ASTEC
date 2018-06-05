
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
        <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/CadastrarUsuario">
        <fieldset>
        <input id="idFunc" name="idFunc" value="${usuarioEditar.getIdFunc()}" type="hidden">
        <div class="panel panel-primary">
            <div class="panel-heading">Cadastro de Usuario</div>
            <div class="panel-body">
                
        <div class="form-group">
            <div class="col-md-11 control-label">
                <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
            </div>
        </div>
                
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-2 control-label" for="Nome">Nome <h11>*</h11></label>  
          <div class="col-md-8">
          <input id="Nome" name="Nome" value="${usuarioEditar.getNome()}" placeholder="" class="form-control input-md" required="" type="text" autofocus>
          </div>
        </div>
            
        <!-- Seção login -->
        <div id="newpost">
            <div class="form-group">
             <div class="col-md-3 control-label">
                 <h3>Dados de acesso</h3>
             </div>
             </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label" for="login">Login <h11>*</h11></label>
            <div class="col-md-3">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="login" name="login" value="${usuarioEditar.getLogin()}" class="form-control" placeholder="Digite o login" required="" type="text" maxlength="13">
                </div>
            </div>
        </div>  
        <div class="form-group">
            <label class="col-md-2 control-label" for="password">Senha <h11>*</h11></label>
            <div class="col-md-2">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" value="${usuarioEditar.getSenha()}" name="password" class="form-control" placeholder="******" type="password" maxlength="13" >
                </div>
            </div>
        </div>    
        <div class="form-group">
        <label class="col-md-2 control-label" for="filial">Unidade <h11>*</h11></label>
        <div class="col-md-2">
            <select required id="filial" value="${usuarioEditar.getFilial().getIdFilial()}" name="filial" class="form-control">
                    <option value=""></option>
                    <c:forEach items="${filiais}" var="filial">
                        <option value="${filial.getIdFilial()}" ${filial.getIdFilial() == usuarioEditar.getFilial().getIdFilial() ? 'selected="selected"' : ''}>${filial.getFilial_Nome()}</option>
                    </c:forEach> 
            </select>
        </div>
        </div>
        <div class="form-group">
        <label class="col-md-2 control-label" for="Cargo">Cargo <h11>*</h11></label>
        <div class="col-md-2">
            <select required id="Cargo" name="Cargo" class="form-control">
                    <option value=""></option>
                    <c:forEach items="${cargos}" var="cargo">
                        <option value="${cargo.getIdCargo()}" ${cargo.getIdCargo() == usuarioEditar.getCargo().getIdCargo() ? 'selected="selected"' : ''}>${cargo.getCargo_Nome()}</option>
                    </c:forEach> 
            </select>
        </div>
        </div>

        <!-- Button (Double) -->
        <div class="form-group">
          <label class="col-md-2 control-label" for="Cadastrar"></label>
          <div class="col-md-8">
            <button id="Cadastrar" name="Cadastrar" class="btn btn-success" type="Submit">Cadastrar</button>
            <button id="Cancelar" name="Cancelar" class="btn btn-danger" type="Reset">Cancelar</button>
          </div>
        </div>
        
        </div>    
        </div> 

        </fieldset>
        </form>        
       
    </main>
    </body>
    <script src="js/cadastrarUsuario.js"></script>
</html>