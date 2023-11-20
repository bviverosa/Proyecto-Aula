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
             break;
                 
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
            addAmbulance(ambulancePlates.value,firstOption,thirdOption);
        }
        
     
 }
 function addAmbulance(plateNumber, institution,service) {
    // Obtén los valores del formulario que deseas enviar al servlet
   console.log(plateNumber);
   console.log(institution);
   console.log(service);
    // Otros campos según tu formulario

    // Construye los datos que se enviarán al servlet
   // Construye la URL con los parámetros
 let url = `/Proyecto_Emelth/Ambulances?action=add&plateNumber=${encodeURIComponent(plateNumber)}&institution=${encodeURIComponent(institution)}&service=${encodeURIComponent(service)}`;
// Realiza la llamada Fetch con método GET
fetch(url, {
    method: 'GET',
})
.then(response => response.text())
.then(result => {
    alert(result);
})
.catch(error => {
    console.error('Error en la solicitud:', error);
});

}

 
