let autos = require("./autos");

let concesionaria = {
  autos: autos,

  buscarAuto: function (patente) {
    for (let i = 0; i < autos.length; i++) {
      if (patente == autos[i].patente) {
        return autos[i];
      }
    }
    return null;
  },
  venderAuto: function (patente) {
    this.buscarAuto(patente).vendido = true;
  },
  autosParaLaVenta: function () {
    let autosVendidos = [];
    for (let i = 0; i < autos.length; i++) {
      if (autos[i].vendido == false) {
        autosVendidos.push(autos[i]);
      }
    }
    return autosVendidos;
  },


  autosNuevos: function (){
    let autos0Km = [ ]
    let arrayAutosParaLaVenta = this.autosParaLaVenta()

    for (let i = 0; i < arrayAutosParaLaVenta.length; i++){
        
      if(arrayAutosParaLaVenta[i].km < 100){
          autos0Km.push(arrayAutosParaLaVenta[i])
       }
    }
    return autos0Km
 },
 listaDeVentas: function (){
     let dineroVentas = []
    for (let i = 0; i <autos.length; i++){
       if(autos[i].vendido== true){
       dineroVentas.push (autos[i].precio)
       }
       }
    return dineroVentas;
},
puedeComprar: function (auto, persona) {
    let cuotas = auto.precio/auto.cuotas
    if(auto.precio >= persona.capacidadDePagoTotal){
       return false
    }
    else{
       if (persona.capacidadDePagoEnCuotas<cuotas){
          return false
       }
       else {return true}
    }
},

autosQuePuedeComprar:  function (persona){
    let listaDeAutos = []
    let autosVenta = this.autosParaLaVenta();

    for(let i=0; i<autosVenta.length;i++){
       if(this.puedeComprar(autosVenta[i],persona)==true){
          listaDeAutos.push(autosVenta);
       }
    }

    return listaDeAutos;
 }
};

let auto = {
    marca : "Ford",
    modelo : "Fiesta",
    precio : 150000,
    km : 200,
    color: "Azul",
    cuotas: 12,
    anio: 2019,
    patente: "APL123",
    vendido : false
}

let persona = {
    nombre: "Juan",
    capacidadDePagoEnCuotas: 20000,
    capacidadDePagoTotal: 200000
    }
let variable = concesionaria.autosQuePuedeComprar(persona);
console.log(variable)
