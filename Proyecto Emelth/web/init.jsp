<%-- 
    Document   : init
    Created on : 17 dic 2023, 12:36:43
    Author     : bryda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
        HttpSession sesion = request.getSession();
         Integer id = null;
        if (sesion != null) {
            Integer userId = (Integer) sesion.getAttribute("userId");
              id = (Integer) sesion.getAttribute("ID");
              
            if (userId != null) {
                switch(userId){
                case 0:
                     response.sendRedirect("index.jsp");
                break;
                case 3:
                      response.sendRedirect("HomeOper");
                break;
                case 2:
                     response.sendRedirect("HomeAdmin.jsp");
                break;
                default:;
                
                
               
                  }
                    id = (Integer) sesion.getAttribute("ID");
                    
                
            } else {
                // El usuario no está autenticado, redirecciona o realiza alguna acción adecuada
                response.sendRedirect("index.jsp");
            }
        } else {
            // Sesión no disponible, redirecciona o realiza alguna acción adecuada
            response.sendRedirect("index.jsp");
        }
         
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciando</title>
        
    </head>
    <body>
        <label id="so" hidden><%= id %></label>
        <h1>Iniciando llamada</h1>
    
    </body>
    <script type="text/javascript" src="./FilesJS/locate.js"></script>
   
</html>
