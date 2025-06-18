<%@page import= "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.sql.ResultSet" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        //recebe  o código do produto a ser alterado e armazena
        //na variavel
        
        int c;
        c=Integer.parseInt(request.getParameter("codigo"));
        Connection conecta;
        PreparedStatement st;
        
          Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bancojsp";
        
         String user = "root";
         String password="root";
         
         conecta = DriverManager.getConnection(url,user,password);
         
          String sql = ( "SELECT * FROM produto WHERE codigo=?");
         st=conecta.prepareStatement(sql);    
         
          st.setInt(1, c);
         ResultSet resultado = st.executeQuery();
         
         //Verifica se o produto de código informado  foi encontrado
         
         if (!resultado.next()){
         out.print("Este produto não foi localizado");
            } 
            else{
            //se encontrou o produto no tabela , irá carregar os dados no formulário
            
            
            %>
            
             <form method="post" action = "alterar_produtos.jsp"> 
         <p>
            <label for = "codigo"> Codigo: </label>
            <input type= "number" name="codigo" id="codigo" value="<%=resultado.getString("codigo")%>"readonly>
        </p>
        <p>
          <label for="nome"> Nome do produto:</label>
          <input type = "text" name="nome" id="nome" value="<%=resultado.getString("nome")%>">
        </p>
        <p>
          <label for="marca"> Marca do Produto:</label>
          <input type = "text" name="marca" id="marca" value="<%=resultado.getString("marca")%>">
        </p>
        <p>
          <label for="valor">Valor:</label>
          <input type = "number" name="valor" id="valor" value="<%=resultado.getString("valor")%>">
       </p>
       <p>
        <input type ="submit" value="Salvar alterações">
       </p>
    
               
</form>
        <%
            }
          %>  
    </body>
</html>
