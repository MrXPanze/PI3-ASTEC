

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
    </head>
    <body>
      <div class="container">
        <div class="col-md-4 col-md-offset-4 format-login">
          <div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title"><strong>CorderInFields </strong></h3></div>
             <div class="panel-body">
             <form role="form" method="POST" action="home">
                <div class="alert alert-danger">
                    <a class="close" data-dismiss="alert" href="#">×</a>Usuário ou senha incorreto!
                </div>
                <div style="margin-bottom: 12px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="login-username" type="text" class="form-control" name="login" value="" placeholder="Digite seu login">
                </div>
                <div style="margin-bottom: 12px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="login-password" type="password" class="form-control" name="password" placeholder="Digite sua senha">
                </div>
              <button type="submit" class="btn btn-success">Entrar</button>
            </form>
            </div>
          </div>
        </div>
    </div>
    </body>
</html>
