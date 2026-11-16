# 04.02 Markdown

> **Versiones:** CommonMark 0.31.2 y GitHub Flavored Markdown 0.29-gfm, comprobadas el 9 de noviembre de 2026 · Visual Studio Code 1.145
> **Conviene saber antes:** [03.03 El editor de código](../fase-03-herramientas/03-editor-de-codigo.md) · [02.02 Archivos, carpetas y rutas, 1.9](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#19-la-carpeta-actual-y-las-rutas-relativas)
> **Tiempo estimado:** 2,5 horas
> **Nivel:** Básico · Núcleo

## Qué aprenderás

- Qué es **Markdown** y qué es un **lenguaje de marcas ligero**: texto plano con unos pocos símbolos que otro programa convierte en títulos, listas o enlaces.
- Qué son **CommonMark** y **GitHub Flavored Markdown (GFM)**, y por qué el mismo fichero puede verse un poco distinto en cada sitio.
- A escribir **párrafos, títulos, negrita, cursiva, listas** (también anidadas y **de tareas**), **citas** y **tablas**.
- A poner **enlaces**: a una web, a otro fichero de tu proyecto con una **ruta relativa** y a un título concreto con un **ancla**, sabiendo cómo genera GitHub esas anclas.
- A poner **imágenes** con un buen **texto alternativo**.
- A mostrar **código**: en línea y en **bloques con su lenguaje**.
- A **escapar** los caracteres que Markdown entiende como marcas, y a usar **un poco de HTML** cuando Markdown no llega.
- Qué es un **README.md** y qué conviene que cuente.
- A escribir Markdown en **VS Code** con su **vista previa**, y a dejar que te avise de los enlaces rotos.

Todo lo que lees en este curso, incluida esta página, está escrito en Markdown. Al terminar el módulo sabrás escribir así tus apuntes, la documentación de tus proyectos y el README de tu proyecto final.

## 1. Teoría

### 1.1. Qué es Markdown

Ya sabes qué es el [texto plano](../fase-03-herramientas/03-editor-de-codigo.md#11-qué-es-un-editor-de-código): solo caracteres, sin negritas, tamaños ni imágenes. Es lo que leen los programas. Pero las personas también queremos documentos con títulos, listas y enlaces, y no queremos renunciar a las ventajas del texto plano (se edita con cualquier editor, Git guarda su historial línea a línea, ocupa poco y no depende de ningún programa).

**Markdown** resuelve ese problema: es una forma de escribir **texto plano con unos pocos símbolos** que significan algo. Un `#` al principio de la línea dice «esto es un título»; dos asteriscos alrededor de una palabra, «esto va en negrita»; un guion al principio, «esto es un elemento de una lista». Después, **otro programa lee esos símbolos y dibuja el documento** con su formato: GitHub, la academia, la vista previa de VS Code…

```markdown
# Lista de la compra

Para la cena del **sábado**:

- Pan
- Tomates
```

Ese fichero, tal cual, se lee bien (es su gran virtud: aunque nadie lo dibuje, se entiende). Y quien lo dibuja enseña un título grande, «sábado» en negrita y una lista con dos puntos.

A esta forma de escribir se le llama **lenguaje de marcas**: un texto con **marcas** que dicen qué es cada parte (un título, una lista, un enlace), para que un programa decida cómo mostrarlo. El más conocido es **HTML**, el de las páginas web, que verás en [04.04 XML, CSV y otros](04-xml-csv-y-otros.md#17-html-el-pariente-de-xml); sus marcas son etiquetas como `<h1>` y `</h1>`, y un HTML a pelo cuesta leerlo. Markdown es un lenguaje de marcas **ligero**: sus marcas son tan pocas y tan discretas que el texto se lee bien sin dibujarlo.

Lo creó **John Gruber** en **2004**, con las ideas de Aaron Swartz sobre el diseño de su sintaxis, y con un objetivo expreso: que un documento en Markdown se pueda publicar tal cual, como texto, sin que parezca lleno de etiquetas (según la página original del proyecto, *Daring Fireball*, consultada el 9 de noviembre de 2026). Su extensión es **`.md`** (a veces, `.markdown`).

**Dónde lo vas a encontrar:**

- En **GitHub** y en cualquier servicio parecido: el `README.md` que presenta cada proyecto ([apartado 1.16](#116-el-fichero-readme)), la documentación, los comentarios de las *issues* (los avisos de fallos y tareas pendientes de un proyecto en GitHub; las verás en la fase 5).
- En **los cursos de esta academia**: cada módulo es un fichero `.md`.
- En la **documentación** de muchísimos programas y en aplicaciones de notas (como Obsidian o Joplin).
- En los **asistentes de IA**, que suelen contestar en Markdown: por eso sus respuestas traen títulos, listas y bloques de código.

### 1.2. Un estándar y varios sabores: CommonMark y GFM

La descripción original de Gruber dejaba muchos casos sin decidir (¿qué pasa con una lista justo debajo de un párrafo?, ¿cuántos espacios hay que poner para anidar?), y cada programa los resolvió a su manera. Durante años, el mismo fichero se veía distinto según dónde lo abrías.

Para arreglarlo nació **CommonMark**, una especificación que dice con detalle cómo se interpreta cada caso, con cientos de ejemplos. Es el Markdown «de base» que hoy siguen casi todos. Su versión más reciente es la **0.31.2**, del 28 de enero de 2024 (comprobado en `spec.commonmark.org` el 9 de noviembre de 2026).

Sobre esa base, cada sitio añade lo suyo. El añadido más extendido es el de GitHub, **GitHub Flavored Markdown** (**GFM**, «Markdown con sabor a GitHub»): CommonMark más cinco **extensiones** (versión **0.29-gfm**, del 6 de abril de 2019, comprobado en `github.github.com/gfm` el 9 de noviembre de 2026):

| Extensión de GFM | Qué añade | Dónde lo ves |
|---|---|---|
| Tablas | Tablas con columnas | [Apartado 1.13](#113-tablas) |
| Listas de tareas | Casillas que se marcan | [Apartado 1.7](#17-listas-de-tareas) |
| Tachado | ~~Texto tachado~~ | [Apartado 1.5](#15-negrita-cursiva-y-tachado) |
| Autoenlaces | Una dirección como `www.ejemplo.com` se convierte en enlace sola | [Apartado 1.8](#18-enlaces) |
| HTML no permitido | Desactiva algunas etiquetas HTML peligrosas | [Apartado 1.15](#115-un-poco-de-html) |

Además, GitHub entiende cosas que no están en ninguna de las dos especificaciones, como los diagramas Mermaid (los verás en [04.05 Diagramas y Mermaid](05-diagramas-y-mermaid.md#110-dónde-se-dibuja-github-la-academia-y-vs-code)).

**Qué significa esto para ti:**

- Lo **común** (títulos, párrafos, énfasis, listas, enlaces, imágenes, código, citas) se ve igual en todas partes. Es casi todo lo que vas a escribir.
- Lo **añadido** (tablas, tareas, tachado…) depende del sitio. GitHub lo entiende todo; la vista previa de VS Code sigue CommonMark, con las tablas y el tachado, pero no todo lo de GitHub ([apartado 1.17](#117-markdown-en-vs-code)).
- La regla práctica: **escribe pensando en dónde se va a leer**, y compruébalo allí. Este curso, por ejemplo, se escribe para leerse igual en GitHub y en la academia, y por eso usa solo lo que entienden los dos.

> **📌 Nota:** en este módulo, cada vez que algo sea propio de GFM y no de CommonMark, se dice.

### 1.3. Párrafos y saltos de línea

La regla más importante de Markdown, y la que más sorprende al principio: **un párrafo es un bloque de líneas seguidas, y los párrafos se separan con una línea en blanco**.

```markdown
Esto es el primer párrafo.
Esta línea sigue en el mismo párrafo,
y esta también.

Esto ya es el segundo párrafo, porque hay una línea en blanco encima.
```

Al dibujarlo, las tres primeras líneas salen **juntas, en una sola línea** (o en las que hagan falta según el ancho de la pantalla): un salto de línea dentro de un párrafo **cuenta como un espacio**. Así puedes escribir frases largas partidas en varias líneas sin que se note.

¿Y si quieres un salto de línea de verdad, dentro del mismo párrafo (una dirección, un poema)? Tienes dos formas en CommonMark:

- Una **barra invertida** (`\`) al final de la línea. Es la que se recomienda: se ve.
- **Dos espacios** al final de la línea. Funciona, pero no se ven, y muchos editores borran los espacios del final al guardar: un día desaparecen y no sabes por qué.

```markdown
Panadería Sol\
Calle Mayor, 12\
Madrid
```

Así salen tres líneas, una debajo de otra. Sin las barras, saldría `Panadería Sol Calle Mayor, 12 Madrid` en una sola. (GitHub admite además la etiqueta HTML `<br>`, del [apartado 1.15](#115-un-poco-de-html).)

> **💡 Consejo:** ante la duda, **línea en blanco**. Entre párrafos, antes y después de un título, de una lista, de una tabla o de un bloque de código. Nunca estorba y evita casi todos los líos.

### 1.4. Títulos

Un título es una línea que empieza por **almohadillas** (`#`) seguidas de **un espacio**. El número de almohadillas es el **nivel**, de 1 a 6:

```markdown
# Título del documento (nivel 1)

## Una sección (nivel 2)

### Un apartado dentro de la sección (nivel 3)

#### Un subapartado (nivel 4)
```

Cuanto más alto el nivel, más pequeño se dibuja. Los títulos no son solo letra grande: son la **estructura** del documento. Con ellos, GitHub y VS Code generan un **índice** automático ([apartado 1.17](#117-markdown-en-vs-code)), y cada título se convierte en un destino al que se puede enlazar ([apartado 1.9](#19-anclas-enlazar-a-un-título)).

Tres reglas para usarlos bien:

1. **Un solo título de nivel 1** por documento: el nombre del documento. Lo demás cuelga de él.
2. **No te saltes niveles**: debajo de un `##` va un `###`, no un `####`. Elige el nivel por la estructura, no por el tamaño que quieres que tenga.
3. **El espacio detrás de `#` es obligatorio**: `#Título` no es un título, sino un párrafo que empieza por almohadilla ([error típico 3.1](#31-el-título-que-no-es-título)).

> **📌 Nota:** verás a veces otra forma de escribir los títulos de nivel 1 y 2: subrayar la línea con signos `=` o `-` en la línea de debajo. Funciona, pero solo para esos dos niveles. Usa siempre las almohadillas; lo importante de esa otra forma es saber que existe, por lo que verás en el [apartado 1.12](#112-citas-y-separadores).

### 1.5. Negrita, cursiva y tachado

El **énfasis** se marca rodeando el texto con asteriscos o guiones bajos:

| Escribes | Se ve | Para qué |
|---|---|---|
| `*cursiva*` o `_cursiva_` | *cursiva* | Títulos de libros, palabras en otro idioma, un matiz |
| `**negrita**` o `__negrita__` | **negrita** | Lo importante de una frase |
| `***las dos***` | ***las dos*** | Rara vez hace falta |
| `~~tachado~~` | ~~tachado~~ | Lo que ya no vale (es de **GFM**, no de CommonMark) |

Detalles que conviene saber:

- **Elige asteriscos.** Hacen lo mismo que los guiones bajos, pero funcionan también en mitad de una palabra (`super**importante**` sale con «importante» en negrita), y los guiones bajos no. Eso tiene una ventaja: un nombre de fichero como `notas_de_clase.md` no se convierte en cursiva.
- **Pegado al texto.** Las marcas van pegadas a lo que encierran: `**negrita**` funciona; `** negrita **`, con espacios por dentro, no, y se ven los asteriscos.
- **No abuses.** Si la mitad del párrafo va en negrita, nada destaca. Este curso usa la negrita para la idea clave de cada párrafo, y poco más.

### 1.6. Listas

Hay dos tipos de listas:

**Listas sin orden** (con viñetas): cada elemento empieza por un guion (`-`), un asterisco (`*`) o un signo más (`+`), seguido de un espacio. Usa siempre el mismo signo en una lista; el más habitual es el guion.

```markdown
- Harina
- Agua
- Sal
```

**Listas numeradas**: cada elemento empieza por un número, un punto y un espacio.

```markdown
1. Mezcla la harina y el agua.
2. Añade la sal.
3. Amasa diez minutos.
```

Un detalle curioso: **el número que cuenta es el del primer elemento**; los demás se numeran solos, seguidos. Si escribes `1.`, `1.`, `1.`, se verá 1, 2, 3; si la lista empieza por `3.`, se verá 3, 4, 5… Aun así, escribe los números bien: el fichero también lo leen personas.

**Listas anidadas.** Para meter una lista dentro de un elemento, se **sangra**: se escribe más a la derecha, debajo del texto del elemento. La regla de CommonMark es que la sublista tiene que empezar **en la misma columna que el texto** del elemento de arriba:

```markdown
- Cocina
  - Platos
  - Sartenes
- Salón

1. Se cargan los muebles grandes:
   - el sofá
   - la cama
2. Se cargan las cajas.
```

- Debajo de `- Cocina`, el texto empieza en la columna 3 (después de `- `), así que la sublista lleva **2 espacios**.
- Debajo de `1. Se cargan…`, el texto empieza después de `1. `, así que la sublista lleva **3 espacios**.

Con menos espacios, la sublista no se anida: se queda al mismo nivel ([error típico 3.2](#32-la-sublista-que-no-se-anida)). Con la misma regla puedes meter un párrafo entero dentro de un elemento de la lista: déjale una línea en blanco encima y sángralo igual (lo verás en el [ejemplo 2.2](#22-la-lista-de-una-mudanza)).

> **⚠️ Cuidado:** sangra con **espacios**, no con el tabulador. Muchos editores, como VS Code, convierten el tabulador en espacios, pero no todos, y un tabulador puede valer por más columnas de las que parece.

### 1.7. Listas de tareas

Una extensión de **GFM** muy útil: si un elemento de una lista sin orden empieza por `[ ]` (corchete, espacio, corchete), GitHub dibuja una **casilla vacía**; con `[x]`, una casilla **marcada**.

```markdown
- [x] Comprar la pintura
- [x] Elegir el color
- [ ] Pintar el salón
- [ ] Devolver la escalera a Javier
```

Así se escriben las listas de pendientes de un proyecto: en el README (lo que ya funciona y lo que falta), en una *issue* de GitHub (fase 5) o en tus propios apuntes. En una *issue* o un comentario de GitHub, además, las casillas se pueden marcar con un clic.

> **📌 Nota:** fuera de GitHub, una lista de tareas puede verse como una lista normal, con el `[ ]` como texto. Le pasa, por ejemplo, a la academia de este curso, que hoy no dibuja las casillas. Aun así, la lista sigue entendiéndose.

### 1.8. Enlaces

Un enlace tiene dos partes: el **texto** que se ve, entre corchetes, y el **destino**, entre paréntesis, pegado detrás:

```markdown
Consulta el [catálogo de la biblioteca](https://www.ejemplo.com/catalogo).
```

Se ve «Consulta el catálogo de la biblioteca», con «catálogo de la biblioteca» como enlace. Algunas variantes:

| Escribes | Qué hace |
|---|---|
| `[texto](https://www.ejemplo.com)` | Enlace a una web |
| `[texto](https://www.ejemplo.com "Web del club")` | Igual, con un **título** que se ve al pasar el ratón por encima |
| `<https://www.ejemplo.com>` | **Autoenlace**: la dirección, tal cual, como enlace (CommonMark) |
| `https://www.ejemplo.com` o `www.ejemplo.com` | GitHub la convierte en enlace sola (es la extensión de **autoenlaces** de GFM) |
| `[texto](normas.md)` | Enlace a **otro fichero** de tu proyecto, con una ruta relativa |
| `[texto](#cuotas)` | Enlace a **un título** del mismo documento (un ancla, en el [apartado 1.9](#19-anclas-enlazar-a-un-título)) |

**El texto del enlace tiene que decir adónde lleva.** `Lee [la guía de instalación](docs/instalacion.md)` es mucho mejor que `Para la guía, haz clic [aquí](docs/instalacion.md)`: quien lee en diagonal, o quien usa un lector de pantalla que lee solo los enlaces, sabe adónde va sin leer la frase entera.

**Enlaces a otros ficheros: rutas relativas.** Para enlazar a otro fichero de tu proyecto se usa una **ruta relativa**, exactamente como las que aprendiste en [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#19-la-carpeta-actual-y-las-rutas-relativas). La única diferencia es desde dónde se cuenta: **desde la carpeta donde está el fichero `.md` que tiene el enlace**.

```text
ludoteca/
├── README.md
└── docs/
    ├── prestamos.md
    └── preguntas.md
```

| Desde | Para ir a | Escribes |
|---|---|---|
| `README.md` | `prestamos.md` | `[Préstamos](docs/prestamos.md)` |
| `docs/prestamos.md` | `preguntas.md` (en su misma carpeta) | `[Preguntas](preguntas.md)` |
| `docs/prestamos.md` | `README.md` (una carpeta más arriba) | `[Portada](../README.md)` |

Y siempre con barras normales (`/`), también en Windows: es lo que entienden GitHub y los navegadores. Una ruta relativa funciona en tu ordenador, en GitHub y en el ordenador de cualquiera que descargue el proyecto. Una ruta absoluta (`C:\Users\ana\proyecto\docs\prestamos.md`) solo funciona en el tuyo ([error típico 3.4](#34-rutas-que-solo-funcionan-en-tu-ordenador)). Lo recomienda también la documentación de GitHub (consultada el 9 de noviembre de 2026): enlaces relativos, para que funcionen en cualquier copia del proyecto.

### 1.9. Anclas: enlazar a un título

Para enlazar a una sección concreta de un documento, cada título tiene un **ancla**: un identificador que se genera solo a partir del texto del título. Se enlaza con `#` y el ancla:

```markdown
- [Cómo hacerse socio](#cómo-hacerse-socio)
- [Las cuotas, en el manual](manual.md#cuotas)
```

El primero lleva al título «Cómo hacerse socio» del mismo documento; el segundo, al título «Cuotas» de otro fichero, `manual.md`: la ruta y el ancla, juntas.

**Cómo genera GitHub el ancla de un título** (según su documentación, consultada el 9 de noviembre de 2026):

1. Quita el formato: de `` La app `Mi Gym` `` se queda `La app Mi Gym`.
2. Quita los espacios del principio y del final, y pasa **todo a minúsculas**.
3. **Quita los signos de puntuación** (puntos, comas, interrogaciones, paréntesis, `&`…), salvo los guiones (`-`) y los guiones bajos (`_`).
4. Cambia **cada espacio por un guion**.
5. Si dos títulos dan el mismo ancla, al segundo le añade `-1`; al tercero, `-2`…

| Título | Ancla |
|---|---|
| `## Cuotas` | `#cuotas` |
| `## Cómo hacerse socio` | `#cómo-hacerse-socio` (las **tildes se quedan**) |
| `## ¿Cuánto cuesta la cuota?` | `#cuánto-cuesta-la-cuota` |
| `### 1.2. Clases dirigidas` | `#12-clases-dirigidas` (los puntos desaparecen) |
| `## Spinning & yoga` | `#spinning--yoga` (sin `&` quedan dos espacios seguidos: dos guiones) |
| El segundo `## Contacto` del documento | `#contacto-1` |

Fíjate en la barra de direcciones de tu navegador mientras lees este curso: al hacer clic en un enlace a un apartado, la dirección termina en un ancla de estas. Es justo lo que usan los enlaces del tipo «lo tienes en el apartado 1.9» que ves por todo el curso.

> **⚠️ Cuidado:** si cambias el texto de un título, **cambia su ancla**, y todos los enlaces que apuntaban a él se rompen sin avisar: el enlace sigue llevando al documento, pero no a la sección. Cuando cambies un título, busca su ancla antigua en todo el proyecto (<kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd>, en macOS <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>F</kbd>, como en [03.03](../fase-03-herramientas/03-editor-de-codigo.md#18-buscar-y-reemplazar)). VS Code también te puede avisar ([apartado 1.17](#117-markdown-en-vs-code)).

> **📌 Nota:** otros programas generan las anclas con reglas algo distintas (algunos quitan las tildes, por ejemplo). Las de este apartado son las de GitHub, que son las que siguen los cursos de esta academia.

### 1.10. Imágenes y texto alternativo

Una imagen se escribe como un enlace con una **exclamación** delante:

```markdown
![Plano de la planta baja: la sala 2 está a la derecha de la entrada](img/plano.svg)
```

- Entre corchetes va el **texto alternativo** (en inglés, *alt text*).
- Entre paréntesis, la **ruta de la imagen**: relativa, con las mismas reglas que los enlaces. Lo normal es guardar las imágenes en una carpeta `img/` del proyecto.
- Los formatos habituales son PNG y JPG (fotos y capturas) y SVG (dibujos y logotipos).

**El texto alternativo** es la descripción de la imagen con palabras. Sirve para:

- Las personas que **no ven** la imagen: quien usa un **lector de pantalla** (un programa que lee la pantalla en voz alta, lo que usan muchas personas ciegas) oye ese texto en lugar de la imagen.
- Cuando la imagen **no carga**: se ve el texto en su lugar.
- Quien lee el fichero `.md` **sin dibujar**: en el editor, el texto alternativo es lo único que sabe de la imagen.

Un buen texto alternativo dice **lo que la imagen aporta**, no solo qué es. Compara:

| Texto alternativo | ¿Sirve? |
|---|---|
| `![](img/plano.svg)` | **No**: vacío. Quien no ve la imagen no sabe ni que existe |
| `![imagen](img/plano.svg)` o `![plano.svg](img/plano.svg)` | **No**: no dice nada que importe |
| `![Plano de la biblioteca](img/plano.svg)` | Algo mejor: dice qué es |
| `![Plano de la planta baja: la sala 2 está a la derecha de la entrada](img/plano.svg)` | **Sí**: dice lo que tenías que sacar de la imagen |

Una frase corta basta. GitHub lo define así: el texto alternativo es un equivalente breve, en texto, de la información de la imagen (según su documentación, consultada el 9 de noviembre de 2026).

> **⚠️ Cuidado:** la ruta de la imagen tiene que estar escrita **exactamente** como se llama el fichero, mayúsculas incluidas. En tu Windows o tu Mac, `img/Logo.png` encuentra `logo.png`; en GitHub, no ([02.02, apartado 1.12](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#112-mayúsculas-y-minúsculas)).

### 1.11. Código en línea y bloques de código

Lo que es código (una orden, el nombre de un fichero, un trozo de un programa) se escribe en **letra de ancho fijo** y sin que Markdown interprete nada de lo que lleva dentro.

**Código en línea**: entre **comillas invertidas** (`` ` ``, la tecla que en el teclado español está a la derecha de la P, junto al acento circunflejo; según el sistema, puede que tengas que pulsarla y después la barra espaciadora para que salga).

```markdown
Para ver dónde estás, escribe `pwd`. Los apuntes están en `notas_de_clase.md`.
```

Dentro de las comillas invertidas, los asteriscos y los guiones bajos son caracteres normales: `notas_de_clase.md` sale tal cual.

**Bloques de código**: para varias líneas, se encierran entre dos líneas con **tres comillas invertidas** (la valla de apertura y la de cierre). Detrás de las de apertura se escribe **el lenguaje**, para que quien lo dibuje le ponga los colores de su [resaltado de sintaxis](../fase-03-herramientas/03-editor-de-codigo.md#19-el-resaltado-de-sintaxis):

````markdown
```bash
mkdir proyecto
cd proyecto
```
````

Los nombres de lenguaje que más usarás en este curso:

| Lenguaje | Para qué |
|---|---|
| `bash` | Órdenes y scripts de la terminal |
| `text` | Texto sin colores: salidas de la terminal, ficheros de datos sencillos |
| `markdown` | Markdown que quieres enseñar sin que se dibuje (como en este módulo) |
| `json`, `yaml`, `xml`, `csv` | Los formatos de datos de los siguientes módulos de esta fase |
| `mermaid` | Diagramas: GitHub y la academia los **dibujan** en lugar de enseñar el código ([04.05](05-diagramas-y-mermaid.md)) |

Detalles de los bloques:

- **Ciérralos siempre.** Un bloque sin la valla de cierre se come **todo lo que viene detrás**, hasta el final del documento ([error típico 3.5](#35-un-bloque-de-código-sin-cerrar)).
- **Un bloque que contiene tres comillas invertidas** (por ejemplo, un trozo de Markdown con su propio bloque, como el de arriba) se encierra entre **cuatro**: la valla de cierre tiene que ser al menos tan larga como la de apertura. También se pueden usar tres virgulillas (`~~~`) en lugar de las comillas invertidas.
- **Un bloque dentro de una lista** se sangra como cualquier otro contenido del elemento ([apartado 1.6](#16-listas)), con una línea en blanco encima y otra debajo. Debajo de un `1. `, con 3 espacios:

  ````markdown
  1. Crea la carpeta:

     ```bash
     mkdir recetas
     ```

  2. Entra en ella.
  ````

### 1.12. Citas y separadores

**Citas.** Una línea que empieza por `>` y un espacio es una **cita**: se dibuja con una barra vertical a la izquierda, sangrada. Sirve para citar a alguien o para destacar una nota, como hace este curso con sus avisos.

```markdown
> Si llueve, la excursión se aplaza al domingo.
>
> Avisaremos por el grupo antes de las 7:00.
```

Una línea con solo `>` separa dos párrafos dentro de la misma cita. Dentro de una cita puede ir cualquier cosa: negritas, listas, incluso otra cita (con `>>`).

**Separadores.** Una línea con **tres guiones** (`---`), sola y con una línea en blanco encima, dibuja una **línea horizontal**: separa partes de un documento, como al final de cada módulo de este curso, antes de los enlaces de navegación.

> **⚠️ Cuidado:** la línea en blanco de encima importa. Si escribes `---` justo debajo de una línea de texto, no sale una línea horizontal: ese texto se convierte en un **título de nivel 2** (es la forma subrayada que viste en la nota del [apartado 1.4](#14-títulos)). Ante la duda, línea en blanco antes y después.

### 1.13. Tablas

Las tablas son una extensión de **GFM**. Se dibujan con barras verticales (`|`) entre las columnas y una **fila separadora** de guiones debajo de la cabecera:

```markdown
| Servicio | Tiempo | Precio |
|:---|:---:|---:|
| Arreglar un pinchazo | 15 min | 8,00 € |
| Revisión completa | 1 h | 45,00 € |
```

- **La primera fila es la cabecera**: sale en negrita.
- **La fila separadora es obligatoria.** Sin ella, no hay tabla: se ve el texto con sus barras ([error típico 3.6](#36-una-tabla-con-celdas-de-más-o-sin-fila-separadora)). Basta con un guion por columna (`|-|-|`), pero con tres se lee mejor.
- **La alineación** de cada columna se decide con dos puntos en la fila separadora: `:---` a la izquierda (lo normal), `:---:` centrada y `---:` a la derecha. **Los números y los precios, a la derecha**: así las cifras quedan unas debajo de otras.
- **Cada fila, con las mismas celdas que la cabecera.** Si a una fila le faltan, GitHub las deja vacías; si le sobran, **las tira sin avisar** (lo dice la especificación de GFM).
- **No hace falta alinear las barras** en el fichero: `| a | b |` y `|a|b|` dan la misma tabla. Alinearlas lo hace más legible, pero cuesta mantenerlo.
- **Dentro de una celda solo cabe una línea**, con negritas, código en línea o enlaces, pero sin listas ni párrafos. Si necesitas una barra vertical dentro de una celda, escríbela como `\|` ([apartado 1.14](#114-escapar-caracteres)).

> **💡 Consejo:** una tabla sirve para **comparar datos** que tienen las mismas columnas (precios, horarios, opciones). Si cada fila necesita un párrafo para explicarse, no es una tabla: es una lista.

### 1.14. Escapar caracteres

¿Y si quieres escribir un asterisco que **no** sea una marca? Por ejemplo, «El 3\*4\*5 da 60»: Markdown vería `*4*` como una cursiva y se comería los asteriscos ([error típico 3.7](#37-asteriscos-y-guiones-bajos-que-se-comen-el-texto)).

Se arregla **escapando** el carácter: escribiendo una **barra invertida** (`\`) justo delante. La barra le dice a Markdown «esto es el carácter, no una marca», y no se ve en el resultado.

| Escribes | Se ve |
|---|---|
| `El 3\*4\*5 da 60` | El 3\*4\*5 da 60 |
| `\# no es un título` | \# no es un título |
| `Plazas limitadas\*` | Plazas limitadas\* |
| `1986\. Un gran año.` | 1986\. Un gran año. (sin la barra, al principio de la línea sería una lista numerada que empieza en el 1986) |

Se puede escapar cualquier signo de puntuación de ASCII (`*`, `_`, `#`, `-`, `+`, `.`, `!`, `[`, `]`, `(`, `)`, `|`, la propia `\`, la comilla invertida…); delante de otros, como `¿` o `€`, la barra se vería. Escapar uno de ASCII que no hacía falta no estropea nada.

> **💡 Consejo:** si es código, un nombre de fichero o una orden, no escapes: ponlo **entre comillas invertidas** (`` `5*3` ``), que además se lee mejor.

### 1.15. Un poco de HTML

Markdown permite escribir **HTML** dentro del documento, y GitHub lo dibuja. Sirve para lo poco que Markdown no sabe hacer. Lo más útil:

| HTML | Para qué | Ejemplo |
|---|---|---|
| `<details>` y `<summary>` | Un bloque **plegado** que se abre con un clic | Las pistas y soluciones de este curso |
| `<kbd>` | Una **tecla** | <kbd>Ctrl</kbd>+<kbd>S</kbd> |
| `<br>` | Un salto de línea, también dentro de una celda de una tabla | |
| `<sub>` y `<sup>` | Subíndice y superíndice | H<sub>2</sub>O, 10<sup>3</sup> |

Así se escribe un bloque plegado, como los de las soluciones de los ejercicios:

```markdown
<details>
<summary>Ver solución</summary>

La solución, en **Markdown** normal.

</details>
```

Fíjate en las **líneas en blanco**: después de `<summary>…</summary>` y antes de `</details>`. Sin ellas, lo de dentro no se interpreta como Markdown (se verían los asteriscos), porque dentro de un bloque de HTML Markdown no actúa hasta que encuentra una línea en blanco.

**Con cuidado:**

- **Primero Markdown.** Usa HTML solo para lo que Markdown no puede hacer. Un `<b>` donde valía `**` hace el fichero más difícil de leer, y no se ve igual en todos los sitios.
- **No todo el HTML funciona.** Los sitios que muestran Markdown quitan el HTML que podría ser peligroso. La propia especificación de GFM desactiva `<script>`, `<style>`, `<iframe>`, `<title>`, `<textarea>` y algunas más, y GitHub quita además otras cosas, como los estilos. La academia es todavía más estricta. Si una etiqueta no hace nada al publicar, no es un error tuyo: es que ese sitio no la admite.

### 1.16. El fichero README

Un **README** («léeme») es el fichero que **presenta un proyecto**: lo primero que lee quien llega a él. Casi siempre se llama **`README.md`** (en mayúsculas, por costumbre, para que destaque) y está en la carpeta principal del proyecto.

GitHub lo muestra **solo**, debajo de la lista de ficheros, en la página principal de cada repositorio: es la portada del proyecto.

Según la documentación de GitHub (consultada el 9 de noviembre de 2026), un README suele contar:

1. **Qué hace** el proyecto, en una o dos frases, justo debajo del título.
2. **Por qué es útil**: a quién le sirve.
3. **Cómo empezar**: qué hace falta instalar y cómo se pone en marcha, paso a paso, con las órdenes en bloques de código.
4. **Dónde pedir ayuda**.
5. **Quién lo mantiene** y cómo colaborar.

A eso se suele añadir una **captura** o un dibujo (con su texto alternativo), un **índice** con anclas si es largo, el **estado** del proyecto (una lista de tareas va muy bien) y la **licencia**: con qué condiciones se puede usar, que normalmente está en un fichero aparte, `LICENSE`, enlazado desde el README.

> **💡 Consejo:** escribe el README **para alguien que no sabe nada de tu proyecto**: tu yo de dentro de seis meses, alguien que lo encuentra en GitHub o quien lee tu portfolio. Si no entiende en diez segundos qué es, lo cerrará.

Es habitual encontrar al lado otros ficheros en Markdown con nombres en mayúsculas: `CONTRIBUTING.md` (cómo colaborar), `CHANGELOG.md` (qué cambia en cada versión)… Este mismo curso los tiene. En la [fase 5](../fase-05-git-y-github/03-github.md) aprenderás a subirlos a GitHub, y en el [proyecto final](../fase-08-proyecto-final/01-primer-repositorio.md) escribirás el README de tu propio proyecto.

### 1.17. Markdown en VS Code

VS Code entiende Markdown sin instalar nada (lo viste en [03.03](../fase-03-herramientas/03-editor-de-codigo.md#111-extensiones-útiles-para-este-curso)). Lo que te hará falta (VS Code 1.145, según su documentación, consultada el 9 de noviembre de 2026):

| Para | Cómo |
|---|---|
| **Vista previa** en la misma pestaña | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd>), o la orden **Markdown: Open Preview** (**Abrir vista previa**) |
| **Vista previa al lado**, mientras escribes | <kbd>Ctrl</kbd>+<kbd>K</kbd> y después <kbd>V</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>K</kbd> y después <kbd>V</kbd>), o la orden **Markdown: Open Preview to the Side** (**Abrir vista previa en el lateral**) |
| **Ver el índice** de títulos | La vista **Outline** (**Esquema**), abajo del todo en el explorador |
| **Saltar a un título** | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>O</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>O</kbd>), **Go to Symbol in Editor** (**Ir al símbolo en el editor**) |

La forma cómoda de trabajar es con la **vista previa al lado**: escribes a la izquierda y, a la derecha, ves el resultado a la vez. Además, al escribir la ruta de un enlace, VS Code te propone los ficheros de la carpeta y, si empiezas por `#`, los títulos del documento: menos rutas y anclas mal escritas.

**Que te avise de los enlaces rotos.** VS Code puede comprobar los enlaces a otros ficheros, a imágenes y a títulos, y subrayar los que no llevan a ningún sitio. Viene **apagado**: actívalo en la configuración (<kbd>Ctrl</kbd>+<kbd>,</kbd>; en macOS, <kbd>Cmd</kbd>+<kbd>,</kbd>), buscando `markdown.validate.enabled` y marcando la casilla. Solo comprueba lo que está en tu ordenador: los enlaces a internet, no. Para revisar además el estilo (títulos, listas, espacios), está la extensión **markdownlint** que viste en [03.03](../fase-03-herramientas/03-editor-de-codigo.md#111-extensiones-útiles-para-este-curso).

**La vista previa no es GitHub.** Según su documentación, VS Code sigue **CommonMark**, no GFM. En la práctica, las tablas y el tachado los dibuja, pero lo que es solo de GitHub (por ejemplo, las casillas de las listas de tareas, que puede enseñar como texto) puede no verse igual. Para saber cómo quedará en GitHub, la prueba de verdad es verlo en GitHub (fase 5). Los diagramas Mermaid dentro de Markdown, y si VS Code los dibuja, los verás en [04.05 Diagramas y Mermaid](05-diagramas-y-mermaid.md).

## 2. Ejemplos de código

Los ejemplos de este módulo son **ficheros Markdown**, cada uno en su carpeta (el enlace «📁 Código»). Para verlos dibujados, descarga la carpeta, ábrela en VS Code (con `code .` desde la terminal, como en [03.03](../fase-03-herramientas/03-editor-de-codigo.md#113-abrir-vs-code-desde-la-terminal)), abre el `.md` y su vista previa al lado (<kbd>Ctrl</kbd>+<kbd>K</kbd> y después <kbd>V</kbd>). Mejor aún: escríbelos tú, copiándolos, y mira cómo cambia la vista previa con cada línea.

### 2.1. Los apuntes de una clase

**Situación real:** Paula va a una escuela de cocina y toma los apuntes de cada clase en Markdown: así los lee en cualquier editor y los puede pasar a sus compañeros.

```markdown
# Clase 3: masas básicas

Escuela de cocina **La Cuchara** · martes, 10 de noviembre de 2026

## Masa de pizza

Es la masa más sencilla del curso. Lo importante es **dejarla reposar**:
sin reposo, sale dura.

Ingredientes para dos pizzas:

- 500 g de harina de fuerza
- 300 ml de agua templada
- 10 g de sal
- 7 g de levadura seca

Pasos:

1. Mezcla la harina y la levadura.
2. Añade el agua poco a poco y, al final, la sal.
3. Amasa unos *diez minutos*, hasta que no se pegue a las manos.
4. Déjala reposar una hora, tapada con un paño.

## Para la próxima clase

Traer delantal y un táper.\
~~Traer harina.~~ La pone la escuela.

La profesora, Carmen, avisa de que la clase **empieza a las 18:00**, no a las 18:30.

---

*Apuntes de Paula. Si ves algún error, díselo.*
```

📁 **Código:** [`codigo/02-markdown/ejemplos/2.1-apuntes-de-clase/`](codigo/02-markdown/ejemplos/2.1-apuntes-de-clase/)

**En qué fijarte:**

- **Un título de nivel 1** (el de la clase) y **dos de nivel 2** (las secciones). Cada uno con una línea en blanco encima y debajo.
- **«Es la masa más sencilla…»** está escrita en dos líneas, pero en la vista previa sale como **un solo párrafo**: el salto de línea cuenta como un espacio ([apartado 1.3](#13-párrafos-y-saltos-de-línea)).
- **«Traer delantal y un táper.»** termina en `\`: ahí sí hay un salto de línea, y «Traer harina.» sale en la línea de abajo, tachada.
- La **lista de ingredientes** no tiene orden; la de **pasos**, sí.
- La **línea horizontal** (`---`) separa la firma, que va en cursiva. Tiene una línea en blanco encima: sin ella, el párrafo de la profesora se convertiría en un título.

### 2.2. La lista de una mudanza

**Situación real:** Pablo y Marta se mudan y lo organizan todo en un fichero que comparten: lo que falta por hacer, qué va en cada caja y el plan del día.

```markdown
# Mudanza de Pablo y Marta

## Qué hay que hacer

- [x] Pedir presupuesto a tres empresas
- [x] Elegir empresa: **Mudanzas Rápidas**
- [ ] Dar de baja la luz y el agua del piso viejo
- [ ] Cambiar la dirección en el banco

## Cajas por habitación

- Cocina
  - Platos y vasos (¡frágil!)
  - Sartenes y cazuelas
- Salón
  - Libros: unas *ocho cajas*
  - Lámparas
- Dormitorio

## El día de la mudanza

1. A las 8:00 llega el camión.
2. Se cargan primero los muebles grandes:
   - el sofá
   - la cama
   - el armario, desmontado
3. Pablo va en el camión y Marta en coche, con las plantas.

   Las llaves del piso nuevo las lleva Marta.

4. A las 14:00, descarga en el piso nuevo.
```

📁 **Código:** [`codigo/02-markdown/ejemplos/2.2-lista-de-la-mudanza/`](codigo/02-markdown/ejemplos/2.2-lista-de-la-mudanza/)

**En qué fijarte:**

- **La lista de tareas**: en GitHub, dos casillas marcadas y dos vacías ([apartado 1.7](#17-listas-de-tareas)).
- **Las sublistas de las cajas** llevan **2 espacios**, porque cuelgan de un `- `; las de los muebles llevan **3**, porque cuelgan de un `2. ` ([apartado 1.6](#16-listas)). Cuenta los espacios en tu editor: con la flecha, el cursor salta de uno en uno.
- **«Dormitorio»** no tiene sublista: no pasa nada, cada elemento lleva la suya si la necesita.
- **El párrafo de las llaves** pertenece al paso 3: tiene una línea en blanco encima y la misma sangría de 3 espacios. Sin la sangría, el párrafo cortaría la lista en dos.

### 2.3. Una guía con enlaces, anclas e imagen

**Situación real:** la biblioteca del barrio prepara una guía para quien entra nuevo en su club de lectura. Son dos ficheros y un plano (las normas están en `normas.md`, que puedes ver en la carpeta del ejemplo):

```text
2.3-guia-con-enlaces/
├── guia.md
├── normas.md
└── img/
    └── plano.svg
```

`guia.md`:

```markdown
# Guía del club de lectura

Te damos la bienvenida al club de lectura de la biblioteca del barrio. Aquí tienes todo lo que necesitas para la primera reunión.

## Índice

- [Dónde nos reunimos](#dónde-nos-reunimos)
- [El libro de este mes](#el-libro-de-este-mes)
- [Normas del club](#normas-del-club)

## Dónde nos reunimos

En la sala 2 de la biblioteca, el primer jueves de cada mes, a las 19:00. Este es el plano de la planta baja:

![Plano de la planta baja: la sala 2 está a la derecha de la entrada, junto a los ascensores](img/plano.svg)

## El libro de este mes

*Marianela*, de Benito Pérez Galdós. Hay ejemplares para prestar: búscalo en el [catálogo de la biblioteca](https://www.ejemplo.com/catalogo).

## Normas del club

Son pocas y las tienes en [el fichero de normas](normas.md). La más importante es la de [los turnos de palabra](normas.md#turnos-de-palabra).

[Volver arriba](#guía-del-club-de-lectura)
```

📁 **Código:** [`codigo/02-markdown/ejemplos/2.3-guia-con-enlaces/`](codigo/02-markdown/ejemplos/2.3-guia-con-enlaces/)

**En qué fijarte:**

- **El índice** enlaza a los títulos del mismo fichero con sus anclas: minúsculas, guiones en lugar de espacios y **las tildes, tal cual** (`#dónde-nos-reunimos`).
- **«Volver arriba»** enlaza al título de nivel 1, que también tiene su ancla.
- **El enlace a las normas** es una ruta relativa: `normas.md` está en la misma carpeta que `guia.md`. Y el de los turnos de palabra combina **fichero y ancla**: `normas.md#turnos-de-palabra`.
- **La imagen** está en la subcarpeta `img`, y su texto alternativo dice lo que hay que saber del plano: dónde está la sala.
- **El catálogo** es un enlace a internet, con un texto que dice adónde lleva.

En la vista previa de VS Code, haz clic en cada enlace: todos tienen que llevarte a su sitio.

## 3. Errores típicos

### 3.1. El título que no es título

**Qué pasa:** escribes `#Ingredientes` y, en la vista previa, sale el texto normal, con la almohadilla delante.

**Por qué ocurre:** un título necesita **un espacio** entre las almohadillas y el texto ([apartado 1.4](#14-títulos)). Sin él, la línea es un párrafo cualquiera. (La descripción original de Markdown lo admitía sin espacio, y algunos programas antiguos aún lo hacen; CommonMark y GitHub, no.)

**Cómo se arregla:** `# Ingredientes`, con espacio.

### 3.2. La sublista que no se anida

**Qué pasa:** escribes una sublista y en la vista previa sale todo al mismo nivel:

```markdown
- Cocina
 - Platos
 - Sartenes
```

Se ve una lista de tres elementos: Cocina, Platos y Sartenes.

**Por qué ocurre:** la sublista tiene **un solo espacio** de sangría, y para colgar de `- Cocina` tiene que empezar en la columna del texto, es decir, con **dos** ([apartado 1.6](#16-listas)). Debajo de una lista numerada (`1. `) hacen falta **tres**.

**Cómo se arregla:** sangra la sublista hasta la columna donde empieza el texto del elemento de arriba. Si usas el tabulador, comprueba que tu editor lo convierte en espacios (VS Code lo hace).

### 3.3. Un enlace a un ancla que no existe

**Qué pasa:** haces clic en un enlace del índice y te deja donde estabas, o te lleva al principio del documento.

```markdown
# Manual del socio

- [Cómo hacerse socio](#como-hacerse-socio)
- [Cuotas](#cuotas)

## Cómo hacerse socio

Rellena la ficha en la recepción del club y trae una foto.

## Cuotas

La cuota es de 20 € al mes.
```

📁 **Código:** [`codigo/02-markdown/ejemplos/3.3-ancla-que-no-existe/`](codigo/02-markdown/ejemplos/3.3-ancla-que-no-existe/)

**Por qué ocurre:** el ancla está mal escrita. GitHub **conserva las tildes**, así que el ancla de «Cómo hacerse socio» es `#cómo-hacerse-socio`, y `#como-hacerse-socio` no lleva a ningún título. Los fallos más habituales: quitar las tildes, dejar puntos (`#1.2-clases`), dejar mayúsculas (el ancla generada va en minúsculas y muchos visores no la encuentran con mayúscula; alguno, como GitHub, puede perdonarlo, pero no hay que fiarse) o haber cambiado el título después de escribir el enlace ([apartado 1.9](#19-anclas-enlazar-a-un-título)).

**Cómo se arregla:** escribe el ancla con las reglas del apartado 1.9: `[Cómo hacerse socio](#cómo-hacerse-socio)`. Para no fallar, deja que VS Code te proponga los títulos al escribir `#` dentro del paréntesis, y activa `markdown.validate.enabled` para que te subraye los enlaces rotos ([apartado 1.17](#117-markdown-en-vs-code)).

### 3.4. Rutas que solo funcionan en tu ordenador

**Qué pasa:** los enlaces y las imágenes funcionan en tu VS Code, pero en GitHub, o en el ordenador de un compañero, salen rotos.

**Por qué ocurre:** casi siempre, una de estas tres:

- **Una ruta absoluta**: `C:\Users\ana\recetario\img\portada.png` o `/home/ana/recetario/img/portada.png`. Esa carpeta solo existe en tu ordenador.
- **Las mayúsculas**: el fichero se llama `portada.png` y escribiste `Portada.png`. Tu Windows o tu Mac no las distinguen; GitHub, sí ([02.02, apartado 1.12](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#112-mayúsculas-y-minúsculas)).
- **Espacios en el nombre**: `[Mis notas](mis notas.md)` no es un enlace, porque el destino no puede llevar espacios (habría que escribir `<mis notas.md>` o `mis%20notas.md`).

**Cómo se arregla:** **rutas relativas**, con `/`, y escritas letra a letra como se llama el fichero. Y nombres de fichero en minúsculas, sin espacios ni tildes, como ya haces desde [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#113-cómo-nombrar-ficheros-y-carpetas): así el problema no aparece.

### 3.5. Un bloque de código sin cerrar

**Qué pasa:** a partir de cierto punto, **todo el resto del documento** se ve como código: títulos, listas y párrafos, en letra de ancho fijo y sin formato.

```markdown
# Notas de la terminal

Para ver dónde estoy:

```bash
pwd

## Para crear una carpeta

Uso `mkdir`, seguido del nombre de la carpeta.
```

📁 **Código:** [`codigo/02-markdown/ejemplos/3.5-bloque-sin-cerrar/`](codigo/02-markdown/ejemplos/3.5-bloque-sin-cerrar/)

**Por qué ocurre:** falta la **valla de cierre** del bloque de `bash`. Markdown sigue buscándola y, como no la encuentra, el bloque llega hasta el final ([apartado 1.11](#111-código-en-línea-y-bloques-de-código)).

**Cómo se arregla:** cierra cada bloque nada más abrirlo, con tres comillas invertidas en una línea sola, y escribe después lo de dentro. En el editor se nota enseguida: el resaltado de todo lo que viene detrás cambia de color.

### 3.6. Una tabla con celdas de más o sin fila separadora

**Qué pasa:** la tabla no sale como tabla, o le **falta un dato** sin que nadie te avise:

```markdown
# Turnos de la piscina

| Día | Mañana | Tarde |
|---|---|---|
| Lunes | Raquel | Iván |
| Martes | Iván | Raquel | Sonia |
| Miércoles | Sonia | Raquel |
```

📁 **Código:** [`codigo/02-markdown/ejemplos/3.6-tabla-con-columnas-de-mas/`](codigo/02-markdown/ejemplos/3.6-tabla-con-columnas-de-mas/)

**Por qué ocurre:** la fila del martes tiene **cuatro celdas** y la cabecera, tres. GitHub dibuja la tabla con tres columnas y **tira la cuarta celda**: Sonia desaparece del martes, y nadie lo ve hasta que falta en la piscina ([apartado 1.13](#113-tablas)). El otro fallo típico es olvidar la **fila separadora** (`|---|---|---|`): entonces no hay tabla, sino un párrafo con barras.

**Cómo se arregla:** cuenta las celdas de cada fila: tienen que ser las mismas que en la cabecera. Si un dato no cabe en su celda (dos personas el martes por la tarde), júntalo en la misma: `| Martes | Iván | Raquel y Sonia |`. Y si el texto de una celda lleva una barra vertical, escápala (`\|`).

### 3.7. Asteriscos y guiones bajos que se comen el texto

**Qué pasa:** escribes `Cada parcela mide 2*3 metros y la cuota es de 5*12 euros al año.` y en la vista previa desaparecen los dos asteriscos, y todo lo que había entre ellos («3 metros y la cuota es de 5») sale en cursiva.

**Por qué ocurre:** dos asteriscos en la misma frase son, para Markdown, una cursiva ([apartado 1.5](#15-negrita-cursiva-y-tachado)). Lo mismo con un asterisco al principio de una línea seguido de un espacio, que empieza una lista.

**Cómo se arregla:** escapa los asteriscos con la barra invertida (`2\*3`, `5\*12`) o, si son una operación o un código, ponlos entre comillas invertidas (`` `2*3` ``) ([apartado 1.14](#114-escapar-caracteres)). Los guiones bajos dan menos problemas en mitad de una palabra (`notas_de_clase` sale bien), pero sí al principio y al final de una (`_borrador_` sale en cursiva).

## 4. Buenas prácticas

- **Línea en blanco** antes y después de cada título, lista, tabla, cita y bloque de código.
- **Un solo `#`** por documento, y los niveles **sin saltos**.
- **Asteriscos** para el énfasis, y **poca negrita**: solo lo importante.
- **Rutas relativas** y con `/` en todos los enlaces e imágenes de tu proyecto, escritas exactamente como se llaman los ficheros.
- **Textos de enlace que digan adónde llevan**; nunca «aquí».
- **Texto alternativo** en todas las imágenes, que diga lo que aporta la imagen.
- **Cada bloque de código, con su lenguaje** (`bash`, `json`, `text`…) y cerrado nada más abrirlo.
- **Tablas para comparar datos**, con los números alineados a la derecha y las mismas celdas en cada fila.
- **Primero Markdown, HTML solo cuando no llega.**
- **Vista previa al lado** mientras escribes, y `markdown.validate.enabled` activado para que te avise de los enlaces rotos.
- **Compruébalo donde se va a leer**: lo que va a GitHub, en GitHub.
- **Un README en cada proyecto**: qué es, cómo se usa y cómo se instala, escrito para alguien que no sabe nada de él.

## 5. Ejercicios prácticos resueltos

> **💡 Consejo:** escribe cada ejercicio en un fichero `.md` en tu VS Code, con la **vista previa al lado**, y compáralo con la solución **cuando la vista previa te convenza**. Las soluciones tienen su carpeta (el enlace «📁 Código»): puedes descargarla y comparar los dos ficheros.

### 🟢 Básico

#### Ejercicio 1 · Los apuntes de una excursión

El club de senderismo Los Pinos te pasa el aviso de la próxima excursión en texto sin formato. Escríbelo en Markdown en un fichero `excursion.md`:

```text
Excursión a La Pedriza
Club de senderismo Los Pinos, sábado, 21 de noviembre de 2026

Datos de la ruta
Salida: a las 8:00, desde la plaza del ayuntamiento
Distancia: 12 km
Dificultad: media

Qué llevar
Agua: al menos litro y medio
Comida
Botas de montaña
Chubasquero

Horario
8:00, salida en autobús.
9:15, empezamos a andar.
14:00, comida en el refugio.
18:00, vuelta al pueblo.

Si llueve, la excursión se aplaza al domingo.
```

Tiene que tener: un título para el documento y uno para cada sección; el nombre del club y la hora de salida en negrita; «litro y medio» en cursiva; los datos y lo que hay que llevar en listas sin orden; el horario en una lista numerada, y el aviso de la lluvia como cita.

<details>
<summary>Pista 1</summary>

Un `#` para el título del documento y `##` para las tres secciones. Cada elemento de lista, en su línea, con `- ` o `1. ` delante.

</details>

<details>
<summary>Pista 2</summary>

No olvides las líneas en blanco: antes y después de cada título y de cada lista. La cita es una línea que empieza por `> `.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se identifica qué es cada parte (título, sección, lista sin orden, pasos con orden, aviso) y se le pone su marca ([apartados 1.4](#14-títulos), [1.5](#15-negrita-cursiva-y-tachado), [1.6](#16-listas) y [1.12](#112-citas-y-separadores)).

```markdown
# Excursión a La Pedriza

Club de senderismo **Los Pinos** · sábado, 21 de noviembre de 2026

## Datos de la ruta

- Salida: a las **8:00**, desde la plaza del ayuntamiento
- Distancia: 12 km
- Dificultad: media

## Qué llevar

- Agua: al menos *litro y medio*
- Comida
- Botas de montaña
- Chubasquero

## Horario

1. 8:00, salida en autobús.
2. 9:15, empezamos a andar.
3. 14:00, comida en el refugio.
4. 18:00, vuelta al pueblo.

> Si llueve, la excursión se aplaza al domingo.
```

📁 **Código:** [`codigo/02-markdown/ejercicios/ej01-excursion/`](codigo/02-markdown/ejercicios/ej01-excursion/)

**Explicación:**

- **Un título de nivel 1** y tres de nivel 2: la estructura del aviso.
- **Los datos y lo que hay que llevar** no tienen un orden: lista con guiones. **El horario**, sí: lista numerada.
- **La línea del club** podría ir sin negrita; lo que pide el enunciado es destacar el nombre y, en los datos, la hora, que es lo que nadie puede olvidar.
- El separador `·` es un carácter normal, como cualquier otro: no es una marca de Markdown.

**Errores frecuentes al resolverlo:**

- Escribir los elementos de lista sin línea en blanco detrás del título: funciona, pero el fichero se lee peor.
- Poner el horario con guiones: se entiende, pero se pierde que es una secuencia.
- Escribir `#Horario`, sin espacio ([error típico 3.1](#31-el-título-que-no-es-título)).

</details>

### 🟡 Intermedio

#### Ejercicio 2 · Las actividades del polideportivo

El polideportivo municipal quiere publicar sus actividades. Escribe `actividades.md` con:

- El título «Actividades del polideportivo municipal».
- Una línea que diga «Temporada 2026-2027. Inscripciones abiertas hasta el 30 de noviembre.», con la fecha en negrita.
- Una tabla con estas columnas y datos: la actividad (a la izquierda), los días y la hora (centrados) y el precio al mes (a la derecha).

  | Actividad | Días | Hora | Precio al mes |
  |---|---|---|---|
  | Natación | Lunes y miércoles | 18:00 | 22,00 € |
  | Pilates | Martes y jueves | 10:00 | 18,50 € |
  | Baloncesto (8, 10 o 12 años) | Viernes | 17:30 | 15,00 € |
  | Zumba | Sábados | 11:00 | 12,00 € |

- En el baloncesto, las edades separadas con barras verticales: «8 | 10 | 12 años».
- Zumba con un asterisco detrás y, debajo de la tabla, la nota «\* Plazas limitadas.»
- Una sección «Para apuntarte» con una lista de tareas de tres pasos sin marcar: rellenar la ficha de inscripción, traer una foto de carné y pagar el primer mes en recepción.

<details>
<summary>Pista 1</summary>

La alineación va en la fila separadora: `:---`, `:---:` y `---:` ([apartado 1.13](#113-tablas)).

</details>

<details>
<summary>Pista 2</summary>

Dentro de una tabla, una barra vertical separa celdas. Para que sea texto, escápala. Y el asterisco del principio de la nota, al principio de la línea y seguido de un espacio, empezaría una lista ([apartado 1.14](#114-escapar-caracteres)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** la tabla compara datos con las mismas columnas; los precios, a la derecha. Los dos caracteres especiales (las barras de las edades y el asterisco de la nota) se escapan. Lo de apuntarse son pasos que cada persona va marcando: una lista de tareas.

```markdown
# Actividades del polideportivo municipal

Temporada 2026-2027. Inscripciones abiertas hasta el **30 de noviembre**.

| Actividad | Días | Hora | Precio al mes |
|:---|:---:|:---:|---:|
| Natación | Lunes y miércoles | 18:00 | 22,00 € |
| Pilates | Martes y jueves | 10:00 | 18,50 € |
| Baloncesto (8 \| 10 \| 12 años) | Viernes | 17:30 | 15,00 € |
| Zumba\* | Sábados | 11:00 | 12,00 € |

\* Plazas limitadas.

## Para apuntarte

- [ ] Rellena la ficha de inscripción
- [ ] Trae una foto de carné
- [ ] Paga el primer mes en recepción
```

📁 **Código:** [`codigo/02-markdown/ejercicios/ej02-actividades/`](codigo/02-markdown/ejercicios/ej02-actividades/)

**Explicación:**

- **Cuatro columnas en todas las filas**, también en la del baloncesto, gracias a las barras escapadas. Sin escapar, esa fila tendría seis celdas y GitHub tiraría dos: el precio y la hora del baloncesto desaparecerían.
- **`\*` en la nota**: sin la barra, `* Plazas limitadas.` sería una lista de un elemento. En `Zumba\*` el asterisco, solo y sin pareja, se vería igual sin la barra; con ella no hay duda de que no es una marca.
- **La lista de tareas** se verá con casillas en GitHub; en la vista previa de VS Code puede salir como una lista normal ([apartado 1.17](#117-markdown-en-vs-code)).

**Errores frecuentes al resolverlo:**

- Alinear el precio a la izquierda: los euros quedan desiguales y cuesta compararlos.
- Escribir la nota como `* Plazas limitadas.` sin escapar.
- Poner las tareas como `[ ] Rellena…`, sin el guion delante: no es una lista, y no salen casillas.

</details>

#### Ejercicio 3 · La documentación de la ludoteca

La ludoteca del barrio presta juegos de mesa y quiere documentar cómo hacerlo para sus voluntarios. Tiene esta estructura:

```text
ludoteca/
├── README.md
└── docs/
    ├── prestamos.md
    └── preguntas.md
```

`docs/preguntas.md` tiene dos preguntas, como títulos de nivel 2: «¿Cuántos juegos se puede llevar cada persona?» y «¿Qué pasa si falta una pieza?».

Escribe los tres ficheros, con estos enlaces:

1. En `README.md`, una sección «Documentación» con enlaces a `prestamos.md`, a `preguntas.md` y directamente a la pregunta de la pieza que falta.
2. En `docs/prestamos.md` (los pasos para prestar un juego, en una lista numerada), un enlace a la pregunta de la pieza que falta y otro para volver a la portada.
3. En `docs/preguntas.md`, enlaces para volver a la portada y a la página de los préstamos.

<details>
<summary>Pista 1</summary>

Cada ruta se cuenta **desde la carpeta del fichero que tiene el enlace**. `README.md` está arriba; los otros dos, en `docs`. Repasa la tabla del [apartado 1.8](#18-enlaces).

</details>

<details>
<summary>Pista 2</summary>

Para enlazar a un título de otro fichero, se juntan la ruta y el ancla: `fichero.md#ancla`.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** desde `README.md`, los otros dos están en la subcarpeta `docs`; desde los de `docs`, el otro está en la misma carpeta y la portada, una más arriba (`..`). El ancla de «¿Qué pasa si falta una pieza?» es `#qué-pasa-si-falta-una-pieza` ([apartado 1.9](#19-anclas-enlazar-a-un-título)).

`README.md`:

```markdown
# Ludoteca del barrio

Guía para las personas voluntarias de la ludoteca: cómo se prestan los juegos de mesa y qué hacer cuando algo no cuadra.

## Documentación

- [Cómo se presta un juego](docs/prestamos.md)
- [Preguntas frecuentes](docs/preguntas.md)
- [¿Qué pasa si falta una pieza?](docs/preguntas.md#qué-pasa-si-falta-una-pieza)
```

📁 **Código:** [`codigo/02-markdown/ejercicios/ej03-documentacion/`](codigo/02-markdown/ejercicios/ej03-documentacion/)

`docs/prestamos.md`:

```markdown
# Cómo se presta un juego

1. Apunta en la libreta el nombre del juego y el de quien se lo lleva.
2. Cuenta las piezas delante de esa persona.
3. El préstamo dura dos semanas.

Si al devolverlo falta algo, mira las [preguntas frecuentes](preguntas.md#qué-pasa-si-falta-una-pieza).

[Volver a la portada](../README.md)
```

📁 **Código:** [`codigo/02-markdown/ejercicios/ej03-documentacion/`](codigo/02-markdown/ejercicios/ej03-documentacion/)

`docs/preguntas.md`:

```markdown
# Preguntas frecuentes

## ¿Cuántos juegos se puede llevar cada persona?

Dos a la vez como máximo.

## ¿Qué pasa si falta una pieza?

Se apunta en la libreta y se avisa a Jorge, que pide las piezas de repuesto. El juego no se vuelve a prestar hasta que esté completo.

[Volver a la portada](../README.md) · [Cómo se presta un juego](prestamos.md)
```

📁 **Código:** [`codigo/02-markdown/ejercicios/ej03-documentacion/`](codigo/02-markdown/ejercicios/ej03-documentacion/)

**Explicación:**

| Enlace | Desde | Ruta | Por qué |
|---|---|---|---|
| A los préstamos | `README.md` | `docs/prestamos.md` | Bajar a la subcarpeta |
| A la pieza que falta | `README.md` | `docs/preguntas.md#qué-pasa-si-falta-una-pieza` | Ruta y ancla juntas |
| A la pieza que falta | `docs/prestamos.md` | `preguntas.md#qué-pasa-si-falta-una-pieza` | Misma carpeta: sin `docs/` |
| A la portada | `docs/…` | `../README.md` | Subir una carpeta |

Para comprobarlo, abre la carpeta `ludoteca` en VS Code, activa `markdown.validate.enabled` y mira que no se subraya ningún enlace; después, recórrelos todos desde la vista previa.

**Errores frecuentes al resolverlo:**

- Escribir `docs/preguntas.md` desde `docs/prestamos.md`: buscaría `docs/docs/preguntas.md`, que no existe. Es el mismo error de contar la ruta desde la carpeta equivocada que viste en [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#31-contar-la-ruta-relativa-desde-la-carpeta-equivocada).
- Usar `/README.md` para volver a la portada: GitHub (y VS Code) cuentan una ruta que empieza por `/` desde la carpeta principal del proyecto, pero otros programas la cuentan desde la raíz del disco, y ahí no hay ningún `README.md`. La relativa (`../README.md`) funciona en todas partes.
- Olvidar el `#` entre la ruta y el ancla.

</details>

### 🔴 Avanzado

#### Ejercicio 4 · Arregla el README del huerto

Rosa coordina el huerto comunitario de su calle y ha escrito este README. En la carpeta del proyecto están el `README.md` y la imagen `img/logo.svg`. Al publicarlo, casi nada sale bien. Encuentra **todos** los errores (son siete) y escribe el README corregido.

````markdown
#Huerto del barrio

Repositorio con la organización del huerto comunitario de la calle Olmo: quién riega cada día, qué se ha plantado y cómo apuntarse.

![](img/Logo.svg)

- [Cómo apuntarse](#Cómo-apuntarse)
- [Turnos de riego](#turnos-de-riego)

## Cómo apuntarse
Escribe a Rosa, que coordina el huerto. Cada parcela mide 2*3 metros y la cuota es de 5*12 euros al año.

## Turnos de riego

| Día | Mañana | Tarde |
|---|---|---|
| Lunes | Rosa | Manuel |
| Martes | Manuel | Rosa | Inés |
| Miércoles | Inés | Rosa |

## Cómo ver los turnos en la terminal

```bash
cat turnos.txt
````

📁 **Código:** [`codigo/02-markdown/ejercicios/ej04-readme-roto/`](codigo/02-markdown/ejercicios/ej04-readme-roto/)

<details>
<summary>Pista 1</summary>

Repasa los [errores típicos](#3-errores-típicos) uno a uno y busca cada uno en el README: casi todos están.

</details>

<details>
<summary>Pista 2</summary>

Dos de los errores están en la misma línea, la de la imagen. Y fíjate en el final del fichero: ¿qué le falta al último bloque?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se recorre el fichero de arriba abajo con la lista de errores típicos en la mano, y se comprueba cada enlace contra los ficheros y los títulos que existen.

| # | Dónde | Error | Arreglo |
|---|---|---|---|
| 1 | Título | `#Huerto…` sin espacio: no es un título ([3.1](#31-el-título-que-no-es-título)) | `# Huerto del barrio` |
| 2 | Imagen | Sin texto alternativo ([1.10](#110-imágenes-y-texto-alternativo)) | Describirla |
| 3 | Imagen | `img/Logo.svg`, pero el fichero es `img/logo.svg`: en GitHub no se ve ([3.4](#34-rutas-que-solo-funcionan-en-tu-ordenador)) | `img/logo.svg` |
| 4 | Índice | `#Cómo-apuntarse` con mayúscula: el ancla generada va en minúsculas, y muchos visores no la encuentran (alguno, como GitHub, puede perdonarlo, pero no hay que fiarse; [3.3](#33-un-enlace-a-un-ancla-que-no-existe)) | `#cómo-apuntarse` |
| 5 | Cómo apuntarse | `2*3 … 5*12`: los asteriscos se convierten en cursiva ([3.7](#37-asteriscos-y-guiones-bajos-que-se-comen-el-texto)) | `2\*3` y `5\*12` |
| 6 | Tabla | La fila del martes tiene cuatro celdas: Inés desaparece ([3.6](#36-una-tabla-con-celdas-de-más-o-sin-fila-separadora)) | `Rosa e Inés` en la misma celda |
| 7 | Final | El bloque de `bash` no se cierra ([3.5](#35-un-bloque-de-código-sin-cerrar)) | Tres comillas invertidas al final |

Además, falta la línea en blanco debajo de `## Cómo apuntarse`. No es un error (CommonMark lo entiende igual), pero sí una costumbre que conviene mantener.

````markdown
# Huerto del barrio

Repositorio con la organización del huerto comunitario de la calle Olmo: quién riega cada día, qué se ha plantado y cómo apuntarse.

![Logotipo del huerto: un árbol verde](img/logo.svg)

- [Cómo apuntarse](#cómo-apuntarse)
- [Turnos de riego](#turnos-de-riego)

## Cómo apuntarse

Escribe a Rosa, que coordina el huerto. Cada parcela mide 2\*3 metros y la cuota es de 5\*12 euros al año.

## Turnos de riego

| Día | Mañana | Tarde |
|---|---|---|
| Lunes | Rosa | Manuel |
| Martes | Manuel | Rosa e Inés |
| Miércoles | Inés | Rosa |

## Cómo ver los turnos en la terminal

```bash
cat turnos.txt
```
````

📁 **Código:** [`codigo/02-markdown/ejercicios/ej04-readme-arreglado/`](codigo/02-markdown/ejercicios/ej04-readme-arreglado/)

**Explicación:** fíjate en que **tres de los siete errores no saltan a la vista**: en Windows o macOS, `img/Logo.svg` encuentra la imagen y en tu ordenador se ve; el ancla con mayúscula no da ningún error y, según el visor, no lleva a su sitio, y la cuarta celda de la tabla desaparece sin avisar. Por eso conviene activar la comprobación de enlaces de VS Code y revisar el resultado en GitHub.

**Errores frecuentes al resolverlo:**

- Encontrar solo los errores que «se ven» en la vista previa (el título, la cursiva, el bloque) y no los de las rutas y las anclas.
- Arreglar la tabla añadiendo una cuarta columna a la cabecera solo para Inés: la tabla quedaría con una columna casi vacía.
- Poner un texto alternativo como `logo`: dice muy poco.

</details>

### 🏆 Caso real

#### Ejercicio 5 · El README de las reservas de pádel

Nerea y dos amigos han hecho una aplicación web para reservar las pistas de su club de pádel, Las Encinas, y van a publicarla en GitHub. Te piden el README. En la carpeta del proyecto tienen `CONTRIBUTING.md`, `LICENSE` (la licencia MIT) y una captura de la pantalla de reservas en `img/captura.svg`, donde se ve el calendario de la semana con las horas libres de cada pista en verde.

Lo que tiene que contar:

- **Qué es**: una aplicación web para reservar las pistas desde el móvil, sin llamar por teléfono.
- **Qué hace**: muestra las horas libres de las cuatro pistas; deja reservar y cancelar hasta 24 horas antes; manda un recordatorio por correo el día anterior. Y cómo son las pistas: la 1 y la 2 son de cristal y tienen luz; la 3 y la 4, de muro y sin luz.
- **Instalación**: descargar el repositorio con `git clone https://github.com/ejemplo/reservas-padel.git`, entrar en su carpeta con `cd reservas-padel` y abrir `index.html` en el navegador. (La orden `git clone` la verás en [05.03 GitHub](../fase-05-git-y-github/03-github.md); aquí solo tienes que escribirla.)
- **Estado**: ya funcionan ver las horas libres y reservar y cancelar; faltan el recordatorio por correo y pagar la pista desde la aplicación.
- **Cómo colaborar**: leer la guía para colaborar; las dudas, a `nerea@ejemplo.com`.
- **Licencia**: MIT, con enlace al fichero.

Escríbelo con todo lo que has aprendido: la captura con su texto alternativo, un índice con anclas, la tabla de las pistas, las órdenes en un bloque de código y el estado como lista de tareas.

<details>
<summary>Pista 1</summary>

Empieza por la estructura: un `#` con el nombre, una frase debajo, la captura y un `##` por cada punto de la lista. Después, el índice, cuando ya sepas los títulos.

</details>

<details>
<summary>Pista 2</summary>

La instalación son pasos con orden (lista numerada), y las dos órdenes van juntas en un bloque `bash` **dentro** del primer paso: sangrado con 3 espacios ([apartado 1.11](#111-código-en-línea-y-bloques-de-código)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se sigue el orden de un buen README ([apartado 1.16](#116-el-fichero-readme)): qué es, qué hace, cómo se instala, en qué punto está, cómo colaborar y la licencia. Cada dato va con la marca que mejor lo cuenta: lista para las funciones, tabla para comparar las pistas, lista numerada con un bloque para la instalación, lista de tareas para el estado.

````markdown
# Reservas del club de pádel

Aplicación web para reservar las pistas del club de pádel Las Encinas desde el móvil, sin llamar por teléfono.

![Pantalla de reservas: un calendario de la semana con las horas libres de cada pista en verde](img/captura.svg)

## Índice

- [Qué hace](#qué-hace)
- [Instalación](#instalación)
- [Estado del proyecto](#estado-del-proyecto)
- [Cómo colaborar](#cómo-colaborar)
- [Licencia](#licencia)

## Qué hace

- Muestra las horas libres de las **cuatro pistas**.
- Deja reservar una hora y cancelarla hasta **24 horas antes**.
- Manda un recordatorio por correo el día anterior.

| Pista | Tipo | Luz |
|---|---|:---:|
| 1 y 2 | Cristal | Sí |
| 3 y 4 | Muro | No |

## Instalación

1. Descarga el repositorio y entra en su carpeta:

   ```bash
   git clone https://github.com/ejemplo/reservas-padel.git
   cd reservas-padel
   ```

2. Abre `index.html` en el navegador.

## Estado del proyecto

- [x] Ver las horas libres
- [x] Reservar y cancelar
- [ ] Recordatorio por correo
- [ ] Pagar la pista desde la aplicación

## Cómo colaborar

Lee antes la [guía para colaborar](CONTRIBUTING.md). Las dudas, a Nerea: `nerea@ejemplo.com`.

## Licencia

Código con licencia MIT: los detalles, en [LICENSE](LICENSE).
````

📁 **Código:** [`codigo/02-markdown/ejercicios/ej05-readme-del-proyecto/`](codigo/02-markdown/ejercicios/ej05-readme-del-proyecto/)

**Explicación:**

- **La frase de debajo del título** responde a «¿qué es esto?» antes de nada. La captura, justo después, lo enseña.
- **El índice** usa las anclas de GitHub; la de «Instalación» conserva la tilde (`#instalación`).
- **La tabla** compara las pistas; la columna de la luz va centrada porque es un sí o un no.
- **El bloque de código** está dentro del paso 1, sangrado con 3 espacios, y con su lenguaje: GitHub le pondrá colores y un botón para copiarlo.
- **El correo** va en código en línea, para que se copie tal cual. Si lo escribieras sin las comillas invertidas, GitHub lo convertiría en un enlace (es otro de sus autoenlaces).
- **Los enlaces a `CONTRIBUTING.md` y `LICENSE`** son rutas relativas a ficheros de la misma carpeta.

No hay un único README bueno: si el tuyo tiene las mismas partes, en un orden parecido, con las marcas bien puestas y los enlaces funcionando, está bien. Compruébalo con la vista previa y con `markdown.validate.enabled`.

**Errores frecuentes al resolverlo:**

- Sangrar el bloque de código con 2 espacios en lugar de 3: el bloque se sale de la lista, que queda partida en dos.
- Escribir el índice antes de tener los títulos definitivos, y cambiarlos después: los enlaces se rompen.
- Poner la captura sin texto alternativo, o con `captura`.
- Enlazar la licencia con la ruta absoluta de tu ordenador.

</details>

## 6. Chuleta

### Lo básico

| Para | Escribes |
|---|---|
| Título de nivel 1, 2, 3… | `# Título`, `## Sección`, `### Apartado` (con espacio) |
| Párrafo nuevo | Una línea en blanco |
| Salto de línea dentro del párrafo | `\` al final de la línea |
| Cursiva | `*cursiva*` |
| Negrita | `**negrita**` |
| Tachado (GFM) | `~~tachado~~` |
| Lista sin orden | `- elemento` |
| Lista numerada | `1. paso` |
| Sublista | Sangrada hasta el texto de arriba: 2 espacios bajo `- `, 3 bajo `1. ` |
| Lista de tareas (GFM) | `- [ ] pendiente` y `- [x] hecha` |
| Cita | `> texto` |
| Línea horizontal | `---`, con una línea en blanco encima |

### Enlaces, imágenes y código

| Para | Escribes |
|---|---|
| Enlace | `[texto que dice adónde](https://www.ejemplo.com)` |
| Enlace a otro fichero | `[texto](docs/guia.md)` o `[texto](../README.md)` |
| Enlace a un título | `[texto](#título-en-minúsculas)` o `[texto](guia.md#ancla)` |
| Imagen | `![lo que aporta la imagen](img/foto.png)` |
| Código en línea | `` `pwd` `` |
| Escapar una marca | `\*`, `\#`, `\_` (y la barra vertical de una tabla, con una barra invertida delante) |

### Cómo genera GitHub un ancla

1. Quita el formato.
2. Todo a minúsculas.
3. Quita la puntuación, menos `-` y `_` (las tildes se quedan).
4. Cada espacio, un guion.
5. Repetidos: `-1`, `-2`…

`## 1.2. ¿Cómo me apunto?` → `#12-cómo-me-apunto`

### En VS Code

| Para | Windows y Linux | macOS |
|---|---|---|
| Vista previa | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd> |
| Vista previa al lado | <kbd>Ctrl</kbd>+<kbd>K</kbd> y <kbd>V</kbd> | <kbd>Cmd</kbd>+<kbd>K</kbd> y <kbd>V</kbd> |
| Saltar a un título | <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>O</kbd> | <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>O</kbd> |
| Avisos de enlaces rotos | Ajuste `markdown.validate.enabled` | Igual |

### Un README tiene

Título · qué hace y por qué es útil (una o dos frases) · captura · índice · cómo empezar (instalación y uso) · estado · dónde pedir ayuda · quién lo mantiene y cómo colaborar · licencia.

## 7. Preguntas de repaso

1. ¿Qué es un lenguaje de marcas ligero? ¿Por qué Markdown lo es?

   <details>
   <summary>Ver respuesta</summary>

   Un lenguaje de marcas es texto con marcas que dicen qué es cada parte (un título, una lista, un enlace) para que un programa decida cómo mostrarlo. Markdown es ligero porque sus marcas son pocas y discretas (`#`, `*`, `-`), y el fichero se lee bien aunque nadie lo dibuje, al contrario que HTML. Lo tienes en [1.1. Qué es Markdown](#11-qué-es-markdown).

   </details>

2. ¿Qué diferencia hay entre CommonMark y GitHub Flavored Markdown? Di dos cosas que tiene GFM y CommonMark no.

   <details>
   <summary>Ver respuesta</summary>

   CommonMark es la especificación de base, que dice con detalle cómo se interpreta cada caso de Markdown. GFM es CommonMark más cinco extensiones de GitHub: tablas, listas de tareas, tachado, autoenlaces y el filtro de HTML peligroso. Lo tienes en [1.2. Un estándar y varios sabores: CommonMark y GFM](#12-un-estándar-y-varios-sabores-commonmark-y-gfm).

   </details>

3. ¿Qué ancla genera GitHub para el título `## 2.1. ¿Dónde está la sede?`? Explica los pasos.

   <details>
   <summary>Ver respuesta</summary>

   `#21-dónde-está-la-sede`: se pasa a minúsculas, se quitan los puntos y los signos de interrogación (las tildes se quedan) y los espacios se cambian por guiones. Lo tienes en [1.9. Anclas: enlazar a un título](#19-anclas-enlazar-a-un-título).

   </details>

4. ¿Desde dónde se cuenta la ruta relativa de un enlace en Markdown? ¿Por qué no conviene una ruta absoluta?

   <details>
   <summary>Ver respuesta</summary>

   Desde la carpeta donde está el fichero `.md` que tiene el enlace. Una ruta absoluta (`C:\Users\ana\…`) solo existe en tu ordenador: en GitHub o en el de otra persona, el enlace se rompe. Lo tienes en [1.8. Enlaces](#18-enlaces).

   </details>

5. ¿Para qué sirve el texto alternativo de una imagen? ¿Qué hace que sea bueno?

   <details>
   <summary>Ver respuesta</summary>

   Para quien no puede ver la imagen (un lector de pantalla lo lee en voz alta), para cuando la imagen no carga y para quien lee el fichero sin dibujar. Es bueno si dice en una frase corta lo que la imagen aporta, no solo qué es ni su nombre de fichero. Lo tienes en [1.10. Imágenes y texto alternativo](#110-imágenes-y-texto-alternativo).

   </details>

6. ¿Cuándo usarías HTML dentro de un fichero Markdown? Pon dos ejemplos.

   <details>
   <summary>Ver respuesta</summary>

   Solo para lo que Markdown no sabe hacer: un bloque plegado con `<details>` y `<summary>`, una tecla con `<kbd>`, un salto de línea dentro de una celda con `<br>`. Teniendo en cuenta que cada sitio quita el HTML que considera peligroso. Lo tienes en [1.15. Un poco de HTML](#115-un-poco-de-html).

   </details>

7. ¿Qué es un README y qué debería contar?

   <details>
   <summary>Ver respuesta</summary>

   El fichero que presenta un proyecto, normalmente `README.md` en su carpeta principal; GitHub lo muestra en la portada del repositorio. Debería contar qué hace el proyecto, por qué es útil, cómo empezar a usarlo, dónde pedir ayuda y quién lo mantiene, y suele añadir una captura, el estado y la licencia. Lo tienes en [1.16. El fichero README](#116-el-fichero-readme).

   </details>

8. ¿Cómo haces que VS Code te avise de los enlaces rotos de tus ficheros Markdown? ¿Comprueba los enlaces a internet?

   <details>
   <summary>Ver respuesta</summary>

   Activando el ajuste `markdown.validate.enabled`, que viene apagado. Comprueba los enlaces a ficheros, imágenes y títulos de tu proyecto, pero no los de internet. Lo tienes en [1.17. Markdown en VS Code](#117-markdown-en-vs-code).

   </details>

---
⬅️ [Anterior: Texto, binario y codificación](01-texto-binario-y-codificacion.md) · 📚 [Índice](../00-indice.md) · ➡️ [Siguiente: JSON y YAML](03-json-y-yaml.md)
