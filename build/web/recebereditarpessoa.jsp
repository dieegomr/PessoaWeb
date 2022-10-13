<%@page import="Classes.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        //recebe os valores da tela HTML
        int vidpessoa = Integer.parseInt(request.getParameter("idpessoa"));
        String vnomepessoa = request.getParameter("nomepessoa");
        String vemail = request.getParameter("email");
        
        Pessoa pes = new Pessoa();
        pes.setIdPessoa(vidpessoa);
        pes.setNomePessoa(vnomepessoa);
        pes.setEmail(vemail);
        
        if (pes.alterarPessoa()) {
            response.sendRedirect("consultarpessoa.jsp?pmensagem=Pessoa alterada com sucesso");
        } else {
            response.sendRedirect("consultarpessoa.jsp?pmensagem=Problemas ao salvar pessoa");
        }
        %>
    </body>
</html>
