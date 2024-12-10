<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produtos</title>
    </head>
    <body>
        <%
            //Receber os dados ALTERADOS no formulário carregaprod.jsp
            int c;
            String n, m;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("email");
            p = Double.parseDouble(request.getParameter("telefone"));
            
            //Tratamento de excessão
            try{
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");    

               // dos dados executando script de UPDATE na base de dados passando os campos recebidos do formulário
                st = conecta.prepareStatement("UPDATE usuario SET nome = ?, email = ?, telefone = ? WHERE codigo = ?");
                st.setString(1, n);
                st.setString(2, m);
                st.setDouble(3, p);
                st.setInt(4, c);

                //Executa o UPDATE já completo na base de dados
                st.executeUpdate();

                out.print("Os dados do usuário " + c + " foram alterados com sucesso!");
            } catch (Exception erro){
               out.print ("Entre em contato com o suporte e informe o erro " + erro.getMessage());
            }
        %>    
    </body>
</html>
