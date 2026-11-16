#!/usr/bin/env bash
# Prepara el ejercicio 5: la carpeta presupuestos, con tres commits.
# Los dos primeros ya los tiene tu socia; el último, no.
mkdir presupuestos && cd presupuestos || exit 1
git init -q
printf 'Pintura: 20 euros/m2\nAlicatado: 35 euros/m2\n' > precios.txt
git add precios.txt
git commit -q -m "Añade la lista de precios"
printf 'Pintura: 25 euros/m2\nAlicatado: 35 euros/m2\n' > precios.txt
git add precios.txt
git commit -q -m "Sube el precio de la pintura"
printf 'Cliente: comunidad de la calle Mayor, 12\nPintura del portal: 120 m2\n' > calle-mayor.txt
echo "Validez del presupuesto: 30 días" > condiciones.txt
git add calle-mayor.txt
git commit -q -m "cambios"
echo "Listo: la carpeta presupuestos tiene tres commits."
