# Retos de la fase 02 — Tu ordenador por dentro

> **Conviene saber antes:** los módulos de la fase.
> **Tiempo estimado:** 1,5 horas

Estos retos mezclan lo que has aprendido en los tres módulos de la fase: las piezas del ordenador, las unidades y la arquitectura del procesador ([02.01](01-como-funciona-un-ordenador.md)), los ficheros, las carpetas y las rutas en cada sistema ([02.02](02-archivos-carpetas-y-rutas.md)), y cómo se instala un programa y cómo lo encuentra la terminal gracias al PATH ([02.03](03-instalar-programas-y-path.md)).

Van de menor a mayor dificultad, y el último es el más completo. Son **opcionales**: sirven para afianzar lo aprendido y no bloquean nada. Se resuelven **razonando**, sin teclear órdenes: hazlos en papel o en un documento, abre las pistas solo si te atascas y, si tu solución es distinta de la propuesta, comprueba que cumple lo mismo: puede estar igual de bien.

## Reto 1 · Las fotos de la excursión

**Situación real:** Nerea es la fotógrafa de un club de montaña. Ha vuelto de una excursión a Gredos con **420 fotos** de unos **4 MB** cada una y **12 vídeos** de unos **350 MB** cada uno. Lo tiene todo mezclado en una carpeta de su Escritorio de Windows (su usuario es `nerea`) que se llama `Fotos Excursión Gredos 2026 (FINAL)`.

Quiere hacer tres cosas: pasarle todo a Iker, que usa un Mac (su usuario es `iker`), en una memoria USB anunciada como de **8 GB**; subir una copia a la nube del club, con una conexión que sube a **100 Mb/s**; y preparar una página sencilla, `index.html`, con el álbum, que irá dentro de la propia carpeta.

1. ¿Cuánto ocupa todo, en GB (contando de 1000 en 1000)? Al mirar las propiedades de la carpeta, Windows dice que ocupa unos **5,47 GB**, y la memoria USB aparece como de unos **7,45 GB**. Explica las dos cifras. ¿Cabe todo en la memoria?
2. ¿Cuánto tardará, como mínimo, en subir todo a la nube?
3. Propón un nombre para la carpeta y una organización por dentro, de forma que la página del álbum funcione igual en el ordenador de Nerea, en el de Iker y si un día se publica en un servidor.
4. Iker copiará la carpeta dentro de una carpeta `fotos` de su carpeta personal. Con tu organización, escribe la ruta absoluta del primer vídeo en el Mac de Iker, y la de ese mismo vídeo en el ordenador de Nerea (si ella también la guarda en una carpeta `fotos` de su carpeta personal), tal como la enseña el Explorador de Windows y tal como se escribe en Git Bash.
5. Escribe la ruta que tendría que usar `index.html` para mostrar la primera foto. ¿Cambia de un ordenador a otro?

<details>
<summary>Pista 1</summary>

Para sumar, pasa todo a la misma unidad (MB) y después a GB. Para entender las cifras de Windows, repasa el [lío de 1000 y 1024](01-como-funciona-un-ordenador.md#13-kb-mb-gb-y-tb). Para la subida, fíjate en la `b` minúscula de «Mb/s».

</details>

<details>
<summary>Pista 2</summary>

Para los nombres, aplica una a una las reglas del [apartado 1.13 de 02.02](02-archivos-carpetas-y-rutas.md#113-cómo-nombrar-ficheros-y-carpetas). Para las rutas absolutas, empieza por la carpeta personal de cada uno en su sistema ([02.02, apartado 1.11](02-archivos-carpetas-y-rutas.md#111-cómo-se-escribe-una-ruta-en-cada-sistema)); la de la página, cuéntala desde la carpeta donde está `index.html`.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se resuelven las cuentas con las unidades de 02.01, cuidando las dos trampas de siempre (1000 frente a 1024, y bits frente a bytes). Después se ordena la carpeta con las reglas de nombres de 02.02 y se escriben las rutas: las absolutas cambian con el sistema y la persona; la relativa, no.

**1. Cuánto ocupa y si cabe.**

```text
Fotos:   420 × 4 MB   = 1680 MB
Vídeos:   12 × 350 MB = 4200 MB
Total:                  5880 MB = 5,88 GB
```

Las dos cifras de Windows son las mismas cantidades **contadas de 1024 en 1024**, aunque Windows las siga llamando «GB»: 5 880 000 000 bytes ÷ 1 073 741 824 ≈ 5,47, y los 8 000 000 000 bytes de la memoria ÷ 1 073 741 824 ≈ 7,45. No falta nada en ninguna de las dos. Y **sí cabe**: medidas con la misma regla, 5,47 es menos que 7,45, y sobran unos 2 GB. Lo importante es comparar siempre las dos cifras **con la misma regla**: o las dos del fabricante (5,88 de 8) o las dos de Windows (5,47 de 7,45).

**2. La subida a la nube.** La conexión se mide en **megabits** por segundo y los ficheros en **megabytes**, así que primero se pasa a bits (× 8):

```text
5880 MB × 8 = 47 040 Mb
47 040 Mb ÷ 100 Mb/s ≈ 470 segundos, unos 8 minutos
```

Es el mínimo: en la práctica tardará más, porque la velocidad contratada es un máximo que rara vez se alcanza.

**3. La carpeta, ordenada.** Un nombre sin espacios, sin tildes, sin mayúsculas y sin «FINAL» ni «(2)», fuera del Escritorio, y una subcarpeta por tipo de fichero:

```text
excursion-gredos-2026
├── index.html
├── fotos
│   ├── foto-001.jpg
│   ├── foto-002.jpg
│   └── …
└── videos
    ├── video-01.mp4
    └── …
```

Numerar con ceros delante (`001`, `002`… `420`) hace que los nombres salgan en orden en cualquier explorador. Otras organizaciones son igual de válidas (por ejemplo, `img` y `video`); lo importante es que sea coherente y que los nombres sigan las reglas.

**4. Las rutas absolutas del primer vídeo:**

| Dónde | Ruta absoluta |
|---|---|
| Mac de Iker | `/Users/iker/fotos/excursion-gredos-2026/videos/video-01.mp4` |
| Windows de Nerea, como la enseña el Explorador | `C:\Users\nerea\fotos\excursion-gredos-2026\videos\video-01.mp4` |
| Windows de Nerea, en Git Bash | `/c/Users/nerea/fotos/excursion-gredos-2026/videos/video-01.mp4` |

Fíjate en que la parte `fotos/excursion-gredos-2026/videos/video-01.mp4` es igual en las tres: solo cambian la carpeta personal y el separador. Y en que es `Users`, aunque el explorador en español enseñe «Usuarios».

**5. La ruta de la página:** desde `index.html`, que está en `excursion-gredos-2026`, se entra en `fotos`:

```text
fotos/foto-001.jpg
```

**No cambia**: es relativa, así que no lleva la parte que depende del ordenador. Por eso la página funciona igual en el de Nerea, en el de Iker y en un servidor. Si Nerea hubiera escrito la ruta absoluta de su ordenador, en el de Iker no saldría ninguna foto.

**Errores frecuentes al resolverlo:**

- Comparar la cifra del fabricante con la de Windows (5,88 con 7,45, o 8 con 5,47): hay que usar la misma regla en las dos.
- Dividir 5880 entre 100 sin pasar antes los megabytes a megabits: saldría una subida ocho veces más rápida de lo posible.
- Mantener la tilde de «Excursión», los espacios o la extensión en mayúsculas (`.JPG`): en un servidor con Linux, `foto-001.JPG` y `foto-001.jpg` son nombres distintos.
- Escribir `C:\Usuarios\…` o `/Users/iker/Fotos…` cuando la carpeta se llama `fotos`: las rutas se escriben letra a letra.

</details>

## Reto 2 · El programa recién instalado que la terminal no encuentra

**Situación real:** Lucas tiene un MacBook Air con **chip Apple M2**. Para un curso necesita `revisa-md`, una pequeña herramienta de la terminal que revisa documentos (es una herramienta **inventada para este reto**). Su página oficial ofrece estas descargas:

```text
revisa-md-1.4.0-windows-x64.zip
revisa-md-1.4.0-windows-arm64.zip
revisa-md-1.4.0-macos-x64.tar.gz
revisa-md-1.4.0-macos-arm64.tar.gz
revisa-md-1.4.0-linux-x64.tar.gz
```

Las instrucciones de la página dicen: «Descomprime el fichero. Dentro, en la carpeta `bin`, está el programa `revisa-md`. Añade esa carpeta `bin` a tu PATH».

Lucas pulsó el botón grande de la página, que descargó `revisa-md-1.4.0-macos-x64.tar.gz`, y lo descomprimió con doble clic. En el Finder lo ve así: Descargas › revisa-md-1.4.0-macos-x64 › bin › revisa-md. Un compañero le ayudó a añadir la carpeta al PATH escribiendo la ruta que Lucas le dictó mirando el Finder. Después, Lucas **cerró la Terminal y abrió una nueva**, y esto es lo que ve:

```text
% revisa-md --version
zsh: command not found: revisa-md
% command -v revisa-md
% echo $PATH
/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/lucas/Descargas/revisa-md-1.4.0-macos-x64/bin
```

«Pero si está instalado y lo he añadido al PATH», dice Lucas.

1. Lee las tres salidas: ¿qué te dice cada una? Repasa las cuatro causas posibles de un «command not found» y di cuáles puedes descartar ya, y por qué.
2. Encuentra el fallo. ¿Qué carpeta mira el sistema y por qué no encuentra nada en ella?
3. Lucas, además, descargó el fichero equivocado. ¿Cuál debería haber descargado y qué pasaría si se queda con el que tiene?
4. Propón cómo dejarlo bien: qué descargar, dónde guardar el programa (un sitio mejor que Descargas), qué carpeta añadir al PATH y cómo comprobar después que todo funciona, diciendo **qué tiene que ver** en cada salida.
5. Su compañera Alba tiene un portátil con Windows 11 y procesador Intel, y usa Git Bash. ¿Qué fichero de la lista le corresponde? Si guarda el programa siguiendo la misma idea que Lucas, ¿qué carpeta tendría que añadir a su PATH, escrita como la ve el Explorador de Windows y como aparecería en el `echo $PATH` de Git Bash?

<details>
<summary>Pista 1</summary>

Las causas, de más a menos frecuente, están en el [apartado 1.11 de 02.03](03-instalar-programas-y-path.md#111-cuando-el-sistema-no-encuentra-un-programa). Lucas ha abierto una terminal nueva, y el `echo $PATH` enseña la carpeta que añadió: ¿qué te dice eso?

</details>

<details>
<summary>Pista 2</summary>

Compara, letra a letra, la carpeta que hay al final del PATH con la ruta **de verdad** del programa. ¿Cómo se llama de verdad la carpeta que el Finder en español enseña como «Descargas»? Repasa el [apartado 1.5 de 02.02](02-archivos-carpetas-y-rutas.md#15-tu-carpeta-personal).

</details>

<details>
<summary>Pista 3</summary>

Para el fichero: ¿qué [arquitectura](01-como-funciona-un-ordenador.md#110-32-y-64-bits-x86-64-y-arm) tiene un chip M2? ¿Qué pasa en un Mac con chip de Apple cuando ejecutas un programa para Intel?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se sigue el orden de diagnóstico de 02.03 (¿bien escrito?, ¿instalado?, ¿terminal nueva?, ¿carpeta en el PATH?), con las salidas como pruebas. Lo que no cuadra se compara letra a letra con la ruta real, como en 02.02. Y, aparte, se revisa la elección del fichero con la arquitectura de 02.01.

**1. Las tres salidas y las causas que se descartan.**

| Orden | Qué dice |
|---|---|
| `revisa-md --version` | `zsh: command not found`: la terminal (zsh, la de macOS) ha recorrido el PATH y no ha encontrado ningún programa con ese nombre |
| `command -v revisa-md` | Nada: lo confirma, `revisa-md` no está en ninguna carpeta del PATH |
| `echo $PATH` | Siete carpetas; la última es la que añadió Lucas |

- **Mal escrito:** descartado. `revisa-md` coincide letra a letra con el nombre del programa.
- **No instalado:** descartado. El programa existe: Lucas lo ve en el Finder. (Aquí «instalar» es solo descomprimir y añadir al PATH.)
- **Terminal abierta antes del cambio:** descartado. Abrió una nueva, y la prueba es que su carpeta **sí aparece** en el `echo $PATH`.
- **La carpeta del programa no está en el PATH:** es la que queda. Parece que sí está… pero hay que mirarla de cerca.

**2. El fallo: `Descargas` no existe.** El PATH dice `/Users/lucas/Descargas/revisa-md-1.4.0-macos-x64/bin`, pero en macOS en español el Finder **enseña** «Descargas» y la carpeta se llama de verdad `Downloads`. La ruta real del programa es:

```text
/Users/lucas/Downloads/revisa-md-1.4.0-macos-x64/bin/revisa-md
```

Lucas dictó lo que veía en el Finder, y el compañero escribió una carpeta que no existe. El sistema hace exactamente lo que dice el PATH: mira en `/Users/lucas/Descargas/…/bin`, no encuentra nada (no existe), sigue con la siguiente y, como era la última, se rinde. No busca «algo parecido».

**3. El fichero equivocado.** El M2 es un chip de Apple, de arquitectura **ARM** (arm64), así que le corresponde `revisa-md-1.4.0-macos-arm64.tar.gz`. El que tiene es para Intel (x64). Con el PATH arreglado, seguramente funcionaría igual, gracias a Rosetta 2, el traductor de macOS, pero iría más lento, y Apple ya ha anunciado que Rosetta 2 dejará de funcionar para casi todos los programas. Es justo el error del «botón grande» que elige por ti.

**4. Cómo dejarlo bien:**

1. Descargar `revisa-md-1.4.0-macos-arm64.tar.gz` de la **página oficial** y descomprimirlo.
2. Moverlo fuera de Descargas, a una carpeta suya para herramientas con un nombre sencillo, por ejemplo `/Users/lucas/herramientas/revisa-md`, que quedaría así:

   ```text
   /Users/lucas/herramientas
   └── revisa-md
       └── bin
           └── revisa-md
   ```

3. Cambiar en el PATH la carpeta mala por la buena, **copiando la ruta** con el Finder en lugar de dictarla:

   ```text
   /Users/lucas/herramientas/revisa-md/bin
   ```

4. Cerrar la Terminal y abrir una nueva.
5. Comprobar:

   | Orden | Qué tiene que ver |
   |---|---|
   | `command -v revisa-md` | Una ruta: `/Users/lucas/herramientas/revisa-md/bin/revisa-md` |
   | `revisa-md --version` | El nombre del programa y una versión (1.4.0), en lugar de «command not found» |
   | `echo $PATH` | La carpeta nueva en la lista, y no la de `Descargas` |

Sacarlo de Descargas tiene una ventaja más: la carpeta ya no lleva la versión en el nombre, y cuando salga la 1.5.0 basta con sustituir el programa, sin tocar el PATH. Cómo se añade una carpeta al PATH lo aprenderás en «La terminal: sacarle partido» (fase 3).

**5. Alba (Windows 11, Intel, Git Bash).** Intel es x86-64, así que le toca `revisa-md-1.4.0-windows-x64.zip`. Con la misma idea, su carpeta para el PATH sería:

| Cómo se ve | Carpeta |
|---|---|
| Explorador de Windows | `C:\Users\alba\herramientas\revisa-md\bin` |
| `echo $PATH` en Git Bash | `/c/Users/alba/herramientas/revisa-md/bin` |

(En Windows el programa será un `.exe`, pero la carpeta que va al PATH es la misma idea: la que contiene el programa.)

**Lo importante:** un «command not found» no significa «no está instalado». Aquí el programa estaba en el disco y la carpeta «estaba» en el PATH, pero escrita con el nombre que **enseña** el Finder, no con el **de verdad**. Con `echo $PATH`, `command -v` y una comparación letra a letra se encuentra casi siempre la causa, sin adivinar.

**Errores frecuentes al resolverlo:**

- Recomendar «reinstálalo» o «reinicia el ordenador»: no arreglaría nada, porque el PATH seguiría señalando una carpeta que no existe.
- Dar por buena la carpeta del PATH porque «pone Descargas, que es donde está».
- Añadir al PATH la carpeta `revisa-md-1.4.0-macos-x64` en lugar de su subcarpeta `bin`: el sistema busca el programa **directamente** en cada carpeta de la lista, no en las que tienen dentro.
- Pensar que el fichero para Intel no puede ser la causa del «command not found»: no lo es (esa es la carpeta), pero hay que cambiarlo igualmente.

</details>

---
⬅️ [Anterior: Instalar programas, variables de entorno y PATH](03-instalar-programas-y-path.md) · 📚 [Índice](../00-indice.md)
