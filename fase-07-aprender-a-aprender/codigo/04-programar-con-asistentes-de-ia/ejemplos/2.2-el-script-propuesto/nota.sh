#!/usr/bin/env bash
# LO QUE PROPUSO EL ASISTENTE (ejemplo preparado para el curso, con fallos típicos)
# Convierte una nota de 0 a 10 en su calificación.
# Uso: bash nota.sh NOTA
nota=$1

if [ "$nota" -gt 9 ]; then
    echo "Sobresaliente"
elif [ "$nota" -gt 7 ]; then
    echo "Notable"
elif [ "$nota" -gt 5 ]; then
    echo "Aprobado"
else
    echo "Suspenso"
fi
