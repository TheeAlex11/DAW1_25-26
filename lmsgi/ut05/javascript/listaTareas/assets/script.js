// 0. Las constantes y variables
let input = document.querySelector('#tareaInput');
let lista = document.querySelector('#listaTareas');
let botonAgregar = document.querySelector('#agregarTarea');
let botonEliminar = document.querySelector('#eliminarFinalizadas');

// 1. La captura
// los elementos ya están capturados arriba

// 2. El procesado (las acciones)
function agregar() {
    let texto = input.value;

    if (texto.length == 0) {
        return;
    }

    let li = document.createElement('li');
    li.textContent = texto;
    lista.appendChild(li);

    li.addEventListener('click', function() {
        li.classList.toggle('hecha');
    });

    input.value.length = 0;
}

function eliminarFinalizadas() {
    let confirmar = confirm('¿Eliminar las tareas finalizadas?');

    if (confirmar == true) {
        let tareasHechas = lista.querySelectorAll('li.hecha');
        tareasHechas.forEach(function(tarea) {
            tarea.remove();
        });
    }
}

// 3. Los eventos (los desencadenantes)
botonAgregar.addEventListener('click', agregar);
botonEliminar.addEventListener('click', eliminarFinalizadas);
