#!/usr/bin/env bash
# Prepara el ejercicio 6: la carpeta reservas-pistas, un repositorio con un
# commit que guarda, por error, un fichero con una contraseña.
mkdir reservas-pistas && cd reservas-pistas || exit 1
git init -q
echo "# Reservas de pistas del Club de Pádel Norte" > README.md
printf '[basedatos]\nservidor = localhost\nusuario = club\n' > config.ini
echo "contrasena = Padel-2026-Norte" >> config.ini
git add README.md config.ini
git commit -q -m "Primera versión de las reservas"
echo "Listo: la carpeta reservas-pistas tiene un commit."
