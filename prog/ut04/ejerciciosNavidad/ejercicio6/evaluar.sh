#!/bin/bash

# Script: evaluar.sh
# Descripción: Ejecuta el evaluador de tests Java usando assertions

echo "Compilando Evaluador..." 
javac -d tests/compilados/ tests/Evaluador.java 
java -cp tests/compilados:compilados Evaluador