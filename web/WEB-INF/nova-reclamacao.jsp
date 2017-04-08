<%-- 
    Document   : nova-reclamacao
    Created on : 13/03/2017, 21:36:14
    Author     : RafaelaEmília
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Reclamacao</title>
    </head>
    <body>
        <h1>Nova Reclamacao</h1>
        <form method="post">
            
            <label> Nome:
                <input type="text" name="nome"/><br>
            </label><br>
            <label>Email:
                <input type="text" name="email"/><br>
            </label><br>
            <label>Descricao:   <br>              
                 <textarea cols=20 id="descricao" rows="5" name="descricao"  "></textarea><br>
                 
            </label><br>
           <label>Status:                
                <select name="status">
                     <option value="5">Selecione</option>
                     <option value="0">Aberto</option>
                     <option value="1">Confirmado</option>
                     <option value="2">Recusado</option>
                     <option value="3">Em Execucao</option>
                     <option value="4">Resolvido</option>
                </select>       
            </label>
            <input type="submit"/>
        </form>
    </body>
</html>
