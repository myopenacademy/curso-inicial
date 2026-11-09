#!/usr/bin/env bash
# Copia la lista de tareas a la carpeta de copias
origen="Mis notas/tareas.txt"
mkdir -p copias
cp "$origen" copias/
echo "Copia hecha"
