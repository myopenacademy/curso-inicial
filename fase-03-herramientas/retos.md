# Retos de la fase 03 — Herramientas del programador

> **Conviene saber antes:** los módulos de la fase.
> **Tiempo estimado:** 2 horas

Estos retos mezclan lo que has aprendido en los cuatro módulos de la fase: moverte y manejar ficheros desde la terminal ([03.01](01-terminal-lo-basico.md)), encadenar órdenes, redirigir sus salidas y escribir scripts ([03.02](02-terminal-sacarle-partido.md)), trabajar con el editor de código ([03.03](03-editor-de-codigo.md)) y encontrar los errores con método ([03.04](04-errores-y-depuracion.md)).

Van de menor a mayor dificultad, y el último es el más completo. Son **opcionales**: sirven para afianzar lo aprendido y no bloquean nada. Se hacen **en tu terminal**: copia a tu carpeta personal la carpeta del reto (la tienes en el enlace «📁 Código» de cada solución), abre una terminal nueva y trabaja ahí; si lo estropeas, vuelve a copiarla y empieza otra vez. Abre las pistas solo si te atascas y, si tu solución es distinta de la propuesta, comprueba que hace lo mismo: puede estar igual de bien. Recuerda que tus salidas no serán idénticas letra a letra ([el aviso de 02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal)).

## Reto 1 · Ordenar la carpeta de Descargas

**Situación real:** tu carpeta `Descargas` es un cajón desastre. Tiene estos catorce ficheros, todos mezclados:

```text
Descargas/
├── apuntes-tema3.docx
├── cancion-cumple.mp3
├── captura de pantalla 2026-11-03.png
├── contrato-alquiler.pdf
├── entradas-concierto.pdf
├── factura-luz-octubre.pdf
├── fotos-viaje.zip
├── IMG_2041.jpg
├── IMG_2042.JPG
├── lista-compra.txt
├── logo-panaderia.png
├── plantilla-web.zip
├── presupuesto-reforma.xlsx
└── video-boda.mp4
```

Ordénala **desde la terminal**, con el menor número de órdenes que puedas y sin perder nada por el camino:

1. Antes de tocar nada, haz una **copia de seguridad** de toda la carpeta, `Descargas-copia`.
2. Dentro de `Descargas`, crea cuatro carpetas: `documentos` (PDF, Word, hojas de cálculo y texto), `imagenes`, `audio-y-video` y `comprimidos`.
3. Mueve cada fichero a la suya **con comodines**: nada de escribir los catorce nombres uno a uno.
4. Comprueba que no queda nada suelto en `Descargas` y que **siguen siendo catorce** ficheros: cuéntalos con una tubería antes de empezar y al terminar.
5. Termina con una sola orden que enseñe cómo ha quedado todo el árbol.

<details>
<summary>Pista 1</summary>

Para la copia, `cp` con la opción que copia carpetas; para crear las cuatro carpetas, un solo `mkdir`; para mover, `mv` con varios patrones y la carpeta de destino al final ([03.01, apartados 1.7](01-terminal-lo-basico.md#17-copiar-mover-y-renombrar-cp-y-mv) y [1.14](01-terminal-lo-basico.md#114-comodines-y-comillas)). Para contar al principio, `ls` y una tubería hacia la orden que cuenta líneas ([03.02, apartado 1.6](02-terminal-sacarle-partido.md#16-los-filtros-grep-sort-uniq-wc-cut-head-y-tail)).

</details>

<details>
<summary>Pista 2</summary>

Mira las extensiones **letra a letra**: ¿están todas en minúsculas? Y para contar al final, cuando los ficheros ya están dentro de las subcarpetas, `ls` no te sirve: `find . -type f` escribe la ruta de **todos los ficheros** (`-type f`: solo ficheros, no carpetas) desde la carpeta actual hacia abajo.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el orden seguro de cualquier reorganización, el de [03.01](01-terminal-lo-basico.md#ejercicio-9--el-portfolio-de-marta): **copia**, **mira**, **haz**, **comprueba**. Un patrón por tipo de fichero (`*.pdf`, `*.jpg`…) mueve todos los de ese tipo con una orden, y bash lo cambia por la lista de nombres **antes** de ejecutar `mv`, así que el nombre con espacios no necesita comillas: llega a `mv` como una sola pieza. Contar antes y después es la comprobación de que no se ha perdido nada.

**En tu terminal** (`sesion.txt`):

```text
$ cp -r Descargas Descargas-copia
$ cd Descargas
$ ls
 apuntes-tema3.docx                    factura-luz-octubre.pdf   logo-panaderia.png
 cancion-cumple.mp3                    fotos-viaje.zip           plantilla-web.zip
'captura de pantalla 2026-11-03.png'   IMG_2041.jpg              presupuesto-reforma.xlsx
 contrato-alquiler.pdf                 IMG_2042.JPG              video-boda.mp4
 entradas-concierto.pdf                lista-compra.txt
$ ls | wc -l
14
$ mkdir documentos imagenes audio-y-video comprimidos
$ mv *.pdf *.docx *.xlsx *.txt documentos
$ mv *.jpg *.png imagenes
$ mv *.mp3 *.mp4 audio-y-video
$ mv *.zip comprimidos
$ ls
audio-y-video  comprimidos  documentos  imagenes  IMG_2042.JPG
$ mv *.JPG imagenes
$ ls
audio-y-video  comprimidos  documentos  imagenes
$ find . -type f | wc -l
14
$ ls -R
.:
audio-y-video  comprimidos  documentos  imagenes

./audio-y-video:
cancion-cumple.mp3  video-boda.mp4

./comprimidos:
fotos-viaje.zip  plantilla-web.zip

./documentos:
apuntes-tema3.docx     entradas-concierto.pdf   lista-compra.txt
contrato-alquiler.pdf  factura-luz-octubre.pdf  presupuesto-reforma.xlsx

./imagenes:
'captura de pantalla 2026-11-03.png'   IMG_2041.jpg   IMG_2042.JPG   logo-panaderia.png
```

📁 **Código:** [`codigo/retos/reto-01-ordenar-descargas/`](codigo/retos/reto-01-ordenar-descargas/)

**En qué fijarte:**

- **Cuatro `mv` para catorce ficheros.** Cada uno lleva varios patrones y, al final, la carpeta de destino, que tiene que existir antes: por eso el `mkdir` va primero.
- **El primer `ls` de comprobación delata un fichero suelto:** `IMG_2042.JPG`. El patrón `*.jpg` no lo ha cogido, porque bash distingue mayúsculas al comparar los comodines ([03.04, error típico 3.1](04-errores-y-depuracion.md#31-los-tres-mensajes-de-siempre)). Sin ese `ls` se habría quedado ahí. Con `mv *.JPG imagenes` queda resuelto. (También valía `mv *.jpg *.JPG *.png imagenes` desde el principio, si lo ves venir.)
- **`ls` escribe entre comillas simples** el nombre con espacios: es su forma de avisar de que lleva espacios; las comillas no forman parte del nombre.
- **Catorce antes y catorce después.** El primer recuento cuenta lo que lista `ls` en la carpeta; el segundo, con `find . -type f`, los ficheros de todas las subcarpetas. Si saliera menos, sabrías que algo se ha perdido, y tienes `Descargas-copia` para recuperarlo.
- **`ls -R`** enseña el árbol entero: cada carpeta con lo que tiene dentro.

**Errores frecuentes al resolverlo:**

- Mover antes de crear las carpetas: con varios ficheros y un destino que no existe, `mv` se queja y no mueve nada.
- Escribir `mv * .pdf documentos`, con un espacio de más: `*` serían **todos** los ficheros (y las carpetas recién creadas). Es el [error típico 3.3 de 03.01](01-terminal-lo-basico.md#33-un-espacio-de-más-al-borrar); antes de un `mv` o un `rm` con comodines, prueba el patrón con `ls`.
- Poner comillas al patrón (`mv "*.pdf" documentos`): las comillas apagan el comodín, y `mv` buscaría un fichero llamado literalmente `*.pdf`.
- Dar el trabajo por terminado sin el último `ls`: el `.JPG` se habría quedado suelto.

</details>

## Reto 2 · El script que analiza un registro

**Situación real:** en una clínica veterinaria, la aplicación de citas escribe un [registro](01-terminal-lo-basico.md#26-ver-un-fichero-de-texto-y-el-registro-de-una-aplicación), `citas.log`, con una línea por cada cosa que pasa: la fecha, la hora, el nivel (`INFO`, `WARN` o `ERROR`) y un mensaje. Este es el del 12 de noviembre:

```text
2026-11-12 08:30:01 INFO Arranca la aplicación de citas
2026-11-12 08:30:02 INFO Conectada a la base de datos
2026-11-12 09:05:44 INFO Cita reservada para Luna (perro) a las 10:30
2026-11-12 09:12:10 ERROR No se pudo enviar el SMS de recordatorio
2026-11-12 09:40:31 INFO Cita reservada para Simba (gato) a las 12:00
2026-11-12 10:02:15 WARN El pago con tarjeta tarda más de 5 segundos
2026-11-12 10:02:20 ERROR La pasarela de pago no responde
2026-11-12 10:15:03 ERROR No se pudo enviar el SMS de recordatorio
2026-11-12 10:31:47 INFO Cita cancelada para Toby (perro)
2026-11-12 11:20:09 ERROR La pasarela de pago no responde
2026-11-12 11:58:30 WARN Quedan pocas citas libres para el sábado
2026-11-12 12:44:12 INFO Cita reservada para Kira (perro) a las 17:00
2026-11-12 13:05:55 ERROR No se pudo enviar el SMS de recordatorio
2026-11-12 13:30:00 INFO Copia de seguridad hecha
2026-11-12 14:10:41 ERROR No se pudo leer la ficha de Nala
2026-11-12 14:11:02 INFO Ficha de Nala recuperada de la copia
```

Nora, la informática de la clínica, empezó un script para ver los errores de un vistazo, pero algo falla:

```bash
#!/usr/bin/env bash
# Primera versión de Nora: cuántos errores hay en el registro y cuáles se repiten más
fichero=$1
errores=$(grep -c " ERROR " "$fichero")
echo "Errores: $erorres"
echo "Los que más se repiten:"
grep " ERROR " "$fichero" | cut -d ' ' -f 4- | uniq -c | sort -rn | head -n 3
```

📁 **Código:** [`codigo/retos/reto-02-analizar-un-registro/`](codigo/retos/reto-02-analizar-un-registro/)

Con `bash errores-nora.sh citas.log`:

**Salida:**

```text
Errores: 
Los que más se repiten:
      1 No se pudo leer la ficha de Nala
      1 No se pudo enviar el SMS de recordatorio
      1 No se pudo enviar el SMS de recordatorio
```

1. **Depura la versión de Nora.** Tiene dos fallos: no dice cuántos errores hay, y el SMS sale dos veces con un 1, cuando en el registro aparece tres veces. Encuéntralos con el método de [03.04](04-errores-y-depuracion.md#12-un-método-para-depurar): la traza de `bash -x` y la tubería dividida en trozos.
2. **Escribe la versión buena**, `resumen-registro.sh`, que:
   - Reciba el fichero del registro como **único argumento**. Si no le dan exactamente uno, que explique cómo se usa (por la salida de error) y termine con el código 2; si el fichero no existe, que lo diga y termine con 1.
   - Diga cuántas líneas tiene el registro y cuántas hay **de cada nivel**, de más a menos.
   - Diga cuántos errores hay y cuáles son los **tres que más se repiten**, con cuántas veces.
   - Escriba el **último error**, la línea entera, con su hora.
   - Empiece con un seguro que habría cazado uno de los fallos de Nora.
   - Funcione igual en Linux, macOS y Git Bash.
3. **Pruébalo** con el registro, guardando el resumen en un fichero `resumen.txt` con una redirección, y también sin argumentos y con un fichero que no existe, comprobando en cada caso su código de salida.

<details>
<summary>Pista 1</summary>

En la traza de `bash -x`, busca el `echo` de «Errores:»: ¿con qué valor se ejecuta? Para el segundo fallo, ejecuta solo el principio de la tubería (`grep … | cut …`) y mira si los mensajes iguales están **seguidos** ([03.04, apartado 1.5](04-errores-y-depuracion.md#15-aislar-el-problema-dividir-a-la-mitad)).

</details>

<details>
<summary>Pista 2</summary>

Cada línea tiene sus partes separadas por espacios: la fecha es la 1, la hora la 2, el nivel la 3 y, desde la 4 hasta el final, el mensaje (`cut -d ' ' -f 4-`). El recuento por nivel es la receta de [03.02](02-terminal-sacarle-partido.md#16-los-filtros-grep-sort-uniq-wc-cut-head-y-tail): columna, `sort`, `uniq -c`, `sort -rn`. Las comprobaciones del principio, como en el [ejercicio 5 de 03.02](02-terminal-sacarle-partido.md#ejercicio-5--un-script-que-cuenta-las-reservas-de-un-día).

</details>

<details>
<summary>Pista 3</summary>

El seguro es `set -u` ([03.04, apartado 1.11](04-errores-y-depuracion.md#111-dos-seguros-para-tus-scripts)). Y para macOS: allí `wc -l` escribe espacios delante del número; si guardas el número en una variable y lo escribes dentro de `$(( ))`, se quedan fuera.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se depura con método (reproducir, leer, aislar, una hipótesis, un cambio); después se escribe el script por pasos, como en el pseudocódigo: comprobar, contar y escribir. Cada pieza es una tubería que ya conoces, probada antes en la terminal.

**1. La versión de Nora.** El fallo ya está reproducido: la salida de arriba. No hay mensajes que leer (son **errores de lógica**), así que toca aislar. Para el primer fallo basta con el principio de la traza: como la traza sale por la salida de error, `2>&1` la junta con la salida normal y `head -n 5` se queda con sus cinco primeras líneas ([03.02, apartado 1.3](02-terminal-sacarle-partido.md#13-mandar-los-errores-a-otro-sitio-2-y-devnull)):

**En tu terminal** (`sesion-traza.txt`):

```text
$ bash -x errores-nora.sh citas.log 2>&1 | head -n 5
+ fichero=citas.log
++ grep -c ' ERROR ' citas.log
+ errores=6
+ echo 'Errores: '
Errores:
$ grep " ERROR " citas.log | cut -d ' ' -f 4-
No se pudo enviar el SMS de recordatorio
La pasarela de pago no responde
No se pudo enviar el SMS de recordatorio
La pasarela de pago no responde
No se pudo enviar el SMS de recordatorio
No se pudo leer la ficha de Nala
```

📁 **Código:** [`codigo/retos/reto-02-analizar-un-registro/`](codigo/retos/reto-02-analizar-un-registro/)

- **Primer fallo.** La traza dice `+ errores=6`: el recuento está bien. Pero el `echo` se ejecuta con `'Errores: '`, vacío. **Hipótesis:** la variable del `echo` no es la misma. Mirando la línea con calma: `$erorres`, con las letras cambiadas. Esa variable no existe y bash la trata como vacía, sin avisar. **Corrección:** `$errores`. (Con `set -u`, bash se habría detenido ahí diciendo `erorres: variable sin asignar`.)
- **Segundo fallo.** La traza enseñaría las órdenes de la tubería, pero no lo que pasa entre sus piezas; para eso se ejecuta solo el principio, la segunda orden de la sesión. Los mensajes salen **en el orden del registro**, y los iguales no están seguidos. `uniq -c` solo junta los repetidos **seguidos**, así que cuenta seis grupos de uno. **Corrección:** un `sort` antes del `uniq -c`, el [error típico 3.3 de 03.02](02-terminal-sacarle-partido.md#33-contar-con-uniq-sin-ordenar-antes).

**2. La versión buena**, con los pasos numerados en comentarios:

```bash
#!/usr/bin/env bash
# Resumen de un registro: cuántas líneas hay de cada nivel y qué errores se repiten más.
# Uso: bash resumen-registro.sh FICHERO
# Termina con 0 si todo va bien, con 1 si el fichero no existe y con 2 si se usa mal.
set -u

# 1. Comprobar el argumento y el fichero
if [ $# -ne 1 ]; then
    echo "Uso: bash resumen-registro.sh FICHERO" >&2
    exit 2
fi
fichero=$1
if [ ! -f "$fichero" ]; then
    echo "Error: no existe el fichero $fichero" >&2
    exit 1
fi

# 2. Contar: las líneas (con $(( )) se quitan los espacios que pone wc en macOS) y los errores
lineas=$(wc -l < "$fichero")
errores=$(grep -c " ERROR " "$fichero")

# 3. Escribir el resumen
echo "Resumen de $fichero: $((lineas)) líneas"
echo
echo "Por nivel:"
cut -d ' ' -f 3 "$fichero" | sort | uniq -c | sort -rn
echo
echo "Errores: $errores. Los que más se repiten:"
grep " ERROR " "$fichero" | cut -d ' ' -f 4- | sort | uniq -c | sort -rn | head -n 3
echo
echo "El último error:"
grep " ERROR " "$fichero" | tail -n 1
```

📁 **Código:** [`codigo/retos/reto-02-analizar-un-registro/`](codigo/retos/reto-02-analizar-un-registro/)

Con `bash resumen-registro.sh citas.log`:

**Salida:**

```text
Resumen de citas.log: 16 líneas

Por nivel:
      8 INFO
      6 ERROR
      2 WARN

Errores: 6. Los que más se repiten:
      3 No se pudo enviar el SMS de recordatorio
      2 La pasarela de pago no responde
      1 No se pudo leer la ficha de Nala

El último error:
2026-11-12 14:10:41 ERROR No se pudo leer la ficha de Nala
```

**3. Las pruebas**, con el resumen guardado en un fichero y los dos casos que tienen que fallar:

**En tu terminal** (`sesion.txt`):

```text
$ bash resumen-registro.sh citas.log > resumen.txt
$ head -n 5 resumen.txt
Resumen de citas.log: 16 líneas

Por nivel:
      8 INFO
      6 ERROR
$ bash resumen-registro.sh citas.txt
Error: no existe el fichero citas.txt
$ echo $?
1
$ bash resumen-registro.sh
Uso: bash resumen-registro.sh FICHERO
$ echo $?
2
```

📁 **Código:** [`codigo/retos/reto-02-analizar-un-registro/`](codigo/retos/reto-02-analizar-un-registro/)

**Por qué así:**

- **Las comprobaciones, primero**, cada una con su mensaje por la salida de error y su código: así, quien guarda el resumen en un fichero no se encuentra dentro un mensaje de error, y otro script puede saber cómo ha ido.
- **`" ERROR "`, con un espacio a cada lado**, busca el nivel como palabra suelta: un mensaje que contuviera, por ejemplo, «ERRORES» no se contaría.
- **El recuento por nivel y el de los errores son la misma receta**: cortar la columna, ordenar, contar y ordenar de más a menos. El primer `sort` es el que faltaba a Nora.
- **`set -u`** caza las variables mal escritas, como la de Nora. No se pone `set -e` porque `grep -c` termina con el código 1 cuando no encuentra nada, y con `set -e` el script se pararía con un registro sin errores, que es justo el mejor día.
- **`$((lineas))`** escribe el número sin los espacios que `wc -l` pone delante en macOS. Los recuentos de `uniq -c` también tienen allí otro espaciado, pero los mismos números ([03.02, apartado 1.6](02-terminal-sacarle-partido.md#16-los-filtros-grep-sort-uniq-wc-cut-head-y-tail)).
- **Comprobado en los casos que fallan**, no solo en el bueno: sin argumentos (2) y con un fichero que no existe (1).

**Errores frecuentes al resolverlo:**

- Contar los errores con `grep -c ERROR` sin los espacios, o con `grep -ci error`: con este registro da lo mismo, pero contaría también un mensaje que hablara de un «error».
- Quedarse con `cut -d ' ' -f 4`, sin el guion final: solo saldría la primera palabra de cada mensaje (`No`, `La`…), y todos los «No se pudo…» se contarían como el mismo.
- Probar solo con el registro bueno: los mensajes de uso y de error también son parte del script, y hay que verlos funcionar.
- Arreglar a Nora quitando el `uniq -c` «porque cuenta mal»: el fallo no está en `uniq`, sino en lo que le llega.

</details>

---
⬅️ [Anterior: Errores y depuración](04-errores-y-depuracion.md) · 📚 [Índice](../00-indice.md)
