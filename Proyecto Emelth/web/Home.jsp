<%-- 
    Document   : Home
    Created on : 19 nov 2023, 18:06:23
    Author     : bryda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="FilesCSS/estilos_inicio.css">
      <link rel="stylesheet" href="FilesCSS/navs.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&family=Mulish:wght@200;300&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/31afa4227b.js" crossorigin="anonymous"></script>
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
                                   <a href="./Calls.html">Gestion de llamadas</a>
                               </li>
                               <li class="nav-li">
                                   <a href="./ambulance.jsp">Gestion de ambulancias</a>
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
        
        <div class="container">
            <div class="container_subcontainer">
                <div class="subcontainer_div-1">
                    <p class="div-1_heading">Texto tipo slogan sobre la transformación de nuestro proyecto</p>
                    <p class="div-1_text">Lorem ipsum dolor sit amet, consectetur<br>adipiscing elit. </p>
                    <button id="div-1_input">Registrarse</button>
                </div>
                <div class="subcontainer_recuadro"></div>
            </div>

            <div class="container_subcontainer subcontainer_width">
                <div class="subcontainer_recuadro recuadro_2"></div>
                <div class="subcontainer_div-1 div-1_complete">
                    <p class="div-1_heading div-1_heading-2">¿Qué hacemos?</p>
                    <hr>
                    <p class="div-1_text div-1_text-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam scelerisque pellentesque urna vel feugiat. Cras euismod hendrerit ligula, ut commodo massa volutpat eu. Donec at viverra nibh. Aenean luctus, enim eget eleifend blandit, nulla lectus sollicitudin arcu, finibus tempus lectus diam vel felis. Aliquam a placerat diam. </p>
                </div>
            </div>

            <div class="container_subcontainer">
                <div class="subcontainer_div-1 div-1_center">
                    <p class="div-1_heading div-1_heading-2">¿Cómo funciona EMELTH?</p>
                    <p class="div-1_text div-1_text-2 div-text_center">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam scelerisque pellentesque urna vel feugiat. Cras euismod hendrerit ligula, ut commodo massa volutpat eu. Donec at viverra nibh.</p>
                    <div class="subcontainer_icon">
                        <section class="benefit"><i class="fa-regular fa-heart" style="font-size: 24px;"></i><p class="div-1_text div-1_text-2 benefit-text">Beneficio</p></section>
                        <section class="benefit"><i class="fa-solid fa-clock-rotate-left" style="font-size: 24px;"></i><p class="div-1_text div-1_text-2 benefit-text">Beneficio</p></section>
                        <section class="benefit"><i class="fa-solid fa-truck-medical" style="font-size: 24px;"></i><p class="div-1_text div-1_text-2 benefit-text">Beneficio</p></section>
                    </div>
                    <div class="subcontainer_icon-2">
                        <section class="characteristic"><i class="fa-regular fa-circle" style="font-size: 24px;"></i><p class="div-1_text div-1_text-2 characteristic-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p></section>
                        <section class="characteristic"><i class="fa-regular fa-circle" style="font-size: 24px;"></i><p class="div-1_text div-1_text-2 characteristic-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p></section>
                        <section class="characteristic"><i class="fa-regular fa-circle" style="font-size: 24px;"></i><p class="div-1_text div-1_text-2 characteristic-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p></section>
                        
                    </div>
                    <div class="subcontainer_incentive">
                        <p class="div-1_text incentive_text">¡Comienza ahora!</p>
                        <p class="div-1_heading div-1_heading-2 div-1_heading-3">Texto tipo slogan sobre la transformación de nuestro proyecto</p>
                        <button id="div-1_input">Registrarse</button>
                    </div>
                </div>
                
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
