#!/usr/bin/env bash
# LO QUE PROPUSO EL ASISTENTE (ejemplo preparado para el curso, con fallos típicos)
# Cuenta los socios de un fichero CSV del club.
# Uso: bash socios.sh FICHERO
echo "Socios: $(wc -l < "$1")"
