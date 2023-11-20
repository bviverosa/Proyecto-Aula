/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const addAmbulanceButton=document.getElementById("add_ambulance");
addAmbulanceButton.onclick=openDiv;
const AmbulanceEnable=document.getElementById("add-ambulance_enable");
function openDiv(){
    AmbulanceEnable.style.display = "flex";
    
}