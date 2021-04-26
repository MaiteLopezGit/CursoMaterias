
/*function noParesDeContarImparesHasta(numero){
    let impares=0;
    for(let i=0;i<=numero;i++){
        if(i%2!=0)
        {
            impares++;
        };
    }
    return impares;
 }
 
 console.log(noParesDeContarImparesHasta(6));
*/

 function largoString(url)
{
    return url.length;
}
function agregarHttp(url) {
    return "http://"+url;
}

function procesar(url,agregarHttp)
{
    url[0]=agregarHttp(url[0]);
    url[1]=agregarHttp(url[1])
    return url
}


console.log(procesar(["www.google.com","www.yahoo.com"],agregarHttp))