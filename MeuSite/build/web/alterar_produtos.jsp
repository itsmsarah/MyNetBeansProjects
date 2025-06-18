<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.DriverManager" %>
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
            //recebe os dados alterados no form carregaprod.jsp
            int codigo;
            String nome, marca;
            double valor;
            codigo=Integer.parseInt(request.getParameter("codigo"));
            nome=request.getParameter("nome");
            marca=request.getParameter("marca");
            valor=Double.parseDouble(request.getParameter("valor"));
            
             Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bancojsp";
        
            String user = "root";
            String password="root";
             
              conecta = DriverManager.getConnection(url,user,password);
              
            String sql=("UPDATE produto SET nome=?,marca=?,valor=? WHERE codigo=?");
             st=conecta.prepareStatement(sql);   
            //colocar clausa WHERE para filtrar e atualize o que vc quer
            //A cláusula WHERE garante que apenas o registro correspondente ao codigo seja atualizado.
            
            st.setString(1,nome);
            st.setString(2,marca);
            st.setDouble(3,valor);
            st.setInt(4,codigo);
            
            st.executeUpdate();
            out.print("Os dados do produto" + nome + "foram alterados com sucesso");

            %>
    </body>
</html>
