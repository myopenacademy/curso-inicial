#!/usr/bin/env bash
# Prepara el ejercicio 4: la carpeta web-baile, un repositorio vacío con los
# ficheros de la web de una academia de baile.
mkdir web-baile && cd web-baile || exit 1
git init -q
echo "<h1>Academia de baile Compás</h1>" > index.html
echo "h1 { color: darkred; }" > estilos.css
echo "CLAVE_CORREO=Rumba-2026" > .env
echo "CLAVE_CORREO=pon-aquí-tu-clave" > .env.example
echo "2026-01-15 10:00 error: falta la foto" > errores.log
mkdir registros dist fotos
echo "2026-01-15 10:00 GET /index.html" > registros/servidor.log
echo "<h1>Academia de baile Compás</h1>" > dist/index.html
echo "Foto de la clase de salsa" > fotos/clase-de-salsa.jpg
echo "datos de macOS" > .DS_Store
echo "Listo: la carpeta web-baile tiene la web, sin ningún commit."
