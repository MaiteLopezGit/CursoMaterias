//EJERCICIO 1
let fs = require('fs');
let departamentosJSON = fs.readFileSync(__dirname + '/departamentos.json', 'UTF-8');
let departamentos = JSON.parse(departamentosJSON);

let inmobiliaria = {

  departamentos: departamentos,
  //2
  departamentosDisponibles: function () {
    return this.departamentos.filter(departamento => departamento.disponible);
  },
  //3
  listarDepartamentos: function (arrayDepartamentos) {
    arrayDepartamentos.forEach(departamento => {
      let estado = departamento.disponible ? "Disponible" : "Alquilado";
      console.log(
        "id: " + departamento.id + ", $" + departamento.precioAlquiler + " y está " + estado
      );
    });
  },
  //4
  buscarPorId: function (id) {
    return this.departamentos.find(departamento => departamento.id === id);
  },
  //5
  buscarPorPrecio(precio) {
    let departamentosDisponibles = this.departamentosDisponibles();
    let d = departamentosDisponibles.filter(departamento => departamento.precioAlquiler <= precio);
    return d
  },
  //6
  ordenarPorPrecio: function () {
    return this.departamentos.sort((a, b) => b.precioAlquiler - a.precioAlquiler);
  },
  //7
  alquilarDepartamento: function (id) {
    let departamento = this.buscarPorId(id)

    if (departamento.disponible) {
      departamento.disponible = false;
      console.log("" + departamento.id + " alquilado");
    } else if (departamento.disponible === false) {
      console.log("El departamente no se encuentra disponible");
    } else {
      console.log("Por favor, ingresar un numero de id correcto. No se encuentran coincidencias");
    }
  },
  //8
  ingresosMensuales: function () {
    let alquilados = this.departamentos.filter(departamento => departamento.disponible === false)
    return alquilados.reduce((acum, departamento) => acum + departamento.precioAlquiler, 0)
  },
  precioConImpuesto: function (porcentaje) {
    let disponibles = this.departamentosDisponibles()
    return disponibles.map(departamento => departamento.precioAlquiler + (departamento.precioAlquiler * (porcentaje / 100)))
  },
  preferenciasCliente: function (cantHabitacion, cantPersonas, precioAlquiler, mascotas) {
    let disponibles = this.departamentosDisponibles();
    let resultado = disponibles.filter(departamento =>
      departamento.cantidadHabitacion === cantHabitacion
      && departamento.aceptaMascotas === mascotas
      && departamento.cantidadPersonas <= cantPersonas
      && departamento.precioAlquiler <= precioAlquiler
    )
    return resultado
  },
  comentar: function (id, comentario, puntuacion) {
    let deptoComentar = this.departamentos.find(departamento => departamento.id === id);
    let comentarioCliente = {
      comentario,
      puntuacion,
    }
    if (deptoComentar) {
      console.log("Comentario realizado correctamente");
      deptoComentar.comentarios.push(comentarioCliente);
    } else {
      console.log("No se encontraron coincidencias");
    }
  },
}

/*EJ 1 */
console.log("****** dptos *****");
inmobiliaria.listarDepartamentos(inmobiliaria.departamentos)
console.log();

/* EJ 2 -B */
console.log("***** disponibles *****");
inmobiliaria.listarDepartamentos(inmobiliaria.departamentosDisponibles())
console.log();

/*EJ 2 -C */
console.log("***** lista *****");
inmobiliaria.listarDepartamentos(inmobiliaria.departamentos)
console.log();

/* EJ 2 -D */
console.log("***** buscarpor ID *****");
console.log(inmobiliaria.buscarPorId(17));
console.log();

/* EJ 2 -E */
console.log("***** buscar por precio ******");
inmobiliaria.listarDepartamentos(inmobiliaria.buscarPorPrecio(4200))
console.log();

/*EJ 2 -F*/
console.log("****** ordenar por precio ******");
inmobiliaria.listarDepartamentos(inmobiliaria.ordenarPorPrecio())
console.log();

/* EJ 2 -G */
console.log("***** mostrar precio con impuesto *****");
// console.log(inmobiliaria.departamentos);
console.log(inmobiliaria.precioConImpuesto(10));
// console.log(inmobiliaria.departamentos);
console.log();

/* EJ 2 -H */
console.log("***** alquilar dpto *****");
inmobiliaria.alquilarDepartamento(17)
console.log(inmobiliaria.buscarPorId(17))
console.log();

/* EJ 2 -I */
console.log("***** suma alquileres *****");
console.log(inmobiliaria.ingresosMensuales())
console.log();

//*****************ADICIONALES*******************
/* Adicionales -A */
console.log("**** Comentar *****");
inmobiliaria.comentar(17, "Excelente Atencion :)", 5);
console.log(inmobiliaria.buscarPorId(17))
console.log();

/* Adicionales -B */
console.log("**** Preferencias Cliente *****");
inmobiliaria.listarDepartamentos(inmobiliaria.preferenciasCliente(2, 2, 5000, true));

