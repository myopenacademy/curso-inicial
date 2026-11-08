# Curso inicial de MyOpenAcademy

Se suma a `../../CLAUDE.md` (reglas comunes) y `../CLAUDE.md` (reglas de todos los cursos).

## Antes de hacer nada en cada sesión

1. Lee `../../README.md`, `../../PLAN.md` (sobre todo el apartado 5, el curso inicial) y `../../ESTADO.md`.
2. Lee `PLAN-CURSO.md` y `ESTADO.md` de esta carpeta, y el contrato `../kit-cursos/FORMATO.md`.
3. Lee, solo para saber cómo va, `../kit-cursos/ESTADO.md` y revisa la sección de dependencias de tu `ESTADO.md`: dile al autor si algo te bloquea o si la otra sesión necesita algo de esta.
4. Resume al autor en pocas líneas dónde se quedó el trabajo y qué toca a continuación.

## Coordinación con la sesión del kit

Este curso y el kit (`../kit-cursos/`) se trabajan a la vez, en dos sesiones. El autor es quien pasa los mensajes de una a otra.

- **Orden:** esta sesión va primero. Empieza por las decisiones del curso y el temario, porque de ahí sale lo que el kit necesita: **la lista de ejercicios y retos de herramientas y qué hay que comprobar de cada uno**. En cuanto la tengas, escríbela en tu `ESTADO.md` y avisa al autor para la sesión del kit.
- **Puedes avanzar sin el kit:** decisiones, temario, `curso.json` y escribir la fase 1 siguiendo `FORMATO.md`.
- **Tienes que esperar al kit para:** dar por cerrada la fase 1 (hace falta pasar `formato_academia.py`) y verificar los ejemplos y ejercicios de formatos.
- **Avísale al autor siempre que cambie algo que afecta a la otra sesión**: cuando termines algo que la otra espera, cuando necesites algo de ella o cuando encuentres algo que no encaja con `FORMATO.md`. Hazlo **al final de tu respuesta**, en un bloque aparte que empiece por «📣 **Para la sesión del kit:**» y con el mensaje **listo para copiar y pegar** en la otra sesión (por ejemplo: «Mira el `ESTADO.md` del curso inicial: ya está la lista de ejercicios del curso; con ella puedes hacer la tarea 4»).
- Antes de avisar, **actualiza la tabla de dependencias de tu `ESTADO.md`**, para que la otra sesión lo encuentre escrito aunque el autor no le pase el mensaje.
- **Si estás bloqueado** esperando a la otra sesión, dilo claramente, propón al autor en qué puedes avanzar mientras tanto y prepárale el mensaje para la otra.
- No toques nunca el repositorio de la otra sesión: solo lees su `ESTADO.md`.

## Qué es

El curso común de MyOpenAcademy: lo que conviene saber antes de cualquier otro curso. Forma parte del **pack base 1.0** (la academia más este DLC, ya instalado). Identificador del curso: `inicial`. En GitHub irá en `myopenacademy/curso-inicial`.

## Reglas de este curso

- **Principiante absoluto:** no da nada por sabido.
- **Sin un lenguaje de programación concreto:** los algoritmos van en **pseudocódigo**. Los ejemplos, ejercicios y retos verificables son de **herramientas**: terminal, Git, Markdown, JSON, YAML, XML y CSV.
- **Cumple `../kit-cursos/FORMATO.md`** (versión 1). No lo copies ni lo cambies desde aquí: si algo no encaja, anótalo en `ESTADO.md` («Avisos para el kit») y díselo al autor, que lo llevará a la sesión del kit.
- **Origen:** unos 19 módulos se adaptan del curso de Java original, `../../../Curso Java Completo/`, que **solo se lee** (para copiar contenido de su repositorio, solo comandos de Git de lectura: `git show`, `git ls-tree`, `git cat-file`). Se toma la **parte general** de cada módulo, sin Java. La tabla de origen está en `PLAN-CURSO.md`.
- **Glosario común:** este curso tiene el `glosario.md` que enlazan todos los demás (FORMATO.md, apartado 9).
- **Verificación:** mientras el kit no tenga `formato_academia.py` y sus comprobadores, escribe siguiendo `FORMATO.md` y deja anotado en `ESTADO.md` qué falta por comprobar.
- **Para al terminar cada fase** para que el autor la revise.
