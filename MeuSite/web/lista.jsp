<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.DriverManager" %>
<%@page import = "java.sql.*" %>

<%@page import = "java.sql.ResultSet" %>
<!-- ResultSet é uma classe do java que armazena os resultados provenientes de uma  
query(consulta) SQL realizado.Funciona como um conjunto (Set) e guarda uma tabela que é o resultado 
 da consulta SQL-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="tabela.css">

    </head>
    <body>
        <% try {
        
        //fazer conexão  com o banco de dados
        
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bancojsp";
        
         String user = "root";
         String password="root";
         
         conecta = DriverManager.getConnection(url,user,password);
         //na msm sequência 
         
         //Lista os dados da tabela produto do banco de dados;
         
         String sql=("SELECT * FROM produto");
         
         st = conecta.prepareStatement(sql);
         ResultSet rs= st.executeQuery();
         
         //enquat não chegat no final ele vai executar o que estiver
         //dentro do while
         
         %>
         
         <table>
             <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Valor</th>
                <th>Exclusão</th>
             </tr>
             <%
                 while(rs.next()){
                 %>
               
                 <!--  finalizei o código acima, agora vou criar o corpo da tabela
                 html para mostrar os dados trazidos do Banco de Dados-->
                 
                 <tr>
                     <td> 
                         <%=rs.getString("codigo")%>
                     </td>
                     <td>
                          <%=rs.getString("nome")%>
                     </td>
                      <td>
                          <%=rs.getString("marca")%>
                     </td>
                      <td>
                          <%=rs.getString("valor")%>
                     </td>
                     <td>
                         <a href="excpro.jsp?codigo=<%=rs.getString("codigo")%>">Excluir </a>
                     </td>
                 </tr>
                 <%
                 }
                 %>
                 <!-- essa chave vem do While, tem td a função html -->
         </table>
                 <%
                     }catch ( Exception x ){
                     out.print ("Mensagem de erro: "+ x.getMessage());
               }
              %>
              


                 
                 
        
        
        
        
       
        
    </body>
</html>
