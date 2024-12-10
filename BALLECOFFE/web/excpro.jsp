<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
    </head>
    <body>
        <%
          int cod;
          cod = Integer.parseInt(request.getParameter("codigo"));
          
          try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "matheusgabriel", "matheusgabriel2007");
            
            PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE odigo=?");
            
            st.setInt(1, cod);
            
            int resultado = st.executeUpdate();
            
            if (resultado ==0) {
                out.print("O PRODUTO DE CÓDIGO " + cod + "FOI EXCLUÍDO COM SUCESSO!");
            }
            }catch (Exception erro) {
              String mensagemErro = erro.getMessage();
              out.print("ENTRE EM CONTATO COM O SUPORTE E INFORME O ERRO");
            }
            %>
    </body>
</html>
