#!/usr/bin/env bash
# Cuenta los pedidos de Madrid que ya están pagados
de_madrid=$(grep "Madrid" pedidos.txt)
echo "DEPURACIÓN de_madrid:"
echo "$de_madrid"
pagados=$(echo "$de_madrid" | grep -c "pagado")
echo "DEPURACIÓN pagados: $pagados"
echo "Pedidos pagados de Madrid: $pagados"
