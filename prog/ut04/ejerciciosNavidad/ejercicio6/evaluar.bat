echo "Compilando Evaluador..." 
javac -d tests\compilados tests\Evaluador.java 
java -cp tests\compilados;compilados Evaluador
