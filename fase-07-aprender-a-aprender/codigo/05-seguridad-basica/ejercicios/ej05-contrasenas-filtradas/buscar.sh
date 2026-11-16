#!/usr/bin/env bash
# Busca qué usuarios de filtrada.txt tienen una contraseña de comunes.txt.
# filtrada.txt: una línea por usuario, «usuario:huella» (SHA-256, sin sal).
# comunes.txt: una contraseña por línea, sin espacios.
# Uso: bash buscar.sh

for contrasena in $(cat comunes.txt); do
  # La huella de la contraseña: printf no añade salto de línea, y cut se queda
  # con la huella, sin el «  -» que escribe sha256sum detrás
  huella=$(printf '%s' "$contrasena" | sha256sum | cut -d' ' -f1)
  # Las líneas que terminan en esa huella; cut se queda con el usuario
  for usuario in $(grep ":$huella\$" filtrada.txt | cut -d: -f1); do
    echo "$usuario usa «$contrasena»"
  done
done
