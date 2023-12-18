




const name= document.getElementById("nameForm");
const lastname1= document.getElementById("lastName1Form");
const lastname2= document.getElementById("lastName2Form");
const addButton=document.getElementById("addButton");
const emailInput=document.getElementById("emailOper");
const passwordInput=document.getElementById("passwordOper");
 const regex = /^[A-Z][a-z\s]*$/;
 const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
 const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!¡?¿@#$%^&*()_+])[A-Za-z\d!¡?¿@#$%^&*()_+]{8,18}$/;
addButton.onclick=function(){
    event.preventDefault();
    validate();
    
    
};
function validate(){
        firstValue=name.value;
        secondValue=lastname1.value;
        thirdValue=lastname2.value;
        email= emailInput.value;
        password=passwordInput.value;
        if(validateForm(firstValue,secondValue,thirdValue,email,password)){
             alert("ingreso");
             console.log(thirdValue);
                sendUser(email,password,firstValue,secondValue,thirdValue);
             
             
            
        }
};
function validateForm(name,lastName1,lastName2,email, password){
    
    if(name && lastName1 && lastName2 && email && password){
             if(regex.test(firstValue)&& regex.test(secondValue) && regex.test(thirdValue)&&emailRegex.test(email) && passwordRegex.test(password)){
                alert("Valido");
             
                return true;
                 
                 
             }
             
             
            
        }else{
            alert("Rellene todos los campos correctamente");
            return false;
        }
    
    
    
    
}

async function sendUser(email, password,name,lastName1,lastName2) {
   
    const url = '/Proyecto_Emelth/Register';  // La URL del servlet
    const data = new URLSearchParams();
    data.append('action', 'addOper');
    data.append('email', email);
    data.append('password', password);
    data.append('name',name);
    data.append('lastname',lastName1);
    data.append('lastname2',lastName2);
    

    try {
        const response = await fetch(url, {
            method: 'POST',
            body: data
        });

        const result = await response.json();
        console.log(result.success);
        return result.success;
    } catch (error) {
        console.error('Error en la solicitud:', error);
        return false;
    }
}
;
async function obtenerUsuarios() {
    const url = '/Proyecto_Emelth/userHistory';
    const data = new URLSearchParams();
    data.append('action', 'getUser');

    try {
        const response = await fetch(url, {
            method: 'POST',
            body: data
        });

        if (!response.ok) {
            throw new Error(`Server responded with status ${response.status}`);
        }

        const result = await response.json();
         console.log(result);
       return Promise.resolve(result);
    } catch (error) {
        console.error('Error in the request:', error.message);
        return false;
    }
}
function mostrarDetalles(userList) {
    const userDetails = document.getElementById('userContainer');
    userDetails.innerHTML="";

    userList.forEach(user => {
     
        const detailItem = document.createElement('tr');
        detailItem.innerHTML =  `
                                <td>${user["id"]}</td>
                                <td>${user["Name"]}</td>
                                <td>${user["lastName1"]}</td>
                                
                                <td>${user["lastName2"]}</td>
                                <td>${user["email"]}</td>
                                
`;
        userDetails.appendChild(detailItem);
    });
}

obtenerUsuarios()
 .then(data => mostrarDetalles(data))
    .catch(error => console.error('Error al obtener datos del servidor:', error));
    ;
