#!/usr/bin/env bash
# Comprueba si hay que reponer un producto del almacén.
# Uso: bash stock.sh PRODUCTO UNIDADES MINIMO
# Termina con 0 si hay suficiente, con 1 si hay que reponer y con 2 si se usa mal.

# Sin los tres argumentos no se puede comprobar nada: se explica cómo se usa y se termina con 2
if [ $# -ne 3 ]; then
    echo "Uso: bash stock.sh PRODUCTO UNIDADES MINIMO" >&2
    exit 2
fi

# Nombres claros para los argumentos
producto=$1
unidades=$2
minimo=$3

# -lt quiere decir «menor que» (en inglés, less than)
if [ "$unidades" -lt "$minimo" ]; then
    echo "Reponer $producto: quedan $unidades (mínimo $minimo)"
    exit 1
fi

echo "$producto: hay suficientes ($unidades unidades)"
