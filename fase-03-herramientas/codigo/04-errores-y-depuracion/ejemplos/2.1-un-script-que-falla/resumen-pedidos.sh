#!/usr/bin/env bash
# Resumen de los pedidos de un día: los muestra y dice cuántos hay
echo "Pedidos del 9 de noviembre:"
grep "2026-11-09" pedidos.txt
ehco "Número de pedidos:"
grep -c "2026-11-09" pedidos.txt
