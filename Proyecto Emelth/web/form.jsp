<%-- 
    Document   : form
    Created on : 26 nov 2023, 13:46:13
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
    <link rel="stylesheet" type="text/css" href="FilesCSS/navs.css">
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
            <div class ="form">
                <div class="personal-data">
                    <div class="user-data">
             <label><b>Datos del usuario</b></label>
             <label>Nombre del usuario</label>
             
            <input type="text" id="userName-input" placeholder="Nombre">
            <label>Apellido Paterno</label>
             <input type="text" id="userLastName1-input" placeholder="Apellido Paterno">
             <label>Apellido Materno</label>
             <input type="text" id="userlastName2-input" placeholder="Apellido Materno">
                </div>
                    <div class="pacient-data">
                        <label><b>Datos del Herido</b></label>
             <label>Nombre del Herido</label>
             
            <input type="text" id="pacientName-input" placeholder="Nombre">
            <label>Apellido Paterno</label>
             <input type="text" id="pacientLastName1-input" placeholder="Apellido Paterno">
             <label>Apellido Materno</label>
             <input type="text" id="pacientLastName1-input" placeholder="Apellido Materno">
             
                </div>
                </div>
                <div class="emergency-data">
                    <div class="description-container">
                        <label><b>Datos de la emergencia</b></label>
                        <label>Describa la emergencia</label>
                        <textarea placeholder="Escriba aqui" id="description-input"></textarea>
                    </div>
                <div class="more-data">
                    <div class=more-data_subcontainer>
                    <div class="coords-container">
                        <div>
                            <label>Coordenadas</label>
                        </div>
                        <div class="input-coords">
                            <input type="number" placeholder="latitud">
                            <input type="number" placeholder="longitud">
                        </div>
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
            <div class="close-code">
                <label>Codigo de cierre</label>
                <select class="selections">
                 <option>A (Afirmativo)</option>
                 <option>N (Negativo)</option>
                 <option>F (Falso)</option>


                </select>
            </div>
                    
                    <div class="Ambulance-data">
                        <div class="Ambulance-data_subcontainer">
                            <label><b> Datos de la ambulancia</b></label>
               <select class="selections">
                   <option>1</option>
                <option>2</option>
                <option>3</option>
           
                
            </select>
                        </div>
                        <div class="Ambulance-data_subcontainer">
                   <label>Placa </label>
                   <input type="text" placeholder="Placa de la ambulancia">
                   </div>
                    </div>
                       
                    </div>
                     <div class="more-data_subcontainer">
                            <div class="img-container">
                                <img src="https://th.bing.com/th/id/R.ee626e5ae85d14f321840445b0cb473d?rik=mK4pyA9oCTh0CA&pid=ImgRaw&r=0" alt="alt"/>
                            </div>
                        </div>
               </div>
            </div>
            
        </div>
      

            
        
     <!-- Cierre del contenedor principal -->

    <!--<footer>
        <ul>
            <li><a href="#">Nosotros</a></li>
            <li><a href="#">Usuario</a></li>
            <li><a href="#">Ayuda</a></li>
            
        </ul>
    </footer>
    </div>-->
   
        
         
        
   
</body>
</html>
