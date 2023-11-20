/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
 
 let addButton = document.getElementById("add_ambulanceButton");
 let searchButton=document.getElementById("searchButton");
 let expressionPlates=/^AM\d{4}$/;
 let ambulanceFilter = document.getElementById("ambulanceFilter");
 let filterSelect= document.getElementById("selectFilter");
 let ambulancePlates= document.getElementById("ambulancePlate");
 let instititution= document.getElementById("selectInstitution");
 let Type= document.getElementById("selectType");
 

searchButton.onclick= function(){
    option = filterSelect.value;
    validatePlates(ambulanceFilter.value, option);
};
addButton.onclick= function(){
     validate();
};

function validatePlates(value, option){
     
     if(value){
         switch (option){
             case "Placa":
                 if(expressionPlates.test(value)){
                     alert("Placas validas");
                     return  true;
                }else{
                    alert("Placas no validas");
                    return false;
                 }
                 break;
             case "Institución":
                 if(value>9 && value<14 ){
                     alert("Institucion valida");
                     return  true;
                }else{
                    alert("Institucion no valida");
                    return false;
                 }
                 break;
             case "Servicio":
                 if(value >89 && value<94){
                     alert("Servicio Valido");
                     return true;
                 }else{
                     return false;
                 }
                 
                ;
                 
         }
     }else{
        alert("Rellene todos los campos");
        return false;
     }
 
     
     
     
 }
 function validate(){
     firstOption = parseInt(instititution.value);
     thirdOption= parseInt(Type.value);
        firstValidation= validatePlates(ambulancePlates.value,"Placa" );
        secondValidation= validatePlates(firstOption,"Institución");
        thirdValidation= validatePlates(thirdOption,"Servicio");
        if (firstValidation && secondValidation && thirdValidation){
            alert("Regitro exitoso");
        }
        addAmbulance(ambulancePlates.value,firstOption,thirdOption);
     
 }
 function addAmbulance(plateNumber, institution,service) {
    // Obtén los valores del formulario que deseas enviar al servlet
   
    // Otros campos según tu formulario

    // Construye los datos que se enviarán al servlet
    let data = new FormData();
    data.append("plateNumber", plateNumber);
    data.append("institution", institution);
     data.append("service", service);
  
    // Otros campos según tu formulario

    // Realiza la llamada Fetch al servlet
    fetch('/Proyecto_Emelth/Ambulances', {
        method: 'POST',
        body: data
    })
    .then(response => response.text())
    .then(result => {
        alert(result); // Muestra la respuesta del servlet (puede personalizar esto según tus necesidades)
    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });
}

 
