/*2. Crear un archivo app.js que "consuma" el archivo de clases.json. 

Mostrar el
listado de clases existentes por consola. Para esto, ¿necesitamos usar el
módulo nativo “fs”? ¿o con sólo require("archivo.json") ya obtenemos el
array de objetos?.

XtraPlus2: Manejar el error si no encuentra el archivo (try catch). */

let fs = require ('fs');

let clasesJSON = fs.readFileSync ('clases.JSON', 'utf-8');

let claseArray = JSON.parse (clasesJSON);

claseArray.forEach(function(unaClase) {
    console.log(unaClase.titulo)
});

/*3.
Crear una función para filtrar las clases por su estado, asignándolas a
diferentes arrays de objetos literales y guardar todo esto ordenado por
estado, en un archivo.json.

XtraPlus3: Mediante una función arrow guardar cada array en un archivo diferente
según corresponda el estado. Por ejemplo: “repasar.json”, “terminadas.json”. */

function arrayFiltrado (estado, clases){

    let arrayFiltrado = clases.filter (function(clase){
        return clase.estado == estado
    })

    return arrayFiltrado;
}

let claseTerminada = arrayFiltrado( "terminada", claseArray);
let claseRepasar = arrayFiltrado( "repasar", claseArray);
let clasePendiente = arrayFiltrado( "pendiente", claseArray);

console.log(clasePendiente);
console.log(claseRepasar);
console.log(claseTerminada);