<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Usuário</title>
        <link rel="stylesheet" href="ESTILIZAÇÃO/excpro.css">
        <style>
            /* Estilo para centralizar a mensagem */
            .message-container {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f1f1f1;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 80%;
                max-width: 400px;
            }

            .success-message {
                color: #4CAF50;
                font-size: 20px;
            }

            .error-message {
                color: #f44336;
                font-size: 20px;
            }
        </style>
    </head>
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
        <div>
            <%
                // Recupera o código do usuário passado pela URL
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                
                try {
                    Connection conecta;
                    PreparedStatement st;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");
                    
                    st = conecta.prepareStatement("DELETE FROM usuario WHERE codigo = ?");
                    st.setInt(1, codigo);
                    
                    int rows = st.executeUpdate();
                    
                    // Verifica se a exclusão foi bem-sucedida
                    if (rows > 0) {
                        out.print("<div class='message-container'><p class='success-message'>Usuário excluído com sucesso!</p></div>");
                    } else {
                        out.print("<div class='message-container'><p class='error-message'>Erro ao excluir o usuário.</p></div>");
                    }
                } catch (Exception e) {
                    out.print("<div class='message-container'><p class='error-message'>Erro: " + e.getMessage() + "</p></div>");
                }
            %>
        </div>
    </body>
</html>
