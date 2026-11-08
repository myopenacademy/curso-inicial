# Estado del curso inicial

> Actualízalo al terminar cada módulo o paso. Es la memoria entre sesiones: lo que no esté aquí o en `PLAN-CURSO.md` no lo sabrá la sesión siguiente.

## Dónde estamos

**8 de noviembre de 2026:** decisiones del curso aprobadas por el autor (nombre «Fundamentos para programar», bash para todos con Git Bash, normas sobre la IA, Núcleo/Ampliación por módulo, retos de la fase 1 sin código verificable) y **temario cerrado** con carpetas, ficheros, identificadores, horas y nivel (`PLAN-CURSO.md`, apartados 2, 4, 6 y 7). Versiones de las fases 1 a 3 verificadas y fechadas. **`curso.json` escrito** con los 31 módulos como `"disponible": false` con su fichero previsto, y los retos de cada fase previstos con `"retos_disponibles": false` (`FORMATO.md` ya lo admite). **Lista para el kit** (qué se verifica de cada ejercicio y retos de cada fase) aprobada y anotada abajo; la fase 8 no tiene retos. Ningún módulo escrito.

**En paralelo:** una sesión en `../kit-cursos/` prepara las plantillas y `formato_academia.py`. Hasta que estén, se escribe siguiendo `../kit-cursos/FORMATO.md`.

## Siguiente paso

Revisión del autor del plan entero (`PLAN-CURSO.md`) y, con su visto bueno, escribir la fase 1 (módulos 01 a 04 y `retos.md`) y parar para que la revise.

## Dependencias con el kit

Se trabaja a la vez que `../kit-cursos/`. **Lee su `ESTADO.md` (solo leer) al empezar cada sesión y antes de cerrar cada fase**, y actualiza esta tabla.

| El curso espera del kit | Para | Estado |
|---|---|---|
| `formato_academia.py` | Comprobar y **cerrar la fase 1** (se puede escribir antes; no se da por cerrada sin pasar la comprobación) | **Hecho** (8 de noviembre de 2026): el curso da 0 errores |
| `generar_indice.py` | Generar `00-indice.md` desde `curso.json` | **Hecho** (8 de noviembre de 2026) |
| Plantillas (`curso.json`, módulo, retos) | No bloquea: se sigue `FORMATO.md` | **Hechas** en `../kit-cursos/plantillas/` (8 de noviembre de 2026); se usan como referencia |
| Comprobadores de los formatos (JSON, YAML, XML, CSV, Markdown…) | Verificar ejemplos, ejercicios y retos | Pendiente |
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
| 2. Tu ordenador | bash: rutas relativas y absolutas en un árbol de carpetas; añadir una carpeta al PATH y ejecutar un script | Ordenar una carpeta de «Descargas» por tipo de fichero: se comprueba el árbol final |
| 3. Herramientas | bash: comandos básicos, redirecciones, tuberías, permisos, un script; leer errores de scripts que fallan a propósito | Script que analiza un log (`grep`, `sort`, `wc`): se comprueba su salida |
| 4. Formatos | Markdown, JSON, YAML, XML y CSV, válidos y rotos a propósito; codificación (`file`, `iconv`); Mermaid | CSV de pedidos a JSON y YAML, documentado en Markdown con un diagrama: cada fichero y que los datos coinciden |
| 5. Git | Commits, historial, ramas, conflicto resuelto, `.gitignore` | Historial con una rama y un conflicto resuelto: log y estado final |
| 6. Internet | `curl` contra el servidor local (códigos de estado, cabeceras, JSON de respuesta); «puerto en uso» | Consultar una API local y guardar los resultados en JSON: se comprueba el fichero |
| 7. Aprender | `.gitignore` que no deja subir secretos (`git check-ignore`); plantilla de *issue* en Markdown | Repositorio con `.gitignore`, `.env.example` y plantilla de *issue* |
| 8. Proyecto | La plantilla del proyecto: README en Markdown, datos en JSON y diagrama Mermaid | **Sin retos** (aviso 3) |

## Pendiente de comprobar con el kit

Lo escrito antes de que exista `formato_academia.py`, para comprobarlo cuando esté:

- `curso.json`: forma, identificadores y que no falta ningún módulo del temario.
- **`00-indice.md` se genera con el kit** (`python3 ../kit-cursos/herramientas/nucleo/generar_indice.py`, desde el 8 de noviembre de 2026): no se edita a mano; se regenera cada vez que cambia `curso.json` o la cabecera de un módulo (`--comprobar` dice si está al día). `99-chuleta-global.md` se escribe a mano mientras el kit no tenga su generador; en cuanto exista, se regenera con él y no se vuelve a editar a mano.

## Avisos para el kit

Lo que no encaje con `FORMATO.md` (el autor lo lleva a la sesión del kit):

1. ✅ **Resuelto** (`FORMATO.md` 3.2, campos `fichero` y `retos_disponibles`). **Fichero previsto en módulos sin escribir** (8 de noviembre de 2026, aprobado por el autor). `FORMATO.md` 3.2 dice que un módulo con `"disponible": false` «no tiene fichero», así que `curso.json` no puede guardar los nombres de fichero ya cerrados. Se pide que pueda llevar su `fichero` previsto (sin exigir que exista mientras `disponible` sea `false`), como hace Code Academy con las lecciones pendientes; así el índice muestra el temario completo desde el principio. Como el formato no se ha publicado, el autor propone ajustarlo dentro de la versión 1. Lo mismo convendría para el `retos` de una fase todavía sin retos escritos. Los nombres previstos están en `PLAN-CURSO.md`, apartado 4.
2. ✅ **Resuelto** (`FORMATO.md` 3.2; el kit lo trata como error). **Títulos en texto plano** (8 de noviembre de 2026, regla del autor). Los títulos de curso, fase, módulo, ejercicio y reto son texto plano, sin formato Markdown (nada de `` ` ``, `**` ni `*`), tanto en `curso.json` como en el encabezado del módulo. `FORMATO.md` no lo dice; convendría añadirlo y que `formato_academia.py` lo compruebe.
3. ✅ **Resuelto** (`FORMATO.md` 6). **Fase que solo contiene el proyecto final, sin retos** (8 de noviembre de 2026, aprobado por el autor). `FORMATO.md` dice que conviene que toda fase tenga retos y que el kit avisa si faltan. La fase 8 del curso inicial solo tiene el proyecto final (`"proyecto": {"tipo": "modulo"}`), que ya es el reto, así que el aviso saldría siempre. Se pide que el kit no avise cuando la fase solo contiene el módulo del proyecto final.
