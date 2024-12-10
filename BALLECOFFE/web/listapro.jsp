<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listagem de Usuários</title>
    <link rel="stylesheet" href="ESTILIZAÇÃO/listagem.css">
</head>
<body>
    <header>
        <nav>
            <span class="logo">Ballecoffee</span>
            <ul class="menu">
                <li><a href="index.html">Home</a></li>
                <li><a href="excpro.html">Excluir usuário</a></li>
                <li><a href="altpro.html">Alterar usuário</a></li>
                <li><a href="crud.html">Cadastrar</a></li>
            </ul>
            <a class="login" href="perfil.html">Perfil</a>
        </nav>
    </header>

    <%
      try {
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");
      
      //Listar os dados da tabela produto do banco de dados
            st = conecta.prepareStatement("SELECT * FROM usuario");
      
      //Método executeQuery() roda o código SQL e trás os dados que são atribuídos à variável rs
            ResultSet rs = st.executeQuery();
      %>

      <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                </tr>
            </thead>
            <tbody>
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
            </tbody>
        </table>
      </div>
        <%
            } catch (Exception x) {
               out.print("MENSAGEM DE ERRO:" + x.getMessage());
            }
        %>
</body>
</html>
