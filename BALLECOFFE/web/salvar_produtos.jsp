<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         //Receber os dados digitados no formulario no cadpro.html
         int c;
         String n, m, p;
         
         c = Integer.parseInt(request.getParameter("codigo"));
         n = request.getParameter("nome");
         m = request.getParameter("email");
         p = request.getParameter("telefone");         
         try{
          //Fazer conexão com banco de dados
          
          Connection conecta;
          PreparedStatement st;
          Class.forName("com.mysql.cj.jdbc.Driver");
          conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");
 
          //Inserir os dados na tabela produto do banco de dados aberto
          st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
          st.setInt(1,c);
          st.setString(2,n);
          st.setString(3,m);
          st.setString(4,p);
          st.executeUpdate(); //Executa o comando INSERT
          out.print("<p style ='color:#5cceee;font-size:20px'>Produto cadastrado com sucesso!</p>");
            } catch (Exception x){
            out.print("MENSAGEM DE ERRO:" + x.getMessage());
            }
          %>
          
    </body>
</html>
