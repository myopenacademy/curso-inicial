#!/usr/bin/env bash
# Copia de seguridad: copia los documentos a la carpeta copia-seguridad
origen="Documetos"
destino="copia-seguridad"
mkdir -p "$destino"
if [ -d "$origen" ]; then
    cp "$origen"/* "$destino"/
fi
echo "Copia de seguridad terminada"
