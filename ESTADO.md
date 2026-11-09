# Estado del curso inicial

> Actualízalo al terminar cada módulo o paso. Es la memoria entre sesiones: lo que no esté aquí o en `PLAN-CURSO.md` no lo sabrá la sesión siguiente.

## Dónde estamos

**9 de noviembre de 2026: fase 2 aprobada por el autor**, tras la segunda opinión de la sesión de la raíz (tres precisiones: «Archivos» de GNOME, etiquetas de descarga de VS Code para macOS confirmadas en la web oficial —es `.dmg`— y `/ucrt64/bin` de Git for Windows 2.56 confirmado en sus notas de versión). **Glosario:** desde la fase 3 se edita directamente en `glosario.md` (cada módulo añade sus términos en su commit, con el criterio aprobado); el script que lo reconstruía desde `.verificacion/` deja de usarse para el glosario. Se ha pedido al kit `declarar_ejercicios.py` como herramienta común.

Fase 2 escrita, revisada en conjunto y cerrada: Tres módulos (02.01 a 02.03, con 27 ejercicios) y `retos.md` con dos retos que se resuelven razonando, sin bash. Mismo método que la fase 1 (tres autores en paralelo, un editor para la revisión de conjunto, comprobaciones propias). Tiempos aprobados: 2 h, 2,5 h y 2,5 h, más 1,5 h de retos. «Fichero» en todo el texto, con el aviso en 02.02; teclas con `<kbd>`; datos que caducan confirmados en fuentes oficiales (lo que solo salía en prensa o guías de terceros, quitado o descrito de forma general). Comprobaciones de cierre: `formato_academia.py` 0 errores (5 avisos: retos de las fases 3 a 7); `verificar_codigo.py` con Docker, las 3 sesiones del 02.03 correctas con la terminal en español; Mermaid 12.2.0 y 10.9.8, los 23 diagramas del curso bien. Glosario: 82 términos (27 nuevos de la fase 2).

**8 de noviembre de 2026: fase 1 aprobada por el autor tal como está, sin cambios, con los tiempos como definitivos** (01.01, 2 h; 01.02, 4 h; 01.03, 3 h; 01.04, 1,5 h; retos, 3 h). Fija el estilo, la profundidad y el formato de los 31 módulos: las fases siguientes se escriben igual.

Cómo se hizo (para repetirlo): cuatro autores en paralelo con el mismo encargo; una revisión de conjunto por un solo editor (tono, cada término definido una vez, sin solapes, notación unificada, dosis de principiante); comprobaciones propias (formato del kit, Mermaid 12.2.0, fragmentos y salidas en `.verificacion/`); segunda opinión de la sesión de la raíz y correcciones; un commit por módulo. Criterio de dosis: «¿le sirve al alumno antes de empezar su curso?»; la idea sí, el detalle no siempre. Glosario: solo términos de varios cursos o que se consultarán después.

## Siguiente paso

**En marcha (9 de noviembre de 2026): fase 3 escrita (los cuatro módulos pasan el verificador del kit con Docker) y en revisión de conjunto**, con el mismo método; el editor tiene como prioridad la dosis (salieron 1.728, 2.291, 1.219 y 1.674 líneas para 3, 3, 1,5 y 2 h) y escribe los retos con bash verificado (después, revisión de conjunto por un editor, que escribe también los retos: ordenar «Descargas» y el script que analiza un log). **Reparto de los dos módulos de terminal:** 03.01 es moverse y manejar ficheros (`pwd`, `ls`, `cd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `cat`, `less`, `head`, `tail`, `grep` y `find` sencillos, `echo`, ayuda, trucos, comodines y comillas; solo bash, con una tabla pequeña de equivalencias con PowerShell); 03.02 es lo que viene después (entrada y salida estándar y redirecciones, tuberías y filtros, variables y el PATH en la práctica con el ejercicio de añadir una carpeta al PATH, permisos y `sudo`, procesos, códigos de salida y un primer script). 03.04 enlaza lo que ya explican 01.01, 01.03 y 02.03 y aporta el método de depurar, `bash -x` y la idea de depurador. Si la sesión se corta a medias, lo escrito está sin commit en `fase-03-herramientas/`: revisarlo antes de seguir.

**Fase 3, «Herramientas del programador»**, la primera con bash: ejemplos y ejercicios con sus ficheros de verificación (`FORMATO.md` 7.1) y verificados con Docker; «La terminal: lo básico» enlaza a la carpeta actual (02.02 §1.9) y al aviso único (02.03 §2.2) en lugar de volver a explicarlos, y la terminal, bash y orden ya están definidos en 02.03.

**Prueba de importación de la fase 1: hecha** (9 de noviembre de 2026, en una copia de prueba de la academia, revisada por el autor en el navegador). El curso no cambia nada: los identificadores de `curso.json` se quedan con punto y el «Siguiente» de 01.04 a `retos.md` está bien. Es la academia la que tiene que mostrar los retos (al final de cada fase en el índice y como «Siguiente» del último módulo). El importador que lee `curso.json` está pendiente en la academia; avisarán cuando esté.

## Cómo se cambian los documentos

Los cambios en varios ficheros a la vez (plan, estado, módulos) se hacen con la herramienta común del kit, `python3 ../kit-cursos/herramientas/nucleo/reemplazar.py cambios.json` (`--comprobar` para probar sin escribir), que aplica **todas las sustituciones o ninguna** y comprueba después que el texto nuevo está en su sitio; el commit va encadenado con `&&`, así que solo se hace si todo ha ido bien. Motivo (8 de noviembre de 2026): dos veces, un script escribió unos ficheros, falló en otro y el commit se hizo igual con el cambio a medias.

## Dependencias con el kit

Se trabaja a la vez que `../kit-cursos/`. **Lee su `ESTADO.md` (solo leer) al empezar cada sesión y antes de cerrar cada fase**, y actualiza esta tabla.

| El curso espera del kit | Para | Estado |
|---|---|---|
| `formato_academia.py` | Comprobar y **cerrar la fase 1** (se puede escribir antes; no se da por cerrada sin pasar la comprobación) | **Hecho** (8 de noviembre de 2026): el curso da 0 errores |
| `generar_indice.py` | Generar `00-indice.md` desde `curso.json` | **Hecho** (8 de noviembre de 2026) |
| `reemplazar.py` en las herramientas comunes (cambios en varios ficheros, todos o ninguno) | Que quede en Git y la usen todos los proyectos | **Hecho** (9 de noviembre de 2026, commit `f839009` del kit) |
| Terminal del kit en español (`language-pack-es-base`) y `command -v git` en `/usr/bin/git` | Las sesiones del 02.03 | **Hecho** (9 de noviembre de 2026, commit `80e803a` del kit); `verificar_codigo.py --versiones` enseña lo instalado |
| `declarar_ejercicios.py` (ejercicios de un módulo a `curso.json`, conservando los identificadores ya publicados) y que `formato_academia.py` compruebe el orden alfabético y los repetidos del glosario | Publicar cada módulo sin scripts fuera de Git | Pedido el 9 de noviembre de 2026 |
| **Decidido por el autor (9 de noviembre de 2026): coreutils de GNU** en la terminal del kit, como Git Bash, Debian, Fedora y casi todos los servidores. El kit cambia la imagen y avisa; **antes de cerrar la fase 3, volver a verificarla entera con Docker** y actualizar las salidas que cambien. Contexto: Ubuntu 26.04 trae **uutils coreutils 0.10.0** (Rust), con mensajes de `ls`, `cat`, `rmdir`, `mkdir` en inglés o mezclados, fechas de `ls -l` en inglés y `ls` con mayúsculas primero; ¿instalar las de GNU, más parecidas a Git Bash y a la mayoría de Linux? Y corregir el README del kit, que dice GNU | Las salidas de la fase 3 | Pedido el 9 de noviembre de 2026 |
| Dos detalles de la terminal del kit: `$USER` no está definida en las sesiones (`docker exec` no la pone; pasar `-e USER=alumno`), y bash 3.2 se ejecuta en el mismo contenedor justo después de bash 5, así que un script que deja algo creado no da lo mismo la segunda vez (usar un contenedor limpio) | Las sesiones y scripts de la fase 3 | Pedido el 9 de noviembre de 2026 |
| `generar_chuleta_global.py` y `comprobar_mermaid.py` | Chuleta global y diagramas | **Hecho** (8 de noviembre de 2026); los 23 diagramas de la fase 1 se dibujan bien |
| Plantillas (`curso.json`, módulo, retos) | No bloquea: se sigue `FORMATO.md` | **Hechas** en `../kit-cursos/plantillas/` (8 de noviembre de 2026); se usan como referencia |
| Comprobadores de los formatos (JSON, YAML, XML, CSV, Markdown…) | Verificar ejemplos, ejercicios y retos de la fase 4 | **Hecho** (8 de noviembre de 2026); falta la comparación CSV ↔ JSON, que el kit hará con el reto de la fase 4 |
| Que un módulo con `"disponible": false` pueda llevar su `fichero` previsto (aviso 1) | Que `curso.json` guarde los nombres cerrados y el índice muestre el temario completo | Hecho en `FORMATO.md` (versión 1) el 8 de noviembre de 2026; aplicado en `curso.json` |
| Verificar con idioma español (`LC_ALL`), rama `main` y Git con autor y fechas fijos; servidor HTTP local; comprobar la compatibilidad con bash 3.2 | Los ejercicios y retos de las fases 2 a 8 | Recibido por el kit: tarea 4 de su `PLAN.md` |
| No avisar de la falta de retos en una fase que solo contiene el proyecto final (aviso 3) | La fase 8 | **Hecho** en `FORMATO.md` 6 (versión 1) |

| El kit espera del curso | Para | Estado |
|---|---|---|
| Qué ejercicios y retos de herramientas lleva y qué hay que comprobar de cada uno | Sus comprobadores de formatos | **Hecho** el 8 de noviembre de 2026: ver «Lista para el kit» |
| `curso.json` y la fase 1 escritos | Probar `formato_academia.py` con un curso real | `curso.json` escrito (31 módulos sin escribir); fase 1 pendiente |

Si algo bloquea, dilo al autor: él pasa la información de una sesión a otra.

## Hecho

| Fecha | Qué |
|---|---|
| 2026-11-08 | Repositorio creado con el plan del curso. |
| 2026-11-08 | Decisiones del curso aprobadas, temario cerrado con identificadores, versiones de las fases 1 a 3 verificadas y `curso.json` escrito. |
| 2026-11-08 | Ficheros y retos previstos en `curso.json`; títulos en texto plano. Lista para el kit aprobada (macOS y bash 3.2, salidas en español, rama `main`, fase 8 sin retos). |
| 2026-11-08 | Módulo 01.01 Qué es programar escrito, revisado con la fase y disponible en `curso.json`, con sus ejercicios y sus términos en el glosario. |
| 2026-11-08 | Módulo 01.02 Algoritmos y pseudocódigo escrito, revisado con la fase y disponible en `curso.json`, con sus ejercicios y sus términos en el glosario. |
| 2026-11-08 | Módulo 01.03 ¿Cómo sé que funciona? Probar un programa escrito, revisado con la fase y disponible en `curso.json`, con sus ejercicios y sus términos en el glosario. |
| 2026-11-08 | Módulo 01.04 Paradigmas de programación escrito, revisado con la fase y disponible en `curso.json`, con sus ejercicios y sus términos en el glosario. |
| 2026-11-08 | Retos de la fase 1 (tres) y revisión de conjunto de la fase. Comprobaciones de cierre: formato 0 errores, Mermaid 12.2.0 y 10.9.1 sin fallos, fragmentos verificados. |
| 2026-11-09 | Fase 2: módulos 02.01, 02.02 y 02.03 y retos (dos), con revisión de conjunto; un commit por módulo (`925d8f5`, `823f545`, `163ef4f`). |

## Convenciones de verificación para las fases 2 en adelante

Desde el 8 de noviembre de 2026, `FORMATO.md` 7.1 fija los ficheros de verificación de cada ejemplo o solución con carpeta en `codigo/` (`entrada.txt`, `args.txt`, `termina-con-error.txt`, `salida-variable.txt`, `sesion.txt`, `debe-fallar.txt`, `separador.txt`) y las líneas exactas del texto tras el «📁 Código» (`**Salida:**`, `**Salida de error:**`, ``**En tu terminal** (`sesion.txt`):``), cada una con su bloque `text`. **Lo de bash de las fases 2 y 3 se escribe ya así.** El verificador del kit va en este orden: bash y sesiones de terminal; después formatos, Git y `curl`.

### Verificador del kit (desde el 8 de noviembre de 2026)

`python3 ../kit-cursos/herramientas/nucleo/verificar_codigo.py` (o con una fase o un módulo detrás). Scripts: bloque `bash` + «📁 Código» igual al `.sh`, ejecutado con `bash fichero.sh` (`args.txt`, `entrada.txt`) y comparado con «**Salida:**». Sesiones: «En tu terminal (`sesion.txt`):» con la pantalla (`$ `), terminal de 100 columnas, ficheros copiados con fecha 15 de enero de 2026, 10:00. **Entorno con Docker** (para cerrar una fase, siempre con Docker): Ubuntu 26.04.1 en español, hora de Madrid, Git 2.56.0, usuario `alumno`, máquina `ordenador`, sin red, identidad de Git «Ana García <ana@example.com>» y rama `main`: **las salidas esperadas se escriben con eso**. Los scripts se ejecutan también con bash 3.2.57 y deben hacer lo mismo; las diferencias de `sed`, `date` o `ls` entre macOS y Linux se avisan en el texto.

### Sesiones de Git (fase 5, desde el 8 de noviembre de 2026)

En la terminal del kit: fechas de commit fijas que avanzan (el primero, 15 de enero de 2026 a las 10:00; cada uno, un minuto después; un commit que falla no cuenta; otras fechas con `GIT_AUTHOR_DATE` y `GIT_COMMITTER_DATE` en la propia orden), identidad «Ana García <ana@example.com>» y rama `main` salvo `git config` en la sesión. Git no traduce las fechas («Date: Thu Jan 15 10:00:00 2026 +0100») ni el resumen («1 file changed, 1 insertion(+)»): se muestran tal cual. Sin paginador en el kit; en el equipo del alumno una salida larga se abre en `less` (se sale con `q`): decirlo en el texto.

**Fase 6 (`curl`):** al decidir sus ejercicios, decir al kit qué API necesitan (rutas, respuestas, códigos de estado) para su servidor local.

### Comprobadores de formatos (fase 4, desde el 8 de noviembre de 2026)

En el verificador del kit. Cada fichero de datos de una carpeta enlazada con «📁 Código» debe ser válido: JSON y YAML que se leen; XML bien formado; CSV con el separador de `separador.txt` (si no hay, la coma) y las mismas columnas en cada fila; Markdown de `codigo/` con enlaces, anclas, tablas y bloques bien escritos. **Con `debe-fallar.txt`, todos los ficheros de datos de la carpeta tienen que fallar: cada ejemplo roto, en su propia carpeta.** Un `.json` y un `.yaml` con el mismo nombre en la misma carpeta deben tener los mismos datos (para las conversiones). **Pendiente:** la comparación de un CSV con su JSON, para el reto de la fase 4; el kit la añade cuando se escriba ese reto: avisarle de cómo queda.

## Lista para el kit

Aprobada por el autor el 8 de noviembre de 2026. Qué ejercicios y retos de herramientas lleva el curso y qué hay que comprobar de cada uno. Los títulos exactos de los ejercicios se sabrán al escribir cada módulo; aquí va **qué tipo de comprobación necesita cada fase**.

### Condiciones comunes al verificar

- **Sin internet:** nada se verifica contra servicios externos.
- **Idioma español:** las salidas esperadas del curso están en español; el kit fija el idioma al ejecutar (`LC_ALL`, por ejemplo `es_ES.UTF-8`). Ojo: la máquina que verifica necesita ese *locale* y las traducciones de Git.
- **Git reproducible:** autor, correo y fechas fijos (`GIT_AUTHOR_NAME`, `GIT_AUTHOR_DATE`, `GIT_COMMITTER_*`…), para que los identificadores de commit salgan siempre iguales, y rama principal `main` (`init.defaultBranch=main`).
- **bash 3.2 como mínimo común:** macOS trae bash 3.2 (y zsh por defecto), y la versión de bash de Git Bash está por comprobar. Los scripts del curso solo usan lo que funciona en bash 3.2; conviene que el kit lo compruebe (ejecutarlos con un bash 3.2, o al menos detectar lo que no existe en 3.2: arrays asociativos, `mapfile`/`readarray`, `${var,,}`, `${var^^}`, `|&`, `&>>`…). Las diferencias de comandos entre macOS y Linux (`sed -i`, `date`, `ls`) las avisa el texto del módulo; el kit verifica en Linux.

### Por tipo

| Tipo | Qué comprueba el kit |
|---|---|
| bash | Ejecuta el script en una carpeta temporal; compara la salida esperada y los ficheros y carpetas que debe dejar. |
| Git | Ejecuta los comandos en un repositorio temporal (condiciones comunes); compara `git log`, `git status` y el contenido final. |
| JSON, YAML, XML | Que el fichero es válido, o que falla si lleva `debe-fallar.txt`. En los de convertir, que el JSON y el YAML cargan los mismos datos. |
| CSV | Lo lee con su `separador.txt`; mismas columnas en todas las filas y el número de filas esperado. |
| Markdown | Enlaces y anclas válidos, tablas bien formadas, bloques de código cerrados. |
| Mermaid | Que el diagrama se dibuja (`comprobar_mermaid`). |
| HTTP con `curl` | Contra un **servidor HTTP local pequeño que pone el kit**, nunca contra internet; compara la salida con sus partes variables. |
| No se verifica | Pseudocódigo; salidas que dependen de la máquina (`ping`, `nslookup`, `ss`); VS Code; lo que necesita cuenta de GitHub. Van con salida de ejemplo y una nota. |

### Por fase

| Fase | Ejercicios con herramientas | Reto de la fase |
|---|---|---|
| 1. Qué es programar | Ninguno: pseudocódigo y tablas de prueba | Algoritmo con tabla de prueba (no se verifica) |
| 2. Tu ordenador | **Ninguno de bash** (cambio del 8 de noviembre de 2026: la terminal se enseña en la fase 3). Rutas razonadas sobre un árbol; en 02.03, primer contacto con `git --version`, `echo $PATH` y `command -v git`, presentado como ejemplo | Diagnosticar un «command not found» razonando (no se verifica) |
| 3. Herramientas | bash: rutas relativas y absolutas en un árbol de carpetas; comandos básicos, redirecciones, tuberías, permisos, un script; añadir una carpeta al PATH y ejecutar un script; leer errores de scripts que fallan a propósito | Ordenar una carpeta de «Descargas» por tipo de fichero (se comprueba el árbol final) y, el más completo, un script que analiza un log (`grep`, `sort`, `wc`): se comprueba su salida |
| 4. Formatos | Markdown, JSON, YAML, XML y CSV, válidos y rotos a propósito; codificación (`file`, `iconv`); Mermaid | CSV de pedidos a JSON y YAML, documentado en Markdown con un diagrama: cada fichero y que los datos coinciden |
| 5. Git | Commits, historial, ramas, conflicto resuelto, `.gitignore` | Historial con una rama y un conflicto resuelto: log y estado final |
| 6. Internet | `curl` contra el servidor local (códigos de estado, cabeceras, JSON de respuesta); «puerto en uso» | Consultar una API local y guardar los resultados en JSON: se comprueba el fichero |
| 7. Aprender | `.gitignore` que no deja subir secretos (`git check-ignore`); plantilla de *issue* en Markdown | Repositorio con `.gitignore`, `.env.example` y plantilla de *issue* |
| 8. Proyecto | La plantilla del proyecto: README en Markdown, datos en JSON y diagrama Mermaid | **Sin retos** (aviso 3) |

## Pendiente de comprobar con el kit

Lo escrito antes de que exista `formato_academia.py`, para comprobarlo cuando esté:

- `curso.json`: forma, identificadores y que no falta ningún módulo del temario.
- **`00-indice.md` se genera con el kit** (`python3 ../kit-cursos/herramientas/nucleo/generar_indice.py`, desde el 8 de noviembre de 2026): no se edita a mano; se regenera cada vez que cambia `curso.json` o la cabecera de un módulo (`--comprobar` dice si está al día). `99-chuleta-global.md` **no se escribe a mano**: se genera con `python3 ../kit-cursos/herramientas/nucleo/generar_chuleta_global.py` (solo incluye los módulos disponibles). Los diagramas se comprueban con `python3 ../kit-cursos/herramientas/nucleo/comprobar_mermaid.py` (necesita Node y Chrome). El glosario sí se escribe a mano (es contenido).

## Avisos para el kit

Lo que no encaje con `FORMATO.md` (el autor lo lleva a la sesión del kit):

1. ✅ **Resuelto** (`FORMATO.md` 3.2, campos `fichero` y `retos_disponibles`). **Fichero previsto en módulos sin escribir** (8 de noviembre de 2026, aprobado por el autor). `FORMATO.md` 3.2 dice que un módulo con `"disponible": false` «no tiene fichero», así que `curso.json` no puede guardar los nombres de fichero ya cerrados. Se pide que pueda llevar su `fichero` previsto (sin exigir que exista mientras `disponible` sea `false`), como hace Code Academy con las lecciones pendientes; así el índice muestra el temario completo desde el principio. Como el formato no se ha publicado, el autor propone ajustarlo dentro de la versión 1. Lo mismo convendría para el `retos` de una fase todavía sin retos escritos. Los nombres previstos están en `PLAN-CURSO.md`, apartado 4.
2. ✅ **Resuelto** (`FORMATO.md` 3.2; el kit lo trata como error). **Títulos en texto plano** (8 de noviembre de 2026, regla del autor). Los títulos de curso, fase, módulo, ejercicio y reto son texto plano, sin formato Markdown (nada de `` ` ``, `**` ni `*`), tanto en `curso.json` como en el encabezado del módulo. `FORMATO.md` no lo dice; convendría añadirlo y que `formato_academia.py` lo compruebe.
3. ✅ **Resuelto** (`FORMATO.md` 6). **Fase que solo contiene el proyecto final, sin retos** (8 de noviembre de 2026, aprobado por el autor). `FORMATO.md` dice que conviene que toda fase tenga retos y que el kit avisa si faltan. La fase 8 del curso inicial solo tiene el proyecto final (`"proyecto": {"tipo": "modulo"}`), que ya es el reto, así que el aviso saldría siempre. Se pide que el kit no avise cuando la fase solo contiene el módulo del proyecto final.
