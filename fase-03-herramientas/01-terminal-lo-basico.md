# 03.01 La terminal: lo básico

> **Versiones:** bash 5.3, verificada el 8 de noviembre de 2026 (las órdenes del módulo funcionan igual en el zsh de macOS; las diferencias se avisan)
> **Conviene saber antes:** [02.02 Archivos, carpetas y rutas](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md) · [02.03 Instalar programas, variables de entorno y PATH](../fase-02-tu-ordenador/03-instalar-programas-y-path.md)
> **Tiempo estimado:** 3 horas
> **Nivel:** Básico · Núcleo

## Qué aprenderás

- Por qué quien programa usa la terminal a diario y cómo se escribe una orden: **nombre, opciones y argumentos**.
- A saber **dónde estás** (`pwd`) y **qué hay** en una carpeta (`ls`, con `-l`, `-a` y `-h`).
- A **moverte** por las carpetas con `cd`, usando rutas absolutas y relativas, `..`, `~` y `cd -`.
- A **crear** carpetas y ficheros (`mkdir`, `mkdir -p`, `touch`), **copiarlos** (`cp`, `cp -r`), **moverlos y renombrarlos** (`mv`) y **borrarlos** (`rm`, `rm -r`, `rmdir`), sabiendo que en la terminal **no hay papelera**.
- A **ver** lo que hay dentro de un fichero (`cat`, `less`, `head`, `tail`) y a **buscar** un texto dentro de los ficheros (`grep`) o un fichero dentro de las carpetas (`find`).
- A **pedir ayuda** a la propia terminal (`--help` y `man`).
- Los trucos que ahorran tiempo y disgustos: el **tabulador**, el **historial**, <kbd>Ctrl</kbd>+<kbd>C</kbd>, los **comodines** `*` y `?` y las **comillas** para los nombres con espacios.
- A **reconocer** las órdenes equivalentes de PowerShell, por si te las encuentras en un tutorial.

Al terminar, podrás hacer desde la terminal lo que hasta ahora hacías con el explorador de archivos, y algunas cosas que con el ratón serían mucho más lentas.

## 1. Teoría

### 1.1. Por qué la terminal

En el módulo [Instalar programas, variables de entorno y PATH](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#16-instalar-git-en-windows-git-for-windows-y-git-bash) viste qué es una **terminal**: una ventana en la que escribes **órdenes** y el ordenador te contesta con texto. Allí la [abriste por primera vez](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#21-abrir-la-terminal-por-primera-vez) y escribiste tres órdenes para comprobar lo instalado. Ahora vas a aprender a **trabajar** con ella.

Si ya sabes manejar carpetas y ficheros con el ratón, ¿para qué aprender a hacerlo escribiendo? Por cinco razones que vas a notar desde el primer día:

- **Muchas herramientas de programación solo funcionan así**, o funcionan mucho mejor: Git, los gestores de paquetes, los que ejecutan tus programas, los que los prueban… Casi todos los cursos de esta academia te pedirán, en algún momento, «abre la terminal y escribe…».
- **Los servidores no tienen ventanas.** Las aplicaciones y las webs se publican en ordenadores (casi siempre con Linux) que no tienen pantalla ni ratón: se manejan escribiendo órdenes, desde lejos. Las órdenes que aprendes aquí son exactamente esas.
- **Es preciso y se puede repetir.** Una orden hace siempre lo mismo. Puedes copiarla en una guía, mandársela a un compañero o guardarla para la próxima vez, y hará exactamente lo mismo en su ordenador. Con el ratón, tendrías que describir dónde hacer clic.
- **Es rápido para el trabajo repetitivo.** Mover los 200 ficheros que terminan en `.pdf` a otra carpeta es una sola orden ([apartado 1.14](#114-comodines-y-comillas)). Con el ratón, un buen rato de seleccionar con cuidado.
- **Se puede automatizar.** Las órdenes se pueden guardar en un fichero para repetir todo el trabajo de una vez: es lo que se llama un *script*, y lo verás en [«La terminal: sacarle partido»](02-terminal-sacarle-partido.md#114-tu-primer-script), el módulo siguiente.

> **📌 Nota:** recuerda que este curso usa **bash** en los tres sistemas: en Windows, con **Git Bash**; en Linux, con la terminal del sistema; y en macOS, con la Terminal, que usa **zsh**, casi idéntico para todo lo de este módulo ([02.03, apartado 1.7](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#17-instalar-git-en-macos)). Cuando algo cambie de un sistema a otro, el módulo te lo dirá.

### 1.2. Cómo se escribe una orden

Todas las órdenes de la terminal tienen la misma forma: **el nombre de la orden**, y después, si hacen falta, **opciones** y **argumentos**, separados por **espacios**:

```text
ls  -l  web-panaderia
│   │   └── argumento: sobre qué trabaja la orden (aquí, una carpeta)
│   └────── opción: cómo trabaja (aquí, «con detalles»)
└────────── nombre de la orden: qué programa se ejecuta
```

- **El nombre** dice qué programa se ejecuta. Es el que el sistema busca en las carpetas del [PATH](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#110-el-path-dónde-busca-el-sistema-los-programas), como viste en el módulo anterior.
- Una **opción** cambia **cómo** trabaja la orden. Empieza por un guion: `-l`, `-a`. Muchas tienen también una forma larga, con dos guiones y una palabra en inglés: `--help`, `--version`. Las opciones cortas se pueden **juntar**: `ls -l -a -h` es lo mismo que `ls -lah`.
- Un **argumento** dice **sobre qué** trabaja la orden: un fichero, una carpeta, un texto. Algunas órdenes aceptan varios (`mkdir css img js` crea tres carpetas) y otras ninguno (`pwd`).

Tres reglas que se cumplen siempre:

1. **El espacio separa.** Para la terminal, cada espacio separa una pieza de la siguiente. Por eso `mkdir mis apuntes` crea **dos** carpetas, `mis` y `apuntes`. Si un nombre tiene espacios, va **entre comillas**: `mkdir "mis apuntes"` ([apartado 1.14](#114-comodines-y-comillas)).
2. **Las mayúsculas cuentan.** En Linux, `ls` no es `LS` (esa orden no existe). En macOS y en Windows puede que `LS` funcione, porque allí los nombres de los ficheros normalmente no distinguen mayúsculas, pero no cuentes con ello. Y en las opciones cuentan siempre: `-l` no es `-L` (que existe y hace otra cosa). Las órdenes y casi todas las opciones van en minúsculas.
3. **La terminal no adivina.** Como el ordenador de la [fase 1](../fase-01-que-es-programar/01-que-es-programar.md#11-un-ordenador-es-muy-rápido-y-muy-obediente), hace exactamente lo que escribes. Si escribes mal el nombre, te dirá que la orden no existe; si escribes mal una opción, es la orden la que se queja.

Los nombres de las órdenes parecen crípticos, pero casi todos son abreviaturas del inglés. Saberlo ayuda a recordarlas: `ls` es *list* (listar), `cd` es *change directory* (cambiar de carpeta), `mkdir` es *make directory* (crear una carpeta), `cp` es *copy*, `mv` es *move*, `rm` es *remove* (quitar).

> **📌 Nota:** en inglés, y en mucha documentación, verás «directorio» (*directory*) en lugar de «carpeta». Son lo mismo.

### 1.3. Dónde estás: el indicador y la carpeta actual

Cuando abres la terminal, el **indicador** ([02.03, apartado 2.1](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#21-abrir-la-terminal-por-primera-vez)) te espera con algo como `ana@portatil:~$`. Ese `~` del final no es decoración: es la carpeta en la que **estás**, la **carpeta actual**.

Ya conoces la [carpeta actual](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#19-la-carpeta-actual-y-las-rutas-relativas): la carpeta desde la que se cuentan las rutas relativas de un programa en marcha. La terminal es un programa en marcha, así que también tiene la suya, y es la que manda en todo lo que escribas:

- Si escribes un nombre de fichero sin ruta (`cat notas.txt`), la terminal lo busca **en la carpeta actual**.
- Si escribes una ruta relativa (`cat datos/notas.txt`), se cuenta **desde la carpeta actual**.
- Una terminal nueva, abierta desde el menú del sistema, empieza en tu **carpeta personal** (`~`), y ahí sigue hasta que te muevas. (Si la abres de otra forma, puede empezar en otra: la terminal del editor de código, en la carpeta que tengas abierta en él; Git Bash, con «Git Bash Here» del menú del clic derecho, en la carpeta donde hiciste clic. Por eso, ante la duda, `pwd`.)

Piensa en la terminal como en una persona que recorre el árbol de carpetas: siempre está **en una** carpeta, y todo lo que le pides lo hace desde allí, salvo que le des una ruta absoluta.

Para saber exactamente dónde estás, la orden es **`pwd`** (*print working directory*, «escribe la carpeta de trabajo»). Contesta con la **ruta absoluta** de la carpeta actual:

```text
$ pwd
/home/alumno
```

Recuerda que el `$` no se escribe ([02.03, apartado 2.1](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#21-abrir-la-terminal-por-primera-vez)), y que las salidas del curso salen de una terminal concreta: en la tuya, la ruta será la de tu carpeta personal, como explica el [aviso sobre las salidas](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal). En Git Bash verás algo como `/c/Users/ana`, y en macOS, `/Users/ana`.

El indicador también te enseña la carpeta actual, pero **abreviada**: solo muestra la última parte, o la ruta con `~` en lugar de tu carpeta personal. `pwd` te da la ruta completa, sin abreviar. Úsala siempre que dudes.

> **💡 Consejo:** la mayoría de los problemas de principiante en la terminal («no encuentra mi fichero», «se ha creado en otro sitio») se deben a no estar donde creías. Ante la duda, `pwd`.

### 1.4. Qué hay aquí: ls

**`ls`** (*list*) escribe lo que hay en una carpeta. Sin argumentos, lista la carpeta actual; con una ruta, lista esa carpeta:

```text
ls                  lo que hay en la carpeta actual
ls web-panaderia    lo que hay en la carpeta web-panaderia (ruta relativa)
ls /home/ana        lo que hay en /home/ana (ruta absoluta)
```

Sus tres opciones más útiles:

| Opción | Viene de | Qué hace |
|---|---|---|
| `-l` | *long* | Lista **larga**: una línea por elemento, con detalles (tamaño, fecha, si es carpeta…) |
| `-a` | *all* | Muestra **todo**, también los [ficheros ocultos](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#115-ficheros-ocultos) (los que empiezan por punto) |
| `-h` | *human* | Con `-l`, escribe los tamaños de forma **legible**: `49K` en lugar de `49669` |

Se combinan como quieras: `ls -lh`, `ls -la`, `ls -lah`.

**Cómo se lee `ls -l`.** Cada línea es un fichero o una carpeta. Por ejemplo:

```text
-rw-r--r-- 1 alumno alumno  360 ene 15  2026 index.html
drwxr-xr-x 2 alumno alumno 4096 ene 15  2026 css
```

Por ahora, fíjate solo en cuatro cosas:

| Parte | En el ejemplo | Qué es |
|---|---|---|
| **El primer carácter** | `-` y `d` | `d` es una carpeta (*directory*); `-`, un fichero normal. Es la forma más rápida de distinguirlos |
| **El tamaño** | `360`, `4096` | Lo que ocupa, en bytes (con `-h`, en K, M o G). El de una carpeta no es lo que ocupa su contenido, sino su «índice»: en Linux suele ser 4096; en otros sistemas, otro número |
| **La fecha** | `ene 15  2026` | Cuándo se modificó por última vez. Si es de hace más de seis meses, sale el año; si es reciente, la hora |
| **El nombre** | `index.html`, `css` | Al final de la línea |

El resto (`rw-r--r--`, el `1`, los dos `alumno`) son los **permisos**, el número de enlaces y el dueño del fichero: los verás en [«La terminal: sacarle partido»](02-terminal-sacarle-partido.md#110-permisos-quién-puede-leer-escribir-y-ejecutar).

> **📌 Nota:** el texto de los mensajes y el formato de las fechas cambian de un sistema a otro: en macOS y en Git Bash, por ejemplo, muchos mensajes salen en inglés, y alguno puede salir con una parte en inglés aunque el sistema esté en español (como el de `mkdir` del [ejemplo 2.3](#23-crear-la-estructura-de-un-proyecto)). Fíjate en **lo que dicen**, no en las palabras exactas. Vale para todos los módulos de la fase.

**Los ficheros ocultos y las carpetas `.` y `..`.** Con `-a` aparecen los ficheros cuyo nombre empieza por punto, como `.gitignore` o `.bashrc`, y siempre dos más: `.` y `..`. Son las [carpetas especiales](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#110-las-carpetas-especiales-punto-y-punto-punto) «esta carpeta» y «la carpeta padre», que existen dentro de todas las carpetas. Ahí las tienes, de verdad.

**Lo que cambia en tu sistema:**

- **Colores.** En Linux (Ubuntu y muchas otras) y en Git Bash, `ls` pinta las carpetas de un color (normalmente azul) y los ficheros de otro. En macOS no hay colores salvo que lo configures. Las salidas del curso salen sin colores. Son una ayuda, no cambian nada.
- **Git Bash añade una marca.** En Git Bash, `ls` está configurado para escribir una `/` detrás de cada carpeta (`css/`) y un `*` detrás de los programas. No forman parte del nombre: son una pista para que distingas las carpetas a simple vista.
- **El orden.** Todos ordenan por nombre, pero no exactamente igual: según el sistema, las mayúsculas van antes que las minúsculas o se mezclan con ellas. Otra razón para usar nombres en minúsculas ([02.02, apartado 1.13](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#113-cómo-nombrar-ficheros-y-carpetas)).

### 1.5. Moverse: cd

**`cd`** (*change directory*) cambia la carpeta actual. Le das una ruta, y te lleva allí. No escribe nada si todo va bien: la respuesta es el silencio, y el indicador, que cambia para mostrar la nueva carpeta.

Todo lo que aprendiste de rutas en [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#17-qué-es-una-ruta) sirve aquí tal cual:

| Orden | A dónde te lleva |
|---|---|
| `cd web-panaderia` | A la carpeta `web-panaderia` que hay **dentro de la actual** (ruta relativa) |
| `cd web-panaderia/css` | Dos niveles hacia abajo de una vez |
| `cd ..` | A la **carpeta padre**: un nivel hacia arriba |
| `cd ../img` | Sube un nivel y entra en `img`: a una carpeta «hermana» |
| `cd ../..` | Dos niveles hacia arriba |
| `cd /home/ana/proyectos` | A esa carpeta, estés donde estés ([ruta absoluta](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#18-rutas-absolutas)) |
| `cd ~/proyectos` | A `proyectos`, dentro de tu carpeta personal, estés donde estés |
| `cd ~` o solo `cd` | A tu **carpeta personal** |
| `cd -` | A la carpeta en la que estabas **antes** (y escribe cuál es) |

Fíjate en dos detalles:

- **`cd` sin nada te lleva a casa.** Si te pierdes, escribe `cd` y estarás en tu carpeta personal, como al abrir la terminal.
- **`cd -` es el «volver» de la terminal**, como el botón de atrás del explorador, pero solo recuerda **una** carpeta: si lo repites, vas y vuelves entre las dos últimas. Es muy útil cuando trabajas en dos carpetas alejadas.

`cd` solo entra en **carpetas**. Si le das un fichero, o una carpeta que no existe, se queja:

```text
bash: cd: nada: No existe el archivo o el directorio
```

Como en cualquier mensaje de error, lo primero es leerlo: repite lo que has escrito (`nada`) y dice qué pasa. En inglés (lo normal en Git Bash y macOS) verás `No such file or directory`, que significa lo mismo.

> **💡 Consejo:** la forma más rápida de escribir una ruta larga sin errores es **arrastrar** la carpeta o el fichero desde el explorador de archivos hasta la ventana de la terminal: se escribe su ruta completa, con las comillas que hagan falta. Funciona en la Terminal de macOS, en la de Linux y en Git Bash (que la escribe al estilo de Git Bash, `/c/Users/…`). Escribe `cd ` (con el espacio), arrastra la carpeta y pulsa <kbd>Intro</kbd>.

**Y al revés: abrir en el explorador la carpeta en la que estás.** A veces quieres ver con el ratón lo que estás haciendo con la terminal. Cada sistema tiene su orden para abrir una carpeta en el explorador de archivos; recuerda que `.` es «esta carpeta»:

| Sistema | Abre la carpeta actual en el explorador |
|---|---|
| Windows (Git Bash) | `explorer .` |
| macOS | `open .` |
| Linux | `xdg-open .` |

### 1.6. Crear carpetas y ficheros: mkdir y touch

**`mkdir`** (*make directory*) crea carpetas. Puedes darle una o varias:

```text
mkdir recetas-app                 crea una carpeta
mkdir css img js                  crea tres carpetas a la vez
```

Pero `mkdir` solo crea **el último nivel** de la ruta. Si le pides `mkdir src/pantallas` y `src` no existe, falla. Para eso está la opción **`-p`** (*parents*, «padres»): crea **todas las carpetas que falten** en el camino, y si alguna ya existe, no se queja.

```text
mkdir -p src/pantallas            crea src (si no existe) y, dentro, pantallas
```

> **💡 Consejo:** `mkdir -p` es la forma más cómoda de crear de golpe la estructura de carpetas de un proyecto, y es seguro repetirlo: no estropea nada de lo que ya existe.

**`touch`** sirve para dos cosas:

- Si el fichero **no existe**, lo crea **vacío**. Es la forma rápida de crear ficheros que vas a rellenar después con el editor: `touch README.md index.html`.
- Si el fichero **ya existe**, no toca su contenido: solo le pone la fecha de **ahora**, como si lo acabaras de modificar.

Para crear un fichero **con texto dentro** desde la terminal hace falta otra herramienta, la **redirección**, que verás en el [módulo siguiente](02-terminal-sacarle-partido.md#12-mandar-la-salida-a-un-fichero--y-). Por ahora, crea los ficheros vacíos con `touch` y escríbelos con tu editor de código.

### 1.7. Copiar, mover y renombrar: cp y mv

**`cp`** (*copy*) copia. Se escribe **primero lo que copias** (el origen) y **después adónde** (el destino):

| Orden | Qué hace |
|---|---|
| `cp informe.txt informe-copia.txt` | Copia el fichero con otro nombre, en la misma carpeta |
| `cp informe.txt copias` | Si `copias` es una carpeta, deja dentro una copia con el mismo nombre, `copias/informe.txt` |
| `cp informe.txt notas.txt copias` | Varios orígenes: el último argumento es la carpeta de destino |
| `cp ../plantilla.html .` | Trae a la carpeta actual (`.`) una copia de un fichero de la carpeta padre |
| `cp -r facturas facturas-copia` | Copia una **carpeta entera**, con todo lo que tiene dentro |

Para copiar una carpeta hace falta **`-r`** (*recursive*, «recursivo»: entra en la carpeta, en las carpetas de dentro, y así hasta el final). Sin ella, `cp` se niega a copiar carpetas.

**`mv`** (*move*) mueve. Se escribe igual que `cp`, origen y destino, pero el original **desaparece** de donde estaba. Y como «mover un fichero a la misma carpeta con otro nombre» es cambiarle el nombre, **`mv` también sirve para renombrar**:

| Orden | Qué hace |
|---|---|
| `mv borrador.txt presupuesto.txt` | **Renombra** el fichero (se queda en la misma carpeta) |
| `mv presupuesto.txt clientes` | Si `clientes` es una carpeta, **mueve** el fichero dentro |
| `mv factura-enero.pdf factura-febrero.pdf facturas` | Mueve varios ficheros a la carpeta `facturas` |
| `mv fotos imagenes` | Renombra la carpeta `fotos` (con `mv` no hace falta `-r`) |

> **⚠️ Cuidado:** si el destino es un fichero que **ya existe**, `cp` y `mv` **lo sustituyen sin preguntar**, y el contenido anterior se pierde. Lo verás en el [error típico 3.4](#34-sobrescribir-un-fichero-sin-darte-cuenta). Si quieres que pregunten antes, añade la opción **`-i`** (*interactive*): `cp -i`, `mv -i`. Te preguntarán si quieres sustituirlo, y tendrás que contestar sí o no.

¿Cómo sabe `cp` o `mv` si el destino es un nombre nuevo o una carpeta? Mira si existe una carpeta con ese nombre: si existe, deja el fichero dentro; si no, usa ese nombre. Por eso, antes de copiar o mover, conviene saber qué hay (`ls`).

### 1.8. Borrar sin papelera: rm y rmdir

Ya sabes, de [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#116-borrar-la-papelera-y-lo-definitivo), que en la terminal **borrar es definitivo**. Ahora vas a ver las órdenes, con el cuidado que merecen.

> **⚠️ Cuidado:** lo que borras con `rm` **no va a la papelera** ni se puede recuperar desde la terminal. No hay «deshacer» ni pregunta de confirmación. Antes de borrar, mira lo que vas a borrar, y piénsalo dos veces.

| Orden | Qué borra |
|---|---|
| `rm notas-viejas.txt` | Un fichero |
| `rm uno.txt dos.txt` | Varios ficheros |
| `rmdir vacia` | Una carpeta, **solo si está vacía** (si tiene algo dentro, se niega) |
| `rm -r pruebas` | Una carpeta **con todo lo que tenga dentro**, sin preguntar |
| `rm -i notas.txt` | Un fichero, pero **preguntando** antes |

`rm` sin opciones solo borra ficheros: si le das una carpeta, se niega («Es un directorio»). Para borrar una carpeta tienes dos caminos, y el más seguro es el primero:

1. **`rmdir`**, que solo borra carpetas vacías. Si te equivocas de carpeta y tiene algo, se niega y no pasa nada.
2. **`rm -r`** (recursivo, como en `cp -r`), que borra la carpeta y **todo** lo que contiene, carpetas dentro de carpetas incluidas. Es la orden más peligrosa de este módulo: úsala solo cuando hayas comprobado con `ls` qué hay dentro.

> **📌 Nota:** en internet verás a menudo `rm -rf`. La `f` (*force*, «forzar») hace que `rm` no pregunte nunca y no se queje de nada. No la necesitas para este curso: si `rm` se queja, es mejor leer por qué.

Tu red de seguridad de verdad no es tener cuidado (que también), sino **tener copias**: antes de reorganizar una carpeta importante, haz una copia con `cp -r`. Y para tu código, Git, que verás en la fase 5, guarda todas las versiones.

### 1.9. Ver qué hay dentro de un fichero: cat, less, head y tail

Para leer un fichero de texto sin abrir un editor tienes cuatro órdenes, según cómo sea de largo y qué parte quieras. En los ejemplos aparecen dos clases de ficheros de texto que verás a menudo:

- Un **registro** (en inglés, *log*): un fichero de texto en el que un programa va apuntando, línea a línea, lo que pasa mientras funciona, cada cosa con su fecha y su hora. Suelen terminar en `.log` y tener miles de líneas, así que no se leen enteros: se mira el principio o el final.
- Un **CSV**: un fichero de texto con una tabla, una fila por línea y las columnas separadas por comas (o por punto y coma). Su primera línea, la **cabecera**, suele decir qué es cada columna. Lo verás a fondo en la fase 4.

| Orden | Qué escribe | Para qué |
|---|---|---|
| `cat lista.txt` | **Todo** el fichero, de golpe | Ficheros cortos |
| `less registro.log` | El fichero **página a página**, para recorrerlo con el teclado | Ficheros largos |
| `head registro.log` | Las **10 primeras** líneas | Ver cómo empieza (la cabecera de un CSV, por ejemplo) |
| `tail registro.log` | Las **10 últimas** líneas | Ver lo más reciente de un registro |

Con **`-n`** y un número, `head` y `tail` escriben las líneas que quieras: `head -n 3 ventas.csv` escribe las 3 primeras; `tail -n 1 registro.log`, la última.

`cat` (de *concatenate*, «encadenar») acepta varios ficheros y los escribe seguidos, uno detrás de otro. Pero con un fichero de miles de líneas, `cat` lo escribe todo y solo verás el final pasando a toda velocidad. Para eso está **`less`**, un **paginador**: un programa que te enseña un texto largo una pantalla cada vez, sin cambiarlo. Dentro de `less`, la terminal ya no espera órdenes: espera **teclas**:

| Tecla | Qué hace en `less` |
|---|---|
| <kbd>Espacio</kbd> o <kbd>AvPág</kbd> | Avanza una pantalla |
| <kbd>b</kbd> o <kbd>RePág</kbd> | Retrocede una pantalla |
| <kbd>↓</kbd> y <kbd>↑</kbd> | Avanza o retrocede una línea |
| <kbd>/</kbd>, un texto e <kbd>Intro</kbd> | Busca ese texto hacia delante; <kbd>n</kbd> salta a la siguiente coincidencia, y <kbd>Mayús</kbd>+<kbd>N</kbd>, a la anterior |
| <kbd>Q</kbd> | **Sale** de `less` y vuelve al indicador |

En `less`, las letras se pulsan **en minúscula**, porque con la mayúscula algunas hacen otra cosa: <kbd>n</kbd> busca hacia delante y <kbd>Mayús</kbd>+<kbd>N</kbd>, hacia atrás. La <kbd>Q</kbd> de salir funciona de las dos formas. Las tienes todas en su manual, `man less`.

> **⚠️ Cuidado:** la tecla más importante de `less` es <kbd>Q</kbd> (*quit*). Si un día la terminal no te deja escribir órdenes y abajo ves `:` o `(END)`, estás dentro de `less` (o de otro paginador): pulsa <kbd>Q</kbd>. Te pasará con Git, en la fase 5, que usa `less` para enseñarte el historial cuando no cabe en la pantalla.

Estas órdenes son para ficheros de **texto**. Si haces `cat` de una imagen o un PDF, verás símbolos sin sentido (es un [fichero binario](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#114-la-extensión), lo verás en la fase 4) y a veces la terminal se queda con caracteres raros. No se rompe nada: escribe `clear` ([apartado 1.13](#113-trucos-que-ahorran-tiempo)).

### 1.10. Buscar: grep y find

Hay dos búsquedas distintas, y cada una tiene su orden:

- **Buscar un texto dentro de los ficheros** («¿en qué acta se habló del presupuesto?»): **`grep`**.
- **Buscar un fichero por su nombre** dentro de las carpetas («¿dónde dejé `socios.csv`?»): **`find`**.

**`grep`** escribe las **líneas** de un fichero que contienen un texto. Primero el texto que buscas, después el fichero (o los ficheros):

```text
grep presupuesto acta-enero.txt
```

Sus opciones más útiles:

| Opción | Qué hace |
|---|---|
| `-i` | No distingue mayúsculas de minúsculas (*ignore case*): `presupuesto` encuentra también `Presupuesto` |
| `-n` | Escribe el **número de línea** delante de cada línea encontrada |

Si le das **varios ficheros**, `grep` escribe delante de cada línea el nombre del fichero en que la ha encontrado. Y si no encuentra nada, no escribe nada, como `command -v` en el [módulo anterior](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#24-un-programa-que-no-está-en-el-path).

> **📌 Nota:** si lo que buscas tiene espacios, escríbelo entre comillas: `grep "Lucía Martín" pedidos.csv`. Sin ellas, `grep` buscaría `Lucía` en un fichero llamado `Martín`.

**`find`** busca ficheros y carpetas **por su nombre**, entrando en todas las carpetas que haya por debajo de la que le digas. La forma más sencilla:

```text
find documentos -name "socios.csv"
```

Se lee así: «busca **en la carpeta `documentos` y en todas las de dentro** los que **se llamen** `socios.csv`». Contesta con la ruta de cada uno que encuentra, empezando por la carpeta que le has dado (`documentos/2026/socios.csv`). Para buscar desde la carpeta actual, se le da `.`: `find . -name "socios.csv"`. El nombre puede llevar comodines (`find documentos -name "*.csv"`, todos los que terminan en `.csv`; los comodines están en el [apartado 1.14](#114-comodines-y-comillas)), y entonces las comillas son obligatorias.

> **💡 Consejo:** dale a `find` la carpeta más concreta que puedas. Desde tu carpeta personal, `find .` recorre **todas** tus carpetas: puede tardar mucho, llenarte la pantalla de errores de «Permiso denegado» y, en macOS, hacer que el sistema te pida permiso para que la terminal entre en carpetas como Documentos o Escritorio.

> **📌 Nota:** `find` no distingue mayúsculas solo si se lo pides, con `-iname` en lugar de `-name`. Y cuando encuentra varios, **no los ordena** alfabéticamente: los escribe en el orden en que los va encontrando, que puede cambiar de un ordenador a otro.

### 1.11. Escribir un texto: echo

**`echo`** escribe en la pantalla lo que le des. Así, tal cual:

```text
$ echo "Hola, mundo"
Hola, mundo
```

Dicho así parece inútil, pero es una de las órdenes que más vas a usar, por dos motivos:

- Sirve para **ver cómo entiende la terminal** lo que escribes. Ya lo usaste en el módulo anterior: `echo $PATH` escribía el **valor** de la [variable](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#19-variables-de-entorno) `PATH`, no las letras `$PATH`. En el [apartado 1.14](#114-comodines-y-comillas) lo usarás para ver qué ficheros selecciona un comodín antes de usarlo con una orden peligrosa.
- Es la forma de **escribir mensajes** en los scripts y de **guardar texto en ficheros**, con la redirección. Las dos cosas las verás en el módulo siguiente.

### 1.12. Pedir ayuda: --help y man

Nadie se sabe de memoria las opciones de todas las órdenes. Lo que sí sabe quien programa es **dónde mirarlas**, y la primera fuente es la propia terminal:

- **`--help`**: en Linux y en Git Bash, casi todas las órdenes escriben un resumen de cómo se usan y sus opciones con `orden --help`. Por ejemplo, `mkdir --help` o `grep --help`. Es corto, está en la terminal y, en un sistema en español, suele salir en español. (En macOS, muchas no lo entienden: lo verás abajo.)
- **`man`** (*manual*): abre la **página del manual** de una orden, mucho más completa, en el paginador `less`. Se recorre con las teclas del [apartado 1.9](#19-ver-qué-hay-dentro-de-un-fichero-cat-less-head-y-tail) y se sale con <kbd>Q</kbd>: `man ls`, `man grep`.

Las páginas del manual tienen siempre las mismas partes: el nombre (*NAME*), cómo se escribe la orden (*SYNOPSIS*), qué hace (*DESCRIPTION*) y sus opciones. En la línea de cómo se escribe, lo que va entre corchetes `[...]` es **opcional**, y los puntos suspensivos `...` quieren decir «puedes poner varios». Por ejemplo, el resumen de `grep` empieza así:

```text
Modo de empleo: grep [OPCIÓN]... PATRONES [FICHERO]...
```

Se lee: «`grep`, opcionalmente una o varias opciones, **obligatoriamente** lo que buscas, y opcionalmente uno o varios ficheros».

**Lo que cambia en tu sistema:**

- **En Linux**, `man` existe y suele tener los manuales de todo. (Algunas instalaciones mínimas los quitan para ocupar menos.)
- **En macOS**, `man` existe y funciona igual. Pero sus órdenes son de otra familia (las de BSD, no las de GNU que traen Linux y Git Bash), y muchas **no entienden `--help`**: se quejan de que no conocen esa opción y, como mucho, enseñan una línea de uso. En macOS, la ayuda es `man`.
- **En Git Bash**, la orden `man` **no viene incluida** (a 9 de noviembre de 2026): usa `--help`. Para Git, `git help` seguido de una orden abre su manual en el navegador.
- **Las órdenes propias de bash** (como `cd`, `pwd` o `echo`) son parte de bash, y su ayuda sale con `help` y la orden (`help cd`). En Linux, `cd` no tiene página del manual. `man pwd` y `man echo` sí abren una, pero es la de un programa aparte con el mismo nombre, no la de la orden de bash, que puede tener opciones distintas. `help` es de bash: en zsh, la terminal de macOS, no existe, y la ayuda de sus órdenes propias está en su manual, `man zshbuiltins`.

> **💡 Consejo:** el manual está en inglés casi siempre. No pasa nada: lo que buscas suele ser una opción, y la descripción es corta. Y si no te aclaras, la documentación de internet y la IA ayudan; lo verás en el módulo «Buscar ayuda» (fase 7). Pero mira primero la ayuda de tu terminal (`--help` o `man`): es la fuente más directa y no se equivoca de versión.

### 1.13. Trucos que ahorran tiempo

Estos trucos los usa a todas horas cualquiera que trabaje con la terminal. Aprenderlos desde el primer día te ahorra escribir y, sobre todo, erratas.

**Autocompletar con el tabulador.** Escribe el principio de un nombre de fichero, de carpeta o de orden y pulsa <kbd>Tab</kbd>: la terminal **completa** el resto. Si hay varias posibilidades, completa hasta donde todas coinciden; pulsa <kbd>Tab</kbd> dos veces y te enseña la lista. Por ejemplo, con `cd web-p` y <kbd>Tab</kbd>, escribe `cd web-panaderia/`. Además de ahorrar tiempo, es una comprobación: **si no completa, es que no existe** (o no estás donde crees). Y si el nombre tiene espacios, añade las comillas o las barras invertidas por ti.

**El historial.** La terminal recuerda las órdenes que has escrito:

- Con <kbd>↑</kbd> recuperas la orden anterior, y la anterior, y la anterior… Con <kbd>↓</kbd> vuelves hacia delante. Puedes cambiar lo que quieras antes de pulsar <kbd>Intro</kbd>: así se corrige una errata sin escribirlo todo otra vez.
- Con <kbd>Ctrl</kbd>+<kbd>R</kbd> **buscas** en el historial: pulsa la combinación y empieza a escribir un trozo de la orden; la terminal te enseña la última que lo contiene (en bash, en una línea que empieza por `(reverse-i-search)`). <kbd>Ctrl</kbd>+<kbd>R</kbd> otra vez busca una más antigua; <kbd>Intro</kbd> la ejecuta, y <kbd>Ctrl</kbd>+<kbd>C</kbd> sale sin ejecutar nada.

**Parar lo que está en marcha: <kbd>Ctrl</kbd>+<kbd>C</kbd>.** Si una orden no termina (se queda esperando, o tarda demasiado, o lanzaste algo por error), <kbd>Ctrl</kbd>+<kbd>C</kbd> la **interrumpe** y vuelve el indicador. Es el freno de emergencia de la terminal. En la pantalla verás `^C`, que es como la terminal escribe esa combinación.

> **⚠️ Cuidado:** en la terminal, <kbd>Ctrl</kbd>+<kbd>C</kbd> **no copia**: interrumpe. Para copiar y pegar:
>
> - **Linux** (la Terminal de Ubuntu y otras): <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>C</kbd> y <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>V</kbd>.
> - **macOS**: las de siempre, <kbd>Cmd</kbd>+<kbd>C</kbd> y <kbd>Cmd</kbd>+<kbd>V</kbd>.
> - **Git Bash**: lo que **seleccionas con el ratón se copia solo**; para pegar, <kbd>Mayús</kbd>+<kbd>Insert</kbd> o el menú del clic derecho (*Paste*). <kbd>Ctrl</kbd>+<kbd>Insert</kbd> también copia (comprobado en el manual de mintty, la ventana de Git Bash, el 9 de noviembre de 2026).

**Limpiar la pantalla.** Cuando la pantalla está llena, **`clear`** o <kbd>Ctrl</kbd>+<kbd>L</kbd> la dejan en blanco, con el indicador arriba. No borra nada más: tus ficheros, tu carpeta actual y tu historial siguen ahí.

**Abrir una carpeta en el explorador**, **arrastrar un fichero para escribir su ruta** y **`cd -`** para volver: los tienes en el [apartado 1.5](#15-moverse-cd).

### 1.14. Comodines y comillas

**Los comodines** son caracteres especiales que sirven para nombrar **muchos ficheros de una vez** por un patrón, en lugar de escribirlos uno a uno:

| Comodín | Significa | Ejemplo | Selecciona |
|---|---|---|---|
| `*` | **Cualquier texto**, de cualquier longitud (también ninguno) | `*.jpg` | Todos los que terminan en `.jpg` |
| `?` | **Exactamente un** carácter, el que sea | `foto-0?.jpg` | `foto-01.jpg` a `foto-09.jpg`, pero no `foto-10.jpg` |

Más ejemplos con `*`: `informe*` (todo lo que empieza por `informe`), `*2026*` (todo lo que tiene `2026` en alguna parte del nombre), `*` (todo lo que hay en la carpeta, salvo los ocultos).

Lo importante es **quién** entiende el comodín: **no es la orden, sino bash**. Antes de ejecutar `ls *.jpg`, bash mira la carpeta, cambia `*.jpg` por la **lista de nombres que encajan**, ordenada, y le pasa esa lista a `ls`. Por eso los comodines funcionan igual con cualquier orden (`ls`, `cp`, `mv`, `rm`, `grep`…), y por eso `echo *.txt` es la forma de **ver qué selecciona un patrón antes de usarlo**: `echo` escribe la lista que le ha pasado bash.

> **⚠️ Cuidado:** con `rm`, los comodines son peligrosos: `rm *.txt` borra **todos** los ficheros que acaben en `.txt` de la carpeta, sin preguntar. Antes de borrar con un comodín, escribe `ls` con el **mismo patrón** y mira qué sale. Y fíjate bien en los espacios: lo verás en el [error típico 3.3](#33-un-espacio-de-más-al-borrar).

**Las comillas.** Ya sabes que el espacio separa las piezas de una orden ([apartado 1.2](#12-cómo-se-escribe-una-orden)). Si un nombre tiene espacios (como `Fotos del viaje`), tienes que decirle a bash que es **una sola pieza**, y hay dos formas:

- **Entre comillas**: `cd "Fotos del viaje"`. Es lo más claro.
- **Con una barra invertida** delante de cada espacio: `cd Fotos\ del\ viaje`. Es lo que escribe el tabulador cuando autocompleta, así que lo verás a menudo.

Las comillas tienen otro efecto: **apagan los comodines**. `echo *.txt` escribe la lista de ficheros que encajan; `echo "*.txt"` escribe `*.txt`, tal cual. Por eso en `find . -name "*.csv"` el patrón va entre comillas: queremos que le llegue a `find` tal cual, para que lo use él en cada carpeta, y no que bash lo cambie antes por los `.csv` de la carpeta actual.

> **📌 Nota:** las comillas pueden ser dobles (`"…"`) o simples (`'…'`). Para nombres con espacios, las dos sirven. La diferencia entre ellas (las simples lo dejan **todo** tal cual, incluido el `$` de las variables) la verás en el [módulo siguiente](02-terminal-sacarle-partido.md#17-variables-en-la-terminal).

**Lo que cambia en macOS (zsh).** Un comodín que no encaja con nada: si escribes `ls *.xyz` y no hay ningún fichero así, bash le pasa a `ls` el patrón tal cual y es `ls` quien dice que no existe:

```text
ls: no se puede acceder a '*.xyz': No existe el archivo o el directorio
```

zsh, en cambio, ni siquiera ejecuta la orden: contesta él mismo `zsh: no matches found: *.xyz`. Significan lo mismo: «no hay ningún fichero que encaje con ese patrón». Esta y otras diferencias de los ejemplos de este módulo, juntas:

| Lo que escribes | En bash (Linux, Git Bash) | En zsh (la terminal de macOS) |
|---|---|---|
| Un patrón que no encaja con nada, como `*.xyz` | Se lo pasa tal cual a la orden, que dice que no existe. Si en la orden hay otros patrones que sí encajan, la orden se ejecuta con ellos | Dice `no matches found` y **no ejecuta la orden**, aunque los demás patrones sí encajen: no se hace nada |
| Un nombre con espacios sin comillas: `cd Mis apuntes` | `cd: demasiados argumentos` | Otro mensaje: `cd: string not in pwd: Mis` (con dos palabras, zsh intenta otra forma de `cd`, que no te hace falta). Se arregla igual: con comillas |
| `rm *` (o `rm` con un `*` suelto, como en el [error típico 3.3](#33-un-espacio-de-más-al-borrar)) | Borra sin preguntar | Pregunta antes si de verdad quieres borrar todos los ficheros de la carpeta. Es una ayuda, no una red: con `rm *.txt` ya no pregunta |
| `ls` de un nombre con espacios | Lo escribe entre comillas simples (`'Mis apuntes'`) para que veas los espacios | El `ls` de macOS lo escribe sin comillas |

(Comprobado en la documentación oficial de zsh y en el manual de `ls` de BSD el 9 de noviembre de 2026.)

### 1.15. Las órdenes de PowerShell, para reconocerlas

En Windows verás tutoriales que usan **PowerShell**, la terminal que trae Windows, en lugar de bash. Este curso no la usa ([02.03, error típico 3.3](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#33-usar-otra-terminal-en-windows)), pero conviene que **reconozcas** sus órdenes cuando las veas, para saber qué hacen y cuál es su equivalente en bash. No tienes que aprenderlas:

| Qué hace | bash (este curso) | PowerShell | Símbolo del sistema (`cmd`), el antiguo |
|---|---|---|---|
| Escribir la carpeta actual | `pwd` | `Get-Location` | `cd` sin nada |
| Listar una carpeta | `ls` | `Get-ChildItem` | `dir` |
| Cambiar de carpeta | `cd` | `Set-Location` (o `cd`) | `cd` |
| Crear una carpeta | `mkdir` | `New-Item -ItemType Directory` (o `mkdir`) | `mkdir` o `md` |
| Copiar | `cp` | `Copy-Item` | `copy` |
| Mover o renombrar | `mv` | `Move-Item` / `Rename-Item` | `move` / `ren` |
| Borrar | `rm` | `Remove-Item` | `del` |
| Ver un fichero | `cat` | `Get-Content` | `type` |
| Buscar un texto | `grep` | `Select-String` | `findstr` |
| Limpiar la pantalla | `clear` | `Clear-Host` | `cls` |

Fíjate en la forma de las órdenes de PowerShell: **un verbo, un guion y un nombre** en inglés (`Get-ChildItem`, «obtener los elementos hijos»). Y PowerShell acepta algunos nombres de bash como atajos (`ls`, `cd`, `cat`, `cp`, `mv`, `rm`…), pero sus opciones son otras: `ls -l` o `rm -r` no funcionan allí igual. Si un tutorial está escrito para PowerShell, búscalo para bash, o traduce la orden con esta tabla.

> **📌 Nota:** cómo saber en qué terminal estás: el indicador de bash (y de Git Bash) termina en `$`; el de zsh, en `%`; el de PowerShell empieza por `PS` y termina en `>` (`PS C:\Users\ana>`); el del símbolo del sistema termina en `>` (`C:\Users\ana>`).

## 2. Ejemplos de código

Todos los ejemplos de esta sección son **sesiones de terminal** sobre carpetas de casos reales. Para seguirlos en tu ordenador, copia la carpeta del caso (la tienes en el enlace «📁 Código» de cada ejemplo) a tu carpeta personal con el explorador de archivos, abre una terminal nueva y escribe las órdenes una a una. Tu salida no será idéntica letra a letra (el usuario, las rutas, las fechas, los colores…): fíjate en lo que dice cada «En qué fijarte», como explica el [aviso sobre las salidas](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal).

### 2.1. Moverse por la web de una panadería

**Situación real:** te pasan la carpeta de la web de una panadería, `web-panaderia`, muy parecida a la que viste en [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#21-un-árbol-real-la-web-de-una-panadería). Antes de tocar nada, quieres recorrerla para ver qué tiene. Esta es su estructura:

```text
web-panaderia/
├── index.html
├── contacto.html
├── css/
│   └── estilos.css
├── img/
│   ├── logo.png
│   └── pan-de-centeno.jpg
└── js/
    └── menu.js
```

**En tu terminal** (`sesion.txt`):

```text
$ pwd
/home/alumno
$ ls
web-panaderia
$ cd web-panaderia
$ pwd
/home/alumno/web-panaderia
$ ls
contacto.html  css  img  index.html  js
$ cd css
$ ls
estilos.css
$ cd ../img
$ pwd
/home/alumno/web-panaderia/img
$ ls
logo.png  pan-de-centeno.jpg
$ cd ..
$ cd ~/web-panaderia/js
$ pwd
/home/alumno/web-panaderia/js
$ cd -
/home/alumno/web-panaderia
$ cd
$ pwd
/home/alumno
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.1-moverse-por-un-proyecto/`](codigo/01-terminal-lo-basico/ejemplos/2.1-moverse-por-un-proyecto/)

**En qué fijarte:**

1. **`cd` no contesta nada** cuando todo va bien: para saber dónde has llegado, `pwd` (o el indicador).
2. **`cd ../img`** pasa de `css` a su carpeta «hermana» `img` en un solo paso: sube a `web-panaderia` y entra en `img`.
3. **`cd ~/web-panaderia/js`** funciona desde cualquier sitio: empieza en tu carpeta personal.
4. **`cd -`** vuelve a la carpeta anterior (`web-panaderia`, donde estabas antes de ir a `js`) y, a diferencia de los demás `cd`, **escribe** a dónde ha vuelto.
5. **`cd`** solo, sin nada, te devuelve a tu carpeta personal.
6. `ls` escribe los nombres en columnas, ordenados. En tu terminal, las carpetas (`css`, `img`, `js`) saldrán seguramente de otro color, o con una `/` detrás en Git Bash.

### 2.2. Mirar una carpeta con detalle: ls -l, -a y -h

**Situación real:** la panadería te manda ahora la versión de la web que tiene publicada, `web-panaderia-publicada`: los mismos ficheros y un fichero oculto más, `.gitignore`. Quieres saber qué es cada cosa (fichero o carpeta), si hay ficheros ocultos y cuánto ocupan las imágenes, porque la web va lenta y sospechas de alguna foto.

**En tu terminal** (`sesion.txt`):

```text
$ cd web-panaderia-publicada
$ ls -l
total 20
-rw-r--r-- 1 alumno alumno  269 ene 15  2026 contacto.html
drwxr-xr-x 2 alumno alumno 4096 ene 15  2026 css
drwxr-xr-x 2 alumno alumno 4096 ene 15  2026 img
-rw-r--r-- 1 alumno alumno  360 ene 15  2026 index.html
drwxr-xr-x 2 alumno alumno 4096 ene 15  2026 js
$ ls -a
.  ..  contacto.html  css  .gitignore  img  index.html  js
$ ls -lh img
total 60K
-rw-r--r-- 1 alumno alumno 4,8K ene 15  2026 logo.png
-rw-r--r-- 1 alumno alumno  49K ene 15  2026 pan-de-centeno.jpg
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.2-mirar-con-detalle/`](codigo/01-terminal-lo-basico/ejemplos/2.2-mirar-con-detalle/)

**En qué fijarte:**

1. En **`ls -l`**, las líneas que empiezan por **`d`** son carpetas (`css`, `img`, `js`) y las que empiezan por **`-`**, ficheros. Las carpetas marcan `4096` (en tu sistema puede ser otro número), que no es lo que ocupa su contenido ([apartado 1.4](#14-qué-hay-aquí-ls)).
2. **`ls -a`** enseña `.gitignore`, que `ls` a secas no enseñaba, y las dos carpetas especiales `.` y `..`.
3. **`ls -lh img`** da los tamaños legibles: la foto ocupa unos `49K` (49 kilobytes) y el logo, `4,8K`. Nada preocupante para una web. (La línea `total` es el espacio que ocupa la carpeta en el disco; no hace falta que te fijes en ella.)
4. Las fechas salen iguales porque los ficheros del curso se copiaron todos a la vez; en tu ordenador verás las tuyas.

### 2.3. Crear la estructura de un proyecto

**Situación real:** empiezas una aplicación de recetas y quieres dejar preparadas sus carpetas: el código en `src` (con una subcarpeta `pantallas`), los datos en `datos` y la documentación en `docs`, y unos cuantos ficheros vacíos para empezar.

**En tu terminal** (`sesion.txt`):

```text
$ mkdir recetas-app
$ cd recetas-app
$ mkdir -p src/pantallas datos docs
$ touch README.md src/inicio.js datos/recetas.json
$ ls
datos  docs  README.md  src
$ ls -R
.:
datos  docs  README.md  src

./datos:
recetas.json

./docs:

./src:
inicio.js  pantallas

./src/pantallas:
$ mkdir docs
mkdir: cannot create directory ‘docs’: El archivo ya existe
$ mkdir -p docs
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.3-crear-un-proyecto/`](codigo/01-terminal-lo-basico/ejemplos/2.3-crear-un-proyecto/)

(La carpeta de este ejemplo solo tiene las órdenes: la sesión empieza en una carpeta personal sin nada, y lo crea todo.)

**En qué fijarte:**

1. **`mkdir -p src/pantallas datos docs`** crea **cuatro** carpetas con una orden: `src` y, dentro, `pantallas` (gracias a `-p`), `datos` y `docs`.
2. **`touch`** crea los tres ficheros vacíos, cada uno en su carpeta, con rutas relativas a la carpeta actual (`recetas-app`).
3. **`ls -R`** (*recursive*) lista la carpeta actual y **todas las de dentro**, una detrás de otra: es una forma rápida de ver la estructura completa. Cada bloque empieza por la ruta de la carpeta y dos puntos (`./src:`); las carpetas vacías (`./docs:`) no tienen nada debajo.
4. **`mkdir docs`**, cuando `docs` ya existe, se queja. **`mkdir -p docs`** no: con `-p`, que la carpeta exista ya no es un problema.
5. El orden de `ls`: en esta terminal, `README.md` se ordena entre las minúsculas, como si fuera `readme.md`. En la tuya puede salir en otro orden, por ejemplo con las mayúsculas delante ([apartado 1.4](#14-qué-hay-aquí-ls)).

### 2.4. Copiar, mover y renombrar los ficheros de un encargo

**Situación real:** trabajas por tu cuenta haciendo webs y en la carpeta `encargos` lo tienes todo mezclado: las facturas, la lista de clientes y un presupuesto que se llama «borrador», aunque ya es el de la Bodega Ribera. Quieres meter las facturas en su carpeta, darle al presupuesto su nombre de verdad, hacer una segunda versión a partir de él y guardar una copia de las facturas, por si acaso.

**En tu terminal** (`sesion.txt`):

```text
$ cd encargos
$ ls
clientes.txt  factura-enero.pdf  factura-febrero.pdf  presupuesto-borrador.txt
$ mkdir facturas
$ mv factura-enero.pdf factura-febrero.pdf facturas
$ mv presupuesto-borrador.txt presupuesto-bodega.txt
$ cp presupuesto-bodega.txt presupuesto-bodega-v2.txt
$ cp -r facturas facturas-copia
$ ls
clientes.txt  facturas  facturas-copia  presupuesto-bodega.txt  presupuesto-bodega-v2.txt
$ ls facturas
factura-enero.pdf  factura-febrero.pdf
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.4-copiar-mover-y-renombrar/`](codigo/01-terminal-lo-basico/ejemplos/2.4-copiar-mover-y-renombrar/)

**En qué fijarte:**

1. **`mv factura-enero.pdf factura-febrero.pdf facturas`**: varios orígenes y, al final, la carpeta de destino. Las facturas ya no están en `encargos`, sino en `encargos/facturas`.
2. **`mv presupuesto-borrador.txt presupuesto-bodega.txt`**: como el destino no es una carpeta, `mv` **renombra**. El fichero con el nombre viejo ya no existe.
3. **`cp presupuesto-bodega.txt presupuesto-bodega-v2.txt`**: ahora hay **dos** ficheros iguales con nombres distintos, y puedes cambiar la versión 2 sin perder la primera.
4. **`cp -r facturas facturas-copia`** copia la carpeta entera con lo que tiene dentro. Sin `-r`, `cp` se habría negado.
5. Ninguna de estas órdenes escribe nada si todo va bien. Para comprobar el resultado, `ls`.

### 2.5. Borrar con cuidado

**Situación real:** en la carpeta de los encargos del año pasado, `encargos-2025`, quedan restos que ya no sirven: unas notas viejas y una carpeta `pruebas` con dos versiones antiguas de un logo. Además, al empezar, creas sin querer una carpeta `vacia`. Vas a borrarlo todo, **mirando antes** lo que borras.

**En tu terminal** (`sesion.txt`):

```text
$ cd encargos-2025
$ mkdir vacia
$ ls
clientes.txt  notas-viejas.txt  pruebas  vacia
$ rm notas-viejas.txt
$ rmdir pruebas
rmdir: fallo al borrar 'pruebas': El directorio no está vacío
$ ls pruebas
logo-v1.png  logo-v2.png
$ rm -r pruebas
$ rmdir vacia
$ ls
clientes.txt
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.5-borrar-con-cuidado/`](codigo/01-terminal-lo-basico/ejemplos/2.5-borrar-con-cuidado/)

**En qué fijarte:**

1. **`rm notas-viejas.txt`** borra el fichero sin preguntar y sin decir nada. No está en ninguna papelera: ha desaparecido.
2. **`rmdir pruebas`** se niega, porque la carpeta **no está vacía**. Es justo lo que lo hace seguro.
3. Antes de borrarla entera, **`ls pruebas`** enseña qué hay dentro. Solo cuando ves que son dos logos viejos, **`rm -r pruebas`**.
4. **`rmdir vacia`** sí funciona, porque está vacía.

### 2.6. Ver un fichero de texto y el registro de una aplicación

**Situación real:** quieres echar un vistazo rápido a dos ficheros: una lista de la compra, muy corta, y el [registro](#19-ver-qué-hay-dentro-de-un-fichero-cat-less-head-y-tail) de la aplicación de gestión de una oficina, donde la aplicación apunta quién entra, quién sale y qué errores ha habido. Este es corto, de 12 líneas, pero haz como con uno de verdad: mira el principio y el final.

**En tu terminal** (`sesion.txt`):

```text
$ cat lista-compra.txt
Harina de centeno
Levadura
Sal
$ head registro.log
2026-11-09 08:59:12 ana entra
2026-11-09 09:01:40 luis entra
2026-11-09 09:03:05 ana abre pedidos.csv
2026-11-09 09:10:27 marta entra
2026-11-09 09:12:51 luis ERROR contraseña incorrecta
2026-11-09 09:13:08 luis entra
2026-11-09 09:20:33 marta abre facturas.csv
2026-11-09 09:41:19 ana sale
2026-11-09 10:02:44 pablo entra
2026-11-09 10:05:10 pablo ERROR fichero no encontrado
$ head -n 3 registro.log
2026-11-09 08:59:12 ana entra
2026-11-09 09:01:40 luis entra
2026-11-09 09:03:05 ana abre pedidos.csv
$ tail -n 2 registro.log
2026-11-09 10:15:58 luis sale
2026-11-09 10:30:01 marta sale
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.6-ver-ficheros/`](codigo/01-terminal-lo-basico/ejemplos/2.6-ver-ficheros/)

**En qué fijarte:**

1. **`cat`** escribe la lista entera: con tres líneas, es lo más cómodo.
2. **`head`**, sin más, escribe **10** líneas, aunque el registro tiene 12.
3. **`head -n 3`** y **`tail -n 2`** escriben las 3 primeras y las 2 últimas. Para un registro, `tail` es la más útil: lo último que ha pasado está al final.
4. Para recorrer el registro entero con calma, usarías **`less registro.log`** (y <kbd>Q</kbd> para salir). No aparece en la sesión porque `less` ocupa toda la ventana mientras lo usas.

### 2.7. Buscar un dato en las actas de un club

**Situación real:** eres secretario de un club de lectura y tienes las actas de las reuniones en ficheros de texto, una por mes. Alguien pregunta: «¿en qué reuniones se habló del presupuesto?». Y además no encuentras el fichero de socios, que guardaste en alguna subcarpeta de `documentos`.

**En tu terminal** (`sesion.txt`):

```text
$ ls actas
acta-enero.txt  acta-febrero.txt  acta-marzo.txt
$ grep presupuesto actas/acta-enero.txt
Se aprueba el presupuesto de la excursión.
$ grep -n presupuesto actas/*.txt
actas/acta-enero.txt:3:Se aprueba el presupuesto de la excursión.
actas/acta-marzo.txt:3:Luis pide revisar el presupuesto de la excursión.
$ grep -i -n presupuesto actas/*.txt
actas/acta-enero.txt:3:Se aprueba el presupuesto de la excursión.
actas/acta-febrero.txt:3:Presupuesto: falta el de la imprenta.
actas/acta-marzo.txt:3:Luis pide revisar el presupuesto de la excursión.
$ find documentos -name "socios.csv"
documentos/2026/socios.csv
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.7-buscar-un-dato/`](codigo/01-terminal-lo-basico/ejemplos/2.7-buscar-un-dato/)

**En qué fijarte:**

1. Con **un fichero**, `grep` escribe solo las líneas que contienen `presupuesto`.
2. Con **varios** (`actas/*.txt`, los tres, gracias al comodín), cada línea va precedida del **nombre del fichero**, y con `-n`, del **número de línea**: `actas/acta-enero.txt:3:` es «línea 3 del acta de enero».
3. **Sin `-i`**, el acta de febrero no aparece, porque allí pone `Presupuesto`, con mayúscula. **Con `-i`**, sí. Si buscas una palabra en textos escritos por personas, usa casi siempre `-i`.
4. **`find documentos -name "socios.csv"`** recorre `documentos` y todas las carpetas de dentro, y encuentra el fichero un nivel más abajo: `documentos/2026/socios.csv`. Esa ruta, relativa a la carpeta actual, la puedes usar directamente (`cat documentos/2026/socios.csv`).

### 2.8. Comodines y comillas con las fotos de un viaje

**Situación real:** tienes las fotos de un viaje en una carpeta que, como tantas carpetas personales, tiene espacios en el nombre: `Fotos del viaje`. Dentro hay doce fotos, un vídeo y unas notas. Quieres entrar y ver solo algunas cosas.

**En tu terminal** (`sesion.txt`):

```text
$ cd Fotos del viaje
bash: cd: demasiados argumentos
$ cd "Fotos del viaje"
$ ls
foto-01.jpg  foto-03.jpg  foto-05.jpg  foto-07.jpg  foto-09.jpg  foto-11.jpg  notas.txt
foto-02.jpg  foto-04.jpg  foto-06.jpg  foto-08.jpg  foto-10.jpg  foto-12.jpg  video-01.mp4
$ ls *.jpg
foto-01.jpg  foto-03.jpg  foto-05.jpg  foto-07.jpg  foto-09.jpg  foto-11.jpg
foto-02.jpg  foto-04.jpg  foto-06.jpg  foto-08.jpg  foto-10.jpg  foto-12.jpg
$ ls foto-0?.jpg
foto-01.jpg  foto-03.jpg  foto-05.jpg  foto-07.jpg  foto-09.jpg
foto-02.jpg  foto-04.jpg  foto-06.jpg  foto-08.jpg
$ ls *.mp4 *.txt
notas.txt  video-01.mp4
$ echo *.txt
notas.txt
$ echo "*.txt"
*.txt
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/2.8-comodines-y-comillas/`](codigo/01-terminal-lo-basico/ejemplos/2.8-comodines-y-comillas/)

**En qué fijarte:**

1. **`cd Fotos del viaje`**, sin comillas, falla con «demasiados argumentos»: bash le ha pasado a `cd` tres piezas (`Fotos`, `del` y `viaje`). **Con comillas**, es una sola. (En zsh, el mensaje es otro: lo tienes en la [tabla del apartado 1.14](#114-comodines-y-comillas).)
2. **`ls *.jpg`** deja fuera el vídeo y las notas.
3. **`ls foto-0?.jpg`** selecciona de la 01 a la 09: el `?` es **un** carácter, así que `foto-10.jpg`, `foto-11.jpg` y `foto-12.jpg` no encajan (después de `foto-` tienen `1`, no `0`).
4. **`ls *.mp4 *.txt`**: se pueden poner varios patrones; bash junta las dos listas.
5. **`echo *.txt`** escribe `notas.txt`, el fichero que encaja: bash ha cambiado el patrón por la lista **antes** de ejecutar `echo`. **`echo "*.txt"`**, con comillas, escribe el patrón tal cual.

## 3. Errores típicos

### 3.1. Estar en la carpeta equivocada

**Qué pasa:** escribes el nombre de un fichero que sabes que existe, y la terminal dice que no.

**En tu terminal** (`sesion.txt`):

```text
$ pwd
/home/alumno
$ ls ventas.csv
ls: no se puede acceder a 'ventas.csv': No existe el archivo o el directorio
$ ls
tienda
$ cd tienda/datos
$ ls ventas.csv
ventas.csv
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/3.1-carpeta-equivocada/`](codigo/01-terminal-lo-basico/ejemplos/3.1-carpeta-equivocada/)

**Por qué ocurre:** `ventas.csv` es una ruta relativa, y se busca **en la carpeta actual** ([apartado 1.3](#13-dónde-estás-el-indicador-y-la-carpeta-actual)). El fichero existe, pero en `tienda/datos`, no en la carpeta personal, que es donde estabas.

**Cómo se arregla:** `pwd` para saber dónde estás, `ls` para ver qué hay, y `cd` a la carpeta buena (o escribe la ruta completa del fichero: `ls tienda/datos/ventas.csv`). El tabulador te avisa antes: si no completa el nombre, no está ahí.

### 3.2. Espacios sin comillas

**Qué pasa:** quieres crear una carpeta `Mis apuntes` y entrar en ella.

**En tu terminal** (`sesion.txt`):

```text
$ mkdir Mis apuntes
$ ls
apuntes  Mis
$ cd Mis apuntes
bash: cd: demasiados argumentos
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/3.2-espacios-sin-comillas/`](codigo/01-terminal-lo-basico/ejemplos/3.2-espacios-sin-comillas/)

**Por qué ocurre:** el espacio separa las piezas de una orden ([apartado 1.2](#12-cómo-se-escribe-una-orden)). `mkdir` recibió **dos** argumentos, `Mis` y `apuntes`, y creó dos carpetas **sin decir nada**. Después, `cd` recibió dos y se quejó, porque solo admite una. (En zsh, `cd` contesta `cd: string not in pwd: Mis`, que dice lo mismo de otra forma: [apartado 1.14](#114-comodines-y-comillas).)

**Cómo se arregla:** pon el nombre entre comillas: `mkdir "Mis apuntes"`, `cd "Mis apuntes"`. Y deshaz lo hecho: `rmdir Mis apuntes` borra las dos carpetas vacías que sobran. Mejor aún: en tus carpetas de trabajo, usa nombres sin espacios ([02.02, apartado 1.13](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#113-cómo-nombrar-ficheros-y-carpetas)): `mis-apuntes`.

### 3.3. Un espacio de más al borrar

**Qué pasa:** quieres borrar los ficheros `.txt` de una carpeta, se te escapa un espacio entre el `*` y `.txt`… y pierdes todo.

**En tu terminal** (`sesion.txt`):

```text
$ ls
esquema.png  practica.pdf  tema1.txt  tema2.txt
$ rm * .txt
rm: no se puede borrar '.txt': No existe el archivo o el directorio
$ ls
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/3.3-un-espacio-de-mas/`](codigo/01-terminal-lo-basico/ejemplos/3.3-un-espacio-de-mas/)

**Por qué ocurre:** con el espacio, `rm` recibió **dos** cosas para borrar: `*`, que bash cambió por **todos** los ficheros de la carpeta, y `.txt`, un fichero que no existe. Borró todos los ficheros (el PDF y la imagen también) y después se quejó del único que no encontró. El mensaje de error llega cuando ya no tiene arreglo, y no hay papelera. (zsh, la terminal de macOS, pregunta antes de un `rm` con un `*` suelto, pero no cuentes con ello: con otras órdenes y otros patrones no pregunta; [apartado 1.14](#114-comodines-y-comillas).)

**Cómo se evita:**

- Antes de borrar con un comodín, escribe **`ls` con el mismo patrón**: `ls * .txt` te habría enseñado que iba a borrar todo.
- Lee la orden **entera** antes de pulsar <kbd>Intro</kbd>, sobre todo si empieza por `rm`.
- Para borrados delicados, usa `rm -i`, que pregunta fichero a fichero.
- Ten **copias** de lo importante (y, para tu código, Git).

### 3.4. Sobrescribir un fichero sin darte cuenta

**Qué pasa:** copias un fichero viejo con el nombre de uno que ya existía, y el bueno desaparece.

**En tu terminal** (`sesion.txt`):

```text
$ cat informe.txt
Informe de noviembre: versión final, revisada.
$ cat informe-viejo.txt
Informe de octubre.
$ cp informe-viejo.txt informe.txt
$ cat informe.txt
Informe de octubre.
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/3.4-sobrescribir-sin-aviso/`](codigo/01-terminal-lo-basico/ejemplos/3.4-sobrescribir-sin-aviso/)

**Por qué ocurre:** si el destino de `cp` o `mv` es un fichero que ya existe, **se sustituye sin preguntar** ([apartado 1.7](#17-copiar-mover-y-renombrar-cp-y-mv)). El informe de noviembre se ha perdido, y en su lugar hay una copia del de octubre.

**Cómo se evita:** antes de copiar o mover, `ls` para ver si el destino existe. Si no estás seguro, usa `cp -i` o `mv -i`, que preguntan antes de sustituir.

### 3.5. rm y rmdir se niegan a borrar una carpeta

**Qué pasa:** `rm pruebas` contesta que no se puede borrar porque «Es un directorio» (*Is a directory*), y `rmdir pruebas`, que no está vacía (*Directory not empty*).

**Por qué ocurre:** `rm` sin opciones solo borra ficheros, y `rmdir` solo borra carpetas vacías ([apartado 1.8](#18-borrar-sin-papelera-rm-y-rmdir)). No es un fallo: es una protección.

**Cómo se arregla:** mira qué hay dentro (`ls pruebas`). Si de verdad quieres borrarlo todo, `rm -r pruebas`, como en el [ejemplo 2.5](#25-borrar-con-cuidado). Si no, deja la carpeta en paz.

### 3.6. La terminal no contesta

**Qué pasa:** escribes una orden, pulsas <kbd>Intro</kbd> y no vuelve el indicador. Escribes cosas y no pasa nada, o pasan cosas raras.

Hay dos causas habituales:

- **La orden está esperando algo.** Muchas órdenes, si no les das un fichero, esperan a que escribas el texto con el teclado. Le pasa a `cat` sin nada detrás, o a `grep texto` sin fichero. No está colgada: te está escuchando.
- **Estás dentro de un paginador** como `less` (o de `man`, o de Git, que lo usa): abajo ves `:` o `(END)`.

**En tu terminal** (`sesion.txt`):

```text
$ cat
^C
$ pwd
/home/alumno
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/3.6-una-orden-que-no-termina/`](codigo/01-terminal-lo-basico/ejemplos/3.6-una-orden-que-no-termina/)

Aquí, `cat` se quedó esperando, y <kbd>Ctrl</kbd>+<kbd>C</kbd> (el `^C`) lo interrumpió y devolvió el indicador.

**Cómo se arregla:** si es un paginador, <kbd>Q</kbd>. Si no, <kbd>Ctrl</kbd>+<kbd>C</kbd>. Uno de los dos te devuelve casi siempre el indicador. Si ninguno funciona, cierra la ventana de la terminal y abre otra: no se rompe nada.

### 3.7. Copiar también el indicador

**Qué pasa:** copias una orden de una guía o de este curso y la pegas con el `$` del principio.

**En tu terminal** (`sesion.txt`):

```text
$ $ ls
bash: $: orden no encontrada
$ ls
notas.txt
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejemplos/3.7-copiar-el-indicador/`](codigo/01-terminal-lo-basico/ejemplos/3.7-copiar-el-indicador/)

**Por qué ocurre:** en las sesiones, el `$ ` representa el indicador: **no se escribe**. Al pegarlo, bash cree que `$` es el nombre de una orden y no la encuentra en el [PATH](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#111-cuando-el-sistema-no-encuentra-un-programa).

**Cómo se arregla:** copia solo lo que va **detrás** del `$ `. Y, en general, no pegues en la terminal órdenes que no entiendes: una orden copiada de una web desconocida puede borrar o instalar lo que sea.

## 4. Buenas prácticas

- **Antes de hacer, mira**: `pwd` para saber dónde estás y `ls` para saber qué hay. Son gratis y evitan la mitad de los errores.
- **Usa el tabulador siempre**: escribe menos, se equivoca menos y te avisa de lo que no existe.
- **Recupera las órdenes con <kbd>↑</kbd>** en lugar de volver a escribirlas; corrige la errata y pulsa <kbd>Intro</kbd>.
- **Lee los mensajes**: casi siempre repiten lo que has escrito y dicen qué pasa. Con calma, como aprendiste en [«Qué es programar»](../fase-01-que-es-programar/01-que-es-programar.md#33-asustarse-con-el-primer-mensaje-de-error).
- **Antes de borrar con un comodín, `ls` con el mismo patrón.** Y prefiere `rmdir` a `rm -r` cuando la carpeta debería estar vacía.
- **Haz una copia (`cp -r`) antes de reorganizar** una carpeta que te importa.
- **Nombres sin espacios, sin tildes y en minúsculas** en tus carpetas de trabajo: te ahorrarás comillas y sustos.
- **Pide ayuda a la terminal** (`--help` o `man`; en macOS, `man`) antes que a internet: es la documentación de **tu** versión.
- **Entiende lo que pegas**: no ejecutes órdenes copiadas de webs que no conoces, y menos si empiezan por `rm` o llevan `sudo`.

**Lo que conviene evitar:**

- `rm -r` y `rm -rf` con comodines (`rm -r *`) si no has comprobado antes qué hay.
- Trabajar a ciegas durante muchas órdenes sin mirar dónde estás.
- Seguir un tutorial escrito para PowerShell en Git Bash (o al revés) sin traducir las órdenes ([apartado 1.15](#115-las-órdenes-de-powershell-para-reconocerlas)).

## 5. Ejercicios prácticos resueltos

> **💡 Consejo:** hay ejercicios de **razonar** (con papel y lápiz) y ejercicios de **teclear** en tu terminal. Para los de teclear, copia antes a tu carpeta personal la carpeta de casos que te indica el enunciado, y abre una terminal nueva: así empezarás en el mismo sitio que la solución. Si te equivocas y lo estropeas, vuelve a copiarla y empieza otra vez: para eso está.

### 🟢 Básico

#### Ejercicio 1 · Dónde estás después de cada orden

Abres una terminal, que empieza en tu carpeta personal, `/home/ana`, y escribes estas órdenes, una tras otra. Para cada una, di **en qué carpeta estás** después de ejecutarla. Todas las carpetas existen.

```text
cd proyectos
cd web-panaderia/css
cd ..
cd ../..
cd /home/ana/proyectos/web-panaderia/img
cd ../js
cd -
cd
```

<details>
<summary>Pista 1</summary>

Haz una tabla con tres columnas: la orden, de dónde partes y dónde llegas, como en la [traza de rutas](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#110-las-carpetas-especiales-punto-y-punto-punto) de 02.02. Cada `..` sube un nivel.

</details>

<details>
<summary>Pista 2</summary>

`cd -` te devuelve a la carpeta en la que estabas **justo antes** de la última orden `cd`, y `cd` sin nada, a la carpeta personal ([apartado 1.5](#15-moverse-cd)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se sigue cada orden desde la carpeta en la que te dejó la anterior. Las rutas relativas se cuentan desde ahí; la absoluta, desde la raíz.

| # | Orden | Partes de | Llegas a |
|---|---|---|---|
| 1 | `cd proyectos` | `/home/ana` | `/home/ana/proyectos` |
| 2 | `cd web-panaderia/css` | `/home/ana/proyectos` | `/home/ana/proyectos/web-panaderia/css` |
| 3 | `cd ..` | `…/web-panaderia/css` | `/home/ana/proyectos/web-panaderia` |
| 4 | `cd ../..` | `…/web-panaderia` | `/home/ana` (sube a `proyectos` y después a `ana`) |
| 5 | `cd /home/ana/proyectos/web-panaderia/img` | `/home/ana` | `/home/ana/proyectos/web-panaderia/img` (absoluta: da igual dónde estuvieras) |
| 6 | `cd ../js` | `…/web-panaderia/img` | `/home/ana/proyectos/web-panaderia/js` |
| 7 | `cd -` | `…/web-panaderia/js` | `/home/ana/proyectos/web-panaderia/img` (la anterior) |
| 8 | `cd` | `…/web-panaderia/img` | `/home/ana` |

**Lo importante:** cada orden depende de dónde te dejó la anterior, salvo la ruta absoluta (paso 5) y `cd` a secas (paso 8), que llevan siempre al mismo sitio. Si en algún momento dudas, `pwd`.

**Errores frecuentes al resolverlo:**

- En el paso 4, subir solo un nivel (`../..` son **dos**).
- En el paso 7, pensar que `cd -` sube a la carpeta padre. No: vuelve a la **anterior**, que aquí era `img`.

</details>

#### Ejercicio 2 · Primeros pasos por el club de lectura

Los ficheros de este ejercicio están en [`codigo/01-terminal-lo-basico/ejercicios/ej02-el-club-de-lectura/`](codigo/01-terminal-lo-basico/ejercicios/ej02-el-club-de-lectura/): copia la carpeta `club-lectura` a tu carpeta personal. Después, en una terminal nueva, haz esto con órdenes, en este orden:

1. Comprueba en qué carpeta estás y qué hay en ella.
2. Entra en `club-lectura` y lista lo que hay **con detalles**. ¿Qué es fichero y qué es carpeta?
3. Lista también los ficheros **ocultos**. ¿Hay alguno?
4. Entra en la carpeta `reuniones`, comprueba dónde estás y mira qué hay.
5. Pasa **directamente**, con una sola orden, a la carpeta `libros` y mira qué hay.
6. Vuelve a tu carpeta personal con la orden más corta posible y compruébalo.
7. Vuelve a `libros` sin escribir su ruta.

<details>
<summary>Pista 1</summary>

Para el paso 5: `libros` es una carpeta «hermana» de `reuniones`; sube uno y entra ([apartado 1.5](#15-moverse-cd)).

</details>

<details>
<summary>Pista 2</summary>

Para los pasos 6 y 7: hay un `cd` que no lleva nada y otro que lleva un guion.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** cada paso es una orden del módulo: `pwd` y `ls` para mirar; `ls -l` para los detalles; `ls -a` para los ocultos; `cd` con rutas relativas para moverse; `cd` a secas para ir a casa, y `cd -` para volver.

**En tu terminal** (`sesion.txt`):

```text
$ pwd
/home/alumno
$ ls
club-lectura
$ cd club-lectura
$ ls -l
total 12
drwxr-xr-x 2 alumno alumno 4096 ene 15  2026 libros
drwxr-xr-x 2 alumno alumno 4096 ene 15  2026 reuniones
-rw-r--r-- 1 alumno alumno   42 ene 15  2026 socios.csv
$ ls -a
.  ..  .config-club  libros  reuniones  socios.csv
$ cd reuniones
$ pwd
/home/alumno/club-lectura/reuniones
$ ls
2026-09.txt  2026-10.txt
$ cd ../libros
$ ls
leidos.txt  pendientes.txt
$ cd
$ pwd
/home/alumno
$ cd -
/home/alumno/club-lectura/libros
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejercicios/ej02-el-club-de-lectura/`](codigo/01-terminal-lo-basico/ejercicios/ej02-el-club-de-lectura/)

**Las respuestas:**

- **Paso 2:** `libros` y `reuniones` son **carpetas** (empiezan por `d`) y `socios.csv` es un **fichero** (empieza por `-`).
- **Paso 3:** sí, hay un fichero oculto, `.config-club`, que `ls -l` no enseñaba. Además salen `.` y `..`.
- **Paso 5:** `cd ../libros`: sube a `club-lectura` y entra en `libros`.
- **Paso 6:** `cd` sin nada.
- **Paso 7:** `cd -`, que además escribe la carpeta a la que vuelve.

**Errores frecuentes al resolverlo:**

- Escribir `cd libros` desde `reuniones`: `libros` no está **dentro** de `reuniones`, sino al lado (la terminal diría que no existe).
- Usar `cd ..` en el paso 6: desde `libros` solo subes a `club-lectura`, no a tu carpeta personal.
- No copiar antes la carpeta a tu carpeta personal: la primera orden `cd club-lectura` fallaría.

</details>

#### Ejercicio 3 · Qué hace cada opción

Sin ejecutar nada, explica qué hace cada orden y en qué se diferencia de la de al lado:

1. `ls` frente a `ls -a`
2. `ls -l` frente a `ls -lh`
3. `mkdir a/b/c` frente a `mkdir -p a/b/c` (en una carpeta vacía)
4. `cp fotos copia` frente a `cp -r fotos copia` (`fotos` es una carpeta)
5. `rm notas` frente a `rm -r notas` (`notas` es una carpeta con ficheros dentro)
6. `grep madrid clientes.txt` frente a `grep -i madrid clientes.txt`
7. `head -n 5 ventas.csv` frente a `tail -n 5 ventas.csv`

<details>
<summary>Pista 1</summary>

Recuerda de dónde vienen las letras: `a` de *all*, `h` de *human*, `p` de *parents*, `r` de *recursive*, `i` de *ignore case*.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** cada opción cambia **cómo** trabaja la orden ([apartado 1.2](#12-cómo-se-escribe-una-orden)); el nombre en inglés de la letra suele decir qué hace.

1. `ls` lista lo que hay, **sin** los ficheros ocultos; `ls -a` lista **todo**, también los que empiezan por punto, y las carpetas especiales `.` y `..`.
2. Las dos dan la lista larga, con detalles; `-h` escribe los tamaños **legibles** (`49K` en lugar de `49669`).
3. `mkdir a/b/c` **falla**, porque `a` y `a/b` no existen y `mkdir` solo crea el último nivel; `mkdir -p a/b/c` crea las tres, una dentro de otra.
4. `cp fotos copia` **se niega** a copiar una carpeta; `cp -r fotos copia` la copia entera, con todo lo de dentro.
5. `rm notas` **se niega** («Es un directorio»); `rm -r notas` borra la carpeta con todo lo que tiene, **sin papelera** y sin preguntar.
6. `grep madrid` solo encuentra `madrid` en minúsculas; con `-i` encuentra también `Madrid` y `MADRID`.
7. `head -n 5` escribe las **5 primeras** líneas; `tail -n 5`, las **5 últimas**.

**Lo importante:** fíjate en que en los casos 3, 4 y 5 la orden **sin** la opción se niega a hacer algo que puede ser grande o peligroso. Las opciones `-p` y `-r` son la forma de decir «sí, eso es lo que quiero».

**Errores frecuentes al resolverlo:**

- Pensar que `-h` en `ls` es la ayuda (*help*). En `ls`, la ayuda es `--help`, con dos guiones y la palabra entera (en macOS, `man ls`).
- Creer que `rm notas`, al negarse, ha borrado algo. No ha borrado nada.

</details>

### 🟡 Intermedio

#### Ejercicio 4 · La estructura de la web de una academia de baile

Una academia de baile te encarga su web. Empezando en tu carpeta personal, crea con el **menor número de órdenes** que puedas esta estructura (los ficheros, vacíos):

```text
web-academia-baile/
├── index.html
├── css/
│   └── estilos.css
├── img/
└── paginas/
    ├── horarios.html
    └── precios.html
```

Después, compruébala con una sola orden que enseñe todas las carpetas y lo que tienen dentro. Puedes hacerlo en cualquier carpeta; si quieres empezar en el mismo sitio que la solución, abre una terminal nueva (empieza en tu carpeta personal).

<details>
<summary>Pista 1</summary>

`mkdir -p` acepta varias rutas a la vez, y crea las carpetas padre que falten ([apartado 1.6](#16-crear-carpetas-y-ficheros-mkdir-y-touch)).

</details>

<details>
<summary>Pista 2</summary>

`touch` también acepta varios ficheros, cada uno con su ruta. Y para ver toda la estructura, `ls` tiene una opción recursiva.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero las carpetas, todas de una vez con `mkdir -p` (crea también `web-academia-baile`, que es la carpeta padre de las tres); después se entra en el proyecto y se crean los ficheros con `touch`, con rutas relativas; y al final se comprueba con `ls -R`.

**En tu terminal** (`sesion.txt`):

```text
$ mkdir -p web-academia-baile/css web-academia-baile/img web-academia-baile/paginas
$ cd web-academia-baile
$ touch index.html css/estilos.css paginas/horarios.html paginas/precios.html
$ ls -R
.:
css  img  index.html  paginas

./css:
estilos.css

./img:

./paginas:
horarios.html  precios.html
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejercicios/ej04-la-estructura-de-una-web/`](codigo/01-terminal-lo-basico/ejercicios/ej04-la-estructura-de-una-web/)

**En qué fijarte:** el resultado de `ls -R` coincide con el dibujo del enunciado: `index.html` arriba, `estilos.css` en `css`, los dos `.html` en `paginas` e `img` vacía. Son tres órdenes de trabajo y una de comprobación.

**Otras soluciones válidas:** `mkdir web-academia-baile` y luego, ya dentro, `mkdir css img paginas` (una orden más). O, sin entrar en la carpeta, `touch web-academia-baile/index.html web-academia-baile/css/estilos.css …`: funciona igual, pero las rutas son más largas. Si tu estructura final es la misma, está bien.

**Errores frecuentes al resolverlo:**

- `mkdir web-academia-baile/css` **sin** `-p` cuando `web-academia-baile` aún no existe: falla.
- Hacer `touch` antes de crear las carpetas: `touch css/estilos.css` no crea la carpeta `css`, y se queja de que no existe.
- Hacer `touch` desde la carpeta personal con rutas pensadas para dentro del proyecto: los ficheros no se crean donde querías (o falla, porque `css` no existe ahí).

</details>

#### Ejercicio 5 · Ordena los apuntes

Los ficheros de este ejercicio están en [`codigo/01-terminal-lo-basico/ejercicios/ej05-ordena-los-apuntes/`](codigo/01-terminal-lo-basico/ejercicios/ej05-ordena-los-apuntes/): copia la carpeta `apuntes` a tu carpeta personal. Dentro hay esto:

```text
apuntes/
├── copia de tema2.txt
├── resumen.txt
├── tema1-borrador.txt
├── tema1.txt
└── tema2.txt
```

Desde tu carpeta personal, en una terminal nueva:

1. **Antes de nada**, haz una copia de seguridad de toda la carpeta, llamada `apuntes-copia`.
2. Dentro de `apuntes`, crea una carpeta `temas` y mueve allí `tema1.txt` y `tema2.txt`.
3. Cambia el nombre de `resumen.txt` a `resumen-final.txt`.
4. Borra el borrador del tema 1 y la copia del tema 2, que sobran.
5. Comprueba cómo ha quedado `apuntes` y `temas`, y que en tu carpeta personal siguen estando las dos carpetas.

<details>
<summary>Pista 1</summary>

Para copiar una carpeta entera hace falta una opción de `cp`. Para renombrar, la misma orden que para mover ([apartado 1.7](#17-copiar-mover-y-renombrar-cp-y-mv)).

</details>

<details>
<summary>Pista 2</summary>

Uno de los ficheros que hay que borrar tiene espacios en el nombre ([apartado 1.14](#114-comodines-y-comillas)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero la copia de seguridad, **antes** de cambiar nada (con `cp -r`, porque es una carpeta); después se entra en `apuntes` y se va paso a paso: `mkdir`, `mv` con varios orígenes y la carpeta al final, `mv` para renombrar y `rm` para borrar, con comillas en el nombre con espacios. Al final, `ls` para comprobar.

**En tu terminal** (`sesion.txt`):

```text
$ cp -r apuntes apuntes-copia
$ cd apuntes
$ ls
'copia de tema2.txt'   resumen.txt   tema1-borrador.txt   tema1.txt   tema2.txt
$ mkdir temas
$ mv tema1.txt tema2.txt temas
$ mv resumen.txt resumen-final.txt
$ rm tema1-borrador.txt
$ rm "copia de tema2.txt"
$ ls
resumen-final.txt  temas
$ ls temas
tema1.txt  tema2.txt
$ cd ..
$ ls
apuntes  apuntes-copia
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejercicios/ej05-ordena-los-apuntes/`](codigo/01-terminal-lo-basico/ejercicios/ej05-ordena-los-apuntes/)

**En qué fijarte:**

- La primera `ls` escribe `'copia de tema2.txt'` **entre comillas simples**: es la forma en que `ls` te avisa de que ese nombre tiene espacios (las comillas no forman parte del nombre). En otros sistemas puede que `ls` no las ponga.
- `rm "copia de tema2.txt"` lleva comillas. Sin ellas, `rm` intentaría borrar tres ficheros (`copia`, `de` y `tema2.txt`)… y el tercero **existe**, aunque ya en otra carpeta. Aquí, como `tema2.txt` ya estaba en `temas`, solo habría dado error; si lo hubieras hecho antes del paso 2, habrías borrado el tema 2 de verdad.
- La copia, `apuntes-copia`, sigue teniendo todo como estaba al principio: si algo sale mal, ahí está.

**Errores frecuentes al resolverlo:**

- Hacer la copia de seguridad al final (ya no sirve de nada) o con `cp` sin `-r`.
- `mv tema1.txt tema2.txt temas` **antes** de crear `temas`: `mv` se queja, porque con varios orígenes el destino tiene que ser una carpeta que exista.
- Olvidar las comillas en el nombre con espacios.

</details>

#### Ejercicio 6 · Encuentra el error en cada orden

Cada una de estas personas ha escrito una orden que no hace lo que quería. Explica **qué pasa** y escribe la orden correcta. Todas están en la carpeta adecuada salvo que se diga otra cosa.

1. Lucía quiere entrar en la carpeta `Mis Documentos` y escribe `cd Mis Documentos`.
2. Pablo quiere borrar la carpeta `pruebas`, que tiene ficheros dentro, y escribe `rmdir pruebas`.
3. Elena quiere crear `src/estilos` en un proyecto vacío y escribe `mkdir src/estilos`.
4. Jorge quiere ver las 3 últimas líneas de `registro.log` y escribe `tail -3n registro.log`.
5. Marta quiere copiar la carpeta `web` como `web-copia` y escribe `cp web web-copia`.
6. Iván quiere buscar «Sevilla» en `clientes.csv`, donde a veces está escrito «SEVILLA», y escribe `grep Sevilla clientes.csv`.
7. Nuria copia de una guía `$ ls -l` y lo pega tal cual.
8. Raúl está en `/home/raul/proyectos/web/css` y quiere ir a `/home/raul/proyectos/web/img`. Escribe `cd img`.

<details>
<summary>Pista 1</summary>

Repasa los [errores típicos](#3-errores-típicos): varios de estos están ahí.

</details>

<details>
<summary>Pista 2</summary>

En el caso 4, compara con la forma de `-n` que has visto en el [apartado 1.9](#19-ver-qué-hay-dentro-de-un-fichero-cat-less-head-y-tail): primero la opción, después el número.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** para cada caso se pregunta qué recibe la orden de verdad (cuántas piezas, qué opciones) y qué hace con eso, con las reglas del [apartado 1.2](#12-cómo-se-escribe-una-orden).

| # | Qué pasa | Orden correcta |
|---|---|---|
| 1 | El espacio separa: `cd` recibe `Mis` y `Documentos` y dice «demasiados argumentos» | `cd "Mis Documentos"` |
| 2 | `rmdir` solo borra carpetas **vacías**: se niega | `ls pruebas` para ver qué hay y, si se puede borrar todo, `rm -r pruebas` |
| 3 | `src` no existe y `mkdir` solo crea el último nivel: falla | `mkdir -p src/estilos` |
| 4 | `-3n` no es una opción válida de `tail`: lo que va después de `-n` es el número | `tail -n 3 registro.log` |
| 5 | `cp` sin `-r` no copia carpetas: se niega | `cp -r web web-copia` |
| 6 | `grep` distingue mayúsculas: no encuentra `SEVILLA` | `grep -i Sevilla clientes.csv` |
| 7 | El `$` es el indicador: bash busca una orden llamada `$` y no la encuentra | `ls -l` (sin el `$ `) |
| 8 | `img` no está dentro de `css`, sino al lado: `cd` dice que no existe | `cd ../img` |

**Lo importante:** en 2, 3 y 5, la orden **no ha hecho nada malo**: se ha negado y lo ha dicho. Es mucho mejor que el caso contrario, cuando una orden hace algo que no querías sin decir nada (como `mkdir Mis apuntes`, que crea dos carpetas en silencio).

**Errores frecuentes al resolverlo:**

- En el caso 2, proponer `rm -r pruebas` sin mirar antes qué hay dentro.
- En el caso 4, pensar que da igual el orden de letras y números en las opciones. Algunas órdenes lo aceptan, pero no puedes contar con ello: escríbelo como dice la ayuda.

</details>

### 🔴 Avanzado

#### Ejercicio 7 · Los pedidos de la tienda

Los ficheros de este ejercicio están en [`codigo/01-terminal-lo-basico/ejercicios/ej07-los-pedidos-de-la-tienda/`](codigo/01-terminal-lo-basico/ejercicios/ej07-los-pedidos-de-la-tienda/): copia las carpetas `pedidos` y `gestion` a tu carpeta personal. Llevas una pequeña tienda en línea de cerámica y papelería, y en `pedidos` tienes un fichero CSV por mes (`2026-09.csv`, `2026-10.csv`, `2026-11.csv`), con una línea por pedido. Contesta a estas preguntas con órdenes, **sin abrir ningún fichero en el editor** y sin moverte de tu carpeta personal:

1. ¿Qué ficheros de pedidos tienes?
2. ¿Qué columnas tienen los ficheros? (Están en la primera línea.)
3. ¿Cuáles son los dos últimos pedidos de noviembre?
4. ¿En qué meses ha comprado Lucía Martín, y qué?
5. ¿Cuántos pedidos llevan una taza? Ojo: en algún pedido está escrito «TAZA», en mayúsculas.
6. En algún sitio dentro de `gestion` hay un fichero `devoluciones.txt`. ¿Dónde?

<details>
<summary>Pista 1</summary>

Para 2 y 3, `head` y `tail` con `-n`. Para 4 y 5, `grep` con el comodín `*.csv` para mirar los tres meses a la vez ([apartado 1.10](#110-buscar-grep-y-find)).

</details>

<details>
<summary>Pista 2</summary>

En el 4, el nombre lleva un espacio. En el 5, hay una opción de `grep` para no distinguir mayúsculas, y otra que te dice en qué línea está cada resultado.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** cada pregunta se traduce a una orden de este módulo. Como no te mueves de la carpeta personal, las rutas empiezan por `pedidos/`. Para buscar en los tres meses a la vez, el comodín `pedidos/*.csv`, que bash cambia por los tres ficheros.

**En tu terminal** (`sesion.txt`):

```text
$ ls pedidos
2026-09.csv  2026-10.csv  2026-11.csv
$ head -n 1 pedidos/2026-09.csv
pedido,fecha,cliente,producto,importe
$ tail -n 2 pedidos/2026-11.csv
108,2026-11-04,Pedro Vidal,Cuaderno,9.90
109,2026-11-06,Ana Torres,Taza de cerámica,12.50
$ grep "Lucía Martín" pedidos/*.csv
pedidos/2026-09.csv:101,2026-09-03,Lucía Martín,Taza de cerámica,12.50
pedidos/2026-11.csv:107,2026-11-01,Lucía Martín,Lámina A4,18.00
$ grep -i -n "taza" pedidos/*.csv
pedidos/2026-09.csv:2:101,2026-09-03,Lucía Martín,Taza de cerámica,12.50
pedidos/2026-10.csv:3:105,2026-10-14,Nuria Gil,TAZA grande,15.00
pedidos/2026-11.csv:4:109,2026-11-06,Ana Torres,Taza de cerámica,12.50
$ find gestion -name "devoluciones.txt"
gestion/2026/otono/devoluciones.txt
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejercicios/ej07-los-pedidos-de-la-tienda/`](codigo/01-terminal-lo-basico/ejercicios/ej07-los-pedidos-de-la-tienda/)

**Las respuestas:**

1. Tres ficheros: septiembre, octubre y noviembre de 2026.
2. `pedido`, `fecha`, `cliente`, `producto` e `importe`.
3. El 108 (Pedro Vidal, un cuaderno) y el 109 (Ana Torres, una taza de cerámica).
4. En **septiembre** (una taza de cerámica, pedido 101) y en **noviembre** (una lámina A4, pedido 107): lo dicen los nombres de fichero delante de cada línea. El nombre va entre comillas porque tiene un espacio.
5. **Tres**: uno por mes. Sin `-i`, `grep taza` no habría encontrado ninguno, porque en los ficheros pone `Taza` y `TAZA`. Con `-n`, además, sabes en qué línea de cada fichero está.
6. En `gestion/2026/otono/devoluciones.txt`, dos carpetas por debajo de `gestion`. Se busca en `gestion` y no en `.` porque el enunciado dice dónde está, y porque desde la carpeta personal `find .` recorrería todas tus carpetas ([apartado 1.10](#110-buscar-grep-y-find)).

**Por qué esta forma:** en una tienda de verdad, cada fichero tendría cientos de líneas, y abrirlos uno a uno para buscar a una clienta sería lentísimo. Con `grep`, la respuesta sale en un segundo, tenga el fichero 10 líneas o 100 000. En el [módulo siguiente](02-terminal-sacarle-partido.md#15-tuberías-la-salida-de-una-orden-es-la-entrada-de-otra) aprenderás a **contar** los resultados y a encadenar órdenes (por ejemplo, para saber cuántos pedidos ha hecho cada cliente).

**Errores frecuentes al resolverlo:**

- `grep Lucía Martín pedidos/*.csv`, sin comillas: `grep` buscaría `Lucía` en un fichero llamado `Martín`, que no existe.
- Olvidar la ruta (`grep taza *.csv` desde la carpeta personal): no hay ningún `.csv` ahí, sino dentro de `pedidos`.
- Contar con el ojo las líneas de `head` sin `-n`: escribiría 10 líneas, y el fichero solo tiene 4.

</details>

#### Ejercicio 8 · Qué ficheros selecciona cada comodín

En una carpeta hay estos siete ficheros:

```text
fotos-2026.zip
informe-1.pdf
informe-2.pdf
informe-10.pdf
informe-final.docx
notas-2025-12.txt
notas-2026-01.txt
```

**Primero razona, sin ejecutar nada:** ¿qué ficheros selecciona cada uno de estos patrones?

1. `*.pdf`
2. `informe-?.pdf`
3. `*2026*`
4. `informe*`
5. `notas-????-??.txt`
6. `*.PDF`

**Después**, comprueba los cuatro primeros en tu terminal: los ficheros están en [`codigo/01-terminal-lo-basico/ejercicios/ej08-que-ficheros-selecciona/`](codigo/01-terminal-lo-basico/ejercicios/ej08-que-ficheros-selecciona/); cópialos a tu carpeta personal (los ficheros, no la carpeta).

<details>
<summary>Pista 1</summary>

`*` es **cualquier texto, también ninguno**; `?` es **exactamente un** carácter ([apartado 1.14](#114-comodines-y-comillas)). Prueba cada nombre contra el patrón, letra a letra.

</details>

<details>
<summary>Pista 2</summary>

En el 2, ¿cuántos caracteres hay entre `informe-` y `.pdf` en `informe-10.pdf`? En el 6, recuerda que en los comodines las mayúsculas cuentan: los compara bash (o zsh), letra a letra.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se compara cada nombre con el patrón de izquierda a derecha: el texto fijo tiene que coincidir exactamente; `*` puede tragarse cualquier cosa (o nada) y `?`, un solo carácter.

| # | Patrón | Selecciona | Por qué |
|---|---|---|---|
| 1 | `*.pdf` | `informe-1.pdf`, `informe-10.pdf`, `informe-2.pdf` | Los tres que terminan en `.pdf` |
| 2 | `informe-?.pdf` | `informe-1.pdf`, `informe-2.pdf` | En `informe-10.pdf` hay **dos** caracteres (`10`), y `?` es uno |
| 3 | `*2026*` | `fotos-2026.zip`, `notas-2026-01.txt` | Los que tienen `2026` en cualquier sitio |
| 4 | `informe*` | Los tres PDF e `informe-final.docx` | Todo lo que empieza por `informe`, termine como termine |
| 5 | `notas-????-??.txt` | `notas-2025-12.txt`, `notas-2026-01.txt` | Cuatro caracteres (el año), un guion y dos (el mes) |
| 6 | `*.PDF` | Ninguno | Las mayúsculas cuentan: `.pdf` no es `.PDF`. bash deja el patrón tal cual y `ls` dice que no existe (en zsh, `no matches found`) |

**La comprobación:**

**En tu terminal** (`sesion.txt`):

```text
$ ls
fotos-2026.zip  informe-1.pdf  informe-final.docx  notas-2026-01.txt
informe-10.pdf  informe-2.pdf  notas-2025-12.txt
$ ls *.pdf
informe-10.pdf  informe-1.pdf  informe-2.pdf
$ ls informe-?.pdf
informe-1.pdf  informe-2.pdf
$ ls *2026*
fotos-2026.zip  notas-2026-01.txt
$ ls informe*
informe-10.pdf  informe-1.pdf  informe-2.pdf  informe-final.docx
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejercicios/ej08-que-ficheros-selecciona/`](codigo/01-terminal-lo-basico/ejercicios/ej08-que-ficheros-selecciona/)

**En qué fijarte:** el orden. `informe-10.pdf` sale **antes** que `informe-2.pdf`, porque se ordenan como texto, letra a letra, no como números: `1` va antes que `2`, y lo que viene después no importa. (Que aquí salga incluso antes que `informe-1.pdf` es porque, en un sistema en español, `ls` no tiene en cuenta los guiones ni los puntos al ordenar: compara `informe10pdf` con `informe1pdf`, y el `0` va antes que la `p`. En otros sistemas, `informe-1.pdf` sale el primero.) Es la razón por la que, cuando numeres ficheros, conviene usar siempre el mismo número de cifras (`informe-01`, `informe-02`… `informe-10`), como las fotos del [ejemplo 2.8](#28-comodines-y-comillas-con-las-fotos-de-un-viaje).

**Errores frecuentes al resolverlo:**

- Pensar que `?` puede ser «uno o más» caracteres: es exactamente uno.
- Pensar que `*.pdf` también encuentra `informe-final.docx` porque empieza por `informe`: el patrón exige que **termine** en `.pdf`.
- En el 6, contestar «los tres PDF»: eso pasaría en Windows con otras herramientas, pero en bash las mayúsculas cuentan.

</details>

### 🏆 Caso real

#### Ejercicio 9 · El portfolio de Marta

**Situación real:** Marta es fotógrafa y ha empezado su web, un *portfolio*, pero lo tiene todo suelto en una carpeta. Los ficheros están en [`codigo/01-terminal-lo-basico/ejercicios/ej09-el-portfolio-de-marta/`](codigo/01-terminal-lo-basico/ejercicios/ej09-el-portfolio-de-marta/): copia la carpeta `portfolio` a tu carpeta personal. Dentro hay:

```text
portfolio/
├── borrador-index.html
├── estilos.css
├── foto-boda.jpg
├── foto-paisaje.jpg
├── foto-retrato.jpg
├── index.html
└── notas.txt
```

Te pide que lo dejes ordenado como una web de verdad, **desde la terminal**, y sin perder nada por el camino:

1. Antes de tocar nada, una **copia de seguridad** de todo, `portfolio-copia`.
2. Las hojas de estilo en una carpeta `css` y las fotos en una carpeta `img`.
3. Marta cree que `borrador-index.html` ya no sirve, pero no está segura: **míralo** antes y, si es un borrador viejo, bórralo.
4. En `notas.txt` ha ido apuntando cosas, y las que le quedan por hacer empiezan por `PENDIENTE`. Sácale la lista de lo pendiente, con su número de línea.
5. Comprueba con una sola orden cómo queda toda la estructura.

<details>
<summary>Pista 1</summary>

Para mover las tres fotos con una orden, puedes escribirlas una a una o usar un comodín ([apartado 1.14](#114-comodines-y-comillas)). Para crear las dos carpetas, `mkdir` acepta varias.

</details>

<details>
<summary>Pista 2</summary>

Para «mirar antes de borrar» un fichero corto, `cat`. Para sacar las líneas que contienen una palabra, `grep`, con la opción que pone el número de línea.

</details>

<details>
<summary>Pista 3</summary>

Ojo con el `index.html`: tiene que quedarse **arriba**, en `portfolio`, porque es la página principal de la web. Si sus rutas apuntan a `img/foto-retrato.jpg` y a `css/estilos.css` (puedes comprobarlo con `cat index.html`), la estructura tiene que coincidir con esas rutas relativas ([02.02, apartado 1.9](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#19-la-carpeta-actual-y-las-rutas-relativas)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se sigue el orden seguro de cualquier reorganización: **copia**, **mira**, **haz**, **comprueba**. Primero `cp -r` desde la carpeta personal; después se entra en `portfolio`, se crean las dos carpetas a la vez y se mueve cada fichero a la suya; el borrador se mira con `cat` antes de borrarlo con `rm`; `grep -n` saca lo pendiente; y `ls -R` enseña la estructura final.

**En tu terminal** (`sesion.txt`):

```text
$ cp -r portfolio portfolio-copia
$ cd portfolio
$ ls
borrador-index.html  foto-boda.jpg     foto-retrato.jpg  notas.txt
estilos.css          foto-paisaje.jpg  index.html
$ mkdir css img
$ mv estilos.css css
$ mv foto-boda.jpg foto-retrato.jpg foto-paisaje.jpg img
$ cat borrador-index.html
<h1>Marta Ruiz</h1>
<p>Borrador</p>
$ rm borrador-index.html
$ grep -n PENDIENTE notas.txt
2:PENDIENTE: pedir permiso a los novios para la foto de la boda
4:PENDIENTE: escribir la página de contacto
$ ls -R
.:
css  img  index.html  notas.txt

./css:
estilos.css

./img:
foto-boda.jpg  foto-paisaje.jpg  foto-retrato.jpg
```

📁 **Código:** [`codigo/01-terminal-lo-basico/ejercicios/ej09-el-portfolio-de-marta/`](codigo/01-terminal-lo-basico/ejercicios/ej09-el-portfolio-de-marta/)

**Lo que le dirías a Marta:**

- **La web está ordenada:** `index.html` arriba, `estilos.css` en `css` y las tres fotos en `img`. Las rutas que usa `index.html` (`css/estilos.css` e `img/foto-retrato.jpg`) son relativas a la carpeta `portfolio`, así que ahora **sí** encuentran sus ficheros.
- **El borrador era viejo**: dos líneas con «Borrador», nada que no esté en `index.html`. Borrado. (Y si te hubieras equivocado, está en `portfolio-copia`.)
- **Le quedan dos cosas pendientes**: pedir permiso a los novios para la foto de la boda (línea 2 de las notas) y escribir la página de contacto (línea 4).

**Otras soluciones válidas:** mover las fotos con un comodín, `mv *.jpg img`, es igual de bueno (y mejor si fueran 200 fotos). Comprueba antes con `ls *.jpg` que selecciona solo las fotos.

**Por qué esta forma:** con el ratón habrías hecho lo mismo, pero con la terminal cada paso queda **escrito**: puedes repasarlo, enseñárselo a Marta o repetirlo la próxima vez que te pase una carpeta así. Y la copia del principio convierte cualquier error en un susto sin consecuencias.

**Errores frecuentes al resolverlo:**

- Mover también `index.html` a una carpeta: la web dejaría de encontrar sus estilos y fotos.
- Borrar el borrador sin mirarlo.
- Hacer `mv *.jpg img` **antes** de crear `img`: con varios ficheros y un destino que no existe, `mv` se queja y no mueve nada (con un solo fichero, lo habría **renombrado** a `img`, un error más difícil de ver).
- Hacer la copia de seguridad desde dentro de `portfolio` (`cp -r portfolio portfolio-copia` desde ahí falla: `portfolio` no está dentro de sí misma).

</details>

## 6. Chuleta

### Cómo es una orden

```text
nombre  -opciones  argumentos       ls -lh img
```

- Opciones cortas con un guion (`-l`), que se pueden juntar (`-lah`); largas, con dos (`--help`).
- El espacio separa las piezas; un nombre con espacios va entre comillas.
- Las mayúsculas cuentan. El `$` de las sesiones del curso no se escribe.

### Mirar y moverse

| Orden | Qué hace |
|---|---|
| `pwd` | Escribe la ruta de la carpeta actual |
| `ls` / `ls carpeta` | Lista la carpeta actual / esa carpeta |
| `ls -l` · `-a` · `-h` · `-R` | Con detalles · con ocultos · tamaños legibles · con las subcarpetas |
| `cd carpeta` | Entra en una carpeta (ruta relativa o absoluta) |
| `cd ..` · `cd ../otra` | Sube un nivel · pasa a una carpeta hermana |
| `cd` o `cd ~` | Va a tu carpeta personal |
| `cd -` | Vuelve a la carpeta anterior |
| `explorer .` · `open .` · `xdg-open .` | Abre la carpeta actual en el explorador (Git Bash · macOS · Linux) |

### Crear, copiar, mover y borrar

| Orden | Qué hace |
|---|---|
| `mkdir a b` · `mkdir -p a/b/c` | Crea carpetas · crea también las carpetas padre que falten |
| `touch fichero` | Crea un fichero vacío (o le pone la fecha de ahora) |
| `cp origen destino` · `cp -r carpeta copia` | Copia un fichero · una carpeta entera |
| `mv origen destino` | Mueve, o renombra si el destino no es una carpeta |
| `rm fichero` · `rm -r carpeta` | Borra un fichero · una carpeta con todo (**sin papelera**) |
| `rmdir carpeta` | Borra una carpeta solo si está vacía |
| `-i` (en `cp`, `mv`, `rm`) | Pregunta antes de sustituir o borrar |

### Ver y buscar

| Orden | Qué hace |
|---|---|
| `cat fichero` | Escribe el fichero entero |
| `less fichero` | Lo enseña página a página (<kbd>Espacio</kbd> avanza, <kbd>/</kbd> busca, <kbd>Q</kbd> sale) |
| `head -n 5 fichero` · `tail -n 5 fichero` | Las 5 primeras · las 5 últimas líneas (sin `-n`, 10) |
| `grep texto fichero` | Las líneas que contienen el texto (`-i` sin mayúsculas, `-n` con número de línea) |
| `find carpeta -name "nombre"` | Busca ficheros por su nombre en esa carpeta y en las de dentro (`.`: desde aquí) |
| `echo texto` | Escribe el texto (y enseña cómo entiende bash lo que escribes) |

### Ayuda y trucos

| Qué | Cómo |
|---|---|
| Ayuda de una orden | `orden --help` (no en muchas de macOS); `man orden` (no en Git Bash); `help cd` para las de bash (en zsh, `man zshbuiltins`) |
| Autocompletar | <kbd>Tab</kbd> (dos veces: ver las opciones) |
| Historial | <kbd>↑</kbd> y <kbd>↓</kbd>; buscar con <kbd>Ctrl</kbd>+<kbd>R</kbd> |
| Parar una orden | <kbd>Ctrl</kbd>+<kbd>C</kbd> (en `less` y `man`, <kbd>Q</kbd>) |
| Limpiar la pantalla | `clear` o <kbd>Ctrl</kbd>+<kbd>L</kbd> |
| Escribir una ruta sin errores | Arrastra el fichero o la carpeta a la ventana de la terminal |
| Copiar y pegar | Linux: <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>C</kbd> / <kbd>V</kbd> · macOS: <kbd>Cmd</kbd>+<kbd>C</kbd> / <kbd>V</kbd> · Git Bash: seleccionar copia, <kbd>Mayús</kbd>+<kbd>Insert</kbd> pega |

### Comodines y comillas

| Escribes | Significa |
|---|---|
| `*` | Cualquier texto, también ninguno: `*.jpg`, `informe*`, `*2026*` |
| `?` | Exactamente un carácter: `foto-0?.jpg` |
| `"Mis fotos"` o `Mis\ fotos` | Un nombre con espacios, como una sola pieza |
| `"*.txt"` | El patrón tal cual, sin cambiarlo por los ficheros |

### Antes de borrar

1. `pwd`: ¿estoy donde creo?
2. `ls` con **el mismo patrón** que vas a borrar: ¿es eso lo que quiero borrar?
3. ¿Tengo copia? Si no, `cp -r`.
4. Lee la orden entera, espacio a espacio, y entonces <kbd>Intro</kbd>.

### PowerShell y cmd, para reconocerlas

| bash | PowerShell | cmd |
|---|---|---|
| `pwd` · `ls` · `cd` | `Get-Location` · `Get-ChildItem` · `Set-Location` | `cd` · `dir` · `cd` |
| `cp` · `mv` · `rm` | `Copy-Item` · `Move-Item` · `Remove-Item` | `copy` · `move` · `del` |
| `cat` · `grep` · `clear` | `Get-Content` · `Select-String` · `Clear-Host` | `type` · `findstr` · `cls` |

## 7. Preguntas de repaso

1. ¿Qué tres partes puede tener una orden? Pon un ejemplo con las tres.

   <details>
   <summary>Ver respuesta</summary>

   El nombre de la orden (qué programa se ejecuta), las opciones (cómo trabaja, empiezan por guion) y los argumentos (sobre qué trabaja). Por ejemplo, `ls -l web-panaderia`: `ls` es el nombre, `-l` la opción y `web-panaderia` el argumento. Lo tienes en [1.2. Cómo se escribe una orden](#12-cómo-se-escribe-una-orden).

   </details>

2. ¿Qué es la carpeta actual de la terminal y cómo la averiguas?

   <details>
   <summary>Ver respuesta</summary>

   La carpeta en la que «estás»: en ella se buscan los ficheros que nombras sin ruta y desde ella se cuentan las rutas relativas. Al abrir la terminal es tu carpeta personal. La averiguas con `pwd`, que escribe su ruta absoluta, o mirando el indicador, que la muestra abreviada. Lo tienes en [1.3. Dónde estás: el indicador y la carpeta actual](#13-dónde-estás-el-indicador-y-la-carpeta-actual).

   </details>

3. ¿Qué te enseña `ls -la` que no te enseña `ls`? ¿Cómo distingues en él una carpeta de un fichero?

   <details>
   <summary>Ver respuesta</summary>

   Con `-l`, una línea por elemento con detalles (tamaño, fecha, permisos); con `-a`, también los ficheros ocultos y las carpetas especiales `.` y `..`. Las carpetas son las líneas que empiezan por `d`, y los ficheros normales, las que empiezan por `-`. Lo tienes en [1.4. Qué hay aquí: ls](#14-qué-hay-aquí-ls).

   </details>

4. Estás en `/home/ana/proyectos/web/css`. ¿Dónde te llevan `cd ..`, `cd ../img`, `cd` y `cd -`?

   <details>
   <summary>Ver respuesta</summary>

   `cd ..` a `/home/ana/proyectos/web`; `cd ../img` a `/home/ana/proyectos/web/img`; `cd` a tu carpeta personal, `/home/ana`; y `cd -` a la carpeta en la que estabas antes de la última orden `cd`. Lo tienes en [1.5. Moverse: cd](#15-moverse-cd).

   </details>

5. ¿Para qué sirve la opción `-p` de `mkdir`?

   <details>
   <summary>Ver respuesta</summary>

   Para crear también las carpetas padre que falten en la ruta (`mkdir -p a/b/c` crea las tres) y para que no se queje si la carpeta ya existe. Lo tienes en [1.6. Crear carpetas y ficheros: mkdir y touch](#16-crear-carpetas-y-ficheros-mkdir-y-touch).

   </details>

6. ¿Cómo se renombra un fichero en la terminal? ¿Qué pasa si el nuevo nombre ya existía?

   <details>
   <summary>Ver respuesta</summary>

   Con `mv nombre-viejo nombre-nuevo`: renombrar es mover a la misma carpeta con otro nombre. Si ya existía un fichero con el nombre nuevo, `mv` lo sustituye sin preguntar y su contenido se pierde (salvo que uses `mv -i`). Lo tienes en [1.7. Copiar, mover y renombrar: cp y mv](#17-copiar-mover-y-renombrar-cp-y-mv) y en [3.4. Sobrescribir un fichero sin darte cuenta](#34-sobrescribir-un-fichero-sin-darte-cuenta).

   </details>

7. ¿Qué diferencia hay entre `rmdir carpeta` y `rm -r carpeta`? ¿Cuál es más segura y por qué?

   <details>
   <summary>Ver respuesta</summary>

   `rmdir` solo borra la carpeta si está vacía; `rm -r` la borra con todo lo que tenga dentro, sin preguntar y sin papelera. Es más segura `rmdir`: si te equivocas de carpeta y tiene algo, se niega y no pierdes nada. Lo tienes en [1.8. Borrar sin papelera: rm y rmdir](#18-borrar-sin-papelera-rm-y-rmdir).

   </details>

8. Quieres ver las últimas líneas de un registro de miles de líneas, y después recorrerlo entero con calma. ¿Qué órdenes usas? ¿Cómo sales de la segunda?

   <details>
   <summary>Ver respuesta</summary>

   `tail` (o `tail -n 20`, por ejemplo) para las últimas líneas, y `less` para recorrerlo página a página. De `less` se sale con la tecla <kbd>Q</kbd>. Lo tienes en [1.9. Ver qué hay dentro de un fichero: cat, less, head y tail](#19-ver-qué-hay-dentro-de-un-fichero-cat-less-head-y-tail).

   </details>

9. ¿Qué diferencia hay entre `grep` y `find`?

   <details>
   <summary>Ver respuesta</summary>

   `grep` busca un **texto dentro** de los ficheros y escribe las líneas que lo contienen; `find` busca **ficheros por su nombre** dentro de las carpetas y escribe sus rutas. Lo tienes en [1.10. Buscar: grep y find](#110-buscar-grep-y-find).

   </details>

10. ¿Cómo pides ayuda sobre una orden a la propia terminal? ¿Qué cambia en Git Bash y en macOS?

    <details>
    <summary>Ver respuesta</summary>

    Con `orden --help`, que escribe un resumen de su uso y sus opciones, o con `man orden`, que abre su página del manual (se sale con <kbd>Q</kbd>). En Git Bash no viene `man`, así que se usa `--help`; en macOS, al revés: muchas órdenes no entienden `--help`, y se usa `man`. Las órdenes propias de bash, como `cd`, tienen su ayuda en `help cd` (en el zsh de macOS no existe `help`: allí, `man zshbuiltins`). Lo tienes en [1.12. Pedir ayuda: --help y man](#112-pedir-ayuda---help-y-man).

    </details>

11. ¿Para qué sirven <kbd>Tab</kbd>, <kbd>↑</kbd>, <kbd>Ctrl</kbd>+<kbd>R</kbd> y <kbd>Ctrl</kbd>+<kbd>C</kbd> en la terminal?

    <details>
    <summary>Ver respuesta</summary>

    <kbd>Tab</kbd> autocompleta nombres de ficheros, carpetas y órdenes (y si no completa, es que no existe); <kbd>↑</kbd> recupera las órdenes anteriores del historial; <kbd>Ctrl</kbd>+<kbd>R</kbd> busca en el historial; y <kbd>Ctrl</kbd>+<kbd>C</kbd> interrumpe la orden que está en marcha (en la terminal no copia). Lo tienes en [1.13. Trucos que ahorran tiempo](#113-trucos-que-ahorran-tiempo).

    </details>

12. ¿Quién cambia `*.txt` por la lista de ficheros, la orden o bash? ¿Cómo puedes ver qué ficheros selecciona un patrón antes de usarlo con `rm`?

    <details>
    <summary>Ver respuesta</summary>

    bash, antes de ejecutar la orden: la orden recibe ya la lista de nombres. Por eso, para ver qué selecciona un patrón, basta con `echo *.txt` o, mejor aún, `ls *.txt`, con el mismo patrón que vas a usar con `rm`. Lo tienes en [1.14. Comodines y comillas](#114-comodines-y-comillas) y en [3.3. Un espacio de más al borrar](#33-un-espacio-de-más-al-borrar).

    </details>

---
⬅️ [Anterior: Retos de la fase 2](../fase-02-tu-ordenador/retos.md) · 📚 [Índice](../00-indice.md) · ➡️ [Siguiente: La terminal: sacarle partido](02-terminal-sacarle-partido.md)
