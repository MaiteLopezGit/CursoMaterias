//EJERCICIO INTEGRADOR DE CICLOS

const a = [23, 45, 32];
const b = [12, 67, 7];
function encontrarGanador(a, b) {
  let ptosA = 0;
  let ptosB = 0;

  for (let i = 0; i < 3; i++) {
    if (a[i] < b[i]) {
      ptosB++;
    } else if (a[i] > b[i]) {
      ptosA++;
    }
  }

  if (ptosA < ptosB) {
    return "segundo";
  } else return "primer";
}

console.log("El ganador es el "+ encontrarGanador(a,b)+" participante");
