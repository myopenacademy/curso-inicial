#!/usr/bin/env bash
# Comprueba si responde un servidor en cada puerto de tu ordenador (localhost).
# Uso: bash comprobar.sh PUERTO [PUERTO...]     (por ejemplo: bash comprobar.sh 8080 3000)
# Termina con 0 si ha podido comprobarlos y con 2 si se usa mal.

# Sin ningún puerto no hay nada que comprobar: se explica cómo se usa y se termina con 2
if [ $# -eq 0 ]; then
  echo "Uso: bash comprobar.sh PUERTO [PUERTO...]" >&2
  exit 2
fi

responden=0
for puerto in "$@"; do
  # -s: sin barra de progreso ni mensajes; -o /dev/null: la respuesta no interesa;
  # -w '%{http_code}': solo el código. Si nadie escucha, curl escribe 000.
  codigo=$(curl -s -o /dev/null -w '%{http_code}' "http://localhost:$puerto/")
  if [ "$codigo" = "000" ]; then
    echo "Puerto $puerto: no responde nadie"
  else
    echo "Puerto $puerto: responde un servidor (código $codigo)"
    responden=$((responden + 1))
  fi
done

echo "Responden $responden de $# puertos"
