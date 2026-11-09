#!/usr/bin/env bash
# Resumen de un registro: cuántas líneas hay de cada nivel y qué errores se repiten más.
# Uso: bash resumen-registro.sh FICHERO
# Termina con 0 si todo va bien, con 1 si el fichero no existe y con 2 si se usa mal.
set -u

# 1. Comprobar el argumento y el fichero
if [ $# -ne 1 ]; then
    echo "Uso: bash resumen-registro.sh FICHERO" >&2
    exit 2
fi
fichero=$1
if [ ! -f "$fichero" ]; then
    echo "Error: no existe el fichero $fichero" >&2
    exit 1
fi

# 2. Contar: las líneas (con $(( )) se quitan los espacios que pone wc en macOS) y los errores
lineas=$(wc -l < "$fichero")
errores=$(grep -c " ERROR " "$fichero")

# 3. Escribir el resumen
echo "Resumen de $fichero: $((lineas)) líneas"
echo
echo "Por nivel:"
cut -d ' ' -f 3 "$fichero" | sort | uniq -c | sort -rn
echo
echo "Errores: $errores. Los que más se repiten:"
grep " ERROR " "$fichero" | cut -d ' ' -f 4- | sort | uniq -c | sort -rn | head -n 3
echo
echo "El último error:"
grep " ERROR " "$fichero" | tail -n 1
