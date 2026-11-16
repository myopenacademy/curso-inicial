#!/usr/bin/env bash
# Prepara el reto 2: la carpeta recordatorios, tal como te la pasa Ramón.
# Los commits llevan su nombre: git -c cambia la configuración solo para esa
# orden. Todos los datos son inventados, y la clave, de mentira.
mkdir recordatorios && cd recordatorios || exit 1
git init -q
printf '%s\n' '# Recordatorios del Banco de Tiempo del Arrabal' '' \
  'Manda a cada socio un SMS con los intercambios que tiene al día siguiente.' > README.md
printf '%s\n' '#!/usr/bin/env bash' \
  '# Manda a cada socio el recordatorio de sus intercambios de mañana.' \
  '# La clave del servicio de SMS está en el fichero .env.' \
  '. ./.env' > avisar.sh
printf '.env\n' > .gitignore.txt
git add README.md avisar.sh .gitignore.txt
git -c user.name="Ramón Ferrer" -c user.email=ramon@example.com commit -q -m "Primera versión de los recordatorios"
printf '%s\n' '#!/usr/bin/env bash' \
  '# Manda a cada socio el recordatorio de sus intercambios de mañana.' \
  '# Si no hay .env, usa la clave de siempre, para que funcione en cualquier ordenador.' \
  'CLAVE_SMS=clave-de-prueba-123' \
  '[ -f .env ] && . ./.env' > avisar.sh
git add avisar.sh
git -c user.name="Ramón Ferrer" -c user.email=ramon@example.com commit -q -m "Que funcione también sin .env"
# Lo que hay en la carpeta de Ramón y no está en Git
printf 'CLAVE_SMS=clave-de-prueba-123\n' > .env
printf '%s\n' 'nombre,telefono' 'Amparo Gil,600111222' 'Fabián Ortega,600333444' \
  'Nieves Prado,600555666' > socios.csv
printf '%s\n' '2026-11-15 20:00 SMS a 600111222: mañana, 10:00, clase de guitarra' \
  '2026-11-15 20:00 SMS a 600555666: mañana, 17:30, arreglo de una persiana' > envios.log
echo "Listo: la carpeta recordatorios es la que te pasa Ramón."
