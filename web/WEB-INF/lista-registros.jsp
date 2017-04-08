<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Registros</title>
    </head>
    <body>
        <h1>Listagem de Registros</h1>
        
        <table border="1">
            
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Descrição</th>
                <th>Status</th>
            </tr>
            <c:forEach var="reclamacao" items="${reclamacoes}">
                <tr>
                 <td><a href="edita.html?id=${reclamacao.id}"> ${reclamacao.id} </a></td> 
                <td>${reclamacao.nome}</td> 
                <td>${reclamacao.email}</td> 
                <td>${reclamacao.descricao}</td> 
                 <td>
                    <c:if test="${reclamacao.status==0}">
                        Aberto
                    </c:if>
                    <c:if test="${reclamacao.status==1}">
                        Confirmado
                    </c:if>
                     <c:if test="${reclamacao.status==2}">
                        Recusado
                    </c:if>
                    <c:if test="${reclamacao.status==3}">
                        Em Execução
                    </c:if>
                    <c:if test="${reclamacao.status==4}">
                        Resolvido
                    </c:if>
                </td>
                    
                    <td><a href="exclui.html?id=${reclamacao.id}">X</a></td> 
                </tr>
            </c:forEach>
            
        </table>
        
        
        
    </body>
</html>
