<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import =" java.sql.ResultSet" %>
<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta pelo nome</title>
    </head>
    <body>
        <%
 
       String nom;
       //n vai receber o nome do produto
       nom=request.getParameter("primeiro_nome");
         
       try{
          //fazer a conexao com o banco de dados
          Connection conecta;
          PreparedStatement st;
          Class.forName("com.mysql.cj.jdbc.Driver");
            
          String url = "jdbc:mysql://localhost:3306/banco_sarah";
          String user="root";
          String password="root";
            
          conecta = DriverManager.getConnection(url,user,password);
          //Lista o dado da tabela produto do Banco De dados
          String sql=("SELECT * FROM informacoespessoais_sarah WHERE primeiro_nome LIKE ?");
            
          st=conecta.prepareStatement(sql);
            
          // na linha abaixo estamos dizendo o que vai dentro
          //do ponto ?
          // que será concatenado com % para poder pegar
          //qualquer parte do nome do produto salvo no banco
            
          st.setString(1,"%" + nom +"%");
          //ResultSet serve para guardar aquilo que é trazido do Banco
            
          ResultSet rs=st.executeQuery();
          //enquanto não chegar no final do Banco ele vai executat
          // o que estiver dentro do while
          //vamos montar uma tabela html
          //criando o titulo da tabela
          // e executar o codigo Java
            
        %>

        <table>
            <tr> 
                <th>endereco</th>
                <th>cidade</th>
                <th>ddd</th>
                <th>celular</th>
                <th>email</th>
                <th>cpf</th>
            </tr>

            <%
                while(rs.next()){
            %>    
            <!-- finalizamos o codigo java acima e agora vamos criar uma tabela -->
            <!-- para mostrar os dados recuperados dos banco de dados -->
            <tr>

                <td><%=rs.getString("endereco")%></td>
                <td><%=rs.getString("cidade")%></td>
                <td><%=rs.getString("ddd")%></td>
                <td><%=rs.getString("celular")%></td>
                 <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("cpf")%></td>

            </tr>
            <%
                }
            %>
        </table>   
        <%
            }catch(Exception x){
            out.print("Mensagem de erro"+ x.getMessage());

}
        %>
    </body>
</html>
