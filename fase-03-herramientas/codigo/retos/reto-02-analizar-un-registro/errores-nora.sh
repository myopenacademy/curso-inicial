#!/usr/bin/env bash
# Primera versión de Nora: cuántos errores hay en el registro y cuáles se repiten más
fichero=$1
errores=$(grep -c " ERROR " "$fichero")
echo "Errores: $erorres"
echo "Los que más se repiten:"
grep " ERROR " "$fichero" | cut -d ' ' -f 4- | uniq -c | sort -rn | head -n 3
