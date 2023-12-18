 
function obtenerDatos() {
    let url = `/Proyecto_Emelth/Ambulances?action=history`;

    // Retorna la promesa resultante de la llamada fetch
    return fetch(url, {
        method: 'GET'
    })
    .then(response => response.json()) 
    .then(result => {
        console.log(result);
        return Promise.resolve(result);

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
        return Promise.reject(error);
        
        
        
    });
}

function mostrarDetalles(ambulanceList) {
    const ambulanceDetails = document.getElementById('history_container');
    ambulanceDetails.innerHTML="";

    ambulanceList.forEach(ambulance => {
        const detailsContainer = document.createElement('div');
        const detailItem = document.createElement('div');
        detailItem.innerHTML =  `<div class="rows"><details><summary>${ambulance["Placas"]}/${ambulance["Institución"]}</summary>${ambulance["Estado"]},${ambulance["Servicio"]}</details><div>`;
        detailsContainer.appendChild(detailItem);
        detailsContainer.setAttribute("class","hola");
        ambulanceDetails.appendChild(detailsContainer);
    });
}

obtenerDatos()
    .then(data => mostrarDetalles(data))
    .catch(error => console.error('Error al obtener datos del servidor:', error));

let buttonReload= document.getElementById("history_button");
buttonReload.onclick=function(){
    obtenerDatos()
    .then(data => mostrarDetalles(data))
    .catch(error => console.error('Error al obtener datos del servidor:', error));
    
}

