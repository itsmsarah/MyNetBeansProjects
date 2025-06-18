<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import =" java.sql.ResultSet" %>
<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
        //recebe o nome do produto digitado no formulario conpro.html
         String n;
         
         //n vai receber o nome do produto
         n=request.getParameter("nome");
         
         try{
            //fazer a conexao com o banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url = "jdbc:mysql://localhost:3306/bancojsp";
            String user="root";
            String password="root";
            
            conecta = DriverManager.getConnection(url,user,password);
            //Lista o dado da tabela produto do Banco De dados
            String sql=("SELECT * FROM produto WHERE nome LIKE ?");
            
            st=conecta.prepareStatement(sql);
            
            // na linha abaixo estamos dizendo o que vai dentro
            //do ponto ?
            // que será concatenado com % para poder pegar
            //qualquer parte do nome do produto salvo no banco
            
            st.setString(1,"%" + n +"%");
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
                <th>Codigo</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Valor</th>
            </tr>
            
            <%
                while(rs.next()){
            %>    
            <!-- finalizamos o codigo java acima e agora vamos criar uma tabela -->
            <!-- para mostrar os dados recuperados dos banco de dados -->
            <tr>
                
                <td><%=rs.getString("codigo")%></td>
                 <td><%=rs.getString("nome")%></td>
                 <td><%=rs.getString("marca")%></td>
                 <td><%=rs.getString("valor")%></td>
                
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
