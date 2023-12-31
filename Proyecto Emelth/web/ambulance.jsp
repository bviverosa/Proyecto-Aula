<%-- 
    Document   : ambulance
    Created on : 19 nov 2023, 17:06:34
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
     <link rel="stylesheet" type="text/css" href="FilesCSS/requests.css">
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
                                   <a href="./form.html">Registro de llamada</a>
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
                       <div class="nav-label"><a href="./contactUS.html">Contacto</a></div>
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
       
        <div class="buttons">
            <button  class="gray_button" id="add_ambulance">
                Agregar +
            </button>
            <button class="gray_button" id="history_button">Recargar Historial</button>
        </div>
        <div class="form_container">
            <div class ="form">
             <label>Encuentre la ambulancia que busca</label>
            <input type="text"  id="ambulanceFilter" placeholder="Buscar"> 
            <label> seleccione un filtro</label>
            <select class="selects" id="selectFilter">
                <option value="Placa">Placa</option>
                <option value="Nombre de institución">Institucion</option>
                
            </select>
            <button id="searchButton" class="blue_buttons" >Buscar</button>
            </div>
            
            
        </div>
        <div class="form_container">
            <div class ="form" id="history_container">
                
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
    <div  class="add-ambulance_enable" id="add-ambulance_enable" style="display: none">
        
        <div class=" sub_add-ambulance">
            <label id="close_button">X</label>
            <label> Placa de la ambulancia</label>
            <input type="text" placeholder="Placa de  la ambulancia" id="ambulancePlate" >
             <label> Institucion a la que pertenece</label> 
          
             <select class="selects" id="selectInstitution">
                <option value="10">Centro Regulador de unidades Medicas</option>
                <option value="11">Cruz Roja</option>
                <option value="12">Escuadron de Rescate y Urgencias Medicas</option>
                  <option value="13">Protección Civil</option>
                            </select>
                <label> Tipo de servicio autorizado</label>
                 <select class="selects" id="selectType">
                <option value="90">Traslado Asistencial Básico (TAB)</option>
                <option value="91">Traslado Asistencial Medicalizado (TAM)</option>
                <option value="92">Traslado Asistencial Básico Intermunicipal</option>
                <option value="93">Traslado Asistencial Medicalizado Intermunicipal</option>
                 
                            </select>
             <button class="blue_buttons" id="add_ambulanceButton">Agregar</button>
         </div>
        
         
        
    </div>
    
    
    <script  type="text/javascript" src="FilesJS/validations.js"></script>
     <script  type="text/javascript" src="FilesJS/history.js"></script>
     <script  type="text/javascript" src="OnOpen.js"></script>
</body>

</html>