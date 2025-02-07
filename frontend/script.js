// Función para mostrar un saludo personalizado en la consola
window.onload = () => {
    const nombre = "Carlos"; // Aquí podemos poner tu nombre o el que prefieras
    console.log(`Bienvenido a la página de Series y Películas, ${nombre}!`);

    // También podemos agregar un saludo en la página
    const saludo = document.createElement('div');
    saludo.style.textAlign = 'center';
    saludo.style.fontSize = '20px';
    saludo.style.color = '#333';
    saludo.style.marginTop = '20px';
    saludo.innerText = `Bienvenido a nuestra página! Disfruta de las mejores series y películas.`;
    document.body.insertBefore(saludo, document.querySelector('.container'));
};
