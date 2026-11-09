#!/usr/bin/env bash
# Crea la carpeta de un proyecto nuevo y le copia la plantilla del README
set -eu
proyecto="tienda-online"
mkdir -p "$proyecto"
cp plantilla-readme.md "$proyeto/README.md"
echo "Proyecto $proyecto creado"
