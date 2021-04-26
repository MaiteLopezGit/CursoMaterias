//**********EJERCICIOS IF TERNARIO ************************//

//********SEMAFORO PEATONAL*******************************//

function semaforoPeatonal(semaforo) {
  semaforo = semaforo.toUpperCase();
  if (semaforo == "BLANCO") {
    console.log("\tPuede cruzar");
  } else {
    console.log("\tNo puede cruzar");
  }
}
console.log("\n******SEMAFORO CON IF*******");
semaforoPeatonal("rojo");
semaforoPeatonal("blanco");

function semaforoPeatonalIFTernario(semaforo) {
  semaforo = semaforo.toUpperCase();
  return semaforo == "BLANCO" ? "\tPuede cruzar" : "\tNo puede cruzar";
}

console.log("\n******SEMAFORO CON IF TERNARIO*******");
console.log(semaforoPeatonalIFTernario("blanco"));
console.log(semaforoPeatonalIFTernario("rojo"));

//**********MAYOR DE EDAD O NO*****************//
function mayorDeEdad(edad) {
  if (edad < 18) console.log("\tUsted no es mayor de edad");
  else console.log("\tUsted es mayor de edad");
}

console.log("\n******MAYOR DE EDAD CON IF*******");
mayorDeEdad(17);
mayorDeEdad(30);
mayorDeEdad(18);

function mayorDeEdadIfTernario(edad) {
  return edad < 18 ? "\tUsted no es mayor de edad" : "\tUsted es mayor de edad";
}

console.log("\n******MAYOR DE EDAD CON IF TERNARIO*******");
console.log(mayorDeEdadIfTernario(17));
console.log(mayorDeEdadIfTernario(30));
console.log(mayorDeEdadIfTernario(18));

//***********EJERCICIO 1: Numero par impar***************//
function esPar(numero) {
  return numero % 2 == 0 ? "\tEs par" : "\tEs impar";
}

console.log("\n******NUMERO PAR O IMPAR CON OF TERNARIO*******");
console.log(esPar(7));
console.log(esPar(6));

//**********EJERCICIO 2: Levantar barrera*************//
function levantarBarrera(pagaPeaje) {
  return pagaPeaje == "si" ? "\tLevantar barrera" : "\tNo levantar barrera";
}

console.log("\n******LEVANTAR LA BARRERA CON IF TERNARIO*******");
console.log(levantarBarrera("si"));
console.log(levantarBarrera("no"));

//***********EJERCICIO 3: Numero entre ENTERO 0 y 10*********//
function numero10y0(numero) {
  return numero == Math.round(Math.random() * 10)
    ? "\tEs igual"
    : "\tEs diferente";
}

console.log(
  "\n******NUMERO ENTERO ENTRE 0 Y 10 IGUAL AL RANDOM CON IF TERNARIO*******"
);
console.log(numero10y0(4));

//*************EJERCICIO 4: Es navidad************//
function esNavidad(fecha) {
  return fecha == "25-12" ? "\tEs navidad" : "\tNo es navidad";
}

console.log("\n******ES NAVIDAD CON IF TERNARIO*******");
console.log(esNavidad("25-12"));
console.log(esNavidad("12-4"));

//**********EJERCICIO 5: Cantidad de dias en los meses**********//
function numeroMeses(mes) {
  switch (mes) {
    case "abril":
    case "junio":
    case "septiembre":
    case "noviembre":
      console.log("\tTiene 30 dias");
      break;
    case "febrero":
      console.log("\tTiene 28 dias");
      break;
    default:
      console.log("\tTiene 31 dias");
  }
}

console.log("\n******CANTIDAD DE DIAS DEL MES CON SWITCH*******");
numeroMeses("febrero");
numeroMeses("abril");
numeroMeses("enero");

//**************EJEERCICIO 6: alumno aprueba recursa o recupera********************//
function alumnoApruebaReprueba(nota) {
  return nota < 4
    ? "\tRecursa"
    : nota < 7
    ? "\tVa a recuperatorio"
    : "\tAprueba";
}

console.log("\n******ALUMNO APRUEBA RECURSA O RECUPERA CON IF TERNARIO*******");
console.log(alumnoApruebaReprueba(7));
console.log(alumnoApruebaReprueba(4));
console.log(alumnoApruebaReprueba(3));
console.log(alumnoApruebaReprueba(8));

//**************EJERCICIO 7: nave espacial*************//
function abreParacaidas(altura, velocidad) {
  return 2000 < altura && altura < 3000 && velocidad < 1000
    ? "\tPuede abrir el paracaidas"
    : "\tNo puede abrir el paracaidas";
}
console.log("\n******SE ABRE EL PARACAIDAS CON IF TERNARIO*******");
console.log(abreParacaidas(500, 1999));
console.log(abreParacaidas(500, 250));
console.log(abreParacaidas(2000, 1000));
console.log(abreParacaidas(2100, 1000));
console.log(abreParacaidas(2100, 999));

//**************EJERCICIO 8:SANDWICH**********************//
function sandwich(tomate, papas, huevo) {
  let total = 150;
  if (tomate) total += 20;
  if (papas) total += 50;
  if (huevo) total += 60;
  return total;
}

console.log("\n*******PRECIO DEL SANDWICH**************");
console.log("Valor del sandwich: " + sandwich(true, true, true));
console.log("Valor del sandwich: " + sandwich(true, true, false));
console.log("Valor del sandwich: " + sandwich(true, false, true));
console.log("Valor del sandwich: " + sandwich(false, true, true));
console.log("Valor del sandwich: " + sandwich(true, false, false));
console.log("Valor del sandwich: " + sandwich(false, false, true));
console.log("Valor del sandwich: " + sandwich(false, false, false));

//**********COSNIGNA SWITCH **************//
function estacionesDelAnio(mes) {
  mes = mes.toUpperCase();
  switch (mes) {
    case "ENERO":
    case "FEBRERO":
        console.log("Verano");
        break;
    case "ABRIL":
    case "MAYO":
        console.log("Otoño");
        break;
    case "JULIO":
    case "AGOSTO":
        console.log("Invierno"); 
        break;
    case "OCTUBRE":
    case "NOVIEMBRE":
        console.log("Primavera");
        break;
    case "JUNIO":
        console.log("Otoño/Invierno");
        break;
    case "SEPTIEMBRE":
        console.log("Otoño/Primavera");
        break;
    case "DICIEMBRE":
        console.log("Primavera/Verano");
        break;
    case "MARZO":
        console.log("Verano/Otoño");
        break;
    }
}

console.log("\nESTACIONES DE LOS MESES DEL AÑO");
estacionesDelAnio("abril");
estacionesDelAnio("diciembre")
estacionesDelAnio("julio");



