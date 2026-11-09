#!/usr/bin/env bash
# Copia de seguridad: copia los documentos a la carpeta copia-seguridad
origen="Documentos"
destino="copia-seguridad"
mkdir -p "$destino"
if [ ! -d "$origen" ]; then
    echo "Error: no existe la carpeta $origen" >&2
    exit 1
fi
cp "$origen"/* "$destino"/
echo "Copia de seguridad terminada"
