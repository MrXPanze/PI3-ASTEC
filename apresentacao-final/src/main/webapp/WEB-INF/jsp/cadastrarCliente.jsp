
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cliente</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/menuPrincipal.css">
        <link rel="stylesheet" type="text/css" href="css/cadastrarUsuario.css">
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
        <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/cadastrarCliente">
        <fieldset>
        <input id="idFunc" name="idCli" value="${cliente.getId()}" type="hidden">
        <div class="panel panel-primary">
            <div class="panel-heading">Cadastro de Cliente</div>
            <div class="panel-body">
                
        <div class="form-group">
            <div class="col-md-11 control-label">
                <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
            </div>
            <div id="newpost">
                <div class="form-group">
                 <div class="col-md-3 control-label">
                     <h3>Dados cadastrais</h3>
                 </div>
                </div>
            </div>
        </div>
                
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-2 control-label" for="Nome">Nome <h11>*</h11></label>  
          <div class="col-md-8">
          <input id="Nome" name="Nome" value="${cliente.getNome()}" placeholder="" class="form-control input-md" required="" type="text" autofocus>
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="cpf">CPF <h11>*</h11></label>  
            <div class="col-md-2">
                <input id="cpf" name="cpf" value="${cliente.getCpf()}" placeholder="Apenas números" class="form-control input-md" required="" type="text" maxlength="11" pattern="[0-9]+$">
            </div>

            <label class="col-md-1 control-label" for="dtnasc">Nascimento<h11>*</h11></label>  
            <div class="col-md-2">
                <input id="dtnasc" name="dtnasc" value='${data}' class="form-control input-md" required="" type="date">
            </div>

        <!-- Multiple Radios (inline) -->

          <label class="col-md-1 control-label" for="radios">Sexo <h11>*</h11></label>
          <div class="col-md-4"> 
            <label class="radio-inline" for="radios-0" >
              <input name="sexo" id="sexo" value="FEMININO" type="radio" ${cliente.getSexo() == 'FEMININO' ? 'checked="checked"' : ''}>
              Feminino
            </label> 
            <label class="radio-inline" for="radios-1">
              <input name="sexo" id="sexo" value="MASCULINO" type="radio" ${cliente.getSexo() == 'MASCULINO' ? 'checked="checked"' : ''}>
              Masculino
            </label>
          </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
          <label class="col-md-2 control-label" for="estadoCivil">Estado Civil <h11>*</h11></label>
          <div class="col-md-2">
            <select required id="estadoCivil" name="estadoCivil" value="${cliente.getEstadoCivil()}" class="form-control">
                <option value=""></option>
              <option value="Solteiro(a)" ${cliente.getEstadoCivil() == 'SOLTEIRO(A)' ? 'selected="selected"' : ''}>Solteiro(a)</option>
              <option value="Casado(a)" ${cliente.getEstadoCivil() == 'CASADO(A)' ? 'selected="selected"' : ''}>Casado(a)</option>
              <option value="Divorciado(a)" ${cliente.getEstadoCivil() == 'DIVORCIADO(A)' ? 'selected="selected"' : ''}>Divorciado(a)</option>
              <option value="Viuvo(a)" ${cliente.getEstadoCivil() == 'VIUVO(A)' ? 'selected="selected"' : ''}>Viuvo(a)</option>
            </select>
          </div>
        </div>
        
        <!-- Prepended text-->
        <div class="form-group">
          <label class="col-md-2 control-label" for="telefone">Telefone <h11>*</h11></label>
          <div class="col-md-2">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
              <input id="telefone" name="telefone" value="${cliente.getTelefone()}" class="form-control" placeholder="XX XXXX-XXXX" type="number" maxlength="12" pattern="\d{2} \d{4}-\d{4}$"
              OnKeyPress="formatar('## ####-####', this)">
            </div>
          </div>

            <label class="col-md-1 control-label" for="celular">Celular</label>
             <div class="col-md-2">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
              <input id="celular" name="celular" value="${cliente.getCelular()}" class="form-control" placeholder="XX XXXXX-XXXX" type="number" maxlength="13"  pattern="\d{2} \d{5}-\d{4}$"
              OnKeyPress="formatar('## #####-####', this)">
            </div>
          </div>
         </div> 

        <!-- Prepended text-->
        <div class="form-group">
          <label class="col-md-2 control-label" for="email">Email <h11>*</h11></label>
          <div class="col-md-5">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input id="email" name="email" value="${cliente.getEmail()}" class="form-control" placeholder="email@email.com" type="text" pattern="/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+{2,4}$/" >
            </div>
          </div>
        </div>


         <!-- Search input-->
        <div class="form-group">
          <label class="col-md-2 control-label" for="CEP">CEP <h11>*</h11></label>
          <div class="col-md-2">
            <input id="cep" name="cep" value="${cliente.getCep()}" placeholder="Apenas números" class="form-control input-md" required="" value="" type="search" maxlength="8" pattern="[0-9]+$">
          </div>
          <div class="col-md-2">
              <button type="button" class="btn btn-primary" onclick="pesquisacep(cep.value)">Pesquisar</button>
            </div>
        </div>

        <!-- Prepended text-->
        <div class="form-group">
          <label class="col-md-2 control-label" for="prependedtext">Endereço</label>
          <div class="col-md-4">
            <div class="input-group">
              <span class="input-group-addon">Rua</span>
              <input id="rua" name="rua" value="${cliente.getLogradouro()}" class="form-control" placeholder="" required="" readonly="readonly" type="text">
            </div>

          </div>
            <div class="col-md-2">
            <div class="input-group">
              <span class="input-group-addon">Nº <h11>*</h11></span>
              <input id="numero" name="numero" value="${cliente.getNumero()}" class="form-control" placeholder="" required=""  type="text">
            </div>

          </div>

          <div class="col-md-3">
            <div class="input-group">
              <span class="input-group-addon">Bairro</span>
              <input id="bairro" name="bairro" value="${cliente.getBairro()}" class="form-control" placeholder="" required="" readonly="readonly" type="text">
            </div>

          </div>
        </div>

        <div class="form-group">
          <label class="col-md-2 control-label" for="prependedtext"></label>
          <div class="col-md-4">
            <div class="input-group">
              <span class="input-group-addon">Cidade</span>
              <input id="cidade" name="cidade" value="${cliente.getCidade()}" class="form-control" placeholder="" required=""  readonly="readonly" type="text">
            </div>

          </div>

           <div class="col-md-2">
            <div class="input-group">
              <span class="input-group-addon">Estado</span>
              <input id="estado" name="estado" value="${cliente.getEstado()}" class="form-control" placeholder="" required=""  readonly="readonly" type="text">
            </div>

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
