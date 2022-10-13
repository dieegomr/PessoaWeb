<%@page import="Classes.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            // recebe os valores da tela HTML
            String vnomepessoa = request.getParameter("nomepessoa");
            String vemail = request.getParameter("email");            
            
            Pessoa pes = new Pessoa();
            pes.setNomePessoa(vnomepessoa);
            pes.setEmail(vemail);
            if(pes.incluirPessoa()){
                response.sendRedirect("cadastrarpessoa.jsp?pmensagem= Pessoa cadastrada com sucesso");
            } else {
                response.sendRedirect("cadastrarpessoa.jsp?pmensagem= Problemas ao cadastrar pessoa");
            }
        %>
