
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
    </head>
    <body>
      <div class="container">
        <div class="col-md-4 col-md-offset-4 format-login">
          <div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title"><strong>Login</strong></h3></div>
             <div class="panel-body">
             <form role="form" method="POST" action="home">
                <div style="margin-bottom: 12px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="login" type="text" class="form-control" name="login" placeholder="Digite seu login" required autofocus>
                </div>
                <div style="margin-bottom: 12px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="password" placeholder="Digite sua senha" required>
                </div>
              <button type="submit" class="btn btn-success">Entrar</button>
            </form>
            </div>
          </div>
        </div>
    </div>
    </body>
</html>
