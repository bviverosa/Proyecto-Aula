/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener('DOMContentLoaded', function () {
    const socket = new WebSocket('ws://10.0.0.23:8080/Proyecto_Emelth/endpoint');
    socket.onopen =  () => {
    console.log('Conexión WebSocket establecida');

    try {
       
      

        const peticion = {
            tipo: 'obtener',
            rol:3
            
           
        };
         socket.send(JSON.stringify(peticion));

    } catch (error) {
        
    }
};
socket.onmessage = (event) => {
         const userDetails = document.getElementById('pet-container');
       
       const data = JSON.parse(event.data);
       console.log(data);
       if (data.tipo === 'peticion') {
       
      
         userDetails.innerHTML +=  `<div class="rows" onclick=handleRowClick('${data.id}')><details><summary>${data.id}</summary></details><div>`;
    }
       
};
});
function handleRowClick(id){
   
    const url = '/Proyecto_Emelth/Control';
    const data = new URLSearchParams();
    data.append('action', 'trytochange');
     data.append('id', id);
    
    
    
    
};