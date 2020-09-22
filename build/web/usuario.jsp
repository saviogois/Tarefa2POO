<%-- 
    Document   : usuario
    Created on : 22 de set de 2020, 03:01:17
    Author     : savio
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.fatecpg.poo.User"%>
<!DOCTYPE html>
<%
    ArrayList<User> usersList = (ArrayList)application.getAttribute("usersList");
    if(usersList == null){
        usersList = new ArrayList<>();
        usersList.add(new User("admin", "admin@gmail.com", "admin"));
        application.setAttribute("usersList", usersList);
    }
    if(request.getParameter("add")!=null){
        String name = request.getParameter("nome");
        String email = request.getParameter("email");
        String password = request.getParameter("senha");
        usersList.add(new User(name, email, password));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("remove")!=null){
        int i = Integer.parseInt(request.getParameter("i"));
        usersList.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuário</title>
    </head>
    <body>
        <h1>Aula de POO</h1>
        <h2>Users</h2>
        
        <p>
        <form>
            Nome:<input type="text" name="nome"/>
            E-mail:<input type="text" name="email"/>
            Senha:<input type="password" name="senha"/>
            <input type="submit" value="Enviar" name="env"/>
        </form>
    </p>
    <div> 
        <table border="3">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Comandos</th>
            </tr>
            <%for(int i=0; i<usersList.size(); i++){%>
            <tr>
                <td><%= i %></td>
                <% User u = usersList.get(i); %>
                <td><%= u.getNome() %></td>
                <td><%= u.getEmail() %></td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%= i %>"/>
                        <input type="submit" name="remove" value="Remover"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </div>
    </body>
</html>
