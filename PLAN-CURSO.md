# Plan del curso inicial

> 8 de noviembre de 2026. Sale del plan general (`../../PLAN.md`, apartado 5) y del contrato `../kit-cursos/FORMATO.md`. Se cierra con el autor antes de escribir (paso 4 del arranque de un curso, `../../PLAN.md`, apartado 8.3).

## 1. Objetivo

Que cualquiera, sin saber nada, termine preparado para empezar cualquier curso de MyOpenAcademy: entiende qué es programar, maneja su ordenador, la terminal, el editor, Git y GitHub, los formatos de datos, cómo funcionan internet y las aplicaciones, cómo estudiar y cómo usar la IA, y termina con **un repositorio propio publicado en GitHub Pages**.

**Regla para decidir qué entra** (un tema entra solo si las tres son sí): ¿lo necesitan todos los cursos? ¿Se puede explicar sin un lenguaje concreto? ¿Le sirve al alumno antes de empezar su curso?

## 2. Decisiones tomadas

- **Identificador:** `inicial`. **Repositorio:** `myopenacademy/curso-inicial`.
- **Pseudocódigo** para los algoritmos; nada de un lenguaje real.
- **Retos de fase** sobre todo de herramientas, que el kit puede verificar: terminal, Git, Markdown, JSON, YAML, XML y CSV.
- **Licencias:** CC BY-SA 4.0 para el texto y MIT para el código.
- **Preguntas de repaso obligatorias** en todos los módulos.
- **Fases imprescindibles** (1, 2, 3, 5 y 8) y **recomendadas** (4, 6 y 7). Con el acceso libre, quien ya sepa algo se salta la fase.
- **Proyecto para el portfolio:** el módulo final «Tu primer repositorio» (`"proyecto": {"tipo": "modulo"}` en `curso.json`).
- **Está en el límite de tamaño:** lo que se añada debería sustituir algo o ir como recomendado.

## 3. Decisiones pendientes del autor (antes de escribir)

1. **Nombre público** del curso (propuestas: «Fundamentos para programar», «Curso de iniciación»).
2. **Terminal en Windows:** bash para todos con Git Bash o WSL (recomendado) o también PowerShell. Mirar antes cómo lo resuelve el módulo 01.04 del curso de Java original.
3. **Normas de la academia sobre el uso de la IA** en ejercicios y proyectos (las usa el módulo 29).
4. **Versiones** de las herramientas que se enseñan (VS Code, Git…), verificadas en su documentación oficial y fechadas.
5. Qué se verifica de cada ejercicio de herramientas y cómo (se decide junto con la sesión del kit).

## 4. Temario: 8 fases y 31 módulos

♻️ = se adapta del curso de Java original (`../../../Curso Java Completo/`) · 🆕 = nuevo. Los identificadores, los nombres de fichero y las carpetas de las fases se cierran con el autor antes de escribir.

| # | Fase | Módulo | Origen |
|---|---|---|---|
| 1 | **1. Qué es programar** | Qué es programar | ♻️ 00.01 `fase-00-logica/01-que-es-programar.md` |
| 2 | | Algoritmos y pseudocódigo | ♻️ 00.02 `fase-00-logica/02-algoritmos-y-pseudocodigo.md` |
| 3 | | ¿Cómo sé que funciona? Probar un programa | 🆕 |
| 4 | | Paradigmas de programación | ♻️ 00.03 `fase-00-logica/03-paradigmas-de-programacion.md` |
| 5 | **2. Tu ordenador por dentro** | Cómo funciona un ordenador | 🆕 |
| 6 | | Archivos, carpetas y rutas | 🆕 |
| 7 | | Instalar programas, variables de entorno y PATH | 🆕 |
| 8 | **3. Herramientas del programador** | La terminal: lo básico | ♻️ 01.04 `fase-01-entorno/04-terminal-y-linea-de-comandos.md` |
| 9 | | La terminal: sacarle partido | ♻️ parte general de 18.01 `fase-18-despliegue/01-linux-basico.md` |
| 10 | | El editor de código | 🆕 |
| 11 | | Errores y depuración | ♻️ parte general de 02.12 `fase-02-fundamentos/12-depuracion.md` |
| 12 | **4. Formatos y diagramas** | Texto, binario y codificación | 🆕 |
| 13 | | Markdown | 🆕 |
| 14 | | JSON y YAML | ♻️ parte general de 04.11 `fase-04-java-intermedio/11-formatos-de-datos.md` |
| 15 | | XML, CSV y otros | ♻️ parte general de 04.11 (el mismo) |
| 16 | | Diagramas y Mermaid | ♻️ parte general de 03.11 `fase-03-poo/11-uml.md` |
| 17 | **5. Git y GitHub** | Git: fundamentos | ♻️ 01.05 `fase-01-entorno/05-git-fundamentos.md` |
| 18 | | Ramas y conflictos | ♻️ 01.06 `fase-01-entorno/06-git-ramas-y-conflictos.md` |
| 19 | | GitHub | ♻️ 01.07 `fase-01-entorno/07-github.md` |
| 20 | **6. Internet y aplicaciones** | Redes: IP, router, DNS y cortafuegos | ♻️ parte general de 06.05 `fase-06-concurrencia-y-redes/05-redes-y-sockets.md` |
| 21 | | Puertos y `localhost`: tu ordenador como servidor | 🆕 |
| 22 | | La web: HTTP, peticiones, respuestas y APIs | ♻️ 10.01, 10.02 y 10.08 `fase-10-web/01-como-funciona-la-web.md`, `02-apis-y-rest.md`, `08-postman.md` |
| 23 | | Qué es una base de datos | ♻️ 09.01 y 09.02 `fase-09-bases-de-datos/01-conceptos-de-bases-de-datos.md`, `02-tipos-de-bases-de-datos.md` |
| 24 | | Las piezas de una aplicación | 🆕 |
| 25 | | Qué es la IA y cómo funciona por dentro | ♻️ 19.01 `fase-19-spring-ai/01-conceptos-de-ia.md` |
| 26 | **7. Aprender a aprender** | Cómo estudiar con estos cursos | 🆕 |
| 27 | | Organizar tu trabajo | ♻️ parte general de 20.03 `fase-20-profesional/03-metodologias-agiles.md` |
| 28 | | Buscar ayuda | ♻️ parte general de 02.08 `fase-02-fundamentos/08-documentacion-oficial.md` |
| 29 | | Programar con asistentes de IA | ♻️ 20.01 `fase-20-profesional/01-programar-con-asistentes-de-ia.md` |
| 30 | | Seguridad básica | ♻️ partes generales de 14.01 y 14.06 `fase-14-seguridad/01-criptografia-conceptos-y-hash.md`, `06-tokens-y-secretos.md` |
| 31 | **8. Proyecto final** | Tu primer repositorio | 🆕 (ideas de 20.06 `fase-20-profesional/06-portfolio.md`) |

Unos **19 se adaptan** y unos **12 son nuevos**. Qué lleva cada módulo nuevo o ampliado: `../../PLAN.md`, apartado 5.3. Cada fase termina con su `retos.md`.

## 5. Cómo se trabaja

1. Cerrar con el autor las decisiones del apartado 3 y el temario: carpetas, ficheros, identificadores, tiempos, nivel y retos de cada fase. Escribir `curso.json`.
2. Revisión del autor del plan entero antes de escribir nada.
3. Fase 1 y **parar** para que el autor revise estilo, profundidad y formato.
4. Prueba de importación de la fase 1 en una copia de la academia (desde su propio proyecto).
5. El resto, fase a fase, con las reglas de `../CLAUDE.md`.
6. Etiquetar la versión 1.0.0 y publicarlo con la academia (pack base 1.0).
