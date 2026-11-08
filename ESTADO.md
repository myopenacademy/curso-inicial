# Estado del curso inicial

> Actualízalo al terminar cada módulo o paso. Es la memoria entre sesiones: lo que no esté aquí o en `PLAN-CURSO.md` no lo sabrá la sesión siguiente.

## Dónde estamos

**8 de noviembre de 2026:** decisiones del curso aprobadas por el autor (nombre «Fundamentos para programar», bash para todos con Git Bash, normas sobre la IA, Núcleo/Ampliación por módulo, retos de la fase 1 sin código verificable) y **temario cerrado** con carpetas, ficheros, identificadores, horas y nivel (`PLAN-CURSO.md`, apartados 2, 4, 6 y 7). Versiones de las fases 1 a 3 verificadas y fechadas. **`curso.json` escrito** con los 31 módulos como `"disponible": false` con su fichero previsto, y los retos de cada fase previstos con `"retos_disponibles": false` (`FORMATO.md` ya lo admite). Ningún módulo escrito.

**En paralelo:** una sesión en `../kit-cursos/` prepara las plantillas y `formato_academia.py`. Hasta que estén, se escribe siguiendo `../kit-cursos/FORMATO.md`.

## Siguiente paso

Decidir con el autor **los retos de cada fase y qué se verifica de cada ejercicio de herramientas** (`PLAN-CURSO.md`, apartado 3) y pasarlo a la sesión del kit. Después, revisión del autor del plan entero y la fase 1.

## Dependencias con el kit

Se trabaja a la vez que `../kit-cursos/`. **Lee su `ESTADO.md` (solo leer) al empezar cada sesión y antes de cerrar cada fase**, y actualiza esta tabla.

| El curso espera del kit | Para | Estado |
|---|---|---|
| `formato_academia.py` | Comprobar y **cerrar la fase 1** (se puede escribir antes; no se da por cerrada sin pasar la comprobación) | Pendiente |
| Plantillas (`curso.json`, módulo, retos) | No bloquea: se sigue `FORMATO.md` | Pendiente |
| Comprobadores de los formatos (JSON, YAML, XML, CSV, Markdown…) | Verificar ejemplos, ejercicios y retos | Pendiente |
| Que un módulo con `"disponible": false` pueda llevar su `fichero` previsto (aviso 1) | Que `curso.json` guarde los nombres cerrados y el índice muestre el temario completo | Hecho en `FORMATO.md` (versión 1) el 8 de noviembre de 2026; aplicado en `curso.json` |

| El kit espera del curso | Para | Estado |
|---|---|---|
| Qué ejercicios y retos de herramientas lleva y qué hay que comprobar de cada uno | Sus comprobadores de formatos | Temario cerrado; **la lista es lo siguiente** que se decide con el autor |
| `curso.json` y la fase 1 escritos | Probar `formato_academia.py` con un curso real | `curso.json` escrito (31 módulos sin escribir); fase 1 pendiente |

Si algo bloquea, dilo al autor: él pasa la información de una sesión a otra.

## Hecho

| Fecha | Qué |
|---|---|
| 2026-11-08 | Repositorio creado con el plan del curso. |
| 2026-11-08 | Decisiones del curso aprobadas, temario cerrado con identificadores, versiones de las fases 1 a 3 verificadas y `curso.json` escrito. |

## Pendiente de comprobar con el kit

Lo escrito antes de que exista `formato_academia.py`, para comprobarlo cuando esté:

- `curso.json`: forma, identificadores y que no falta ningún módulo del temario.

## Avisos para el kit

Lo que no encaje con `FORMATO.md` (el autor lo lleva a la sesión del kit):

1. ✅ **Resuelto** (`FORMATO.md` 3.2, campos `fichero` y `retos_disponibles`). **Fichero previsto en módulos sin escribir** (8 de noviembre de 2026, aprobado por el autor). `FORMATO.md` 3.2 dice que un módulo con `"disponible": false` «no tiene fichero», así que `curso.json` no puede guardar los nombres de fichero ya cerrados. Se pide que pueda llevar su `fichero` previsto (sin exigir que exista mientras `disponible` sea `false`), como hace Code Academy con las lecciones pendientes; así el índice muestra el temario completo desde el principio. Como el formato no se ha publicado, el autor propone ajustarlo dentro de la versión 1. Lo mismo convendría para el `retos` de una fase todavía sin retos escritos. Los nombres previstos están en `PLAN-CURSO.md`, apartado 4.
2. ✅ **Resuelto** (`FORMATO.md` 3.2; el kit lo trata como error). **Títulos en texto plano** (8 de noviembre de 2026, regla del autor). Los títulos de curso, fase, módulo, ejercicio y reto son texto plano, sin formato Markdown (nada de `` ` ``, `**` ni `*`), tanto en `curso.json` como en el encabezado del módulo. `FORMATO.md` no lo dice; convendría añadirlo y que `formato_academia.py` lo compruebe.
