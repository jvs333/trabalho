<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
    </head>
    <body>
        <%
          try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");
          
          //Listar os dados da tabela produto do banco de dados
                st = conecta.prepareStatement("SELECT * FROM produto");
          
          //Método executeQuery() roda o codigo SQL e trás os dados que são atribuidos a váriavel rs
                ResultSet rs = st.executeQuery();
          %>
          
          <table border="1">
              <tr>
                  <th>Código</th><th>Nome</th><th>Email</th><th>Telefone</th>
              </tr>
              <%
               while (rs.next()){
               %>
                 
               <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("email")%></td>
                <td><%= rs.getString("telefone")%></td>
               </tr>
              <%
              }
             %>
          </table>
            <%
                } catch (Exception x) {
                   out.print("MENSAGEM DE ERRO:" + x.getMessage());
                }
            %>
    </body>
</html>
