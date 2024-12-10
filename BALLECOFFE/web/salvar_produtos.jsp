<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ESTILIZAÇÃO/salvar.css">       
      <body>
           <header>
            <nav>
                <span class="logo">Ballecoffee</span>
                <ul class="menu">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="listapro.jsp">Listagem de usuários</a></li>
                    <li><a href="excpro.html">Excluir usuário</a></li>
                    <li><a href="altpro.html">Alterar usuário</a></li>
                   
                </ul>
                <a class="login" href="perfil.html">Perfil</a>
            </nav>
        </header>
          
        <%
            // Verifique se o formulário foi enviado via POST
            if (request.getMethod().equalsIgnoreCase("POST")) {
                int c;
                String n, m, p;

                // Receber os dados do formulário
                c = Integer.parseInt(request.getParameter("codigo"));
                n = request.getParameter("nome");
                m = request.getParameter("email");
                p = request.getParameter("telefone");

                try {
                    // Conectar ao banco de dados
                    Connection conecta;
                    PreparedStatement st;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");

                    // Inserir os dados no banco de dados
                    st = conecta.prepareStatement("INSERT INTO usuario VALUES(?,?,?,?)");
                    st.setInt(1, c);
                    st.setString(2, n);
                    st.setString(3, m);
                    st.setString(4, p);
                    st.executeUpdate(); // Executa o comando INSERT

                   // Exibir a mensagem de sucesso na mesma página
                    out.print("<div class'message-container'><p class='success-message'>Usuário cadastrado com sucesso!</p></div>");
                    } catch (Exception x) {
                    out.print("<div class'message-container'><p class='error-message'>Erro: usuário já cadastrado</p></div>");
                    }
            }
        %>
    </body>
</html>
