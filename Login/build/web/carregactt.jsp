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
        
        String c;
        c=request.getParameter("cpf");
        Connection conecta;
        PreparedStatement st;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/banco_sarah";
        
         String user = "root";
         String password="root";
         
         conecta = DriverManager.getConnection(url,user,password);
         
          String sql = ( "SELECT * FROM informacoespessoais_sarah WHERE cpf=?");
         st=conecta.prepareStatement(sql);    
         
          st.setString(1, c);
         ResultSet resultado = st.executeQuery();
         
         //Verifica se o produto de código informado  foi encontrado
         
         if (!resultado.next()){
         out.print("Este produto não foi localizado");
            } 
            else{
            //se encontrou o produto no tabela , irá carregar os dados no formulário
            
            
            %>
            
             <form method="post" action = "atualizar.jsp"> 
         <p>
            <label for = "cpf"> CPF </label>
            <input type= "text" name="cpf" id="cpf" value="<%=resultado.getString("cpf")%>"readonly>
        </p>
        <p>
          <label for="primeiro_nome"> Nome</label>
          <input type = "text" name="primeiro_nome" id="primeiro_nome" value="<%=resultado.getString("primeiro_nome")%>"readonly>
        </p>
        <p>
          <label for="segundo_nome">Sobrenome</label>
          <input type = "text" name="segundo_nome" id="segundo_nome" value="<%=resultado.getString("segundo_nome")%>"readonly>
        </p>
        <p>
          <label for="endereco">Endereço</label>
          <input type = "text" name="endereco" id="endereco" value="<%=resultado.getString("endereco")%>">
       </p>
       <p>
          <label for="cidade">Cidade</label>
          <input type = "text" name="cidade" id="cidade" value="<%=resultado.getString("cidade")%>">
       </p>
       <p>
          <label for="estado">Estado</label>
          <input type = "text" name="estado" id="estado" value="<%=resultado.getString("estado")%>">
       </p>
       <p>
          <label for="ddd">DDD</label>
          <input type = "text" name="ddd" id="ddd" value="<%=resultado.getString("ddd")%>">
       </p>
       <p>
          <label for="celular">Celular</label>
          <input type = "text" name="celular" id="celular" value="<%=resultado.getString("celular")%>">
       </p>
       <p>
          <label for="email">E-mail</label>
          <input type = "email" name="email" id="email" value="<%=resultado.getString("email")%>">
       </p>
       <p>
          <label for="senha">Senha</label>
          <input type = "password" name="senha" id="senha" value="<%=resultado.getString("senha")%>">
       </p>
        <p>
          <label for="mes_nascimento">Senha</label>
          <input type = "text" name="mes_nascimento" id="mes_nascimento" value="<%=resultado.getString("mes_nascimento")%>"readonly>
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
