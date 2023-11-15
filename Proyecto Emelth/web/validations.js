/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
 
 const plates= document.getElementById("ambulanceFilter");
 const expressionPlates=/pene/;
 function validatePlates(plates){
     const value = plates.value;
     if(expressionPlates.test(value)){
         alert("pene");
     }
     
     
     
 }