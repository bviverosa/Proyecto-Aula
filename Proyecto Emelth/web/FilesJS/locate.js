document.addEventListener('DOMContentLoaded', function () {
id = document.getElementById("so").textContent;



function obtenerUbicacion() {
    
    return new Promise((resolve, reject) => {
        // Verificar si el navegador soporta la geolocalización
        if (navigator.geolocation) {
            // Obtener la ubicación
            navigator.geolocation.getCurrentPosition(
                function (position) {
                    const latitud = position.coords.latitude;
                    const longitud = position.coords.longitude;

                    console.log('Ubicación obtenida:\nLatitud: ' + latitud + '\nLongitud: ' + longitud);

                    resolve({ latitud, longitud });
                },
                function (error) {
                    reject(error);
                }
            );
        } else {
            reject(new Error("La geolocalización no es compatible con este navegador."));
        }
    });
}

const socket = new WebSocket('ws://10.0.0.23:8080/Proyecto_Emelth/endpoint');

socket.onopen = async () => {
    console.log('Conexión WebSocket establecida');

    try {
       
        const ubicacion = await obtenerUbicacion();

        const peticion = {
            tipo: 'peticion',
            rol:1,
            lat: ubicacion.latitud,
            lon: ubicacion.longitud,
            id:id
        };

        socket.send(JSON.stringify(peticion));
    } catch (error) {
        console.error('Error al obtener la ubicación:', error.message);
    }
};

socket.onmessage = (event) => {
    // Procesar mensajes recibidos a través del WebSocket
};

socket.addEventListener('close', () => {
    console.log('Conexión WebSocket cerrada');
});
});