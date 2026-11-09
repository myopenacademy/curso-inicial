#!/usr/bin/env bash
# Cuenta los pedidos de Madrid que ya están pagados
de_madrid=$(grep "Madrid" pedidos.txt)
pagados=$(echo "$de_madrid" | grep -c "pagado")
echo "Pedidos pagados de Madrid: $pagados"
