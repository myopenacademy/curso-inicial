#!/usr/bin/env bash
# vigilar.sh: comprueba si responden bien las direcciones que recibe.
# Uso: bash vigilar.sh DIRECCIÓN [DIRECCIÓN...]

if [ $# -eq 0 ]; then
    echo "Uso: bash vigilar.sh DIRECCIÓN [DIRECCIÓN...]" >&2
    exit 1
fi

problemas=0
for direccion in "$@"; do
    # -s: sin barra de progreso · -o /dev/null: el cuerpo no interesa
    # -w: escribe solo el código de estado (000 si no hay respuesta)
    codigo=$(curl -s -o /dev/null -w '%{http_code}' "$direccion")
    if [ "$codigo" = "200" ]; then
        echo "OK      $codigo  $direccion"
    else
        echo "ALERTA  $codigo  $direccion"
        problemas=$((problemas + 1))
    fi
done

echo "Direcciones con problemas: $problemas de $#"
