<%@page import= "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql. *" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de produto</title>
    </head>
    
        <%
            //receber dados digitados do formulário cadpro.html
            int codigo;
            String nome,marca;
            double valor;
            codigo =  Integer.parseInt(request.getParameter("codigo"));
            //esse metodo retorna um número inteiro da caixinha do formulario q 
            //foi digitado e será armezando em códigp
           
            nome = request.getParameter("nome");
            marca = request.getParameter("marca");
            //como essas duas já são texto não precisa desse Intereger
            
            valor= Double.parseDouble(request.getParameter("valor"));     
            // essas variaveis deve ser o mesmo  nome no banco de dados
            //essas informações serão salvas em nosso banco de dados
            //nível de perfomance é melhor colocar em ordem oq vc colocou no banco de dados
             // aqui nesse código
             
            //fazer a conexão com banco de dados
            
             try{
             Connection conecta ;
             PreparedStatement st; //este objeto permite enviar vários comandos SQL
             //com um grupo único para o banco de dados.
             
             Class.forName("com.mysql.cj.jdbc.Driver");
             //este metodo é usado para que o servidor de aplicação faça o registro
             //do driver do Banco
             
             String url= "jdbc:mysql://localhost:3306/bancojsp";
             String user = "root";
             String password="root";
             
             conecta=DriverManager.getConnection(url,user,password);
             //inserindo dados na tabela do banco de dados
             
             String sql=("INSERT INTO produto VALUES( ?,?,?,?) ");
             //inserir os valores que estão dentro dessas caixinhas ? ? ? ?
            st=conecta.prepareStatement(sql);
            st.setInt(1,codigo);
            st.setString(2,nome);
            st.setString(3,marca);
            st.setDouble(4,valor);
            
            st.executeUpdate();// executar a instrução INSERT 
            
            out.print("<p style =' color:blue:font-size:25px'>Produto cadastrado com sucesso...</p>");
            
            //é sugerivel a mesma ordem do form no banc de dados 
             
            
  
            } catch( Exception x){
            String erro=x.getMessage();
            if(erro.contains("Duplicate entry")){
            out.print("<p style ='color:blue;font-size:25px'>Esse produto já está cadastrado </p>");
            }else{
             out.print("<p style ='color:red;font-size:25px'>Mensagen de erro:"+erro +"</p>");
            }
            }
            
            
             
        %>
    </body>
</html>
