<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link ref="stylesheet" href="carrega.css"
        <title>Alteração de produtos</title>
    </head>
    <body>
        <%
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));
            
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");         
            
            st = conecta.prepareStatement("SELECT * FROM usuario WHERE codigo = ?");
            st.setInt(1, c);
            
            
            ResultSet resultado = st.executeQuery(); 
                    
            if (!resultado.next()) {
                out.print("Este produto não foi encontrado");
            
            } else {
        %>
       
        <form method="post" action="alterar_produtos.jsp">
           
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo") %>" readonly>
            </p>
            <p>
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" size="70" value="<%= resultado.getString("nome") %>">
            </p>  
            <p>
                <label for="email">Email:</label>
                <input type="text" name="email" id="email" value="<%= resultado.getString("email") %>">
            </p> 
            <p>
                <label for="telefone">Telefone:</label>
                <input type="number" step="0.1" name="telefone" id="telefone" value="<%= resultado.getString("telefone") %>">
            </p>              
            <p>
                <input type="submit" value="Salvar Alterações">   
            </p>
        </form>    
        <%
            }
        %>    
    </body>
</html>