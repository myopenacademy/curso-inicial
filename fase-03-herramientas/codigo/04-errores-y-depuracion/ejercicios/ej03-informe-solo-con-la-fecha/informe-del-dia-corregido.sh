#!/usr/bin/env bash
# Crea el fichero del informe de un día, con su nombre y su fecha
nombre="informe"
fecha="2026-11-09"
fichero="${nombre}_$fecha.txt"
echo "Ventas del día $fecha" > "$fichero"
echo "Creado: $fichero"
