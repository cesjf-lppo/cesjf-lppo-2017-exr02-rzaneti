<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edita Registro</title>
    </head>
    <body>
        <h1>Edita Registro</h1>
        <form method="post">
            <div><input type="hidden" name="id" value="${reclamacao.id}"/> Id: ${reclamacao.id}</div>
            <div><label>Nome: <input type="text" name="nome" value="${reclamacao.nome}"</label></div>
            <div><label>Email: <input type="text" name="email" value="${reclamacao.email}"</label></div>
            <div><label>Descricao: <input type="text" name="descricao" value="${reclamacao.descricao}"</label></div>
            <select name="status">
                     <option value="5">Selecione</option>
                     <option value="0"${reclamacao.status==0?"selected":""}>Aberto</option>
                     <option value="1"${reclamacao.status==1?"selected":""}>Confirmado</option>
                     <option value="2"${reclamacao.status==2?"selected":""}>Recusado</option>
                     <option value="3"${reclamacao.status==3?"selected":""}>Em Execucao</option>
                     <option value="4"${reclamacao.status==4?"selected":""}>Resolvido</option>
                </select> 
            <div><input type="submit" /></div>
        </form>
    </body>
</html>
