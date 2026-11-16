#!/usr/bin/env bash
# Prepara el reto 1: la carpeta gimnasio, con el historial que te encuentras.
# Los commits de Raúl llevan su nombre: git -c cambia la configuración
# solo para esa orden, como si Raúl los hubiera hecho en su ordenador.
mkdir gimnasio && cd gimnasio || exit 1
git init -q
printf '%s\n' 'Lunes: spinning, 19:00' 'Martes: pilates, 18:00' > horario.txt
printf '%s\n' 'Miércoles: zumba, 19:00' 'Jueves: pilates, 18:00' >> horario.txt
printf '%s\n' 'Cuota mensual: 35 €' 'Matrícula: 20 €' > tarifas.txt
git add horario.txt tarifas.txt
git commit -q -m "Horario y tarifas de la temporada 2026"
git tag -a v1.0.0 -m "Temporada 2026"
# Las tarifas de 2027, en su rama
git switch -q -c tarifas-2027
printf '%s\n' 'Cuota mensual: 38 €' 'Matrícula: 20 €' > tarifas.txt
git add tarifas.txt
git commit -q -m "Sube la cuota mensual a 38 €"
echo 'Bono de 10 sesiones: 60 €' >> tarifas.txt
git add tarifas.txt
git commit -q -m "Añade el bono de 10 sesiones"
# Mientras, en main, los cambios de Raúl y el tuyo
git switch -q main
printf '%s\n' 'Lunes: spinning, 19:30' 'Martes: pilates, 18:00' > horario.txt
printf '%s\n' 'Miércoles: zumba, 19:00' 'Jueves: pilates, 18:00' >> horario.txt
git add horario.txt
git -c user.name="Raúl Vega" -c user.email=raul@example.com commit -q -m "Actualiza el horario"
printf '%s\n' 'Lunes: spinning, 19:30' 'Miércoles: zumba, 19:00' > horario.txt
echo 'Jueves: pilates, 18:00' >> horario.txt
git add horario.txt
git -c user.name="Raúl Vega" -c user.email=raul@example.com commit -q -m "Actualiza el horario de la semana"
echo 'Viernes: yoga, 10:00' >> horario.txt
git add horario.txt
git commit -q -m "Añade el yoga de los viernes"
echo "Listo: la carpeta gimnasio tiene su historial."
