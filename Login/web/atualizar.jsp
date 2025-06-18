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
    String cpf = request.getParameter("cpf");
    String endereco = request.getParameter("endereco");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");
    String ddd = request.getParameter("ddd");
    String celular = request.getParameter("celular");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    Connection conecta;
    PreparedStatement st;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/banco_sarah";
        String user = "root";
        String password = "root";

        conecta = DriverManager.getConnection(url, user, password);

       
        String sql = "UPDATE informacoespessoais_sarah SET endereco=?, cidade=?, estado=?, ddd=?, celular=?,email=?, senha=? WHERE cpf=?";
        st = conecta.prepareStatement(sql);

        st.setString(1, endereco);
        st.setString(2, cidade);
        st.setString(3, estado);
        st.setString(4, ddd);
        st.setString(5, celular);
        st.setString(6, senha);
        st.setString(7, email);
        st.setString(8, cpf); //cpf é a aonde usamos o where como clausula

        st.executeUpdate();
        out.print("Os dados foram alterados com sucesso!");

        st.close();
        conecta.close();
    } catch (Exception e) {
        out.print("Erro: " + e.getMessage());
    }
%>


    </body>
</html>
