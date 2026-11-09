#!/usr/bin/env bash
# Resumen de las reservas de un día del restaurante.
# Uso: bash reservas-dia.sh FECHA      (la fecha, como en reservas.txt: 2026-11-14)
# Termina con 0 si todo va bien, con 1 si falta reservas.txt y con 2 si se usa mal.

if [ $# -ne 1 ]; then
    echo "Uso: bash reservas-dia.sh FECHA" >&2
    exit 2
fi

fecha=$1
fichero=reservas.txt

if [ ! -f "$fichero" ]; then
    echo "Error: no encuentro $fichero en esta carpeta" >&2
    exit 1
fi

# Las mismas tuberías que en la terminal, guardando el resultado en variables
total=$(grep -c "^$fecha;" "$fichero")
canceladas=$(grep "^$fecha;" "$fichero" | grep -c cancelada)
confirmadas=$((total - canceladas))

echo "Reservas del $fecha: $total"
echo "- Confirmadas: $confirmadas"
echo "- Canceladas: $canceladas"

if [ "$total" -eq 0 ]; then
    echo "Ese día no hay ninguna reserva."
fi
