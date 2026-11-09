#!/usr/bin/env bash
# Copia de seguridad de una carpeta de la carpeta actual, con la fecha de hoy en el nombre.
# Uso: bash copia.sh CARPETA
# La copia se guarda en copias/CARPETA-AAAA-MM-DD (si ya hay una de hoy, la sustituye).
# Termina con 0 si la hace, con 1 si la carpeta no existe o la copia falla, y con 2 si se usa mal.

# 1. Comprobar que se ha dicho qué carpeta copiar
if [ $# -ne 1 ]; then
    echo "Uso: bash copia.sh CARPETA" >&2
    exit 2
fi

# ${1%/} es el argumento sin la / del final, si la lleva (el tabulador la pone: documentos/)
origen=${1%/}

# 2. Comprobar que es el nombre de una carpeta de aquí, sin ruta: con ../docs o con .,
#    la copia (y el rm del paso 4) acabarían fuera de copias/. Se rechazan / (que sin
#    su barra queda vacío), . y .., y cualquier nombre que lleve una / (../docs, /home/ana)
if [ "$origen" = "" ] || [ "$origen" = "." ] || [ "$origen" = ".." ] ||
    echo "$origen" | grep -q /; then
    echo "Error: escribe solo el nombre de una carpeta de la carpeta actual (por ejemplo, documentos)" >&2
    exit 2
fi

# 3. Comprobar que la carpeta existe (-d: «existe y es una carpeta»)
if [ ! -d "$origen" ]; then
    echo "Error: no existe la carpeta $origen" >&2
    exit 1
fi

# 4. El nombre de la copia, con la fecha de hoy (por ejemplo, copias/documentos-2026-11-09)
hoy=$(date +%Y-%m-%d)
destino="copias/$origen-$hoy"

# 5. Si ya hay una copia de hoy, se borra para sustituirla (avisando por la salida de error).
#    Con -f, rm no pregunta por los ficheros de solo lectura; aquí es seguro, porque el
#    paso 2 garantiza que destino está dentro de copias/. Y se comprueba que lo ha borrado.
if [ -e "$destino" ]; then
    echo "Aviso: ya había una copia de hoy; la sustituyo por esta" >&2
    if ! rm -rf "$destino"; then
        echo "Error: no se ha podido borrar la copia anterior, $destino" >&2
        exit 1
    fi
fi

# 6. Copiar, y comprobar que cp ha terminado bien y que la copia existe
mkdir -p copias
if ! cp -R "$origen" "$destino" || [ ! -d "$destino" ]; then
    echo "Error: no se ha podido copiar $origen" >&2
    exit 1
fi

# 7. Contar lo que hay en el original y en la copia: tiene que ser lo mismo
#    (en una carpeta vacía, el * se queda tal cual; por eso se comprueba con -e)
en_origen=0
for fichero in "$origen"/*; do
    if [ -e "$fichero" ]; then
        en_origen=$((en_origen + 1))
    fi
done
en_copia=0
for fichero in "$destino"/*; do
    if [ -e "$fichero" ]; then
        en_copia=$((en_copia + 1))
    fi
done
if [ "$en_copia" -ne "$en_origen" ]; then
    echo "Error: la copia tiene $en_copia ficheros y el original, $en_origen" >&2
    exit 1
fi

echo "Copia hecha: $destino ($en_copia ficheros)"
