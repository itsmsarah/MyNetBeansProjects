<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.DriverManager" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
    try {
    Connection conecta;
    PreparedStatement st1, st2;

   
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Conectar ao banco de dados
    String url = "jdbc:mysql://localhost:3306/banco_sarah";
    String user = "root";
    String password = "root";
    conecta = DriverManager.getConnection(url, user, password);

    // Fazendo a consultagem em ordem alfábetica pelo nome:
    String sql1 = "SELECT cpf, primeiro_nome, segundo_nome, ddd, email, mes_nascimento FROM informacoespessoais_sarah ORDER BY primeiro_nome ASC";
    st1 = conecta.prepareStatement(sql1);
    ResultSet rs1 = st1.executeQuery();
    %>
    <table>
         <thead>
         <tr>
            <th>cpf</th>
            <th>primeiro_nome</th>
            <th>segundo_nome</th>
            <th>ddd</th>
            <th>email</th>
            <th>mes_nascimento</th>
         </tr>
        </thead>
    <tbody>
        <%
        while (rs1.next()) {
        %>
        <tr>
            <td><%= rs1.getString("cpf") %></td>
            <td><%= rs1.getString("primeiro_nome") %></td>
            <td><%= rs1.getString("segundo_nome") %></td>
            <td><%= rs1.getString("ddd") %></td>
            <td><%= rs1.getString("email") %></td>
            <td><%= rs1.getString("mes_nascimento") %></td>
        </tr>
        <%
        }
        rs1.close();
        st1.close();
        %>
    </tbody>
    </table>

    <%
    // Fazendo a consulta da segunda tabela da atividade
    String sql2 = "SELECT cpfid, primeiro_nome, endereco, cidade, email FROM informacoespessoais_sarah ORDER BY estado ASC";
    st2 = conecta.prepareStatement(sql2);
    ResultSet rs2 = st2.executeQuery();
    %>
    <table>
     <thead>
        <tr>
            <th>cpfid</th>
            <th>primeiro_nome</th>
            <th>endereco</th>
            <th>cidade</th>
            <th>email</th>
        </tr>
     </thead>
    <tbody>
        <%
        while (rs2.next()) {
        %>
        <tr>
            <td><%= rs2.getString("cpfid") %></td>
            <td><%= rs2.getString("primeiro_nome") %></td>
            <td><%= rs2.getString("endereco") %></td>
            <td><%= rs2.getString("cidade") %></td>
            <td><%= rs2.getString("email") %></td>
        </tr>
        <%
        }
        rs2.close();
        st2.close();
        conecta.close();
        %>
    </tbody>
    </table>

    <%
    } catch (Exception x) {
    out.print("Mensagem de erro: " + x.getMessage());
    }
    %>

    </body>
</html>
