#!/usr/bin/env bash
# Prepara el ejercicio 3: la carpeta agenda, un repositorio con un commit
# y dos cambios de la tarde que todavía no están en el historial.
mkdir agenda && cd agenda || exit 1
git init -q
printf 'Escuela de música Allegro\nTeléfono: 600 123 465\n' > README.md
printf 'Lunes: piano\nMartes: guitarra\n' > horario.txt
git add README.md horario.txt
git commit -q -m "Primera versión de la agenda"
# Los dos cambios de la tarde, sin commit
printf 'Escuela de música Allegro\nTeléfono: 600 123 456\n' > README.md
echo "Miércoles: violín" >> horario.txt
echo "Listo: la carpeta agenda tiene un commit y dos cambios sin guardar."
