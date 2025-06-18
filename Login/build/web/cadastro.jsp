<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.DriverManager" %>
<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
    String cpf = request.getParameter("cpf");
    String primeiro_nome = request.getParameter("primeiro_nome");
    String segundo_nome = request.getParameter("segundo_nome");
    String endereco = request.getParameter("endereco");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");
    String ddd = request.getParameter("ddd");
    String celular = request.getParameter("celular");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String mes_nascimento = request.getParameter("mes_nascimento");

    try {
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/banco_sarah";
        String user = "root";
        String password = "root";

        conecta = DriverManager.getConnection(url, user, password);

        // VALIDAÇÃO CPF
        while (true) {
            if (cpf == null || cpf.length() != 11 || !cpf.matches("\\d+")) {
                out.print("CPF inválido! O CPF deve conter 11 números.");
                return;
            }

            int[] digitos = new int[11];
            for (int i = 0; i < 11; i++) {
                digitos[i] = Character.getNumericValue(cpf.charAt(i));
            }

            int soma = 0, peso = 10;
            for (int i = 0; i < 9; i++) {
                soma += digitos[i] * peso--;
            }
            int digito1 = 11 - (soma % 11);
            if (digito1 >= 10) {
                digito1 = 0;
            }

            soma = 0;
            peso = 11;
            for (int i = 0; i < 10; i++) {
                soma += digitos[i] * peso--;
            }
            int digito2 = 11 - (soma % 11);
            if (digito2 >= 10) {
                digito2 = 0;
            }

            if (digito1 == digitos[9] && digito2 == digitos[10]) {
                out.print("CPF válido.");
                break;
            } else {
                out.print("CPF inválido!");
                return;
            }
        }

        // VALIDAÇÃO PRIMEIRO NOME
        while (true) {
            if (primeiro_nome == null || primeiro_nome.isEmpty() || !primeiro_nome.matches("[a-zA-Z ]+")) {
                out.print("Nome inválido! O nome deve conter apenas letras e espaços.");
                return;
            } else {
                out.print("Nome válido.");
                break;
            }
        }

        // SOBRENOME VALIDAÇÃO
        while (true) {
            if (segundo_nome == null || segundo_nome.isEmpty() || !segundo_nome.matches("[a-zA-Z ]+")) {
                out.print("Sobrenome inválido! O sobrenome deve conter apenas letras e espaços.");
                return;
            } else {
                out.print("Sobrenome válido.");
                break;
            }
        }

        // VALIDAÇÃO ESTADO
        while (true) {
            if (estado != null) {
                estado = estado.toUpperCase();
                if (estado.equals("AC") || estado.equals("AL") || estado.equals("AP") || estado.equals("AM") ||
                    estado.equals("BA") || estado.equals("CE") || estado.equals("DF") || estado.equals("ES") ||
                    estado.equals("GO") || estado.equals("MA") || estado.equals("MT") || estado.equals("MS") ||
                    estado.equals("MG") || estado.equals("PA") || estado.equals("PB") || estado.equals("PR") ||
                    estado.equals("PE") || estado.equals("PI") || estado.equals("RJ") || estado.equals("RN") ||
                    estado.equals("RS") || estado.equals("RO") || estado.equals("RR") || estado.equals("SC") ||
                    estado.equals("SP") || estado.equals("SE") || estado.equals("TO")) {
                    out.print("Estado válido.");
                    break;
                } else {
                    out.print("Estado inválido!");
                    return;
                }
            } else {
                out.print("Estado inválido!");
                return;
            }
        }

        // VALIDAÇÃO DDD
        while (true) {
            if (ddd == null || ddd.length() != 2 || !ddd.matches("\\d+") || Integer.parseInt(ddd) < 11 || Integer.parseInt(ddd) > 99) {
                out.print("DDD inválido! Deve conter exatamente 2 números entre 11 e 99.");
                return;
            } else {
                out.print("DDD válido.");
                break;
            }
        }

        // VALIDAÇÃO MÊS
        while (true) {
            try {
                int mes = Integer.parseInt(mes_nascimento);
                if (mes >= 1 && mes <= 12) {
                    out.print("Mês de nascimento válido.");
                    break;
                } else {
                    out.print("Mês de nascimento inválido!");
                    return;
                }
            } catch (NumberFormatException e) {
                out.print("Erro: Mês de nascimento deve ser um número.");
                return;
            }
        }

        // VALIDAÇÃO CELULAR
        if (celular == null || celular.length() > 9 || !celular.matches("\\d+")) {
            out.print("Celular inválido! Deve conter até 9 números.");
            return;
        } else {
            out.print("Celular válido.");
        }

        // Insert into Database
        String sql = "INSERT INTO informacoespessoais_Sarah (cpf, primeiro_nome, segundo_nome, endereco, cidade, estado, ddd, celular, email ,senha, mes_nascimento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        st = conecta.prepareStatement(sql);
        st.setString(1, cpf);
        st.setString(2, primeiro_nome);
        st.setString(3, segundo_nome);
        st.setString(4, endereco);
        st.setString(5, cidade);
        st.setString(6, estado);
        st.setString(7, ddd);
        st.setString(8, celular);
        st.setString(9, email);
        st.setString(10,senha);
        st.setString(11, mes_nascimento);

        int validando = st.executeUpdate();
            if(validando>0) {
            response.sendRedirect("bem_vindo.html");
          } else {
            response.sendRedirect("error.html");
          }
            
            } catch (Exception e) {
        out.print("Erro ao processar os dados: " + e.getMessage());
            }
            

%>
</body>
</html>
