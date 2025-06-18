<%@page import= "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            // receber o código digitado no formulário
            String cpf;
            cpf=request.getParameter("cpf");
            if (cpf == null || cpf.trim().isEmpty()) {
        out.print("Erro: CPF não foi fornecido ou está vazio.");
        return;
    }
            
          
            try{
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/banco_sarah";
        
             String user = "root";
            String password="root";
         
            conecta = DriverManager.getConnection(url,user,password);
         
         String sql = "DELETE FROM informacoespessoais_sarah WHERE cpf=?";
         st = conecta.prepareStatement(sql);        
         st.setString(1, cpf);
         int resultado= st.executeUpdate(); 
         // ta executando o comando DELETE
         if ( resultado == 0){
         out.print ("Este CPF não está cadastrado no banco");
            } else {
            out.print("Os dados do CPF=" + cpf+" , foram excluídos com sucesso");
            }
            } catch (Exception erro){
            String mensagemErro = erro.getMessage();
            out.print("Entre em contato com o Administrador e informe o erro");
            }
            
            
            %>
    </body>
</html>
