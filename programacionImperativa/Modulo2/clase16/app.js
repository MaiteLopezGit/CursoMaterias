const fs = require('fs');
 
//Diferencia entre readFileSinc, y readFile
//Forma convencional

    fs.readFile(__dirname + '/personas.json', (err, data) => {
        if (err) {
            console.log(err)
        } else {
            console.log(JSON.parse(data));
        }
    });
/*
    fs.readFile(__dirname + '/personas.json', )
    .then(function(data){
        console.log(JSON.parse(data))
    })
    .catch(function(err){
        console.log(err)
    })
*/

setTimeout(() => console.log("pasaron 3 segundos"), 3000)

function diAlgo (msg) {
    console.log(msg);
}

const espera = ms => new Promise(resuelve => setTimeout(resuelve, ms));

espera(10000).then(() => diAlgo("10 segundos")).catch();
