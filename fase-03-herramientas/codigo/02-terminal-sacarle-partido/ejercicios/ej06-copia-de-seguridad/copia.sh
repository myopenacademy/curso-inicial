#!/usr/bin/env bash
# Copia de seguridad de una carpeta, con la fecha de hoy en el nombre.
# Uso: bash copia.sh CARPETA
# La copia se guarda en copias/CARPETA-AAAA-MM-DD (si ya hay una de hoy, la sustituye).
# Termina con 0 si la hace, con 1 si la carpeta no existe y con 2 si se usa mal.

# 1. Comprobar que se ha dicho qué carpeta copiar
if [ $# -ne 1 ]; then
    echo "Uso: bash copia.sh CARPETA" >&2
    exit 2
fi

origen=$1

# 2. Comprobar que la carpeta existe (-d: «existe y es una carpeta»)
if [ ! -d "$origen" ]; then
    echo "Error: no existe la carpeta $origen" >&2
    exit 1
fi

# 3. El nombre de la copia, con la fecha de hoy (por ejemplo, copias/documentos-2026-11-09)
hoy=$(date +%Y-%m-%d)
destino="copias/$origen-$hoy"

# 4. Si ya hay una copia de hoy, se sustituye por esta (avisando por la salida de error)
if [ -e "$destino" ]; then
    echo "Aviso: ya había una copia de hoy; la sustituyo por esta" >&2
    rm -r "$destino"
fi

# 5. Copiar
mkdir -p copias
cp -R "$origen" "$destino"

# 6. Contar lo copiado, para comprobar que no está vacía
total=0
for fichero in "$destino"/*; do
    total=$((total + 1))
done

echo "Copia hecha: $destino ($total ficheros)"
