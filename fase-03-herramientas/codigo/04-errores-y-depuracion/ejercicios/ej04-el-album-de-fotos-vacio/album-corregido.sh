#!/usr/bin/env bash
# Prepara el álbum: copia cada foto de vacaciones a la carpeta album, con «menorca-» delante del nombre
mkdir -p album
for foto in vacaciones/*.jpg; do
    nombre=$(basename "$foto")
    cp "$foto" "album/menorca-$nombre"
done
echo "Fotos del álbum:"
ls album
