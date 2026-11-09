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

Aprobadas por el autor el 8 de noviembre de 2026:

- **Nombre público: «Fundamentos para programar».** Dice qué es sin sonar a curso menor. («Kit» queda solo para las herramientas.)
- **Terminal: bash para todos.** En Windows, con **Git Bash**, que se instala con Git for Windows (hace falta igualmente para la fase 5); WSL se menciona como alternativa para cursos posteriores (DevOps). Por qué: un solo juego de comandos, el mismo que en servidores, Docker y CI, y verificable por el kit en Linux. El curso de Java original pone PowerShell y bash lado a lado (módulo 01.04), lo que duplica contenido y verificación. Consecuencias: Git for Windows se instala en el módulo «Instalar programas» (fase 2); «La terminal: lo básico» lleva solo una tabla pequeña de equivalencias con PowerShell, para reconocerlos; y **afecta al curso de Java**, que hoy da PowerShell por supuesto (se anota en el plan general).
- **macOS** (8 de noviembre de 2026): su terminal usa zsh por defecto y su bash es el 3.2. Por eso **los ejemplos y scripts del curso usan solo lo que funciona en bash 3.2** (nada de arrays asociativos, `mapfile`, `${var,,}` ni otras novedades de bash 4 y 5), y cuando un comando se comporta distinto en macOS y en Linux (`sed -i`, `date`, algunas opciones de `ls`…), **el módulo lo avisa**. Afecta también a la decisión 9 del plan general.
- **Salidas en español** (8 de noviembre de 2026): las salidas de Git y de los comandos se muestran en español, que es lo que verá el alumno; el kit fija el idioma al verificar (`LC_ALL`).
- **Rama principal `main`** (8 de noviembre de 2026): el curso dice `main` y explica cómo configurarlo (`init.defaultBranch`); el kit lo fija al verificar.
- **Convenciones de pseudocódigo añadidas en la fase 1** (aprobadas el 8 de noviembre de 2026): `lista[posición]` con la **primera posición en la 0**, como en Python, Java y JavaScript; y **nombres sin tildes ni eñes** (`anio`), como en la programación real.
- **Fragmentos en lenguajes reales, solo para ilustrar** (8 de noviembre de 2026). «Sin un lenguaje concreto» quiere decir que el curso no enseña ningún lenguaje ni pide programar en uno. Para que se entiendan ideas como «compilado frente a interpretado» o los paradigmas, el texto puede mostrar **fragmentos cortos** en Python, Java, JavaScript o SQL, variando de lenguaje según lo que ilustre mejor cada idea (sin favorecer ninguno). Van en el texto, sin carpeta `codigo/`, y nunca se pide al alumno que los ejecute. Cada uno lleva una frase del tipo «no hace falta que entiendas cada línea: fíjate en…». Antes de incluirlos se comprueban en `.verificacion/`, fuera de Git. Lo que el alumno hace es siempre pseudocódigo o herramientas.
- **Aviso sobre las salidas de terminal** (8 de noviembre de 2026). El primer módulo de la fase 2 que muestre salidas de terminal avisa **una sola vez** (los demás módulos no lo repiten; como mucho enlazan a ese aviso): las salidas del curso salen de una terminal concreta (la del kit: usuario `alumno`, máquina `ordenador`, Linux en español), y en su ordenador cambiarán el nombre de usuario, las rutas (en Windows con Git Bash, `/c/Users/…`), las fechas y algún detalle en macOS; y, cuando llegue a Git (fase 5), los identificadores de los commits, sus fechas y el nombre y el correo de quien los hace también serán distintos de los del curso (es lo primero que notará al comparar su `git log` con el del curso). Que se fije en **lo importante de cada salida**, no en que sea idéntica.
- **«Fichero» en todo el texto** (9 de noviembre de 2026), como en la fase 1, el kit y `FORMATO.md`; es regla común de todos los cursos en `../CLAUDE.md` («Vocabulario común»). El módulo 02.02 avisa al principio de que «fichero» y «archivo» son lo mismo y de que las pantallas de Windows y macOS en español dicen «archivo» («Explorador de archivos», el menú «Archivo»). Su título se queda «Archivos, carpetas y rutas», porque es la palabra que el alumno verá y buscará en su ordenador. Los nombres propios de las pantallas («Explorador de archivos») se escriben como aparecen.
- **Teclas y atajos con `<kbd>`** (9 de noviembre de 2026): una etiqueta por tecla, unidas con «+» (`<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>T</kbd>`); `FORMATO.md` 10.5 lo admite y la academia lo muestra como una tecla. Dentro de los bloques de código, sin HTML. Es regla común de todos los cursos en `../CLAUDE.md` (guía de estilo común).
- **La fase 8 no tiene retos**: el proyecto final ya es el reto.
- **Normas sobre el uso de la IA** (apartado 6). Son de toda la academia, no solo de este curso: se anotan también en el plan general.
- **Núcleo o Ampliación se marca por módulo, no por fase**: el proyecto final usa módulos de fases «recomendadas» (Markdown, JSON, Mermaid, tableros, secretos), y varios módulos de la fase 6 los necesitan casi todos los cursos.
- **Retos de la fase 1 sin código verificable:** el pseudocódigo no se ejecuta, así que llevan una solución razonada y una tabla de prueba (lo que enseña el módulo «Probar un programa»).
- **Títulos en texto plano** (regla de `FORMATO.md` 3.2): sin negrita, cursiva, comillas invertidas, enlaces ni HTML, en `curso.json` y en los encabezados; los nombres de órdenes y ficheros se escriben sin más («Lee la salida de git status»). Vale también para los títulos de ejercicios y retos.
- **Versiones** de las herramientas: se verifican en la documentación oficial y se fechan en el texto; las de las fases 1 a 3, ya (apartado 7); el resto, al escribir cada fase.

## 3. Decisiones pendientes

Ninguna. Qué se verifica de cada ejercicio y los retos de cada fase se aprobaron el 8 de noviembre de 2026 (apartado 8).

## 4. Temario: 8 fases y 31 módulos

Cerrado con el autor el 8 de noviembre de 2026. Prefijo de los identificadores: `inicial.`; el de cada módulo es el nombre de su fichero sin número; el de cada fase, `inicial.fase.` y el nombre de su carpeta sin número. Todos los módulos son de nivel **Básico**; N = Núcleo, A = Ampliación. Horas con ejercicios, sin retos.

| Fase (carpeta → id) | Fichero | Módulo | Horas | N/A |
|---|---|---|---|---|
| `fase-01-que-es-programar` → `inicial.fase.que-es-programar` | `01-que-es-programar.md` | Qué es programar | 2 | N |
| | `02-algoritmos-y-pseudocodigo.md` | Algoritmos y pseudocódigo | 4 | N |
| | `03-probar-un-programa.md` | ¿Cómo sé que funciona? Probar un programa | 3 | N |
| | `04-paradigmas-de-programacion.md` | Paradigmas de programación | 1,5 | A |
| `fase-02-tu-ordenador` → `inicial.fase.tu-ordenador` | `01-como-funciona-un-ordenador.md` | Cómo funciona un ordenador | 2 | N |
| | `02-archivos-carpetas-y-rutas.md` | Archivos, carpetas y rutas | 2,5 | N |
| | `03-instalar-programas-y-path.md` | Instalar programas, variables de entorno y PATH | 2,5 | N |
| `fase-03-herramientas` → `inicial.fase.herramientas` | `01-terminal-lo-basico.md` | La terminal: lo básico | 3 | N |
| | `02-terminal-sacarle-partido.md` | La terminal: sacarle partido | 3 | N |
| | `03-editor-de-codigo.md` | El editor de código | 1,5 | N |
| | `04-errores-y-depuracion.md` | Errores y depuración | 2 | N |
| `fase-04-formatos-y-diagramas` → `inicial.fase.formatos-y-diagramas` | `01-texto-binario-y-codificacion.md` | Texto, binario y codificación | 1,5 | A |
| | `02-markdown.md` | Markdown | 2 | N |
| | `03-json-y-yaml.md` | JSON y YAML | 2,5 | N |
| | `04-xml-csv-y-otros.md` | XML, CSV y otros | 2 | A |
| | `05-diagramas-y-mermaid.md` | Diagramas y Mermaid | 2 | N |
| `fase-05-git-y-github` → `inicial.fase.git-y-github` | `01-git-fundamentos.md` | Git: fundamentos | 3 | N |
| | `02-ramas-y-conflictos.md` | Ramas y conflictos | 3 | N |
| | `03-github.md` | GitHub | 2,5 | N |
| `fase-06-internet-y-aplicaciones` → `inicial.fase.internet-y-aplicaciones` | `01-redes.md` | Redes: IP, router, DNS y cortafuegos | 2,5 | A |
| | `02-puertos-y-localhost.md` | Puertos y localhost: tu ordenador como servidor | 1,5 | N |
| | `03-la-web-http-y-apis.md` | La web: HTTP, peticiones, respuestas y APIs | 3 | N |
| | `04-que-es-una-base-de-datos.md` | Qué es una base de datos | 2 | A |
| | `05-piezas-de-una-aplicacion.md` | Las piezas de una aplicación | 1,5 | N |
| | `06-que-es-la-ia.md` | Qué es la IA y cómo funciona por dentro | 2 | N |
| `fase-07-aprender-a-aprender` → `inicial.fase.aprender-a-aprender` | `01-como-estudiar.md` | Cómo estudiar con estos cursos | 1 | N |
| | `02-organizar-tu-trabajo.md` | Organizar tu trabajo | 1,5 | N |
| | `03-buscar-ayuda.md` | Buscar ayuda | 1 | N |
| | `04-programar-con-asistentes-de-ia.md` | Programar con asistentes de IA | 2 | N |
| | `05-seguridad-basica.md` | Seguridad básica | 1,5 | N |
| `fase-08-proyecto-final` → `inicial.fase.proyecto-final` | `01-primer-repositorio.md` | Tu primer repositorio | 6 | N |

Total: unas **70,5 horas**, más los retos (los de la fase 1, 3 horas; los de la fase 2, 1,5; los de la fase 3, 2). Tiempos de la fase 2 aprobados por el autor el 9 de noviembre de 2026 (pasa de 5,5 a 7 horas; el 02.03 incluye instalar de verdad). **La fase 1 está aprobada por el autor (8 de noviembre de 2026) y sus tiempos son definitivos.** La fase 1 quedó en 10,5 horas el 8 de noviembre de 2026, tras **ajustar la dosis** a un principiante: 01.03 y 01.04 se quedan con las ideas y dejan el detalle a cada curso. **Criterio para las fases siguientes:** «¿le sirve al alumno antes de empezar su curso?»; la idea sí, el detalle no siempre. Vigilar la extensión: el curso estaba ya en el límite.

### 4.1. Origen de cada módulo

♻️ = se adapta del curso de Java original (`../../../Curso Java Completo/`) · 🆕 = nuevo.

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
| 21 | | Puertos y localhost: tu ordenador como servidor | 🆕 |
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

Unos **19 se adaptan** y unos **12 son nuevos**. Qué lleva cada módulo nuevo o ampliado: `../../PLAN.md`, apartado 5.3. Retos de cada fase: apartado 8.

## 5. Cómo se trabaja

1. ~~Cerrar con el autor las decisiones y el temario: carpetas, ficheros, identificadores, tiempos y nivel. Escribir `curso.json`.~~ Hecho el 8 de noviembre de 2026, junto con los retos de cada fase y qué se verifica de cada ejercicio (apartado 8).
2. ~~Revisión del autor del plan entero antes de escribir nada.~~ Aprobado el 8 de noviembre de 2026, con los ajustes de glosario, ficheros obligatorios y retos (apartados 8 a 10).
3. ~~Fase 1 y **parar** para que el autor revise estilo, profundidad y formato.~~ Aprobada el 8 de noviembre de 2026, tal como está.
4. Prueba de importación de la fase 1 en una copia de la academia (desde su propio proyecto).
5. El resto, fase a fase, con las reglas de `../CLAUDE.md`.
6. Etiquetar la versión 1.0.0 y publicarlo con la academia (pack base 1.0).

## 6. Normas sobre el uso de la IA

Aprobadas por el autor el 8 de noviembre de 2026. Son de **toda la academia** (se anotan también en el plan general) y las explica el módulo «Programar con asistentes de IA». Son recomendaciones: no hay corrección ni seguimiento.

1. **Intenta cada ejercicio tú primero.** Usa la IA como profesor: que te explique, te dé pistas o revise tu solución, no que la haga por ti.
2. **Comprueba siempre lo que te dé**, con casos de prueba (módulo «Probar un programa»).
3. **Nunca pegues** contraseñas, claves ni datos personales en un chat de IA.
4. **En el proyecto final puedes usarla**, pero debes entender y poder explicar todo lo que entregues. Cuéntalo en el README, en una sección «Cómo lo hice».
5. **Las soluciones del curso ya están plegadas**: mira antes la tuya.

## 7. Versiones

Verificadas en la documentación oficial el 8 de noviembre de 2026. En el texto de los módulos se fechan igual.

| Herramienta | Versión | Fuente |
|---|---|---|
| Git | 2.56.0 (28 de septiembre de 2026) | git-scm.com, «Latest source release» |
| Git for Windows (incluye Git Bash) | 2.56.0(4) (26 de octubre de 2026) | git-scm.com/install/windows |
| Visual Studio Code | 1.145 (4 de noviembre de 2026; con la actualización 1.145.2) | code.visualstudio.com/updates |
| Bash | 5.3 (5 de julio de 2025) | ftp.gnu.org/gnu/bash |

VS Code saca versión cada mes: en el texto se dice «la versión de noviembre de 2026 (1.145)» y se explica que se actualiza solo. Las del resto de fases (Mermaid, `curl`, etc.) se verifican al escribir cada fase.

## 8. Qué se verifica y retos de cada fase

**Orden de la terminal** (aprobado el 8 de noviembre de 2026): la terminal se enseña en la fase 3, y en Windows no hay bash hasta que el módulo 02.03 instala Git for Windows. Por eso la fase 2 **no tiene ejercicios de bash**: 02.02 trabaja las rutas con el explorador de archivos y razonando sobre un árbol de carpetas (cómo se escribe una ruta en Windows, macOS, Linux y Git Bash, sin teclear órdenes); 02.03 instala Git for Windows y VS Code, explica las variables de entorno y el PATH y da un **primer contacto mínimo con la terminal** solo para comprobar lo instalado (`git --version`, `echo $PATH`, `command -v git`), con el **aviso único sobre las salidas**; esas salidas cambian mucho entre sistemas, así que se presentan como ejemplo, diciendo en qué tiene que fijarse el alumno en cada una (que sale una versión, que Git está en el PATH…). Los ejercicios de bash empiezan en la fase 3: «Descargas» pasa a sus retos y «añadir una carpeta al PATH y ejecutar un script», a «La terminal: sacarle partido».

Aprobado por el autor el 8 de noviembre de 2026 y pasado a la sesión del kit (lista detallada en `ESTADO.md`, «Lista para el kit»). Todo lo verificable se comprueba **sin internet**; lo que no se puede verificar va con salida de ejemplo y una nota que lo dice.

**Dos o tres retos por fase** (aprobado el 8 de noviembre de 2026), de menor a mayor dificultad, como los ejercicios. El de esta tabla es **el más completo** de cada fase, el último; los demás se deciden al escribir la fase y mezclan lo de varios módulos.

| Fase | Reto más completo |
|---|---|
| 1. Qué es programar | Algoritmo en pseudocódigo con su tabla de prueba (no se verifica) |
| 2. Tu ordenador | Diagnosticar un «command not found»: por qué un programa instalado no se encuentra (PATH), razonando sin ejecutar |
| 3. Herramientas | Script que analiza un log (`grep`, `sort`, `wc`); antes, ordenar una carpeta de «Descargas» por tipo de fichero (`mkdir`, `mv`) |
| 4. Formatos | Pasar un CSV de pedidos a JSON y YAML y documentarlo en Markdown con un diagrama |
| 5. Git | Historial con una rama y un conflicto resuelto |
| 6. Internet | Consultar una API local pequeña y guardar los resultados en JSON |
| 7. Aprender | Repositorio con `.gitignore`, `.env.example` y plantilla de *issue* |
| 8. Proyecto | Sin retos: el proyecto es el reto |

## 9. El glosario

Este curso tiene el **`glosario.md` común** que enlazan todos los cursos (`../kit-cursos/FORMATO.md`, apartado 9). **Crece con cada módulo**: cada término nuevo que se explica en un módulo entra en el glosario en el mismo commit, con una definición corta y un enlace al apartado del módulo donde se explica. Un `## Letra` por letra y un `### Término` por término, en orden alfabético.

**Criterio para que un término entre** (aprobado el 8 de noviembre de 2026): solo los que **se usan en varios cursos** o que el alumno **va a necesitar consultar después** (algoritmo, variable, caso de prueba, API…), no cada palabra que un módulo explica una vez. La fase 1 explica 96 términos y entran 55. Los paradigmas se nombran completos («Programación funcional», no «Funcional»), porque otros cursos enlazan a esas anclas. La lista de cada fase se guarda en `.verificacion/`.

## 10. Cuándo se crean los ficheros obligatorios

| Fichero | Cuándo |
|---|---|
| `00-indice.md` | Con la fase 1, y al día con cada módulo (lo generará el kit desde `curso.json`; mientras, a mano y con el mismo formato) |
| `ROADMAP.md` | Con la fase 1 |
| `glosario.md` | Con el primer módulo, y crece con cada uno (apartado 9) |
| `99-chuleta-global.md` | Con el primer módulo, y crece a medida que se escriben (lo generará el kit) |
| `LICENSE`, `CONTRIBUTING.md`, `CHANGELOG.md` | Antes de publicar (paso 6 del apartado 5) |
