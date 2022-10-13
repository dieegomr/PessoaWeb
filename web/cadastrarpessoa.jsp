<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Classes.Pessoa" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container d-flex flex-column justify-content-center" style="width: 400px;">
            <h3 class="text-center">Cadastro de Pessoas</h3>
            <form id="pessoa" action="receberdadopessoa.jsp" method="POST">
                
                <label class="cabecalho" id="msg">
                    <%
                        if(request.getParameter("pmensagem") != null)
                        out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <div class="form-group nomepessoa">
                    <label for="nomepessoa">Nome</label>
                    <input id="nomepessoa" class="form-control" name="nomepessoa" placeholder="Informe o nome" type="text" required maxlength="40" style="text-transform: uppercase">
                </div>
                <div class="form-group mb-5 email">
                    <label for="email">Email</label>
                    <input id="email" class="form-control" name="email" placeholder="Informe o email" type="email" required maxlength="50">
                </div>
                
                <div class="container d-flex flex-row justify-content-center">
                    <div style="width: 125px;">
                        <input type="submit" value="Cadastrar" class="btn btn-primary" onclick="enviaForm()">
                    </div>
                    <div style="width: 125px;">
                        <input type="reset" value="Cancelar" class="btn btn-danger">
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
