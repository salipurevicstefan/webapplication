<%-- 
    Document   : index
    Created on : Nov 14, 2017, 3:59:38 PM
    Author     : Makina
--%>

<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selecting Data from a DB</title>
    </head>
    <body>
        <h1>Selecting Data from a DB</h1>
        <%!
            public class Actor {
                String URL = "jdbc:mysql//localhost:3306/sakila";
                String USERNAME = "root";
                String PASSWORD = "";

                Connection conn = null;
                PreparedStatement selectActors = null;
                ResultSet resultSet = null;

            public Actor () {
                try{
                    conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                    selectActors = conn.prepareStatement("SELECT actor_id, first_name, last_name FROM actor");
    } catch(SQLException ex) {
        ex.printStackTrace();
    }
}
            public ResultSet getActors() {
                try {
                   resultSet = selectActors.executeQuery();
    } catch(SQLException ex) {
        ex.printStackTrace();
        }
                    return resultSet;
    }
}
        %>
        <%
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>Actor ID</td>
                    <td>First Name</td>
                    <td>Last Name</td>
                </tr>
                <% while(actors.next()) { %>
                <tr>
                    <td><%= actors.getInt("actor_id") %></td>
                    <td><%= actors.getString("first_name") %></td>
                    <td><%= actors.getString("last_name") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

    </body>
</html>
