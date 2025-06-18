<%@page import= "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão</title>
        <%
            // receber o código digitado no formulário
            int cod;
            cod= Integer.parseInt(request.getParameter("codigo"));
            try{
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bancojsp";
        
         String user = "root";
         String password="root";
         
         conecta = DriverManager.getConnection(url,user,password);
         
         String sql = "DELETE FROM produto WHERE codigo=?";
         st = conecta.prepareStatement(sql);        
         st.setInt(1, cod);
         int resultado= st.executeUpdate(); 
         // ta executando o comando DELETE
         if ( resultado == 0){
         out.print ("Este produto não está cadastrado no banco");
            } else {
            out.print("O produto de codigo = " + cod+" , foi excluído com sucesso");
            }
            } catch (Exception erro){
            String mensagemErro = erro.getMessage();
            out.print("Entre em contato com o Administrador e informe o erro");
            }
            
            
            %>
            
    </head>
    <body>
      
    </body>
</html>
