<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ESTILIZAÇÃO/carrega.css">
        <title>Alteração de produtos</title>
    </head>
    <body>
        <header>
            <nav>
                <span class="logo">Ballecoffee</span>
                <ul class="menu">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="listapro.jsp">Listagem de usuários</a></li>
                    <li><a href="excpro.html">Excluir usuário</a></li>
                     <a  href="crud.html">Cadastro</a>

                </ul>
                <a class="login" href="perfil.html">Perfil</a>
            </nav>
        </header>

        <!-- Início do formulário -->
        <form method="post" action="alterar_produtos.jsp">
            <h1>Alteração de Produto</h1>
            
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" readonly>
            </p>
            <p>
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" size="70">
            </p>  
            <p>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email">
            </p> 
            <p>
                <label for="telefone">Telefone:</label>
                <input type="text" name="telefone" id="telefone">
            </p>              

            <p>
                <input type="submit" value="Salvar Alterações">   
            </p>
        </form>

        <%
            try {
                int c = Integer.parseInt(request.getParameter("codigo"));

                // Conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");

                // Query para obter o produto
                st = conecta.prepareStatement("SELECT * FROM usuario WHERE codigo = ?");
                st.setInt(1, c);

                ResultSet resultado = st.executeQuery();

                if (!resultado.next()) {
                    out.print("<p>Este produto não foi encontrado.</p>");
                } else {
                    // Preenche os dados do formulário com os valores do banco
                    out.print("<script>");
                    out.print("document.getElementById('codigo').value = '" + resultado.getString("codigo") + "';");
                    out.print("document.getElementById('nome').value = '" + resultado.getString("nome") + "';");
                    out.print("document.getElementById('email').value = '" + resultado.getString("email") + "';");
                    out.print("document.getElementById('telefone').value = '" + resultado.getString("telefone") + "';");
                    out.print("</script>");
                }
                // Fechar conexões
                resultado.close();
                st.close();
                conecta.close();
            } catch (Exception e) {
                out.print("<p>Erro ao carregar dados: " + e.getMessage() + "</p>");
            }
        %>
    </body>
</html>
