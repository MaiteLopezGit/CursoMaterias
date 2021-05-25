//EJERCICIO 1:
let fs = require("fs");

let ticketsJSON = fs.readFileSync(__dirname + "/TICKETS.json", "UTF-8");
let tickets = JSON.parse(ticketsJSON);

//EJERCICIO 2:
//2. Crear un objeto literal que represente la mesa de ayuda
//Este objeto contendrá, una propiedad llamada tickets con el listado de tickets

let mesaDeEntrada = {
  tickets: tickets,

  //A)gregar un método buscarTicket, que permite consultar un ticket enviando como parámetro el nroTicket deseado.
  //Resultado esperado: el ticket según el parámetro enviado.
  buscarTicket: function (nroTicket) {
    return this.tickets.find((ticket) => ticket.nroTicket === nroTicket);
  },

  //B) Agregar un método listarTickets que reciba como parámetro un array de tickets y los imprima por consola.
  //Este método deberá imprimir por cada elemento:
  /*número de Ticket
    usuario
    prioridad
    “resuelto” → En caso de ser true la propiedad estaResuelto 
    “pendiente” → Caso contrario
    minutos de espera*/
  listarTickets: function (tickets) {
    tickets.forEach((ticket) => {
      console.log(
        "Nro de Ticket: " +
          ticket.nroTicket +
          ", usuario: " +
          ticket.usuario +
          ", prioridad: " +
          ticket.prioridad +
          ", estado: " +
          (ticket.estaResuelto ? "Resuelto" : "Pendiente") +
          ", Minutos: " +
          ticket.minutosDeEspera
      );
    });
  },

  //C)Agregar un método ticketsPendientes que permita filtrar tickets sin resolver, esto es indicado por la propiedad estaResuelto.
  ticketsPendientes: function () {
    return this.tickets.filter((ticket) => !ticket.estaResuelto);
  },

  //D) Agregar un método buscarPorPrioridad  que permita filtrar los tickets pendientes, siempre y cuando la prioridad sea igual al parámetro recibido.
  //Este método debe usar ticketsPendientes .
  //Este método debe recibir como parámetro un string que representa la prioridad del ticket.  (“alta”), (“media”) o (“baja”)
  buscarPorPrioridad: function (prioridad) {
    let ticketsPendientes = this.ticketsPendientes();
    return ticketsPendientes.filter((ticket) => ticket.prioridad === prioridad);
  },

  //E) Agregar un método que permita ordenar por tiempo de espera de mayor a menor según la propiedad minutosDeEspera de cada ticket que se encuentre pendiente y devolver un array ordenado.
  //Este método debe usar ticketsPendientes.
  ordenarPorTiempoDeEspera: function () {
    let ticketsPendientes = this.ticketsPendientes();
    return ticketsPendientes.sort(
      (ticketA, ticketB) => -(ticketA.minutosDeEspera - ticketB.minutosDeEspera)
    );
  },

  //F)Agregar un método informarAlUsuario que reciba por parámetro un nro de ticket el cual se informará resuelto, es decir que imprima por pantalla un mensaje del ticket resuelto.
  informarAlUsuario: function (nroTicket) {
    let ticket = this.buscarTicket(nroTicket)  
    console.log(
        "Sr/a: " +
          ticket.usuario +
          ", Se informa que su ticket Nro: " +
          ticket.nroTicket +
          ", prioridad: " +
          ticket.prioridad +
          ", está resuelto"
      );
  },
};

//**Ejercicio 1: **/
/** variable conteniendo un array con todos los tickets disponibles.**/
console.log("EJERCICIO 1: ");
console.log(" ");
console.log(tickets)
console.log(" ");

//**Ejercicio 2: **/
/** variable conteniendo un array con todos los tickets disponibles.**/
console.log("EJERCICIO 2: ");
console.log(" ");
console.log(mesaDeEntrada.tickets);
console.log(" ");

//**Ejercicio 2: A)**/
/** metodo que devuelve el ticket buscado**/
console.log("EJERCICIO 2: A)");
console.log(" ");
console.log(mesaDeEntrada.buscarTicket(24));
console.log(" ");


//**Ejercicio 2: B)**/
/** Listado de array**/
console.log("EJERCICIO 2: B)");
console.log(" ");
mesaDeEntrada.listarTickets(tickets);
console.log(" ");

//**Ejercicio 2: C)**/
/**Listado de ticket pendientes **/
console.log("EJERCICIO 2: C)");
console.log(" ");
mesaDeEntrada.listarTickets(mesaDeEntrada.ticketsPendientes());
console.log(" ");

//**Ejercicio 2: D)**/
/**Listado de ticket con prioridad pedida **/
console.log("EJERCICIO 2: D)");
console.log(" ");
console.log("PRIOIRDAD BAJA");
mesaDeEntrada.listarTickets(mesaDeEntrada.buscarPorPrioridad("baja"));
console.log(" ");

console.log(" ");
console.log("PRIORIDAD MEDIA")
mesaDeEntrada.listarTickets(mesaDeEntrada.buscarPorPrioridad("media"));
console.log(" ");

console.log(" ");
console.log("PRIOIRDAD ALTA");
mesaDeEntrada.listarTickets(mesaDeEntrada.buscarPorPrioridad("alta"));
console.log(" ");

//**Ejercicio 2: E)**/
/**Listado de ticket ordenado de Mayor a menor **/
console.log("EJERCICIO 2: E)");
console.log(" ");
mesaDeEntrada.listarTickets(mesaDeEntrada.ordenarPorTiempoDeEspera());
console.log(" ");

//**Ejercicio 2: F)**/
/**Listado de informes a los usuarios **/
console.log("EJERCICIO 2: F)");
console.log(" ");
mesaDeEntrada.informarAlUsuario(13);
console.log(" ");