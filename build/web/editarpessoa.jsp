<%@page import="Classes.Pessoa" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </head>

    <%
        int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
        Pessoa c = new Pessoa();
        c = c.consultarPessoa(idPessoa);
    %>
    <body>
        <div class="container d-flex flex-column justify-content-center" style="width: 400px;">
            <h3 class="text-center">Alterar Pessoa</h3>
            <form id="pessoa" action="recebereditarpessoa.jsp" method="POST">
                <div class="form-group idpessoa">
                    <label for="idpessoa" >Pessoa</label>
                    <input id="idpessoa" class="form-control" type="text" name="idpessoa" value="<% out.write("" + c.getIdPessoa());%>"/>
                </div>
                <div class="form-group nomepessoa">
                    <label for="nomepessoa" >Nome</label>
                    <input id="nomepessoa" class="form-control" type="text" name="nomepessoa" required maxlength="40" value="<% out.write("" + c.getNomePessoa());%>"/>
                </div>

                <div class="form-group mb-5 email">
                    <label for="email">Email</label>
                    <input id="email" class="form-control" type="email" name="email" required maxlength="50" value="<% out.write("" + c.getEmail());%>"/>
                </div>

                <div class="container d-flex flex-row justify-content-center">
                    <div style="width: 100px;">
                        <input type="submit" value="Alterar" class="btn btn-primary"/>
                    </div>
                    <div style="width: 100px;">
                        <input type="reset" value="Cancelar" class="btn btn-danger"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
