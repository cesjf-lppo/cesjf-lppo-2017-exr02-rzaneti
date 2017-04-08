/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RafaelaEmília
 */
@WebServlet(name = "EditaRegistro", urlPatterns = {"/edita.html"})
public class EditaRegistro extends HttpServlet {


    
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       Reclamacao reclamacao = new Reclamacao();
       Long id = Long.parseLong(request.getParameter("id"));
        
        try {
            //Pegar os dados do banco
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conexao = DriverManager.getConnection("jdbc:derby://localhost:1527//lpto-2017-1", "usuario", "senha");
             
             Statement operacao = conexao.createStatement();
             ResultSet resultado = operacao.executeQuery("SELECT * FROM reclamacao WHERE id=" +id);
                if(resultado.next()){
                    reclamacao.setId(resultado.getLong("id"));
                    reclamacao.setNome(resultado.getString("nome"));
                    reclamacao.setEmail(resultado.getString("email"));
                    reclamacao.setDescricao(resultado.getString("descricao"));                   
                    reclamacao.setStatus(resultado.getInt("status"));
                   
                    
                            
                }            
             
             
        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListaRegistrosServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ListaRegistrosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("reclamacao", reclamacao);
        request.getRequestDispatcher("WEB-INF/edita-registro.jsp").forward(request, response);
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          Reclamacao reclamacao = new Reclamacao();
          reclamacao.setId( Long.parseLong(request.getParameter("id")));
          reclamacao.setNome(request.getParameter("nome"));
          reclamacao.setEmail(request.getParameter("email"));
          reclamacao.setDescricao(request.getParameter("descricao"));
          reclamacao.setStatus(Integer.parseInt(request.getParameter("status")));
        
        try {
            //Pegar os dados do banco
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conexao = DriverManager.getConnection("jdbc:derby://localhost:1527//lpto-2017-1", "usuario", "senha");
             
             Statement operacao = conexao.createStatement();
             operacao.executeUpdate("UPDATE reclamacao SET nome= '"
                     +reclamacao.getNome()+ "', email='"
                     +reclamacao.getEmail()+ "', status="
                     +reclamacao.getStatus()+ ", descricao='"
                     +reclamacao.getDescricao() +"' WHERE id ="
                     +reclamacao.getId() );
                
             
             
        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListaRegistrosServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ListaRegistrosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("lista.html");
    
    }

    

}
