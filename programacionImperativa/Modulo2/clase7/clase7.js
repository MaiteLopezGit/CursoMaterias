como le pasamos la func a encontrando ganador y que no 
haya un console log

function enFormatoTexto(a, b) {
    function enFormatoTexto(a, b) {
     /*  let ganador
      if (a > b) {
        ganador = "primer"
      } else {
        ganador = "segundo"
      } */
     let ganador = a > b ? "primer" : "segundo"
     console.log("el ganador es " + ganador + " jugador");
    }
    
    
    const enFormatoTabla = (jugador1, jugador2) => console.table({ jugador1, jugador2 })
    
    
    encontrarGanador(a, b, enFormatoTexto)
    encontrarGanador(a, b, enFormatoTabla)
    
    