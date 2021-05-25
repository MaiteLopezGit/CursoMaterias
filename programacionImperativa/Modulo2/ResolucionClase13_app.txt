
console.log("**********  MD1 punto 2) ***********");
const fs = require('fs');

const leerArchivo = (ruta) => {
  const jsonData = fs.readFileSync(ruta, "utf8")
  return JSON.parse(jsonData)
}

const clases = leerArchivo("./clases.json")

//clases.forEach(e => console.log(e))
clases.forEach(function (e) { console.log(e.titulo) })


console.log("************** MD1 punto 3) ****************")

const divideBy = (estado, clases) => {
  let arrayFiltrado = clases.filter(clase => clase.estado === estado)
  return arrayFiltrado
}

let terminadas = divideBy("terminada", clases)
let repasar = divideBy("repasar", clases)
let pendiente = divideBy("pendiente", clases)
console.log(terminadas);
console.log(repasar);
console.log(pendiente);

const datosSeparados = [terminadas, repasar, pendiente]
fs.writeFileSync("./clasesOrdenadas.json", JSON.stringify(datosSeparados))


console.log("********* MD1 punto 3) XtraPlus3 *********")
let data = JSON.stringify(terminadas)
let ruta = "./terminadas.txt"
fs.writeFileSync(ruta, data)

data = JSON.stringify(repasar)
ruta = "./repasar.txt"
fs.writeFileSync(ruta, data)

data = JSON.stringify(pendiente)
ruta = "./pendiente.txt"
fs.writeFileSync(ruta, data)

//con arrow func
const guardar = (ruta, datos) => {
  let data = JSON.stringify(datos)
  fs.writeFileSync(ruta, data)
}

guardar("./terminadas.txt", terminadas)
guardar("./repasar.txt", terminadas)
guardar("./pendiente.txt", terminadas)

