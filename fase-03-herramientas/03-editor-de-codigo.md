# 03.03 El editor de código

> **Versiones:** Visual Studio Code 1.146 (a 16 de noviembre de 2026)
> **Conviene saber antes:** [03.01 La terminal: lo básico](01-terminal-lo-basico.md) · [02.03 Instalar programas, variables de entorno y PATH](../fase-02-tu-ordenador/03-instalar-programas-y-path.md)
> **Tiempo estimado:** 1,5 horas
> **Nivel:** Básico · Núcleo

## Qué aprenderás

- Qué es un **editor de código** y en qué se diferencia de un **procesador de textos** (como Word) y de un **IDE**.
- Por qué este curso usa **Visual Studio Code** y qué otros editores existen.
- Por qué se **abre una carpeta** entera y no ficheros sueltos.
- Las **partes de la ventana** de VS Code: barra de actividad, explorador, editor con pestañas, barra de estado y panel.
- Cómo **guardar** sin perder nada: el punto de «sin guardar» de la pestaña y el **autoguardado**.
- Cómo usar la **paleta de comandos**, la puerta a todo lo que sabe hacer el editor.
- Cómo **buscar y reemplazar** en un fichero y en todos los ficheros de una carpeta.
- Qué es el **resaltado de sintaxis** y por qué depende de la extensión del fichero.
- Qué son las **extensiones** del editor, cómo se instalan y cómo elegirlas **con cuidado**.
- Cómo usar la **terminal integrada** (en Windows, con Git Bash) y abrir VS Code desde la terminal con `code .`.
- Los **atajos de teclado** esenciales, en Windows, Linux y macOS.

## 1. Teoría

### 1.1. Qué es un editor de código

Ya sabes que el [código fuente](../fase-01-que-es-programar/01-que-es-programar.md#14-qué-es-un-programa) es el texto de un programa tal y como lo escribe una persona, y que se guarda en [ficheros](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#11-ficheros-donde-se-guardan-los-datos), como cualquier otro dato. Para escribir esos ficheros necesitas un programa, y el que usa quien programa se llama **editor de código**.

Un **editor de código** es un programa para escribir y leer ficheros de **texto plano** (código fuente, configuración, documentación), con ayudas pensadas para programar: colores, búsquedas, atajos, una terminal…

**Texto plano** quiere decir **solo los caracteres**: letras, números, símbolos, espacios y saltos de línea. Nada de negritas, tamaños de letra, márgenes ni imágenes. Es lo que leen los programas: un ordenador que ejecuta tu código, Git cuando guarda tu historial o un servidor que lee su configuración. Ninguno de ellos sabe qué es una negrita.

> **📌 Nota:** el Bloc de notas de Windows o TextEdit de macOS también escriben texto plano (TextEdit, solo si lo pones en modo «texto sin formato»). Son editores de texto muy sencillos. Un editor de código es lo mismo, pero con muchas más ayudas para programar.

### 1.2. Editor, procesador de textos e IDE

Hay tres tipos de programa con los que se escribe, y conviene no confundirlos:

| | Procesador de textos | Editor de código | IDE |
|---|---|---|---|
| **Ejemplos** | Word, LibreOffice Writer, Google Docs | VS Code, Sublime Text, Notepad++, Vim | IntelliJ IDEA, Visual Studio, PyCharm, Eclipse |
| **Para qué** | Documentos para personas: cartas, informes, apuntes | Ficheros de texto plano para programas: código, configuración, documentación | Programar en un lenguaje concreto, con todo incluido |
| **Qué guarda** | Texto **con formato** (negritas, tamaños, imágenes) en un fichero especial (`.docx`, `.odt`) | **Solo texto** (`.txt`, `.md`, `.json`, `.py`…) | Solo texto, como el editor |
| **¿Sirve para programar?** | **No** | **Sí** | **Sí** |

**Por qué un procesador de textos no sirve para programar.** Un fichero `.docx` no es texto plano: por dentro guarda el texto junto con todo el formato, y un programa que espera código no lo entiende. Además, los procesadores de textos «mejoran» lo que escribes sin avisar: cambian las comillas rectas (`"`) por comillas tipográficas (`“ ”`), ponen mayúscula al principio de cada línea o convierten dos guiones en una raya. Para una carta está muy bien; para el código, cada uno de esos cambios es un error (lo verás en el [error típico 3.3](#33-escribir-código-en-un-procesador-de-textos)).

**Qué es un IDE.** Un **IDE** (*entorno de desarrollo integrado*, por sus siglas en inglés) es un editor de código con **todo lo que hace falta para trabajar en un lenguaje concreto** ya incluido y conectado: ejecutar el programa con un botón, encontrar errores mientras escribes, depurarlo paso a paso, hacer las pruebas… Suelen estar pensados para uno o pocos lenguajes, y son más pesados. Cada curso de la academia te dirá si usa un IDE y cuál; para este curso, que no usa ningún lenguaje concreto, el editor de código es lo que necesitas.

### 1.3. Por qué VS Code

Este curso usa **Visual Studio Code** (VS Code), que ya instalaste en [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#15-instalar-visual-studio-code). Por estos motivos:

- **Es gratuito** y está hecho sobre código abierto: el código de base es público, con licencia MIT, y Microsoft le añade partes propias y publica el editor con su propia licencia. También envía a Microsoft datos de uso y de errores (lo que se llama **telemetría**), que puedes limitar o apagar con el ajuste `telemetry.telemetryLevel` (con `off`, nada). (Según las preguntas frecuentes y la documentación oficial de VS Code, consultadas el 9 de noviembre de 2026.)
- **Funciona igual en Windows, macOS y Linux**, así que las explicaciones valen para todos.
- **Es el más usado**: lleva años en cabeza de la encuesta anual de Stack Overflow a quienes programan; en la de 2025, tres de cada cuatro personas que respondieron decían usarlo (el 75,9 %, según la web oficial de la encuesta, consultada el 9 de noviembre de 2026). Eso significa que hay mucha documentación y mucha ayuda en internet.
- **Sirve para cualquier lenguaje y formato**: el mismo editor te vale para este curso (Markdown, JSON, YAML…) y para el curso que hagas después.

**No es el único.** Hay otros editores muy buenos: Sublime Text, Zed, Notepad++ (solo en Windows), Vim o Neovim (que funcionan dentro de la terminal), VSCodium (una versión de VS Code sin las partes propias de Microsoft)… Todo lo que vas a aprender aquí (abrir una carpeta, guardar, buscar y reemplazar, extensiones, atajos) existe en casi todos, con otros nombres. Si ya usas otro y te gusta, puedes seguir el curso con él; solo tendrás que buscar dónde está cada cosa.

> **📌 Nota:** VS Code saca una versión nueva **cada semana** y se actualiza solo. A 16 de noviembre de 2026, la más reciente es la **1.146**. Si tu versión es otra, algún menú puede haber cambiado de sitio; lo que explica este módulo es lo básico, que cambia muy poco.

**En qué idioma lo verás.** VS Code viene **en inglés**. Si tu sistema está en español, la primera vez suele ofrecerte instalar el **paquete de idioma español** para tener los menús en español (lo verás en el [apartado 1.11](#111-extensiones-útiles-para-este-curso)). Por eso, en este módulo, cada menú y cada opción aparecen con su nombre en inglés y, entre paréntesis, el que verás con el paquete de español: **File > Open Folder…** (**Archivo > Abrir carpeta…**). Los nombres en español se han comprobado en la traducción oficial de VS Code el 9 de noviembre de 2026.

> **📌 Nota:** en **macOS**, los menús de las aplicaciones están en la barra de arriba de la pantalla, no dentro de la ventana; además hay un menú más, **Code**, a la izquierda de **File**. Los nombres son los mismos.

### 1.4. Abre carpetas, no ficheros sueltos

Esta es la primera costumbre de quien programa, y la más importante del módulo: **en el editor se abre la carpeta del proyecto, no un fichero suelto**.

Un proyecto casi nunca es un solo fichero: es una **carpeta** con ficheros y subcarpetas que se usan entre sí (lo viste en el [árbol de una web](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#21-un-árbol-real-la-web-de-una-panadería)). Cuando abres la carpeta entera:

- **Ves todo el proyecto** en el explorador del editor, y saltas de un fichero a otro sin buscar en el disco.
- **Buscar y reemplazar** funciona en todos los ficheros de la carpeta, no solo en el que tienes delante.
- **La terminal integrada se abre en esa carpeta**: es tu [carpeta actual](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#19-la-carpeta-actual-y-las-rutas-relativas), así que las rutas relativas del proyecto funcionan.
- **Las herramientas** que verás después (Git, los programas de tu curso) saben que todo eso es un proyecto.

Cómo se abre una carpeta (VS Code 1.146, a 16 de noviembre de 2026):

- Desde el menú: **File > Open Folder…** (**Archivo > Abrir carpeta…**), y eliges la carpeta.
- Desde la terminal, con `code .` ([apartado 1.13](#113-abrir-vs-code-desde-la-terminal)).
- Arrastrando la carpeta desde el explorador de archivos a la ventana de VS Code.

> **⚠️ Cuidado:** la carpeta que abres es **la del proyecto**, no la de arriba ni tu carpeta personal entera. Si abres tu carpeta personal, el explorador se llena de cosas que no son del proyecto, las búsquedas tardan y encuentran resultados de otros sitios, y la terminal se abre en el sitio equivocado. Ya viste lo que pasa cuando un programa se ejecuta desde la carpeta que no toca en el [ejercicio 8 de 02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#ejercicio-8--por-qué-el-programa-no-encuentra-el-fichero).

> **📌 Nota:** la primera vez que abres una carpeta, VS Code te pregunta si **confías en los autores** de sus ficheros. Si la carpeta es tuya, di que sí. Si la has descargado de internet y no sabes de quién es, puedes elegir que no: VS Code la abrirá en un **modo restringido**, en el que no ejecuta nada de lo que hay dentro.

### 1.5. Las partes de la ventana

Al abrir una carpeta, la ventana de VS Code tiene estas partes (con los nombres de la documentación oficial, a 9 de noviembre de 2026):

```text
┌───┬─────────────────┬──────────────────────────────────────────┐
│   │  EXPLORADOR     │  notas.md   presupuesto.json  ●          │ ← pestañas
│ A │                 ├──────────────────────────────────────────┤
│ c │  ▾ mi-proyecto  │                                          │
│ t │    notas.md     │   EDITOR                                 │
│ i │    datos/       │   (el fichero que estás editando)        │
│ v │    ...          │                                          │
│ i │                 ├──────────────────────────────────────────┤
│ d │  BARRA LATERAL  │   PANEL (la terminal integrada)          │
│ a │                 │   $                                      │
│ d │                 │                                          │
├───┴─────────────────┴──────────────────────────────────────────┤
│ BARRA DE ESTADO                        Ln 3, Col 7   UTF-8  LF │
└────────────────────────────────────────────────────────────────┘
```

En texto: a la izquierda del todo, una columna estrecha de iconos (la barra de actividad); a su lado, la barra lateral con el explorador; en el centro, el editor con las pestañas arriba; debajo del editor, el panel con la terminal; y abajo del todo, la barra de estado.

| Parte (en inglés) | Nombre en español | Para qué sirve |
|---|---|---|
| **Activity Bar** | Barra de actividades | La columna de iconos de la izquierda. Cada icono cambia lo que se ve en la barra lateral: el explorador, la búsqueda, el control de versiones (Git, en [05.01](../fase-05-git-y-github/01-git-fundamentos.md#117-git-en-vs-code)), las extensiones… |
| **Primary Side Bar** | Barra lateral principal | La columna que se abre al lado. Lo normal es que muestre el **explorador** (**Explorer**, **Explorador**): el árbol de carpetas y ficheros de la carpeta abierta, donde puedes crear, renombrar, mover y borrar ficheros |
| **Editor** | Editor | La zona grande del centro, donde escribes. Cada fichero abierto tiene su **pestaña** arriba |
| **Panel** | Panel | La zona de debajo del editor. Contiene, entre otras cosas, la **terminal integrada** ([apartado 1.12](#112-la-terminal-integrada)) |
| **Status Bar** | Barra de estado | La franja de abajo del todo. Te da información del fichero que estás editando: la línea y la columna donde está el cursor, su lenguaje, su codificación y sus saltos de línea |
| **Secondary Side Bar** | Barra lateral secundaria | Una columna a la derecha, que puede estar cerrada. Por defecto, contiene el chat con un asistente de IA ([apartado 1.15](#115-lo-que-verás-más-adelante)) |

Dos detalles de las pestañas que confunden al principio:

- **Un clic en el explorador abre el fichero en modo vista previa**: su pestaña tiene el nombre **en cursiva**, y si haces clic en otro fichero, lo sustituye en la misma pestaña. Para que se quede abierto, haz **doble clic** en el fichero o empieza a escribir en él.
- **Un punto en lugar de la ✕ de cerrar** quiere decir que el fichero tiene **cambios sin guardar**. Es tan importante que tiene su propio apartado, el siguiente.

**Los números de línea.** A la izquierda del texto, cada línea lleva su número, y la barra de estado dice en qué línea y columna está el cursor (`Ln 3, Col 7`; con VS Code en español, `Lín. 3, col. 7`). Te harán falta cuando un mensaje de error diga «línea 18»: para saltar a una línea, la orden **Go to Line** con <kbd>Ctrl</kbd>+<kbd>G</kbd> (en macOS, <kbd>Control</kbd>+<kbd>G</kbd>), escribes el número y pulsas <kbd>Intro</kbd>.

> **💡 Consejo:** si te sobra espacio o te falta, la barra lateral se esconde y se muestra con <kbd>Ctrl</kbd>+<kbd>B</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>B</kbd>), y el menú **View** (**Ver**) tiene opciones para mostrar u ocultar cada parte.

### 1.6. Guardar: el punto de la pestaña y el autoguardado

En [02.01](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#19-qué-pasa-al-abrir-un-programa-y-al-guardar) viste que, mientras escribes, el documento está en la **memoria**, y que solo al **guardar** pasa al **disco**. En programación esto tiene una consecuencia muy concreta: **los demás programas leen el fichero del disco**. La terminal, Git o el programa de tu curso **no ven lo que tienes escrito en el editor**: ven lo último que guardaste.

Por eso VS Code te avisa de dos formas cuando un fichero tiene cambios sin guardar (a 9 de noviembre de 2026):

- **Un punto (●) en su pestaña**, en lugar de la ✕ de cerrarla.
- **Un número en el icono del explorador**, en la barra de actividad: cuántos ficheros tienes sin guardar.

Para guardar, <kbd>Ctrl</kbd>+<kbd>S</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>S</kbd>), o **File > Save** (**Archivo > Guardar**). El punto desaparece y vuelve la ✕.

**El autoguardado.** VS Code puede guardar solo. Se activa y se desactiva en **File > Auto Save** (**Archivo > Autoguardado**): cuando está activado, el menú lo muestra con una marca, y el editor guarda cada fichero al poco de que dejes de escribir. La opción tiene más variantes en la configuración (por ejemplo, guardar solo cuando cambias de fichero o de ventana); con la del menú tienes bastante.

¿Conviene activarlo? Para empezar, **sí**: te ahorra el error más frecuente de todos, el de «he cambiado el fichero y no hace caso» ([error típico 3.2](#32-olvidar-guardar)). Aun así, acostúmbrate a mirar el punto de la pestaña y a pulsar <kbd>Ctrl</kbd>+<kbd>S</kbd>: no todos los editores tienen el autoguardado activado, y en algunos proyectos se prefiere guardar a mano.

> **📌 Nota:** si cierras VS Code con cambios sin guardar, por defecto **no los pierdes**: al volver a abrirlo, los recupera (la documentación lo llama *Hot Exit*). Pero **siguen sin estar en el disco**: el fichero guardado es el de antes. Es cómodo, pero no te fíes: el punto de la pestaña te dirá la verdad.

### 1.7. La paleta de comandos

VS Code sabe hacer cientos de cosas, y no todas tienen un menú o un botón. Todas, en cambio, están en la **paleta de comandos** (**Command Palette**, **Paleta de comandos**): una caja de búsqueda donde escribes **lo que quieres hacer** y el editor te propone las órdenes que encajan.

Se abre con <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd>), o con <kbd>F1</kbd>, o desde **View > Command Palette…** (**Ver > Paleta de comandos…**).

Cómo se usa:

1. Ábrela: aparece una caja arriba, en el centro, que empieza por `>`.
2. Escribe una parte de lo que buscas, por ejemplo `language` (o, con el paquete de español, `idioma`). No hace falta escribir el nombre entero.
3. Elige la orden con las flechas y pulsa <kbd>Intro</kbd>.

Cada orden tiene un nombre del tipo **«Categoría: qué hace»**, como **Terminal: Select Default Profile** o **Preferences: Open Keyboard Shortcuts**. A la derecha de cada una verás su **atajo de teclado**, si lo tiene: así los vas aprendiendo sin querer.

> **💡 Consejo:** si no sabes dónde está algo, **pregúntaselo a la paleta**. Es más rápido que recorrer los menús, y funciona igual en los tres sistemas.

**Abrir rápido un fichero.** Un primo hermano de la paleta: <kbd>Ctrl</kbd>+<kbd>P</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>P</kbd>), **Go to File** (**Ir al archivo**). Escribes parte del nombre de un fichero de la carpeta abierta y lo abres sin tocar el explorador. En un proyecto con cientos de ficheros, es la forma más rápida de moverse. (Es la misma caja que la paleta, pero sin el `>` delante: si escribes `>`, se convierte en la paleta.)

### 1.8. Buscar y reemplazar

**En el fichero que tienes abierto:**

- **Buscar:** <kbd>Ctrl</kbd>+<kbd>F</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>F</kbd>). Aparece una cajita arriba a la derecha del editor; escribe lo que buscas y el editor marca todas las veces que aparece y te dice cuántas hay («1 de 4»). <kbd>Intro</kbd> salta a la siguiente; <kbd>Mayús</kbd>+<kbd>Intro</kbd>, a la anterior.
- **Reemplazar:** <kbd>Ctrl</kbd>+<kbd>H</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Opción</kbd>+<kbd>F</kbd>). La misma caja, con otra debajo para el texto nuevo. Puedes reemplazar las apariciones una a una o todas a la vez.

**En todos los ficheros de la carpeta:**

- **Buscar en archivos:** <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd>). Se abre la vista **Search** (**Buscar**) en la barra lateral: escribes lo que buscas y te lo enseña **agrupado por fichero**, con cada línea donde aparece. Un clic en un resultado te lleva a esa línea.
- **Reemplazar en archivos:** <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd>). La misma vista, con la caja para el texto nuevo. Antes de reemplazar, haz clic en algún resultado: VS Code te enseña cómo quedaría la línea, con lo viejo tachado y lo nuevo al lado.

Las dos cajas (la del fichero y la de la carpeta) tienen tres botoncitos a la derecha que cambian **qué cuenta como coincidencia**:

| Botón | Nombre | Qué hace |
|---|---|---|
| `Aa` | Match Case (coincidir mayúsculas y minúsculas) | `Sol` ya no encuentra `sol` ni `SOL` |
| `ab` subrayado | Match Whole Word (solo palabras completas) | `Sol` ya no encuentra el `Sol` de `Solicitud` |
| `.*` | Use Regular Expression (expresiones regulares) | Busca patrones en vez de un texto fijo. No las necesitas en este curso: déjalo apagado |

> **⚠️ Cuidado:** **reemplazar en todos los ficheros es muy potente y no avisa dos veces**. Antes de pulsar «reemplazar todo», mira la lista de resultados: ¿son todos los que quieres cambiar? ¿Se ha colado alguno que no es (como el `Sol` de `Solicitud`)? Si te equivocas, <kbd>Ctrl</kbd>+<kbd>Z</kbd> (deshacer) puede salvarte, pero es mejor no necesitarlo. Cuando uses Git (fase 5), además, podrás ver exactamente qué ha cambiado en cada fichero.

### 1.9. El resaltado de sintaxis

Abre en VS Code un fichero `.json` y verás el texto **de colores**: los nombres de un color, los textos entre comillas de otro, los números de otro. Eso es el **resaltado de sintaxis**: el editor reconoce las partes del lenguaje o el formato del fichero y pinta cada una de un color.

No cambia el fichero (sigue siendo texto plano, sin colores): es solo **cómo lo enseña el editor**. Pero ayuda muchísimo:

- **Lees el código más rápido**, porque distingues sus partes de un vistazo.
- **Ves muchos errores antes de ejecutar nada**: unas comillas sin cerrar, por ejemplo, hacen que todo lo que viene detrás salga del color de los textos.

**¿Cómo sabe el editor qué lenguaje es?** Por la [extensión](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#114-la-extensión) del fichero. `.json` es JSON, `.md` es Markdown, `.yaml` o `.yml` es YAML, `.html` es una página web… El lenguaje que ha elegido el editor (lo que la documentación llama **modo de lenguaje**) aparece en la **barra de estado**, a la derecha: `JSON`, `Markdown`, `YAML`…

Si el fichero **no tiene extensión** o tiene una que el editor no conoce, el modo es **Plain Text** (**Texto sin formato**): todo sale de un solo color. Eso es lo que pasa cuando un fichero se llama `datos.json.txt`: para el editor, es un `.txt` ([error típico 3.4](#34-la-extensión-equivocada-sin-colores)).

> **📌 Nota:** puedes cambiar el modo de lenguaje a mano haciendo clic en él, en la barra de estado. Sirve para un apaño puntual, pero no arregla nada de fondo: si el fichero es JSON, lo correcto es que se llame `.json`. Los demás programas (y las personas) también miran la extensión.

### 1.10. Extensiones: ampliar el editor con cuidado

Una **extensión** de VS Code es un **complemento que le añade funciones**: el idioma de los menús, el resaltado y las comprobaciones de un lenguaje, un tema de colores, la conexión con una herramienta… Ojo: es otra cosa que la extensión de un fichero, aunque se llamen igual.

VS Code trae de serie el resaltado de muchos lenguajes y formatos (JSON, Markdown, YAML, HTML…). Para lo demás, se instalan extensiones desde el **Visual Studio Marketplace** (el catálogo oficial de extensiones, en `marketplace.visualstudio.com`), sin salir del editor.

**Cómo se instala una** (a 9 de noviembre de 2026):

1. Abre la vista **Extensions** (**Extensiones**): el icono de los cuadraditos de la barra de actividad, o <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>X</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>X</kbd>).
2. Escribe en la caja de búsqueda el nombre de la extensión.
3. Haz clic en ella para ver su **página de detalles**: qué hace, quién la publica, cuántas veces se ha instalado, la valoración, su historial de cambios.
4. Si te convence, pulsa **Install** (**Instalar**). Al terminar, el botón se convierte en una rueda dentada (**Manage**, **Administrar**) desde la que puedes **desactivarla** o **desinstalarla**.

**Por qué con cuidado.** La documentación de VS Code lo dice sin rodeos: **una extensión tiene los mismos permisos que el propio VS Code**. Puede leer y cambiar tus ficheros, conectarse a internet y ejecutar otros programas. Es exactamente lo mismo que con los instaladores de [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#13-descarga-siempre-de-la-web-oficial): instalar una extensión es darle las llaves a quien la ha hecho.

El Marketplace hace su parte (a 9 de noviembre de 2026, según la documentación oficial): analiza cada extensión y cada actualización con varios antivirus antes de publicarla, impide que alguien use el nombre de editores oficiales como Microsoft o Red Hat, y vigila los usos extraños. Además, desde la versión 1.97, la primera vez que instalas una extensión de un editor nuevo (que no sea Microsoft), VS Code te pregunta si **confías en ese editor**. Pero la última comprobación es tuya. Antes de pulsar «Instalar», mira:

| Qué mirar | Dónde | Qué buscas |
|---|---|---|
| **Quién la publica** | Debajo del nombre, en la página de detalles | Un **editor verificado**, con la marca azul (✓): ha demostrado que es el dueño de su dominio de internet (como `redhat.com`) y lleva al menos seis meses publicando sin problemas. Mejor aún si es quien hace la herramienta (Microsoft para el paquete de idioma, Red Hat para YAML) |
| **Cuántas instalaciones tiene** | Junto al editor | Muchas instalaciones (cientos de miles o millones) no garantizan nada, pero una extensión con 40 instalaciones y un nombre parecido a una famosa es sospechosa |
| **Valoración y opiniones** | Las estrellas y la pestaña de opiniones | Qué dicen quienes la usan |
| **Si está viva** | Su historial de cambios y su repositorio | Que se actualice y que tenga un repositorio público donde se puedan comunicar fallos |
| **Si de verdad la necesitas** | Tú | Cada extensión gasta memoria, ralentiza el arranque y es una puerta más. Instala lo que vayas a usar, no «por si acaso» |

> **⚠️ Cuidado:** desconfía de las extensiones que **imitan** a una conocida (mismo icono, nombre casi igual, otro editor), de las que prometen cosas que no hacen falta («acelera tu VS Code») y de las que te recomiendan en un mensaje o un vídeo que no conoces. Ante la duda, no la instales.

### 1.11. Extensiones útiles para este curso

Para este curso **no necesitas casi nada**: VS Code ya resalta Markdown, JSON y YAML, y tiene una vista previa de Markdown. Estas son las pocas extensiones que te pueden venir bien, comprobadas en el Marketplace oficial el 9 de noviembre de 2026:

| Extensión | Editor | Instalaciones | Para qué |
|---|---|---|---|
| **Spanish Language Pack for Visual Studio Code** | Microsoft | 12,3 millones | Menús y mensajes de VS Code en español. **Opcional**: solo si prefieres la interfaz en español |
| **YAML** | Red Hat | 29,9 millones | Comprueba los ficheros YAML mientras escribes y te avisa de los errores. La usarás en la fase 4 |
| **markdownlint** | David Anson | 12,5 millones | Revisa el estilo de los ficheros Markdown y te avisa de lo que se puede escribir mejor. Útil en la fase 4 |

**El paquete de español.** Al instalarlo, VS Code te pregunta si quieres reiniciar para cambiar el idioma. Si más adelante quieres volver al inglés (o pasar al español sin esperar a la pregunta), usa la orden **Configure Display Language** (**Configurar idioma de pantalla**) de la paleta de comandos y elige el idioma.

> **💡 Consejo:** tener los menús en inglés tiene una ventaja: la documentación oficial, los tutoriales y casi todas las respuestas de internet usan los nombres en inglés. Con el español, todo te resultará más cómodo al principio. Las dos opciones son buenas; este módulo te da los dos nombres.

**Markdown sin extensiones.** Con un fichero `.md` abierto, <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd>) abre la **vista previa**: el documento tal como se verá, con los títulos, las listas y las negritas. Lo aprovecharás en el módulo «Markdown» (fase 4).

Las extensiones de cada lenguaje (Python, Java, JavaScript…) te las recomendará el curso que hagas después. Cuando abras un fichero de un lenguaje que VS Code no conoce bien, el propio editor suele sugerirte una extensión: aplica los mismos criterios del apartado anterior antes de aceptarla.

### 1.12. La terminal integrada

En [La terminal: lo básico](01-terminal-lo-basico.md) has trabajado con la terminal en su propia ventana. VS Code tiene **una terminal dentro**, en el panel de abajo: la **terminal integrada**. Es una terminal de verdad, la misma de tu sistema, con dos ventajas:

- **Se abre en la carpeta que tienes abierta** en el editor: no hace falta hacer `cd` hasta el proyecto.
- **Tienes el código y la terminal a la vez**, en la misma ventana: editas, guardas y ejecutas sin cambiar de programa.

**Cómo se abre** (a 9 de noviembre de 2026):

- **View > Terminal** (**Ver > Terminal**): la muestra o la oculta.
- **Terminal > New Terminal** (**Terminal > Nuevo terminal**): abre otra más. Puedes tener varias; se eligen en la lista de la derecha del panel.
- Con un atajo: la documentación da <kbd>Ctrl</kbd> más la tecla del acento grave (en macOS, <kbd>Control</kbd> más esa tecla), pero esa tecla está en otro sitio en el teclado español. Mira el atajo que te toca junto a la opción **View > Terminal**, en el menú.

**En Windows: elige Git Bash.** La terminal integrada de Windows abre **PowerShell** si no le dices otra cosa, y este curso usa **Git Bash** ([02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#16-instalar-git-en-windows-git-for-windows-y-git-bash)). Cada tipo de terminal que VS Code sabe abrir se llama **perfil**, y VS Code detecta Git Bash por su cuenta cuando Git for Windows está instalado. Para que sea la que se abre siempre (según la documentación oficial, a 9 de noviembre de 2026):

1. Abre la paleta de comandos (<kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd>).
2. Escribe `default profile` y elige **Terminal: Select Default Profile** (**Terminal: Seleccionar perfil predeterminado**).
3. En la lista, elige **Git Bash**.
4. Cierra la terminal que tenías abierta (el icono de la papelera del panel) y abre una nueva con **Terminal > New Terminal**. Ahora el indicador termina en `$`, como en la ventana de Git Bash.

También puedes llegar a la misma lista desde la flechita (˅) que hay junto al botón `+` del panel de la terminal: abajo del todo está la opción para elegir el perfil predeterminado.

**En macOS y Linux** no tienes que hacer nada: la terminal integrada abre la misma que usas fuera (zsh en macOS, bash en Linux).

> **📌 Nota:** la terminal integrada se comporta como cualquier otra: también **copia el PATH al abrirse** ([02.03, apartado 1.10](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#110-el-path-dónde-busca-el-sistema-los-programas)). Si instalas un programa con VS Code abierto y su terminal no lo encuentra, **cierra VS Code entero** y vuelve a abrirlo: abrir otra terminal dentro del mismo VS Code no siempre basta.

### 1.13. Abrir VS Code desde la terminal

Lo normal, cuando trabajas en la terminal, es ir hasta la carpeta del proyecto con `cd` y abrir **esa carpeta** en el editor. Para eso existe la orden `code`:

| Orden | Qué hace |
|---|---|
| `code .` | Abre en VS Code la **carpeta actual** (recuerda: [`.` es la carpeta actual](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#110-las-carpetas-especiales-punto-y-punto-punto)) |
| `code notas.md` | Abre ese fichero (si no existe, lo crea al guardarlo) |
| `code --version` | Dice la versión de VS Code instalada |

La orden `code` funciona si la carpeta de VS Code está **en el PATH**, igual que `git`. Depende del sistema (según la documentación oficial, a 9 de noviembre de 2026):

- **Windows:** el instalador la añade al PATH (era la opción *Add to PATH* que dejaste marcada en [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#15-instalar-visual-studio-code)). Cierra y vuelve a abrir Git Bash después de instalar.
- **Linux:** el paquete `.deb` o `.rpm` la deja lista.
- **macOS:** **no se instala sola**. Abre VS Code, abre la paleta de comandos (<kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd>), escribe `shell command` y elige la orden **Shell Command: Install 'code' and optionally 'copilot' commands in PATH**. VS Code te preguntará si quieres instalar también la orden `copilot` (la de un asistente de IA): para este curso basta con `code`, así que puedes decir que no. Después, **cierra la terminal y abre otra**, para que lea el PATH nuevo.

Así se ve en la terminal (es un ejemplo: el número de versión y el resto cambiarán en tu ordenador; recuerda el [aviso sobre las salidas](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal)):

```text
$ code --version
1.146.0
69047191fc427f2f92828279aae1d90d8eeda7ab
x64
```

**En qué fijarte:** la primera línea es la **versión** (aquí, la 1.146.0, la 1.146 sin actualizaciones: cada actualización sube el último número, 1.146.1, 1.146.2…); la segunda es un código largo de letras y números que identifica esa versión exacta; y la tercera, la [arquitectura](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#110-32-y-64-bits-x86-64-y-arm) (`x64` o `arm64`). Si sale una versión, `code` está en el PATH. Si sale «command not found» (u «orden no encontrada»), ve al [error típico 3.6](#36-la-orden-code-no-se-encuentra).

### 1.14. Los atajos de teclado esenciales

Un **atajo de teclado** es una combinación de teclas que hace lo mismo que una opción de un menú, sin soltar el teclado. Al principio parecen una manía; con el tiempo, son la diferencia entre editar a gusto y pelearte con el ratón. No hace falta aprenderlos todos: con estos tienes para mucho tiempo.

Comprobados en la documentación oficial de atajos de VS Code el 9 de noviembre de 2026:

| Para | Windows y Linux | macOS |
|---|---|---|
| Guardar | <kbd>Ctrl</kbd>+<kbd>S</kbd> | <kbd>Cmd</kbd>+<kbd>S</kbd> |
| Deshacer | <kbd>Ctrl</kbd>+<kbd>Z</kbd> | <kbd>Cmd</kbd>+<kbd>Z</kbd> |
| Rehacer | <kbd>Ctrl</kbd>+<kbd>Y</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>Z</kbd> |
| Paleta de comandos | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd> o <kbd>F1</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd> |
| Abrir rápido un fichero | <kbd>Ctrl</kbd>+<kbd>P</kbd> | <kbd>Cmd</kbd>+<kbd>P</kbd> |
| Buscar en el fichero | <kbd>Ctrl</kbd>+<kbd>F</kbd> | <kbd>Cmd</kbd>+<kbd>F</kbd> |
| Reemplazar en el fichero | <kbd>Ctrl</kbd>+<kbd>H</kbd> | <kbd>Cmd</kbd>+<kbd>Opción</kbd>+<kbd>F</kbd> |
| Buscar en todos los ficheros | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd> |
| Reemplazar en todos los ficheros | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd> |
| Comentar o descomentar la línea | <kbd>Ctrl</kbd>+<kbd>/</kbd> | <kbd>Cmd</kbd>+<kbd>/</kbd> |
| Mover la línea arriba o abajo | <kbd>Alt</kbd>+<kbd>↑</kbd> o <kbd>Alt</kbd>+<kbd>↓</kbd> | <kbd>Opción</kbd>+<kbd>↑</kbd> o <kbd>Opción</kbd>+<kbd>↓</kbd> |
| Añadir un cursor donde haces clic | <kbd>Alt</kbd>+clic | <kbd>Opción</kbd>+clic |
| Añadir un cursor en la línea de abajo | Windows: <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>↓</kbd> · Linux: <kbd>Mayús</kbd>+<kbd>Alt</kbd>+<kbd>↓</kbd> | <kbd>Cmd</kbd>+<kbd>Opción</kbd>+<kbd>↓</kbd> |
| Seleccionar la siguiente vez que aparece la palabra | <kbd>Ctrl</kbd>+<kbd>D</kbd> | <kbd>Cmd</kbd>+<kbd>D</kbd> |
| Mostrar u ocultar la barra lateral | <kbd>Ctrl</kbd>+<kbd>B</kbd> | <kbd>Cmd</kbd>+<kbd>B</kbd> |

(<kbd>↑</kbd> y <kbd>↓</kbd> son las flechas arriba y abajo del teclado.)

Tres que merecen una explicación:

- **Comentar la línea.** Un [comentario](../fase-01-que-es-programar/01-que-es-programar.md#21-el-mismo-algoritmo-en-tres-lenguajes) es un texto para las personas, que el programa no ejecuta. Este atajo convierte la línea donde está el cursor (o todas las que tengas seleccionadas) en comentario, con el símbolo que use ese lenguaje: `#` en YAML o en bash, por ejemplo. Si ya lo era, le quita el comentario. Solo funciona en lenguajes que tienen comentarios: JSON, por ejemplo, no los tiene.
- **Mover la línea.** Sube o baja la línea entera, sin cortar y pegar. Muy útil para reordenar una lista.
- **Multicursor.** Puedes tener **varios cursores a la vez**: lo que escribes aparece en todos. Sirve para cambiar a la vez varias líneas que se parecen (lo practicarás en el [ejercicio 6](#ejercicio-6--editar-muchas-líneas-a-la-vez)). Para volver a un solo cursor, pulsa <kbd>Esc</kbd>.

> **⚠️ Cuidado:** la documentación da los atajos para un **teclado estadounidense**. En el teclado español, la mayoría son iguales (todos los que llevan letras), pero los que usan símbolos, como el de comentar (<kbd>/</kbd>) o el de la terminal, pueden ser **otras teclas**. No te los aprendas de una tabla: **míralos en tu editor**. Aparecen junto a cada opción de los menús y de la paleta de comandos, y todos están en **Preferences: Open Keyboard Shortcuts** (desde la paleta), donde además los puedes cambiar.

> **💡 Consejo:** no intentes memorizar la tabla de golpe. Elige **dos atajos por semana** y oblígate a usarlos en lugar del ratón. Guardar y la paleta de comandos, los primeros. Microsoft publica además una hoja de atajos para imprimir de cada sistema: la abre **Help > Keyboard Shortcuts Reference** (**Ayuda > Referencia de métodos abreviados de teclado**).

### 1.15. Lo que verás más adelante

Tres cosas del editor que ahora solo necesitas saber que existen:

- **Formato automático.** VS Code puede **ordenar el aspecto** de un fichero (sangrías, espacios) con la orden **Format Document** (**Dar formato al documento**) de la paleta: <kbd>Mayús</kbd>+<kbd>Alt</kbd>+<kbd>F</kbd> en Windows, <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>I</kbd> en Linux y <kbd>Mayús</kbd>+<kbd>Opción</kbd>+<kbd>F</kbd> en macOS. Lo usarás con los ficheros JSON de la fase 4.
- **Codificación y saltos de línea en la barra de estado.** A la derecha de la barra de estado verás algo como `UTF-8` y `LF` (o `CRLF`). Lo primero es la [codificación de caracteres](../fase-01-que-es-programar/01-que-es-programar.md#35-las-tildes-y-las-eñes-salen-mal-en-la-consola) del fichero; lo segundo, cómo marca el final de cada línea (Windows lo hace de una forma y Linux y macOS de otra). Haciendo clic en cada uno se puede cambiar. La codificación, de momento, **no la cambies**: lo entenderás en el módulo «Texto, binario y codificación» (fase 4). Los saltos de línea, en cambio, importan ya: **los scripts de bash tienen que estar en `LF`**; con `CRLF`, que es lo que pone VS Code en Windows si no le dices otra cosa, bash falla con mensajes raros ([03.04, error típico 3.2](04-errores-y-depuracion.md#32-un-script-con-los-saltos-de-línea-de-windows)). Para que los ficheros nuevos se creen con `LF`, está el ajuste del [ejemplo 2.1](#21-preparar-vs-code-para-el-curso).
- **La IA integrada.** VS Code trae un chat con un **asistente de IA** (en la barra lateral secundaria) que puede explicar, sugerir y escribir código; cómo usarlo bien, y sus normas en esta academia, lo verás en el módulo [Programar con asistentes de IA](../fase-07-aprender-a-aprender/04-programar-con-asistentes-de-ia.md) (fase 7).

## 2. Ejemplos de código

En este módulo los ejemplos no son programas, sino **cosas que haces en el editor**, paso a paso. Hazlas con tu VS Code abierto mientras lees.

### 2.1. Preparar VS Code para el curso

**Situación real:** acabas de instalar VS Code y quieres dejarlo listo para el resto del curso. Son cinco minutos.

1. **Crea la carpeta del curso.** En la terminal, en tu carpeta personal, crea una carpeta para tus prácticas (sin espacios ni tildes, como viste en [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#113-cómo-nombrar-ficheros-y-carpetas)) y entra en ella:

   ```bash
   mkdir practicas-curso
   cd practicas-curso
   ```

2. **Ábrela en VS Code.** Escribe `code .`. Si te dice que no encuentra `code` (en macOS, lo normal la primera vez), abre VS Code a mano, ábrela con **File > Open Folder…** (**Archivo > Abrir carpeta…**) e instala la orden `code` como en el [apartado 1.13](#113-abrir-vs-code-desde-la-terminal).
3. **Confía en la carpeta.** VS Code te preguntará si confías en sus autores: es tuya, así que sí.
4. **Idioma (opcional).** Si quieres los menús en español, instala el paquete de idioma ([apartado 1.11](#111-extensiones-útiles-para-este-curso)) y reinicia VS Code cuando te lo pida.
5. **Autoguardado.** Activa **File > Auto Save** (**Archivo > Autoguardado**).
6. **La terminal (en Windows).** Elige Git Bash como perfil predeterminado ([apartado 1.12](#112-la-terminal-integrada)).
7. **Saltos de línea LF.** Abre la configuración con **File > Preferences > Settings** (**Archivo > Preferencias > Configuración**; en macOS no está en el menú **File**, sino en el menú **Code**), o con <kbd>Ctrl</kbd>+<kbd>,</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>,</kbd>), escribe `files.eol` en la caja de búsqueda y elige `\n` (LF). Así los ficheros nuevos se crean con los saltos de línea que entiende bash. Es imprescindible en Windows, donde si no se crean con `CRLF` ([apartado 1.15](#115-lo-que-verás-más-adelante)).
8. **Comprueba.** Abre la terminal integrada con **Terminal > New Terminal** y escribe `pwd`. Tiene que salir la ruta de `practicas-curso`: la terminal se ha abierto en la carpeta del editor.

**En qué fijarte:** en el último paso, el indicador debe terminar en `$` (en macOS, en `%`) y `pwd` debe acabar en `practicas-curso`. Si en Windows ves `PS` al principio del indicador, la terminal sigue siendo PowerShell: vuelve al paso 6.

### 2.2. Tu primer fichero en el editor

**Situación real:** quieres ver con tus ojos el punto de «sin guardar» y el resaltado de sintaxis.

1. Con la carpeta `practicas-curso` abierta, pasa el ratón por el explorador: junto al nombre de la carpeta aparecen unos iconos. Pulsa el de **New File…** (**Nuevo archivo…**) y llama al fichero `contacto.txt`.
2. Escribe esto (solo es texto; lo entenderás en la fase 4):

   ```text
   {
     "nombre": "Ana",
     "edad": 34,
     "socia": true
   }
   ```

3. **Mira la pestaña:** si no tienes el autoguardado, verás el punto ●. Guarda con <kbd>Ctrl</kbd>+<kbd>S</kbd> (<kbd>Cmd</kbd>+<kbd>S</kbd>) y el punto desaparece.
4. **Mira los colores:** todo es del mismo color. En la barra de estado, a la derecha, pone **Plain Text** (**Texto sin formato**).
5. **Cambia el nombre:** en el explorador, clic derecho sobre el fichero, **Rename…** (**Cambiar nombre…**) o la tecla <kbd>F2</kbd>, y llámalo `contacto.json`.
6. **Mira otra vez:** ahora los nombres, los textos, los números y el `true` salen de colores distintos, y la barra de estado dice **JSON**. El contenido no ha cambiado: solo la extensión.
7. **Rompe algo a propósito:** borra las comillas del final de `"Ana"`. Fíjate en cómo cambian los colores de lo que viene detrás, y en la línea ondulada roja que aparece debajo: el editor ya te está diciendo que algo está mal, sin ejecutar nada. Vuelve a ponerlas.

**En qué fijarte:** el resaltado lo decide la **extensión**, no el contenido; y el editor te ayuda a ver errores **antes** de que nada falle.

### 2.3. Cambiar un nombre en varios ficheros a la vez

**Situación real:** en `practicas-curso` tienes tres ficheros de la web de una panadería, y la panadería cambia de nombre: de «Panadería Sol» a «Panadería Luna».

Crea los tres ficheros con este contenido (puedes usar el editor, como en el ejemplo anterior):

`portada.txt`:

```text
Bienvenido a Panadería Sol.
Pan recién hecho cada mañana.
```

`contacto.txt`:

```text
Panadería Sol - Calle Mayor, 12
Solicitud de pedidos: pedidos@ejemplo.com
```

`aviso.txt`:

```text
Panadería Sol cierra los domingos.
```

Los pasos:

1. Abre **Replace in Files** con <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd>).
2. En la caja de búsqueda escribe `Sol`. Fíjate en los resultados: **4 resultados en 3 ficheros**. Uno de ellos es el `Sol` de `Solicitud`, que **no** quieres cambiar.
3. Activa el botón de **palabra completa** (el `ab` subrayado). Ahora son **3 resultados en 3 ficheros**: `Solicitud` ya no cuenta.
4. Mejor aún: busca el texto entero, `Panadería Sol`. Es más preciso y no depende de ningún botón.
5. En la caja de reemplazo escribe `Panadería Luna`. Haz clic en un resultado para ver la vista previa: lo viejo, tachado; lo nuevo, al lado.
6. Pulsa el botón de **reemplazar todo** (junto a la caja de reemplazo) y confirma.
7. Si no tienes el autoguardado, guarda los ficheros.

**En qué fijarte:** el número de resultados es tu control. Antes de reemplazar, comprueba que **coincide con lo que esperas** y que no se ha colado nada. Un `Sol` dentro de `Solicitud` es el tipo de cambio que no ves hasta que un cliente te lo dice.

## 3. Errores típicos

### 3.1. Abrir un fichero suelto en lugar de la carpeta

**Qué pasa:** abres un fichero con doble clic desde el explorador de archivos, o con **File > Open File…**. El editor lo enseña, pero el explorador de VS Code está vacío, la búsqueda en archivos no encuentra nada de los demás ficheros y la terminal integrada se abre en tu carpeta personal.

**Por qué ocurre:** VS Code solo «ve» lo que hay en la carpeta abierta. Con un fichero suelto, no hay carpeta.

**Cómo se arregla:** cierra el fichero y abre **la carpeta del proyecto** (**File > Open Folder…**, o `cd` hasta ella y `code .`). Fíjate en el explorador: arriba, en mayúsculas, aparece el nombre de la carpeta abierta ([apartado 1.4](#14-abre-carpetas-no-ficheros-sueltos)).

### 3.2. Olvidar guardar

**Qué pasa:** cambias un fichero, vas a la terminal, lo miras (con `cat`, por ejemplo) o lo usas… y sigue como antes. «No hace caso.»

**Por qué ocurre:** tus cambios están en el editor (en la memoria), pero no en el disco, y la terminal y los demás programas leen el disco ([apartado 1.6](#16-guardar-el-punto-de-la-pestaña-y-el-autoguardado)).

**Cómo se arregla:** mira la pestaña: si tiene el punto ●, guarda con <kbd>Ctrl</kbd>+<kbd>S</kbd>. Para evitarlo, activa el autoguardado. Si trabajas con varios ficheros, el número del icono del explorador te dice cuántos te quedan por guardar.

### 3.3. Escribir código en un procesador de textos

**Qué pasa:** escribes (o copias) un fichero de configuración en Word, Google Docs o un programa de notas, lo pegas en el editor o lo guardas con otra extensión… y no funciona, aunque «está igual que en el tutorial».

**Por qué ocurre:** el procesador de textos ha cambiado cosas que no se ven a simple vista: las comillas rectas `"` por comillas tipográficas `“ ”`, el guion por una raya, una mayúscula al principio de la línea… Para un programa, `“` y `"` son caracteres distintos ([apartado 1.2](#12-editor-procesador-de-textos-e-ide)).

**Cómo se arregla:** escribe siempre el código en el editor de código. Si copias código de un documento, una web o un chat, **revísalo en el editor**: el resaltado de sintaxis suele delatar las comillas raras, porque el texto deja de salir del color de los textos.

### 3.4. La extensión equivocada: sin colores

**Qué pasa:** abres un fichero que debería ser JSON (o Markdown, o YAML) y sale todo de un color, y la barra de estado dice **Plain Text**.

**Por qué ocurre:** el editor decide el lenguaje por la extensión, y la del fichero no es la que crees. Lo más habitual: el fichero se llama `datos.json.txt` (porque se guardó con el Bloc de notas, que añade `.txt`), y el explorador de Windows esconde la extensión y te enseña `datos.json`. Es la [extensión escondida](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#36-la-extensión-escondida) de 02.02.

**Cómo se arregla:** mira el nombre **completo** del fichero en el explorador de VS Code (que siempre enseña las extensiones) o con `ls` en la terminal, y renómbralo con <kbd>F2</kbd>.

### 3.5. La terminal integrada abre PowerShell

**Qué pasa:** en Windows, abres la terminal integrada y las órdenes del curso no funcionan como esperas: el indicador empieza por `PS` y termina en `>`.

**Por qué ocurre:** en Windows, la terminal integrada abre PowerShell si no le dices otra cosa.

**Cómo se arregla:** elige **Git Bash** con **Terminal: Select Default Profile**, y abre una terminal nueva ([apartado 1.12](#112-la-terminal-integrada)). Si Git Bash no aparece en la lista, es que Git for Windows no está instalado (o lo instalaste con VS Code abierto: ciérralo y vuelve a abrirlo).

### 3.6. La orden code no se encuentra

**Qué pasa:** escribes `code .` y la terminal contesta `command not found` u «orden no encontrada».

**Por qué ocurre:** la carpeta de VS Code no está en el PATH de esa terminal. Según el sistema:

- **macOS:** no has instalado la orden `code` (no viene instalada).
- **Windows:** la terminal se abrió antes de instalar VS Code, o desmarcaste *Add to PATH* en el instalador.
- **Cualquiera:** lo has escrito mal (`Code`, `cdoe`).

**Cómo se arregla:** en macOS, instálala desde la paleta ([apartado 1.13](#113-abrir-vs-code-desde-la-terminal)); en todos, **cierra la terminal y abre otra**. Si sigue sin funcionar en Windows, vuelve a ejecutar el instalador de VS Code con la opción del PATH marcada. Es el mismo razonamiento de cualquier «command not found» ([02.03, apartado 1.11](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#111-cuando-el-sistema-no-encuentra-un-programa)).

### 3.7. Instalar extensiones a ciegas

**Qué pasa:** instalas todas las extensiones que te recomienda cada vídeo o que «suenan bien». Al cabo de un mes, VS Code tarda en arrancar, salen avisos que no entiendes, dos extensiones hacen lo mismo y se pelean, o has instalado una que no era la que creías.

**Por qué ocurre:** cada extensión tiene los permisos del editor, consume memoria y puede chocar con otras ([apartado 1.10](#110-extensiones-ampliar-el-editor-con-cuidado)).

**Cómo se evita:** instala solo lo que vayas a usar, comprueba el editor, las instalaciones y las opiniones antes de instalar, y **desinstala** lo que ya no uses (rueda dentada → **Uninstall**, **Desinstalar**). Si VS Code se comporta raro, desactivar las extensiones una a una es la forma de encontrar la culpable.

## 4. Buenas prácticas

- **Abre siempre la carpeta del proyecto**, ni más arriba ni un fichero suelto.
- **Escribe el código en el editor de código**, nunca en un procesador de textos.
- **Mira el punto de la pestaña** antes de usar un fichero desde la terminal, y activa el autoguardado.
- **Usa la terminal integrada** para tener el código y las órdenes a la vista; en Windows, con Git Bash.
- **Ante la duda, la paleta de comandos**: si no sabes dónde está algo, escribe lo que quieres hacer.
- **Revisa los resultados antes de reemplazar en todos los ficheros**: cuántos son y si se ha colado alguno.
- **Pon a los ficheros su extensión correcta**: de ella dependen el resaltado y lo que harán con ellos los demás programas.
- **Pocas extensiones, y de confianza**: editor verificado, muchas instalaciones, buenas opiniones, y solo si las vas a usar.
- **Aprende los atajos poco a poco**, empezando por guardar y la paleta, y consulta los tuyos en el editor.

## 5. Ejercicios prácticos resueltos

> **💡 Consejo:** hay dos tipos de ejercicios: unos se **hacen en tu VS Code** (tenlo abierto) y otros son de **razonar** (por escrito, en papel o en un fichero del editor). Intenta cada uno **antes** de abrir las pistas y la solución.

### 🟢 Básico

#### Ejercicio 1 · Editor de código, procesador de textos o IDE

Para cada tarea, di qué herramienta elegirías (procesador de textos, editor de código o IDE) y por qué:

1. Escribir una carta de presentación para una oferta de trabajo, con el nombre en negrita y tu foto.
2. Cambiar una línea del fichero de configuración `config.yaml` de un programa.
3. Escribir el fichero `README.md` que explica tu proyecto (un fichero de texto en Markdown).
4. Programar durante meses una aplicación grande en un único lenguaje, con un equipo que usa siempre las mismas herramientas para ejecutarla, probarla y depurarla.
5. Tomar los apuntes de este curso, con títulos y listas, para leerlos tú.
6. Un amigo te pasa la configuración de un servidor en un fichero `.docx` «para que la copies».

<details>
<summary>Pista 1</summary>

Pregúntate quién va a leer el resultado: ¿una **persona** (con formato, imágenes…) o un **programa** (solo texto plano)? Y, si es un programa, ¿es un trabajo largo en un lenguaje concreto?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** si lo lee una persona y necesita formato, procesador de textos; si lo lee un programa, texto plano, y por tanto editor (o IDE si es trabajo largo en un lenguaje concreto) ([apartado 1.2](#12-editor-procesador-de-textos-e-ide)).

| # | Herramienta | Por qué |
|---|---|---|
| 1 | **Procesador de textos** | La lee una persona, y necesita negrita y una foto: formato |
| 2 | **Editor de código** | Lo lee un programa: tiene que ser texto plano, sin nada añadido |
| 3 | **Editor de código** | Markdown es texto plano. El formato (títulos, negritas) se escribe con símbolos, y lo dibuja después quien lo muestra (GitHub, la academia) |
| 4 | **IDE** (o un editor con las extensiones de ese lenguaje) | Trabajo largo en un lenguaje concreto, con ejecutar, probar y depurar integrados: es justo para lo que está pensado un IDE |
| 5 | **Cualquiera de los dos** | Son para ti. Un procesador de textos sirve; un editor con Markdown, también (y es buena práctica para la fase 4) |
| 6 | **Ninguno: pídele el texto plano** | Un `.docx` puede haber cambiado las comillas, los guiones o las mayúsculas. Lo seguro es que te pase el fichero original o el texto copiado de un editor, y revisarlo en el tuyo |

**Errores frecuentes al resolverlo:**

- Decir «procesador de textos» en el caso 3 porque «es un documento». Un `README.md` es texto plano: lo que parece formato son símbolos.
- Pensar que el caso 4 obliga a un IDE. Muchos equipos lo hacen con un editor y extensiones; las dos respuestas valen si se explica por qué.

</details>

#### Ejercicio 2 · Un atajo para cada tarea

Di qué atajo (o qué orden de la paleta) usarías en cada situación, en tu sistema:

1. Llevas diez minutos escribiendo y quieres asegurarte de que está en el disco.
2. Has borrado un párrafo sin querer.
3. El proyecto tiene 200 ficheros y quieres abrir `precios.json` sin buscarlo en el explorador.
4. Quieres saber en qué ficheros del proyecto aparece la palabra `descuento`.
5. Quieres cambiar el idioma de los menús y no recuerdas dónde está la opción.
6. Una línea de un fichero YAML está en el sitio equivocado: debería ir dos líneas más arriba.
7. Quieres desactivar una línea de un fichero YAML sin borrarla, para probar sin ella.

<details>
<summary>Pista 1</summary>

Todos están en la tabla del [apartado 1.14](#114-los-atajos-de-teclado-esenciales). Para el 5, piensa en qué haces cuando no sabes dónde está algo.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se busca la tarea en la tabla del [apartado 1.14](#114-los-atajos-de-teclado-esenciales); cuando no hay atajo, la paleta de comandos.

| # | Windows y Linux | macOS | Qué es |
|---|---|---|---|
| 1 | <kbd>Ctrl</kbd>+<kbd>S</kbd> | <kbd>Cmd</kbd>+<kbd>S</kbd> | Guardar (y comprueba que no queda el punto en la pestaña) |
| 2 | <kbd>Ctrl</kbd>+<kbd>Z</kbd> | <kbd>Cmd</kbd>+<kbd>Z</kbd> | Deshacer |
| 3 | <kbd>Ctrl</kbd>+<kbd>P</kbd> y escribir `precios` | <kbd>Cmd</kbd>+<kbd>P</kbd> | Abrir rápido un fichero |
| 4 | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd> | Buscar en todos los ficheros |
| 5 | Paleta (<kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd>) y escribir `display language` (o `idioma`) | Paleta (<kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd>) | **Configure Display Language** |
| 6 | <kbd>Alt</kbd>+<kbd>↑</kbd> dos veces | <kbd>Opción</kbd>+<kbd>↑</kbd> dos veces | Mover la línea |
| 7 | <kbd>Ctrl</kbd>+<kbd>/</kbd> | <kbd>Cmd</kbd>+<kbd>/</kbd> | Comentar la línea (en YAML, pone `#` delante) |

En el teclado español, el atajo del 7 puede ser otra tecla: búscalo como «comment» (o «comentario») en la paleta para ver el tuyo.

**Errores frecuentes al resolverlo:**

- En el caso 4, usar <kbd>Ctrl</kbd>+<kbd>F</kbd>: busca solo en el fichero abierto.
- En el caso 6, cortar y pegar la línea. Funciona, pero es más lento y es fácil perder la línea por el camino.

</details>

### 🟡 Intermedio

#### Ejercicio 3 · Por qué no sale el resaltado

Sergio ha recibido de un compañero la carpeta de un pequeño proyecto. Al abrirla en VS Code:

- `apuntes.md` sale de colores, con los títulos resaltados.
- `presupuesto.json`, como él lo ve en el Explorador de archivos de Windows, sale **todo del mismo color**, y la barra de estado dice **Plain Text**.
- `tareas` también sale de un solo color.

Abre la terminal integrada y escribe `ls`:

**En tu terminal** (`sesion.txt`):

```text
$ ls
apuntes.md  presupuesto.json.txt  tareas
```

📁 **Código:** [`codigo/03-editor-de-codigo/ejercicios/ej03-por-que-no-sale-el-resaltado/`](codigo/03-editor-de-codigo/ejercicios/ej03-por-que-no-sale-el-resaltado/)

1. ¿Por qué `presupuesto.json` sale sin colores? ¿Por qué Sergio no se había dado cuenta?
2. ¿Por qué `tareas` sale sin colores? ¿Es un problema?
3. ¿Qué tiene que hacer Sergio para arreglar el presupuesto? ¿Basta con cambiar el modo de lenguaje en la barra de estado?

<details>
<summary>Pista 1</summary>

Compara el nombre que ve Sergio en el Explorador de archivos con el que escribe `ls`. ¿Qué hay después del **último** punto?

</details>

<details>
<summary>Pista 2</summary>

El modo de lenguaje cambia **cómo lo enseña VS Code**. ¿Cambia el nombre del fichero en el disco? ¿Qué verán los demás programas?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el editor decide el lenguaje por la extensión, que es lo que va después del **último** punto ([apartado 1.9](#19-el-resaltado-de-sintaxis)). `ls` enseña el nombre completo, sin esconder nada.

1. **El fichero se llama `presupuesto.json.txt`**: su extensión es `.txt`, así que para VS Code es texto plano. Seguramente el compañero lo guardó con el Bloc de notas, que añadió `.txt`. Sergio no lo veía porque **el Explorador de archivos de Windows esconde las extensiones** y le mostraba `presupuesto.json` ([error típico 3.4](#34-la-extensión-equivocada-sin-colores)). El explorador de VS Code y `ls`, en cambio, enseñan el nombre entero.
2. **`tareas` no tiene extensión**, así que el editor no sabe qué es y lo trata como texto plano. **No es un problema**: si es una lista de cosas por hacer, en texto plano está bien. Solo importaría si tuviera que ser de un formato concreto.
3. **Renombrarlo** a `presupuesto.json`: en el explorador de VS Code, clic derecho → **Rename…** o <kbd>F2</kbd>. Cambiar el modo de lenguaje en la barra de estado **no basta**: solo cambia los colores en ese editor, mientras el fichero sigue llamándose `.txt` en el disco, y cualquier programa que busque `presupuesto.json` no lo encontrará.

**Errores frecuentes al resolverlo:**

- Pensar que el problema está en el contenido del fichero. El contenido puede estar perfecto: el editor ni lo ha mirado para decidir el lenguaje.
- Dar por buena la solución de cambiar el modo de lenguaje: es un apaño que solo ve Sergio.
- Querer ponerle una extensión a `tareas` «porque sí».

</details>

#### Ejercicio 4 · El fichero que no se guarda

Lucía tiene abierta en VS Code la carpeta `saludos` con el fichero `mensaje.txt`. Hace esto:

1. En el editor cambia el texto `Hola` por `Hola, mundo`.
2. En la terminal integrada escribe `cat mensaje.txt` (la orden que muestra el contenido de un fichero, de [La terminal: lo básico](01-terminal-lo-basico.md#19-ver-qué-hay-dentro-de-un-fichero-cat-less-head-y-tail)), y sale:

   ```text
   Hola
   ```

3. Cierra VS Code, lo vuelve a abrir y ve `Hola, mundo` en el editor. «¡Pero si se ha guardado!»
4. Vuelve a escribir `cat mensaje.txt` y sale otra vez `Hola`.

Explica qué está pasando en cada paso. ¿Qué habría visto Lucía en la pestaña del fichero? ¿Qué tiene que hacer para que la terminal vea el cambio, y cómo puede evitar que le vuelva a pasar?

<details>
<summary>Pista 1</summary>

¿Dónde está el texto `Hola, mundo`: en la memoria (el editor) o en el disco (el fichero)? ¿Qué lee `cat`?

</details>

<details>
<summary>Pista 2</summary>

Repasa la nota del [apartado 1.6](#16-guardar-el-punto-de-la-pestaña-y-el-autoguardado) sobre lo que pasa al cerrar VS Code con cambios sin guardar.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el editor y el disco son dos sitios distintos. `cat`, como cualquier programa, lee el **disco**; el editor muestra lo que tiene en **memoria** ([apartado 1.6](#16-guardar-el-punto-de-la-pestaña-y-el-autoguardado)).

1. **Paso 1:** el cambio está **solo en el editor**. La pestaña de `mensaje.txt` muestra el **punto ●** de cambios sin guardar (no tiene el autoguardado activado).
2. **Paso 2:** `cat` lee el fichero del disco, donde sigue `Hola`. No es que la terminal falle: lee lo único que hay guardado.
3. **Paso 3:** al cerrar, VS Code **recordó los cambios sin guardar** (*Hot Exit*) y, al abrirlo, se los vuelve a enseñar. Parece guardado, pero **no lo está**: la pestaña sigue con el punto ●.
4. **Paso 4:** por eso `cat` sigue diciendo `Hola`.

**Qué tiene que hacer:** guardar con <kbd>Ctrl</kbd>+<kbd>S</kbd> (<kbd>Cmd</kbd>+<kbd>S</kbd>). El punto desaparece y, ahora sí, `cat mensaje.txt` dice `Hola, mundo`.

**Cómo evitarlo:** activar **File > Auto Save** y, sobre todo, acostumbrarse a mirar la pestaña antes de usar un fichero desde la terminal.

**Errores frecuentes al resolverlo:**

- Pensar que en el paso 3 el fichero se guardó «al cerrar». Recordar no es guardar.
- Echarle la culpa a la terminal o a `cat`.

</details>

### 🔴 Avanzado

#### Ejercicio 5 · Elegir extensiones con criterio

Marta busca en el Marketplace una extensión para trabajar con ficheros YAML y le salen estas (los datos son inventados para el ejercicio, salvo los de la primera, que son los reales del 9 de noviembre de 2026):

| # | Nombre | Editor | ¿Verificado? | Instalaciones | Última actualización | Descripción |
|---|---|---|---|---|---|---|
| A | YAML | Red Hat | Sí (`redhat.com`) | 29,9 millones | Hace unos días | Comprobación y autocompletado de YAML |
| B | YAML Pro | redhatt-tools | No | 312 | Hace 2 semanas | «La extensión de YAML oficial, ahora más rápida» |
| C | YAML Colors | Lucía Pérez | No | 85.000 | Hace 5 años | Colores para YAML |
| D | Super Productividad | dev-boost | No | 1.200 | Hace 1 mes | «Acelera VS Code un 300 % y añade YAML, Python, Java y 50 lenguajes más» |

1. ¿Cuál instalarías? ¿Por qué?
2. ¿Qué te hace desconfiar de B y de D?
3. ¿Hay algo malo en C? ¿La necesitas?

<details>
<summary>Pista 1</summary>

Repasa la tabla de «qué mirar» del [apartado 1.10](#110-extensiones-ampliar-el-editor-con-cuidado). Fíjate muy bien en el nombre del editor de B.

</details>

<details>
<summary>Pista 2</summary>

Para C: ¿qué trae VS Code de serie para YAML? ([apartado 1.11](#111-extensiones-útiles-para-este-curso)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se aplican los criterios del [apartado 1.10](#110-extensiones-ampliar-el-editor-con-cuidado) a cada una: quién la publica, si está verificado, instalaciones, si está viva, y si hace falta.

1. **La A.** La publica Red Hat, que está verificado (ha demostrado que es dueño de `redhat.com`), tiene casi 30 millones de instalaciones y se actualiza a menudo. Hace justo lo que Marta necesita y nada más.
2. **B** es la señal de alarma típica: **imita** a la A. El editor es `redhatt-tools`, con **dos tes**, no está verificado, tiene muy pocas instalaciones y se presenta como «la oficial», cosa que no es. Es exactamente lo que hacen las extensiones maliciosas: parecerse a una famosa. **D** promete cosas imposibles o que no tienen nada que ver («acelera un 300 %») y mete 50 lenguajes en una sola extensión: muchos permisos para algo que no necesitas, de un editor que nadie conoce.
3. **C** no tiene nada malo a la vista: un nombre de persona, bastantes instalaciones. Pero lleva **cinco años sin actualizarse** (puede haber dejado de funcionar bien) y, sobre todo, **no hace falta**: VS Code ya colorea YAML de serie, y la A añade además las comprobaciones.

**Lo importante:** el criterio no es «la que más cosas hace», sino **la que hace lo que necesitas, de quien te puedes fiar**.

**Errores frecuentes al resolverlo:**

- Elegir B porque dice «oficial» y no fijarse en el nombre del editor.
- Elegir D porque «trae más cosas».
- Descartar C por ser de una persona y no de una empresa: muchas extensiones excelentes son de personas. El problema de C es otro.

</details>

#### Ejercicio 6 · Editar muchas líneas a la vez

En un fichero `invitados.txt` tienes esta lista:

```text
Ana García
Luis Pérez
Marta Ruiz
Pedro Sanz
Sara Gil
```

Tienes que dejarlo así, **sin escribir cinco veces lo mismo** y sin cortar y pegar ninguna línea:

```text
- [ ] Sara Gil
- [ ] Ana García
- [ ] Luis Pérez
- [ ] Marta Ruiz
- [ ] Pedro Sanz
```

(Esa forma, `- [ ] `, es una lista de tareas de Markdown, para ir marcando quién confirma; la verás en [04.02 Markdown](../fase-04-formatos-y-diagramas/02-markdown.md#17-listas-de-tareas).)

Escribe qué teclas pulsarías, en orden, y hazlo en tu editor.

<details>
<summary>Pista 1</summary>

Hay dos cambios distintos: **añadir** algo al principio de cada línea y **mover** una línea. Cada uno tiene su atajo en el [apartado 1.14](#114-los-atajos-de-teclado-esenciales).

</details>

<details>
<summary>Pista 2</summary>

Para tener un cursor al principio de cada línea, pon el primero al principio de `Ana García` y añade cursores **abajo**.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el texto que se añade es el mismo en las cinco líneas y en la misma posición: es el caso perfecto para el **multicursor**. Y una línea que cambia de sitio se **mueve** con su atajo ([apartado 1.14](#114-los-atajos-de-teclado-esenciales)).

**Paso 1, añadir `- [ ] ` a todas:**

1. Pon el cursor al principio de `Ana García` (un clic delante de la `A`, o la tecla <kbd>Inicio</kbd>).
2. Añade un cursor abajo **cuatro veces**: <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>↓</kbd> (Windows), <kbd>Mayús</kbd>+<kbd>Alt</kbd>+<kbd>↓</kbd> (Linux) o <kbd>Cmd</kbd>+<kbd>Opción</kbd>+<kbd>↓</kbd> (macOS). Tienes cinco cursores, uno por línea.
3. Escribe `- [ ] ` (guion, espacio, corchete, espacio, corchete, espacio).
4. Pulsa <kbd>Esc</kbd> para volver a un cursor.

**Paso 2, subir a Sara:**

1. Pon el cursor en cualquier punto de la línea `- [ ] Sara Gil`.
2. Pulsa <kbd>Alt</kbd>+<kbd>↑</kbd> (<kbd>Opción</kbd>+<kbd>↑</kbd> en macOS) **cuatro veces**: sube de la quinta posición a la primera.

**Errores frecuentes al resolverlo:**

- Poner el primer cursor en mitad del nombre: el texto se añadiría ahí, en las cinco líneas.
- Olvidar el <kbd>Esc</kbd> y seguir escribiendo con cinco cursores.
- En Linux, usar <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>↓</kbd>: en algunos escritorios, esa combinación la usa el sistema (por ejemplo, para cambiar de escritorio virtual). La de Linux en VS Code es <kbd>Mayús</kbd>+<kbd>Alt</kbd>+<kbd>↓</kbd>. Si ninguna funciona, el <kbd>Alt</kbd>+clic en cada línea hace lo mismo.

</details>

### 🏆 Caso real

#### Ejercicio 7 · Ayuda a Marta con su editor

Marta empieza el curso y te escribe con cuatro problemas. Para cada uno, di **qué le pasa** y **qué tiene que hacer**, paso a paso:

1. «Uso Windows. Abro la terminal de VS Code y el indicador es `PS C:\Users\marta\web>`. Escribo `ls -l` y me sale algo distinto de lo que pone el curso.»
2. «Uso también un Mac en casa. Escribo `code .` en la Terminal y me dice `zsh: command not found: code`, pero VS Code está instalado y lo abro sin problemas desde Aplicaciones.»
3. «He abierto con doble clic el fichero `index.html` de mi web y, cuando busco en archivos el nombre de una imagen, VS Code no encuentra nada, aunque sé que aparece en otros ficheros.»
4. «He cambiado el título de `README.md`, pero cuando lo miro con `cat` en la terminal sale el título viejo. En la pestaña hay un circulito.»

Al final, escríbele una lista corta de **tres costumbres** que le evitarían estos problemas.

<details>
<summary>Pista 1</summary>

Cada problema corresponde a uno de los errores típicos de la [sección 3](#3-errores-típicos). Búscalos por el síntoma.

</details>

<details>
<summary>Pista 2</summary>

En el 2, ¿qué tiene de especial macOS con la orden `code`? Y en el 4, ¿qué significa el «circulito» de la pestaña?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se identifica cada síntoma con su causa (secciones [1](#1-teoría) y [3](#3-errores-típicos)) y se da la solución concreta para su sistema.

**1. La terminal es PowerShell** ([error típico 3.5](#35-la-terminal-integrada-abre-powershell)). `PS` al principio y `>` al final son el indicador de PowerShell. Tiene que:

1. Abrir la paleta de comandos (<kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd>).
2. Elegir **Terminal: Select Default Profile** y, en la lista, **Git Bash**.
3. Cerrar la terminal (icono de la papelera del panel) y abrir una nueva con **Terminal > New Terminal**. El indicador terminará en `$`.

**2. La orden `code` no está instalada en macOS** ([error típico 3.6](#36-la-orden-code-no-se-encuentra)). En macOS no viene instalada aunque VS Code funcione. Tiene que:

1. Abrir VS Code y la paleta (<kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd>).
2. Escribir `shell command` y elegir **Shell Command: Install 'code' and optionally 'copilot' commands in PATH** (si le pregunta por `copilot`, puede decir que no).
3. **Cerrar la Terminal y abrir otra**, y probar `code --version`.

**3. Ha abierto un fichero suelto, no la carpeta** ([error típico 3.1](#31-abrir-un-fichero-suelto-en-lugar-de-la-carpeta)). La búsqueda en archivos solo mira la carpeta abierta, y no hay ninguna. Tiene que abrir la carpeta de la web con **File > Open Folder…**, o con `cd` hasta ella y `code .` (ahora que ya le funciona).

**4. No ha guardado** ([error típico 3.2](#32-olvidar-guardar)). El «circulito» es el punto ● de cambios sin guardar, y `cat` lee el disco. Tiene que guardar con <kbd>Ctrl</kbd>+<kbd>S</kbd> (o <kbd>Cmd</kbd>+<kbd>S</kbd> en el Mac) y volver a probar `cat README.md`.

**Tres costumbres para Marta:**

1. **Abre siempre la carpeta del proyecto**, mejor con `cd` y `code .`.
2. **Activa el autoguardado** y mira el punto de la pestaña antes de usar un fichero desde la terminal.
3. **Comprueba que estás en la terminal del curso**: el indicador termina en `$` (en el Mac, en `%`), sin `PS` delante.

**Errores frecuentes al resolverlo:**

- En el 1, decirle que use otras órdenes de PowerShell: el curso usa bash, y lo que hay que cambiar es la terminal.
- En el 2, decirle que reinstale VS Code: no hace falta, solo instalar la orden `code`.
- En el 3, pensar que la búsqueda falla o que el nombre está mal escrito, sin mirar qué hay abierto en el explorador.

</details>

## 6. Chuleta

### Conceptos clave

| Concepto | En una línea |
|---|---|
| **Editor de código** | Programa para escribir ficheros de texto plano, con ayudas para programar |
| **Texto plano** | Solo caracteres: sin negritas, tamaños ni imágenes. Es lo que leen los programas |
| **Procesador de textos** | Word y similares: texto con formato para personas. No sirve para programar |
| **IDE** | Editor con todo lo de un lenguaje concreto integrado: ejecutar, probar, depurar |
| **Resaltado de sintaxis** | Colores que pone el editor según el lenguaje, que decide por la extensión |
| **Paleta de comandos** | Caja donde escribes lo que quieres hacer y el editor te da la orden |
| **Extensión de VS Code** | Complemento que añade funciones al editor; tiene sus mismos permisos |
| **Terminal integrada** | Terminal dentro del editor, que se abre en la carpeta abierta |
| **Multicursor** | Varios cursores a la vez: lo que escribes aparece en todos |
| **LF / CRLF** | Los saltos de línea de Linux y macOS / de Windows; se ven y se cambian en la barra de estado. Los scripts de bash, siempre con `LF` (ajuste `files.eol`: `\n`) |

### Atajos esenciales (teclado estadounidense; mira los tuyos en el editor)

| Para | Windows y Linux | macOS |
|---|---|---|
| Guardar | <kbd>Ctrl</kbd>+<kbd>S</kbd> | <kbd>Cmd</kbd>+<kbd>S</kbd> |
| Deshacer / rehacer | <kbd>Ctrl</kbd>+<kbd>Z</kbd> / <kbd>Ctrl</kbd>+<kbd>Y</kbd> | <kbd>Cmd</kbd>+<kbd>Z</kbd> / <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>Z</kbd> |
| Paleta de comandos | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd> |
| Abrir rápido un fichero | <kbd>Ctrl</kbd>+<kbd>P</kbd> | <kbd>Cmd</kbd>+<kbd>P</kbd> |
| Buscar / reemplazar en el fichero | <kbd>Ctrl</kbd>+<kbd>F</kbd> / <kbd>Ctrl</kbd>+<kbd>H</kbd> | <kbd>Cmd</kbd>+<kbd>F</kbd> / <kbd>Cmd</kbd>+<kbd>Opción</kbd>+<kbd>F</kbd> |
| Buscar / reemplazar en la carpeta | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd> / <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd> / <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>H</kbd> |
| Comentar la línea | <kbd>Ctrl</kbd>+<kbd>/</kbd> | <kbd>Cmd</kbd>+<kbd>/</kbd> |
| Mover la línea | <kbd>Alt</kbd>+<kbd>↑</kbd> / <kbd>Alt</kbd>+<kbd>↓</kbd> | <kbd>Opción</kbd>+<kbd>↑</kbd> / <kbd>Opción</kbd>+<kbd>↓</kbd> |
| Multicursor | <kbd>Alt</kbd>+clic | <kbd>Opción</kbd>+clic |
| Vista previa de Markdown | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd> |

### Antes de instalar una extensión

1. ¿La necesito de verdad?
2. ¿Quién la publica? ¿Está verificado (✓)? ¿El nombre es exactamente el que espero?
3. ¿Cuántas instalaciones y qué opiniones tiene?
4. ¿Se actualiza?

### Reglas de oro

- Abre **la carpeta del proyecto**, no ficheros sueltos.
- Si la pestaña tiene **●**, el disco tiene la versión vieja.
- Los colores los decide la **extensión** del fichero.
- **Mira los resultados** antes de reemplazar en todos los ficheros.
- En Windows, la terminal integrada con **Git Bash**.

## 7. Preguntas de repaso

1. ¿Por qué no se puede programar con un procesador de textos como Word?

   <details>
   <summary>Ver respuesta</summary>

   Porque guarda el texto con formato en un fichero especial (`.docx`), que los programas no entienden, y porque cambia lo que escribes sin avisar (comillas tipográficas, rayas, mayúsculas). Los programas necesitan texto plano, exactamente como lo escribiste. Lo tienes en [1.2. Editor, procesador de textos e IDE](#12-editor-procesador-de-textos-e-ide).

   </details>

2. ¿Por qué conviene abrir la carpeta del proyecto y no un fichero suelto?

   <details>
   <summary>Ver respuesta</summary>

   Porque así ves todos los ficheros del proyecto, puedes buscar y reemplazar en todos, la terminal integrada se abre en la carpeta del proyecto (y las rutas relativas funcionan) y las herramientas lo reconocen como un proyecto. Lo tienes en [1.4. Abre carpetas, no ficheros sueltos](#14-abre-carpetas-no-ficheros-sueltos).

   </details>

3. ¿Qué significa un punto en la pestaña de un fichero? ¿Qué consecuencia tiene para la terminal?

   <details>
   <summary>Ver respuesta</summary>

   Que el fichero tiene cambios sin guardar: están en el editor, pero no en el disco. La terminal y los demás programas leen el disco, así que verán la versión anterior hasta que guardes. Lo tienes en [1.6. Guardar: el punto de la pestaña y el autoguardado](#16-guardar-el-punto-de-la-pestaña-y-el-autoguardado).

   </details>

4. ¿Para qué sirve la paleta de comandos y cómo se abre?

   <details>
   <summary>Ver respuesta</summary>

   Para encontrar y ejecutar cualquier orden del editor escribiendo lo que quieres hacer, aunque no sepas en qué menú está. Se abre con <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd> (<kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>P</kbd> en macOS) o con <kbd>F1</kbd>. Lo tienes en [1.7. La paleta de comandos](#17-la-paleta-de-comandos).

   </details>

5. Vas a reemplazar un nombre en todos los ficheros de un proyecto. ¿Qué compruebas antes de pulsar «reemplazar todo»?

   <details>
   <summary>Ver respuesta</summary>

   Cuántos resultados hay y en qué ficheros, y que todos son los que quieres cambiar (que no se ha colado una palabra que contiene la que buscas, ni una versión en mayúsculas que debía quedarse). Para afinar, los botones de mayúsculas (`Aa`) y de palabra completa. Lo tienes en [1.8. Buscar y reemplazar](#18-buscar-y-reemplazar).

   </details>

6. ¿Cómo decide VS Code de qué colores pinta un fichero? ¿Dónde ves qué ha decidido?

   <details>
   <summary>Ver respuesta</summary>

   Por la extensión del fichero, que le dice el lenguaje (el modo de lenguaje). Lo ves a la derecha de la barra de estado: `JSON`, `Markdown`, o `Plain Text` si no lo reconoce. Lo tienes en [1.9. El resaltado de sintaxis](#19-el-resaltado-de-sintaxis).

   </details>

7. ¿Por qué hay que tener cuidado con las extensiones de VS Code? Di tres cosas que mirarías antes de instalar una.

   <details>
   <summary>Ver respuesta</summary>

   Porque tienen los mismos permisos que el editor: pueden leer y cambiar tus ficheros, conectarse a internet y ejecutar programas. Antes de instalar, mira quién la publica (y si está verificado), cuántas instalaciones y qué opiniones tiene, si se actualiza y si de verdad la necesitas. Lo tienes en [1.10. Extensiones: ampliar el editor con cuidado](#110-extensiones-ampliar-el-editor-con-cuidado).

   </details>

8. ¿Qué tienes que hacer en Windows para que la terminal integrada sea Git Bash?

   <details>
   <summary>Ver respuesta</summary>

   En la paleta de comandos, elegir **Terminal: Select Default Profile** y luego **Git Bash**, y abrir una terminal nueva. Si no lo cambias, abre PowerShell. Lo tienes en [1.12. La terminal integrada](#112-la-terminal-integrada).

   </details>

9. ¿Qué hace `code .`? ¿Qué hay que hacer en macOS para poder usarlo?

   <details>
   <summary>Ver respuesta</summary>

   Abre en VS Code la carpeta actual de la terminal (`.`). En macOS, la orden `code` no viene instalada: hay que instalarla desde la paleta de comandos, con la orden **Shell Command: Install 'code' and optionally 'copilot' commands in PATH**, y abrir una terminal nueva. Lo tienes en [1.13. Abrir VS Code desde la terminal](#113-abrir-vs-code-desde-la-terminal).

   </details>

---
⬅️ [Anterior: La terminal: sacarle partido](02-terminal-sacarle-partido.md) · 📚 [Índice](../00-indice.md) · ➡️ [Siguiente: Errores y depuración](04-errores-y-depuracion.md)
