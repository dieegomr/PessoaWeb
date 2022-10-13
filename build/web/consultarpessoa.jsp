<%@page import="java.util.List"%>
<%@page import="Classes.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://kit.fontawesome.com/ece6841de5.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body>
    <div class="card text-center">
        <%
            Pessoa pes = new Pessoa();
            List<Pessoa> listapessoas = pes.ConsultarPessoas();
        %>
        <h4>Cadastro de Pessoas</h4>
        <label class="cabecalho" id="msg">
            <%
                if (request.getParameter("pmensagem") != null)
                    out.write(request.getParameter("pmensagem"));
            %>
        </label>
        <table class='table table-striped'>
            <thead>
            <th>Nome</th>
            <th>Email</th>
            <th>Editar</th>
            <th>Excluir</th>
            </thead>
            <tbody>
                <% for (Pessoa p : listapessoas) {%>
                <tr>
                    <td><% out.write(p.getNomePessoa()); %></td>
                    <td><% out.write(p.getEmail()); %></td>
                    <td><% out.write("<a class='btn btn-outline-primary' href=editarpessoa.jsp?idPessoa=" + "" + p.getIdPessoa() + ">" + "<i class='fa-solid fa-pen-to-square'></i>" + "</a>"); %></td>
                    <td><button class="btn btn-outline-danger" type="button" id="botaoexcluir" onclick="mostrarExclusao(<%out.write("" + p.getIdPessoa());%>)"><i class='fa-solid fa-trash'></i></button><td>
                </tr>
                <%}%>
            </tbody>
        </table>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel" class="text-center" style="color: #ff0000; font-family: arial-bold" >Exclusão</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Confirma a <b>exclusão</b> do registro?
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-dark" data-dismiss="modal" href="" onclick="cancela()">Não</a>
                        <a class="btn btn-danger" id="exclui" href="#">Sim</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        function cancela() {
            document.getElementsByClassName("msg-popup2")[0].style.display = "none";
        }

        function mostrarExclusao(pessoa) {
            $('#exampleModal').modal('show');
            var link = document.getElementById("exclui");
            link.href = "excluirpessoa.jsp?idpessoa=" + pessoa;
        }
    </script>
</body>