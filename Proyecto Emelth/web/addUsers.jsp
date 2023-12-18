<%-- 
    Document   : addUsers
    Created on : 23 nov 2023, 9:26:01
    Author     : bryda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        HttpSession sesion = request.getSession();
        if (sesion != null) {
            Integer userId = (Integer) sesion.getAttribute("userId");
            if (userId != null) {
                switch(userId){
                case 0:
                     response.sendRedirect("index.jsp");
                break;
                case 1:
                     response.sendRedirect("home.jsp");
                break;
                case 3:
                    response.sendRedirect("HomeOper");
                break;
                default:;
                
                
               
                  }
                
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
    <title>Registrar usuarios</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="FilesCSS/estilos_registroAdmin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200;300&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/31afa4227b.js" crossorigin="anonymous"></script>
<body>
    <div class="wrapper">
        <nav>
            <ul>
                <li><a href="#">Logo</a></li>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Nosotros</a></li>
                <li><a href="#">Contacto</a></li>
                <li><a href="#">Ayuda</a></li>
            </ul>
        </nav>
        
        <div class="container">

            <div class="container_registrar">
                <form>
                    <div class="form-input">
                        <div class="form-heading"><p class="heading-input">Nombre</p></div>
                        <input type="text" placeholder="Escriba su nombre" id="nameForm" >
                    </div>
                    <div class="form-input">
                        <div class="form-heading"><p class="heading-input">Apellido paterno</p></div>
                        <input type="text" placeholder="Escriba su primer apellido" id="lastName1Form">
                    </div>
                    <div class="form-input">
                        <div class="form-heading"><p class="heading-input">Apellido materno</p></div>
                        <input type="text" placeholder="Escriba su segundo apellido" id="lastName2Form">
                    </div>
                    <div class="form-input">
                        <div class="form-heading"><p class="heading-input">Correo</p></div>
                        <input type="email" placeholder="Escriba su correo electronico" id="emailOper">
                    </div>
                    <div class="form-input">
                        <div class="form-heading"><p class="heading-input">Contraseña</p></div>
                        <input type="password" placeholder="Ingrese una contraseña" id="passwordOper">
                    </div>
                    <button id="addButton">Registrar</button>
                </form>
            </div>

            <div class="container_tabla" >
                <table >
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido paterno</th>
                            <th>Apellido materno</th>
                            <th>Correo</th>
                            
                        </tr>
                        <tbody id="userContainer">   
                        </tbody>
                    </head>    
                </table>
            </div>
        </div>
   
     
        <footer>
            <ul>
                <li><a href="#">Nosotros</a></li>
                <li><a href="#">Usuario</a></li>
                <li><a href="#">Ayuda</a></li>
            </ul>
        </footer>
     
    </div>
    <script type="text/javascript" src="FilesJS/registerValidation.js"></script>
</body>
</html>