<%@page import="com.emergentes.modelo.Persona"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listaper") == null){
        ArrayList<Persona> lisaux = new ArrayList<Persona>();
        session.setAttribute("listaper", lisaux);
    }
    ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("listaper");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listado de registros</h1>
        <h3>Nombre: Carlos Daniel Mamani Corina</h3>
        <a href="MainServlet?op=nuevo">Nuevo registro</a>
        <table border="1">
            <tr>
                <td>Id</td>
                <td>Nombres</td>
                <td>Apellidos</td>
                <td>Edad</td>
                <td></td><!-- comment -->
                <td></td>
            </tr>
            <%
                if(lista != null){
                    for(Persona item : lista){
                  
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombres() %></td>
                <td><%= item.getApellidos() %></td>
                <td><%= item.getEdad() %></td>
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>" onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a>
                    
                </td>
            </tr>
            <%
                   }
                }
            %>
        </table>
    </body>
</html>
