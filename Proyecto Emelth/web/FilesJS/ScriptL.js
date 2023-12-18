const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');
const login = document.getElementById('loginButton');
const emailLoginInput = document.getElementById('email-Login-Input');
const passwordLoginInput = document.getElementById('password-Login-Input');
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!¡?¿@#$%^&*()_+])[A-Za-z\d!¡?¿@#$%^&*()_+]{8,18}$/;
const regexName = /^[A-Z][a-z]{2,29}(\s[A-Z][a-z]{2,29}){1,2}$/;
const emailRegisterInput=document.getElementById("email-register-input");
const passwordRegisterInput=document.getElementById("password-register-input");
const nameRegisterInput=document.getElementById("name-register-input");
const register=document.getElementById("register-button");


registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

register.onclick=async function(event){
    event.preventDefault();
    const email=emailRegisterInput.value;
    const password=passwordRegisterInput.value;
    const name=nameRegisterInput.value;
    if (validateCredentials(email,password) && regexName.test(name)) {
        sendUser(email,password,name);
    }else{
        alert("Rellene todos los campos");
    }
};
login.onclick = async function(event) {
    event.preventDefault();
    const email = emailLoginInput.value;
    const password = passwordLoginInput.value;
    
    if (validateCredentials(email, password)) {
        const success = await sendCredentials(email, password);
        if (success > 0) {
    // Redirect based on user role
    switch (success) {
        case 1:
           
            window.location = 'home.jsp';
            break;
        case 2:
           
            window.location = 'HomeAdmin.jsp';
            break;
        case 3:
       
            window.location = 'HomeOper.jsp';
            break;
        // Add more cases for additional roles as needed
        default:
           
            window.location = 'index.jsp';
            break;
    }
    }
};

};

function validateCredentials(email, password) {
    if (email && password) {
        if (emailRegex.test(email)) {
            if (passwordRegex.test(password)) {
                return true;
            } else {
                alert("Contraseña inválida");
                return false;
            }
        } else {
            alert("Formato de email inválido");
            return false;
        }
    } else {
        alert("Rellene todos los campos");
        return false;
    }
}

async function sendCredentials(email, password) {
    const url = '/Proyecto_Emelth/Login';  // La URL del servlet
    const data = new URLSearchParams();
    
    data.append('action', 'add');
    data.append('email', email);
    data.append('password', password);

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

async function sendUser(email, password,name) {
    const url = '/Proyecto_Emelth/Register';  // La URL del servlet
    const data = new URLSearchParams();
    data.append('action', 'addUser');
    data.append('email', email);
    data.append('password', password);
    data.append('name',name);

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
