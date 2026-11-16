# Registro de cambios

Qué cambia en cada versión del curso, de la más nueva a la más antigua. Cada versión publicada se etiqueta en Git (`v1.0.0`) y es la que se instala en la academia. Los números siguen `MAYOR.MENOR.PARCHE` ([`FORMATO.md`, apartado 11](https://github.com/myopenacademy/kit-cursos/blob/main/FORMATO.md#11-versiones-del-curso)):

- **PARCHE:** erratas y mejoras de texto o de código, sin cambiar la estructura.
- **MENOR:** contenido nuevo (módulos, ejercicios, retos, etapas) sin quitar ni cambiar identificadores.
- **MAYOR:** cambios de estructura con equivalencias, o una edición nueva del curso.

## Sin publicar

- Nada todavía.

## 1.0.0 — 16 de noviembre de 2026

Primera versión publicada, para el pack base 1.0 de MyOpenAcademy: **8 fases, 31 módulos y 219 ejercicios**, con retos al final de las fases 1 a 7, el glosario común de la academia y un proyecto final para el portfolio (un repositorio propio publicado en GitHub Pages). Todo el código, verificado en la terminal del kit; versiones de las herramientas revisadas el 16 de noviembre de 2026 (Git 2.56, Visual Studio Code 1.146, bash 5.3, curl 8.18.0 en las salidas, Mermaid 12.3.0 y GitHub Pages con Jekyll 3.10.0).

Cómo se hizo, fase a fase:

- Decisiones, temario cerrado con identificadores y `curso.json` (8 de noviembre de 2026).
- Fase 1, «Qué es programar»: cuatro módulos, retos y glosario de sus términos (8 de noviembre de 2026; aprobada por el autor).
- Fase 2, «Tu ordenador por dentro»: tres módulos, dos retos y sus términos en el glosario (9 de noviembre de 2026; aprobada por el autor).
- Fase 3, «Herramientas del programador»: cuatro módulos, dos retos con bash verificados y sus términos en el glosario (9 de noviembre de 2026; aprobada por el autor).
- Fase 4, «Formatos y diagramas»: cinco módulos, tres retos verificados (con la comparación de un CSV con su JSON) y sus términos en el glosario (9 de noviembre de 2026; corregida tras la segunda opinión de la raíz y aprobada por el autor el 16 de noviembre de 2026).
- Fase 5, «Git y GitHub»: tres módulos, tres retos con sesiones de Git encadenadas y verificadas (los remotos, con un repositorio local que hace de GitHub) y sus términos en el glosario (16 de noviembre de 2026; corregida tras la segunda opinión de la raíz y aprobada por el autor el 16 de noviembre de 2026).
- Fase 6, «Internet y aplicaciones»: seis módulos, tres retos con `curl` contra un servidor local verificados (y que se pueden hacer sin él, con respuestas guardadas) y sus términos en el glosario (16 de noviembre de 2026; corregida tras la segunda opinión de la raíz y aprobada por el autor el 16 de noviembre de 2026).
- Fase 7, «Aprender a aprender»: cinco módulos (cómo estudiar, organizar el trabajo, buscar ayuda, asistentes de IA y seguridad básica), tres retos verificados (con una plantilla de *issue* en `.github/` y `git check-ignore`) y sus términos en el glosario (16 de noviembre de 2026; corregida tras la segunda opinión de la raíz y aprobada por el autor el 16 de noviembre de 2026).
- Fase 8, «Proyecto final»: el módulo «Tu primer repositorio» (un repositorio propio planificado con *issues*, con README, datos en JSON, diagrama Mermaid e historial en Git, publicado en GitHub Pages con Jekyll), con su proyecto modelo verificado y sus términos en el glosario (16 de noviembre de 2026; corregida tras la segunda opinión de la raíz y aprobada por el autor el 16 de noviembre de 2026). Con ella, 05.03 explica cómo firmar los commits con la dirección `noreply` de GitHub para no publicar el correo personal.
