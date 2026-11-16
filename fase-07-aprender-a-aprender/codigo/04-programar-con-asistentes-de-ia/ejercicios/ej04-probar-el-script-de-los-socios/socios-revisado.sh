#!/usr/bin/env bash
# LA VERSIÓN REVISADA: sin contar la cabecera, con la última línea aunque no
# termine en salto de línea, y avisando si falta el fichero.
# Uso: bash socios-revisado.sh FICHERO

# Sin el fichero no se puede contar nada: se explica cómo se usa y se termina con 2
if [ $# -ne 1 ]; then
    echo "Uso: bash socios-revisado.sh FICHERO" >&2
    exit 2
fi

fichero=$1

# Si el fichero no existe, se dice claramente y se termina con 1
if [ ! -f "$fichero" ]; then
    echo "No existe el fichero $fichero" >&2
    exit 1
fi

# tail -n +2 escribe desde la línea 2: se salta la cabecera.
# grep -c . cuenta las líneas que tienen algo, también la última aunque no termine en salto.
socios=$(tail -n +2 "$fichero" | grep -c .)
echo "Socios: $socios"
