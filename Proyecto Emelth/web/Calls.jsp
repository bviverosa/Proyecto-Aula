<%-- 
    Document   : Calls
    Created on : 26 nov 2023, 13:44:46
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
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="FilesCSS/navs.css">
    <link rel="stylesheet" type="text/css" href="FilesCSSS/components.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200;300&display=swap" rel="stylesheet">
</head>
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
                       Inicio
                       </div>
                   </li>
                   <li>
                       <div class="nav-label">
                       Gestion
                       </div>
                       <div class="menu-container">
                           <ul class="nav-ul">
                               <li class="nav-li">
                                   Gestion de llamadas
                               </li>
                               <li class="nav-li">
                                   Gestión de Ambulancias
                               </li>
                           </ul>
                       </div>
                   
                   </li>
                       
                   <li><div class="nav-label">
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
        <div class="form_container">
            <div class ="form">
             <label>Encuentre el registro de llamada</label>
            <input type="text" placeholder="Buscar">
            <label> Seleccione un filtro</label>
            <select class="selects">
                <option>Placa</option>
                <option>Institucion</option>
                
            </select>
            <button id="buscar" class="blue_buttons" >Buscar</button>
            </div>
            
        </div>
        <div class="history-container">
            <div class="rows-container">
                <div class="info-row">
            <div class="rows"><label>Nombre de la persona   /   Fecha de creación </label></div>
            <div class="info-container">
                
            <div class="sub_container-row">
                <div>
                    <div>
                        <label>Nombre del paciente</label>
                        <input type="text" placeholder>
                    </div>
                    <div class="date-container">
                        <div>
             <label>Fecha de creación</label>
               <input type="date">
                        </div>
                        <div>
             <label>Fecha de cierre</label>
               <input type="date">
                        </div>
                    </div>
                    <div class="name-container">
                         <label>Nombre del operador</label>
             
            <input type="text" id="userName-input" placeholder="Nombre">
                    </div>
                   
                    
                </div>
            </div>
            <div class="sub_container-row">
             <div class="description-container">
                        <label><b>Datos de la emergencia</b></label>
                        <label>Describa la emergencia</label>
                        <textarea placeholder="Escriba aqui" id="description-input"></textarea>
                    </div>
        </div>
                </div>
    </div>
            <div class="rows"><label>Nombre de la persona   /   Fecha de creación </label></div>
            <div class="rows"><label>Nombre de la persona   /   Fecha de creación </label></div>
            <div class="rows"><label>Nombre de la persona   /   Fecha de creación </label></div>
            </div>
            
        </div>
            
        
     <!-- Cierre del contenedor principal -->

    <footer>
        <ul>
            <li><a href="#">Nosotros</a></li>
            <li><a href="#">Usuario</a></li>
            <li><a href="#">Ayuda</a></li>
            
        </ul>
    </footer>
    </div>
    
        
   
        
         
        
   
</body>
</html>