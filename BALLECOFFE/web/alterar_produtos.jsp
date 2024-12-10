<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ESTILIZAÇÃO/alterarpro.css">
       <style>
 form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
    margin: 0 auto; /* Para centralizar o formulário */
}

form h1 {
    margin-bottom: 20px;
}

form input[type="text"],
form input[type="email"],
form input[type="number"],
form input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

/* Estilos para a notificação */
.notification {
    display: none;
    margin-top: 20px;
    padding: 20px;
    background-color: #4CAF50;
    color: white;
    border-radius: 10px;
    text-align: center;
    font-size: 16px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    width: 300px; /* Tamanho fixo para centralizar melhor */
    max-width: 90%;
    transition: opacity 0.3s ease;
}

.notification.error {
    background-color: #f44336; /* Cor de erro */
}

</style>

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
                    <li><a href="crud.html">Cadastro</a></li>
                </ul>
                <a class="login" href="perfil.html">Perfil</a>
            </nav>
        </header>


        <!-- Notificação de sucesso ou erro -->
        <div id="notification" class="notification"></div>

        <% 
            // Receber os dados ALTERADOS no formulário
            int c;
            String n, m;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("email");
            p = Double.parseDouble(request.getParameter("telefone"));
            
            // Tratamento de exceção
            try {
                // Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");

                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");    

                // Atualização dos dados no banco de dados
                st = conecta.prepareStatement("UPDATE usuario SET nome = ?, email = ?, telefone = ? WHERE codigo = ?");
                st.setString(1, n);
                st.setString(2, m);
                st.setDouble(3, p);
                st.setInt(4, c);

                // Executa o UPDATE no banco de dados
                st.executeUpdate();

                // Exibir notificação de sucesso
                out.print("<script>document.getElementById('notification').textContent = 'Os dados do usuário " + c + " foram alterados com sucesso!'; document.getElementById('notification').style.display = 'block';</script>");
            } catch (Exception erro) {
                // Exibir notificação de erro
                out.print("<script>document.getElementById('notification').textContent = 'Entre em contato com o suporte e informe o erro " + erro.getMessage() + "'; document.getElementById('notification').classList.add('error'); document.getElementById('notification').style.display = 'block';</script>");
            }
        %>
    </body>
</html>
