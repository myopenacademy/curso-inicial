#!/usr/bin/env bash
# Dice cuántos ficheros y carpetas hay en la carpeta actual
total=0
for elemento in *; do
    # En una carpeta vacía, el * se queda tal cual y no hay nada que contar
    if [ -e "$elemento" ]; then
        total=$((total + 1))
    fi
done
echo "En $(pwd) hay $total elementos"
