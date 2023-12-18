<%-- 
    Document   : control
    Created on : 17 dic 2023, 16:32:03
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
                case 2:
                     response.sendRedirect("HomeAdmin.jsp");
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
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="FilesCSS/estilos_inicio.css">
      <link rel="stylesheet" href="FilesCSS/navs.css">
    
    <link rel="stylesheet" type="text/css" href="./FilesCSS/requests.css">
     <link rel="stylesheet" type="text/css" href="./FilesCSS/components.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200;300&display=swap" rel="stylesheet">
<body>
    <div class="wrapper"> 
        <div class="top-container">
            <div class="logo-container">
                <label>logo</label>
            </div>
        <div class="nav-container">
            
       <nav>
           <div class="nav-left">
               <ul>
                   
                   <li>
                      <div class="nav-label">
                          <a href="./form.html">Inicio</a>
                       </div>
                   </li>
                   <li>
                       <div class="nav-label">
                       Gestion
                       </div>
                       <div class="menu-container">
                           <ul class="nav-ul">
                               <li class="nav-li">
                                   <a href="./form.jsp">Registrar llamada</a>
                               </li>
                              
                           </ul>
                       </div>
                   
                   </li>
                       
                   <li>
                       <div class="nav-label">
                       Ayuda
                       </div>
                   </li>
                   <li>
                       <div class="nav-label">Contacto</div>
                   </li>
                 
                   
               </ul>
           </div>
           <div class="nav-right">
               <ul>
                   <li>Inicio</li>
               </ul>
               
           </div>
       </nav>
        </div>
        </div>
       
        <div class="request_container">
            <div class="text-container">
            
                <label class="Titles"> <b>Control de llamadas</b></label>
        </div>
           
                 <div class="rows-container" id="pet-container">
               
           
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
    <script type="text/javascript" src="./FilesJS/recieve.js"></script>
</body>
</html>