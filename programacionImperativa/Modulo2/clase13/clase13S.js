/*1. Crear un archivo clases.json que contenga un array de objetos literales con
formato JSON. 

Cada objeto literal deberá tener las propiedades: título y
estado. 

En donde la primera podrá ser cualquier cadena de texto, por ejemplo,
“Introduccion a la Programacion” y la segunda, “terminada”, “repasar”,
“pendiente”.
XtraPlus1: Agregar otra propiedad descripción.*/

let clases = [{
    titulo : "Introduccion a la Programacion",
    estado : "repasar",
    descripcion : "Materia en donde se ven contenidos de Java Script",
},
{
    titulo : "Medtodologia de trabajo", 
    estado : "terminada",
    descripcion : "Materia en donde se ven contenidos de Learn Agility",
},
{
    titulo : "Base de datos",
    estado : "repasar",
    descripcion : "Materia en donde se ven contenidos de mySQL",
}]

let clasesJSON = JSON.stringify (clases)

let fs = require ('fs');

fs.writeFileSync ('clases.JSON', clasesJSON);


