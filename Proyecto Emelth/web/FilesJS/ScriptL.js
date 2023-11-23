const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');
const login = document.getElementById('loginButton');
const emailLoginInput = document.getElementById('email-Login-Input');
const passwordLoginInput = document.getElementById('password-Login-Input');
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!¡@#$%^&*()_+])[A-Za-z\d!¡@#$%^&*()_+]{8,18}$/;

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

login.onclick = async function() {
    event.preventDefault();
    const email = emailLoginInput.value;
    const password = passwordLoginInput.value;
    
    if (validateCredentials(email, password)) {
        const success = await sendCredentials(email, password);

        if (success) {
            window.location = 'Home.jsp';
        } else {
            alert("Usuario o contraseña incorrectos");
        }
    }
};

function validateCredentials(email, password) {
    if (email && password) {
        if (emailRegex.test(email)) {
            if (passwordRegex.test(password)) {
                return true;
            } else {
                alert("Contraseña invalida");
                return false;
            }
        } else {
            alert("Formato de email invalido");
        }
    } else {
        alert("Rellene todos los campos");
        return false;
    }
}

async function sendCredentials(email, password) {
    const url = `/Proyecto_Emelth/Login?action=add&email=${encodeURIComponent(email)}&password=${encodeURIComponent(password)}`;

    try {
        const response = await fetch(url, {
            method: 'GET',
        });

        const result = await response.json();
        console.log(result.success);
        return result.success;
    } catch (error) {
        console.error('Error en la solicitud:', error);
        return false;
    }
}
