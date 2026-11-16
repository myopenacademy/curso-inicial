#!/usr/bin/env bash
# LA VERSIÓN REVISADA: límites con -ge y notas fuera de 0 a 10 rechazadas.
# Convierte una nota entera de 0 a 10 en su calificación.
# Uso: bash nota.sh NOTA

# Sin una nota no se puede calificar nada: se explica cómo se usa y se termina con 2
if [ $# -ne 1 ]; then
    echo "Uso: bash nota.sh NOTA (un número entero de 0 a 10)" >&2
    exit 2
fi

nota=$1

# Una nota fuera de 0 a 10 no tiene calificación: se avisa y se termina con 1
if [ "$nota" -lt 0 ] || [ "$nota" -gt 10 ]; then
    echo "Nota no válida: $nota (tiene que estar entre 0 y 10)" >&2
    exit 1
fi

# -ge quiere decir «mayor o igual»: el 9, el 7 y el 5 justos cuentan
if [ "$nota" -ge 9 ]; then
    echo "Sobresaliente"
elif [ "$nota" -ge 7 ]; then
    echo "Notable"
elif [ "$nota" -ge 5 ]; then
    echo "Aprobado"
else
    echo "Suspenso"
fi
