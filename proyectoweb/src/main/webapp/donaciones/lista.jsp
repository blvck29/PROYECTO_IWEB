<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Donaciones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  ArrayList<Donaciones> lista = (ArrayList<Donaciones>) request.getAttribute("lista");
%>
<html>
    <head>
      <title>Title</title>
    </head>
    <body>
        <h1> Lista de Donaciones </h1>
        <table>
            <tr>
                  <th>Id Registro Donaciones</th>
                  <th> Id Usuario </th>
                  <th> Comprobante </th>
                  <th> Monto </th>
                  <th> Comprobado</th>
            </tr>
            <% for (Donaciones dona : lista) {%>
            <tr>
                <td> <%= dona.getIdRegistro_Donaciones() %></td>
                <td> <%= dona.getIdUsuario() %></td>
                <td> <%= dona.getComprobante() %></td>
                <td> <%= dona.getComprobante() %></td>
                <td> <%= dona.getMonto() %></td>
                <td> <%= dona.getComprobante() %></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
