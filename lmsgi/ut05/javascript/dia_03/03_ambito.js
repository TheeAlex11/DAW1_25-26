// Ámbitos
function varScoping() {
  var x = 1;

  if (true) {
    var x = 2;
    console.log(x); // will print 2
  }

  console.log(x); // will print 2 => el ámbito de "var" atraviesa bloques
}

function letScoping() {
  let x = 1;

  if (true) {
    let x = 2;
    console.log(x); // will print 2
  }

  console.log(x); // will print 1 => el ámbito de "let" está contenido en bloques
}

varScoping();
letScoping();

//-----------------------------------------------------------------------------

var x = 10;
varScoping(); // => el ámbito de "var" NO atraviesa funciones

//-----------------------------------------------------------------------------


// Por encima del ámbito de creación
function nestedScopeTest() {
  if (true) {
    var functionVariable = 1;
    let blockVariable = 2;

    console.log(functionVariable); // will print 1
    console.log(blockVariable); // will print 2

    if (true) {
      console.log(functionVariable); // will print 1
      console.log(blockVariable); // will print 2
    }
  }

  console.log(functionVariable); // will print 1
  console.log(blockVariable); // will throw an error
}

try {
    nestedScopeTest();
} catch(error) {
    console.error(`Error: ${error}`); // => hacia arriba sólo con "var"
}
try {
    console.log(functionVariable);
} catch(error) {
    console.error(`Error: ${error}`); // => hacia afuera NI con "var"
}

//-----------------------------------------------------------------------------

// Global variables => en el navegador web
var x = 1;
let y = 2;
console.log(this.x); // will print 1 => hace referencia a 
console.log(this.y); // will print undefined

console.log(global); // => ver objeto "global" diferente en navegador y node