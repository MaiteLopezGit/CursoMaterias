//Ejercicio 1
let films = ["star wars", "totoro", "rocky", "pulp fiction", "la vida es bella"];



//Ejercicio 2

films[0]=films[0].toUpperCase();
films[1]=films[1].toUpperCase();
films[2]=films[2].toUpperCase();
films[3]=films[3].toUpperCase();
films[4]=films[4].toUpperCase();

console.log(films);

//Ejercicio 3
let cartoons = ["toy story", "finding Nemo", "kung-fu panda", "wally", "fortnite"];

function addPelisAnimadas()
{
    films.push(cartoons[0]);
    films.push(cartoons[1]);
    films.push(cartoons[2]);
    films.push(cartoons[3]);
    films.push(cartoons[4]);
}

addPelisAnimadas(films);
console.log(films)


//Ejercicio 4
