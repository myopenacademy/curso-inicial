#!/usr/bin/env bash
# Cuenta los clientes que hay en clientes.csv
fichero="clientes.csv"
total=$(wc -l < "$fichero")
echo "Hay $total clientes"
