<%@page import="Classes.Pessoa"%>
<%
    int idpessoa = Integer.parseInt(request.getParameter("idpessoa"));
    Pessoa p = new Pessoa();
    p.setIdPessoa(idpessoa);
    if (p.excluirPessoa()) {
        response.sendRedirect("consultarpessoa.jsp?pmensagem=Pessoa removida com sucesso");
    } else {
        response.sendRedirect("consultarpessoa.jsp?pmensagem=Pessoa removida com sucesso");
    }
%>

