<%-- 
    Document   : index
    Created on : 26 nov 2023, 11:51:07
    Author     : bryda
--%>
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
                case 2:
                     response.sendRedirect("HomeAdmin.jsp");
                break;
                case 3:
                response.sendRedirect("HomeOper.jsp");
                
                
                default:;
                
                
               
                  }
                
            } else {
                // El usuario no está autenticado, redirecciona o realiza alguna acción adecuada
               
            }
        } else {
            // Sesión no disponible, redirecciona o realiza alguna acción adecuada
            response.sendRedirect("index.jsp");
        }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="FilesCSS/login.css">
    <title>Sign In | Sign Up</title>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
            <form>
                <h1>Crear cuenta</h1>
                <span></span>
                <div class="form-input">
                    <div class="form-heading"><p class="heading-input">Nombre</p></div>
                    <input type="text" placeholder="Escriba su nombre completo" id="name-register-input">
                </div>
                <div class="form-input">
                    <div class="form-heading"><p class="heading-input">Correo</p></div>
                    <input type="email" placeholder="Escriba su correo electronico" id="email-register-input">
                </div>
                <div class="form-input">
                    <div class="form-heading"><p class="heading-input">Contraseña</p></div>
                    <input type="password" placeholder="Ingrese una contraseña"id="password-register-input">
                    <p id="min-text">Al registrarte aceptas nuestros <a href="#">Terminos de servicio</a> y nuestro <a href="#">Aviso de privacidad</a></p>
                </div>
                <button id="register-button">Registrarse</button>
            </form>
        </div>
        <div class="form-container sign-in">
            <form>
                <h1>Iniciar sesión</h1>
                <span></span>
                <div class="form-input">
                    <div class="form-heading"><p class="heading-input">Correo electrónico</p></div>
                    <input type="email" id="email-Login-Input" placeholder="Escriba su correo electrónico">
                </div>  
                <div class="form-input">
                    <div class="form-heading"><p class="heading-input">Contraseña</p></div>
                    <input type="password" id="password-Login-Input" placeholder="Escriba su contraseña">
                <a href="#">Olvidé mi contraseña</a>
                </div>
                <button id="loginButton">Ingresar</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>¿Ya tienes una cuenta?</h1>
                    <span></span>
                    <p>Ingresa a tu cuenta personal aquí</p>
                    <button class="hidden" id="login"  >Iniciar sesión</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>¿Aún no tienes una cuenta?</h1>
                    <span></span>
                    <p>Registrate para acceder a todas las funciones</p>
                    <button class="hidden" id="register">Crear cuenta</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="FilesJS/ScriptL.js"></script>
</body>

</html>
