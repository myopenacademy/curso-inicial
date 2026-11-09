# 03.02 La terminal: sacarle partido

> **Versiones:** bash 5.3; los scripts del módulo funcionan igual con bash 3.2, la de macOS (comprobado el 9 de noviembre de 2026)
> **Conviene saber antes:** [03.01 La terminal: lo básico](01-terminal-lo-basico.md) · [02.03 Instalar programas, variables de entorno y PATH](../fase-02-tu-ordenador/03-instalar-programas-y-path.md)
> **Tiempo estimado:** 3 horas
> **Nivel:** Básico · Núcleo

## Qué aprenderás

- Que toda orden tiene **tres canales**: la entrada, la salida y la salida de error, y cómo **redirigirlos** a un fichero con `>`, `>>`, `2>` y `<`, o tirarlos a `/dev/null`.
- A **encadenar órdenes con tuberías** (`|`) y a usar los filtros de cada día: `grep`, `sort`, `uniq`, `wc`, `cut`, `head` y `tail`. Con ellos contarás los pedidos de un día o sacarás los errores de un registro en una sola línea.
- A usar **variables** en la terminal: leer `$HOME`, crear las tuyas y pasárselas a los programas con `export`.
- A **cambiar el PATH**: en la terminal que tienes abierta y para siempre, en Linux, macOS y Git Bash.
- A leer los **permisos** de un fichero, a hacer **ejecutable** un script con `chmod +x` y a usar **`sudo`** solo cuando hace falta.
- A ver los **procesos** desde la terminal y a pararlos con <kbd>Ctrl</kbd>+<kbd>C</kbd> o con `kill`.
- Qué es el **código de salida** de una orden y cómo se consulta con `$?`.
- A escribir tus **primeros scripts**: con argumentos, una decisión (`if`) y una repetición (`for`), las mismas estructuras que ya conoces del pseudocódigo.

En [03.01 La terminal: lo básico](01-terminal-lo-basico.md) aprendiste a moverte y a manejar ficheros. Aquí vas a hacer que las órdenes **trabajen juntas** y a guardar lo que haces en scripts que se repiten solos. Es lo que hace que un programador prefiera la terminal para muchas tareas.

## 1. Teoría

### 1.1. Los tres canales de una orden

Cuando ejecutas una orden en la terminal, el sistema le da **tres canales** para comunicarse. Funcionan como tuberías por las que entran y salen líneas de texto:

| Canal | En inglés | Para qué sirve | Por defecto, va a |
|---|---|---|---|
| **Entrada estándar** | *stdin* | Lo que la orden **lee** | El teclado |
| **Salida estándar** | *stdout* | Los **resultados** de la orden | La pantalla |
| **Salida de error** | *stderr* | Los **mensajes de error** y los avisos | También la pantalla, pero por un canal aparte |

```mermaid
flowchart LR
    T["Teclado"] -->|entrada estándar| O["La orden"]
    O -->|salida estándar| P["Pantalla"]
    O -->|salida de error| P
```

En texto: la orden lee del teclado y escribe en la pantalla por dos canales distintos, uno para los resultados y otro para los errores.

¿Por qué dos salidas, si las dos acaban en la pantalla? Porque así **se pueden separar**. Imagina una orden que busca diez ficheros y no encuentra uno: los nueve que encuentra son el resultado (salida estándar) y el que falta es un error (salida de error). Si guardas el resultado en un fichero, el error no se cuela dentro; y si te interesan solo los errores, los puedes guardar aparte.

Cambiar adónde va cada canal se llama **redirigir**, y es lo que verás en los tres apartados siguientes.

> **📌 Nota:** todas las órdenes de bash y casi todos los programas respetan esta regla: los resultados, por la salida estándar; los errores, por la de error. Cuando escribas tus scripts ([apartado 1.14](#114-tu-primer-script)), tú también la seguirás.

### 1.2. Mandar la salida a un fichero: > y >>

Con **`>`** detrás de una orden, su salida estándar no se escribe en la pantalla: **se guarda en un fichero**.

```bash
ls > lista.txt
```

Esta orden no muestra nada: lo que `ls` habría escrito en la pantalla queda dentro de `lista.txt`. Si el fichero no existía, se crea.

Hay dos formas, y la diferencia es importantísima:

| Símbolo | Qué hace con el fichero | Para qué |
|---|---|---|
| **`>`** | Lo **vacía** y escribe desde el principio. Si tenía algo, **se pierde** | Guardar el resultado de una orden, empezando de cero |
| **`>>`** | **Añade** al final, sin tocar lo que ya había | Ir acumulando: un registro, una lista que crece |

Una forma de recordarlo: un `>` es «pon esto aquí»; dos, `>>`, «ponlo **también**».

> **⚠️ Cuidado:** `>` no pregunta. Si el fichero tenía cien líneas importantes, después de `orden > fichero` solo tiene lo que escriba la orden. No hay papelera. Lo verás en el [error típico 3.1](#31-machacar-un-fichero-con--cuando-querías-añadir).

### 1.3. Mandar los errores a otro sitio: 2> y /dev/null

El `>` solo redirige la salida **estándar**. Los mensajes de error siguen saliendo en la pantalla. Para redirigir la salida de **error** se escribe un **2** delante: **`2>`** (y **`2>>`** para añadir).

¿Por qué un 2? Porque, para el sistema, los tres canales tienen número: la entrada es el 0, la salida estándar el 1 y la salida de error el 2. `>` es una forma corta de `1>`.

Se pueden usar a la vez, cada canal a su fichero:

```bash
ls pedidos.txt facturas.txt > lista.txt 2> errores.txt
```

Y hay un sitio especial para lo que no quieres ver: **`/dev/null`**. Es un «fichero» de Linux, macOS y Git Bash que **se traga todo** lo que le mandas y no guarda nada (se le suele llamar el agujero negro). `2> /dev/null` es la forma de decir «no me enseñes los errores».

> **💡 Consejo:** antes de mandar los errores a `/dev/null`, léelos al menos una vez. Esconder un error no lo arregla; solo lo hace invisible.

Hay una última combinación que verás mucho en tutoriales: **`2>&1`**, que significa «manda la salida de error **al mismo sitio** que la estándar». Por ejemplo, `orden > todo.txt 2>&1` guarda las dos salidas en el mismo fichero. El orden importa: primero el `>` y después el `2>&1`.

En un script, para escribir **tú** un mensaje por la salida de error, se usa `>&2` detrás de `echo`: `echo "Error: falta el fichero" >&2`. Lo usarás en el [apartado 1.15](#115-argumentos-lo-que-recibe-un-script).

### 1.4. Leer la entrada de un fichero: <

El canal que queda es la entrada. Con **`<`**, una orden lee de un fichero **en lugar del teclado**:

```bash
wc -l < pedidos.txt
```

Muchas órdenes (`wc`, `grep`, `sort`…) ya aceptan el nombre del fichero directamente (`wc -l pedidos.txt`), así que `<` lo usarás poco. Pero es útil saber que existe: cuando un programa te pregunta algo por el teclado, `<` le pasa las respuestas escritas en un fichero, y así puedes probarlo una y otra vez sin teclear nada (es la idea de los [casos de prueba](../fase-01-que-es-programar/03-probar-un-programa.md#12-qué-es-probar-un-programa) de la fase 1).

### 1.5. Tuberías: la salida de una orden es la entrada de otra

Aquí empieza lo bueno. Con **`|`** (una barra vertical; en el teclado español, <kbd>AltGr</kbd>+<kbd>1</kbd> en Windows y Linux, y <kbd>Alt</kbd>+<kbd>1</kbd> en macOS), la **salida de una orden se convierte en la entrada de la siguiente**, sin pasar por un fichero. Se llama **tubería** (en inglés, *pipe*).

```bash
grep 2026-11-09 pedidos.txt | wc -l
```

Se lee de izquierda a derecha: `grep` saca las líneas de los pedidos del 9 de noviembre, y en lugar de escribirlas en la pantalla, se las pasa a `wc -l`, que las cuenta. En la pantalla solo aparece el número.

```mermaid
flowchart LR
    F["pedidos.txt"] --> G["grep 2026-11-09"]
    G -->|las líneas del día| W["wc -l"]
    W -->|un número| P["Pantalla"]
```

En texto: el fichero entra en `grep`, que deja pasar solo las líneas del día; esas líneas entran en `wc -l`, que las cuenta, y el número sale en la pantalla.

Se pueden encadenar tantas órdenes como quieras, cada una haciendo **una cosa pequeña**. Es la gran idea de la terminal de Linux y macOS: en vez de un programa enorme que lo hace todo, muchas órdenes sencillas que se combinan como piezas. Es la misma idea de [descomponer un problema](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#12-descomponer-un-problema) que viste en la fase 1.

> **📌 Nota:** la tubería solo pasa la salida **estándar**. Los errores de la primera orden siguen saliendo en la pantalla y no entran en la segunda. Es justo lo que quieres: que los mensajes de error no se mezclen con los datos.

### 1.6. Los filtros: grep, sort, uniq, wc, cut, head y tail

Un **filtro** es una orden que lee líneas, hace algo con ellas y escribe el resultado. Leen de un fichero (si le das su nombre) o de la tubería (si no). Algunos ya los conoces de [03.01](01-terminal-lo-basico.md#110-buscar-grep-y-find); aquí los vas a usar juntos.

| Orden | Qué hace | Opciones que más se usan |
|---|---|---|
| `grep texto` | Deja pasar solo las líneas que contienen `texto` | `-i` sin distinguir mayúsculas y minúsculas · `-c` cuenta las líneas en lugar de mostrarlas · `-v` las que **no** lo contienen · `-q` no escribe nada (solo dice si lo encontró, con su [código de salida](#113-códigos-de-salida)) |
| `sort` | Ordena las líneas alfabéticamente | `-n` como números (`9` antes que `10`) · `-r` al revés, de mayor a menor |
| `uniq` | Junta las líneas repetidas **seguidas** en una sola | `-c` delante de cada una, cuántas veces se repetía |
| `wc` | Cuenta líneas, palabras y caracteres | `-l` solo las líneas |
| `cut` | Corta un trozo (una **columna**) de cada línea | `-d ';'` el separador de columnas · `-f 3` la columna que quieres (la primera es la 1) |
| `head` | Las primeras líneas | `-n 5` cuántas (si no dices nada, 10) |
| `tail` | Las últimas líneas | `-n 5` cuántas (si no dices nada, 10) |

Dos combinaciones que vas a usar una y otra vez:

- **Contar lo que cumple algo:** `grep texto fichero | wc -l`, o directamente `grep -c texto fichero`.
- **Contar cuántas veces aparece cada valor de una columna:** `cut -d ';' -f 3 fichero | sort | uniq -c | sort -rn`. Saca la columna, la ordena para que los repetidos queden juntos, los cuenta y pone arriba los que más se repiten. Lo verás paso a paso en el [ejemplo 2.3](#23-qué-tienda-tiene-más-pedidos).

> **⚠️ Cuidado:** `uniq` solo junta las líneas iguales **que están seguidas**. Por eso casi siempre va detrás de un `sort`. Sin él, cuenta mal ([error típico 3.3](#33-contar-con-uniq-sin-ordenar-antes)).

> **📌 Nota para macOS:** estas órdenes existen y funcionan igual, pero algunas **escriben los números con otro espaciado**. En macOS, `wc -l` pone espacios delante del número (`      12 pedidos.txt`) y `uniq -c` deja menos espacio a la izquierda que en Linux. El resultado es el mismo; solo cambia el aspecto. Y si un tutorial te enseña **`sed -i`** (una orden que cambia el texto de un fichero, que no necesitas en este curso), ten en cuenta que en macOS se escribe distinto: `sed -i '' …` en lugar de `sed -i …`.

### 1.7. Variables en la terminal

En [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#19-variables-de-entorno) viste qué es una variable de entorno y que con `$` delante se usa su valor (`echo $PATH`). Ahora vas a crear las tuyas.

Una variable de la terminal es lo mismo que una [variable del pseudocódigo](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#variables): un nombre con un valor guardado. Se crea así:

```bash
ciudad=Sevilla
```

Tres reglas, y la primera es la que más falla:

1. **Sin espacios alrededor del `=`.** `ciudad = Sevilla` no crea ninguna variable: bash cree que `ciudad` es el nombre de una orden y te dice que no la encuentra ([error típico 3.4](#34-poner-espacios-alrededor-del-)).
2. **Para usar el valor, `$` delante:** `echo $ciudad` escribe `Sevilla`. Para crearla o cambiarla, sin `$`.
3. **Si el valor tiene espacios, entre comillas:** `ciudad="Santa Cruz"`.

Las comillas también cambian lo que hace el `$`:

| Escribes | Sale | Por qué |
|---|---|---|
| `echo "Vivo en $ciudad"` | `Vivo en Sevilla` | Entre comillas **dobles**, `$ciudad` se cambia por su valor |
| `echo 'Vivo en $ciudad'` | `Vivo en $ciudad` | Entre comillas **simples**, todo se queda tal cual |

> **💡 Consejo:** cuando uses una variable, ponla **entre comillas dobles**: `"$ciudad"`. Si su valor tiene espacios, sin comillas bash lo partiría en varias palabras. Es una costumbre que te ahorrará errores raros.

Algunas variables ya existen al abrir la terminal, porque las prepara el sistema:

| Variable | Qué guarda |
|---|---|
| `$HOME` | Tu [carpeta personal](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#15-tu-carpeta-personal) |
| `$USER` | Tu nombre de usuario |
| `$PATH` | Las carpetas donde se buscan los programas |
| `$LANG` | El idioma en el que te hablan los programas |

Si escribes mal el nombre de una variable (`$cuidad`), bash **no da error**: para él es una variable que no existe, y una variable que no existe está **vacía**. Escribirá un hueco donde esperabas el valor. Si un resultado sale con un hueco raro, revisa cómo has escrito el nombre.

> **📌 Nota:** las variables que creas así **duran lo que dura la terminal**. Al cerrarla, desaparecen. Para que algo dure, se guarda en un fichero de configuración ([apartado 1.9](#19-cambiar-el-path-en-esta-terminal-y-para-siempre)).

### 1.8. export: variables que heredan los programas

Una variable recién creada solo la conoce **la terminal donde la creaste**. Los programas que lances desde ella **no la ven**. Para que la vean, hay que **exportarla**:

```bash
export ciudad
```

O crearla y exportarla en un paso:

```bash
export ciudad=Sevilla
```

¿Por qué hace falta? Cada programa que lanzas desde la terminal es un [proceso](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#18-programas-y-procesos) nuevo, y al nacer recibe una **copia** de las variables exportadas de la terminal, nada más. Por eso a las variables exportadas se las llama variables de **entorno**: son el entorno que heredan los programas. `HOME`, `PATH` o `LANG` ya vienen exportadas.

Dos consecuencias:

- Si un programa (o un script) necesita un dato tuyo, **expórtalo** antes de lanzarlo. Lo verás en el [ejemplo 2.5](#25-variables-y-export).
- Es una **copia**: si el programa cambia la variable, la de tu terminal no cambia.

Para ver todas las variables de entorno de una vez, escribe `env`. Te saldrá una lista larga; no hace falta que la entiendas entera.

### 1.9. Cambiar el PATH: en esta terminal y para siempre

En [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#110-el-path-dónde-busca-el-sistema-los-programas) viste que el PATH es la lista de carpetas donde el sistema busca los programas, en orden. Ahora vas a **añadir una carpeta tuya**. Es lo que se hace para poder ejecutar tus propios scripts desde cualquier sitio, escribiendo solo su nombre, igual que `ls` o `git`.

**En la terminal que tienes abierta:**

```bash
export PATH="$HOME/bin:$PATH"
```

Léela despacio, porque cada pieza importa:

- `PATH=…` le da un **valor nuevo** al PATH.
- El valor nuevo es `$HOME/bin` (tu carpeta), **dos puntos** y **`$PATH`**, es decir, todo lo que el PATH tenía antes. Así **añades** tu carpeta a la lista sin perder las demás.
- Tu carpeta va **delante**, así que se busca **la primera**. Si la quieres la última, se escribe al revés: `"$PATH:$HOME/bin"`.
- Las **comillas dobles** protegen el valor si alguna carpeta tiene espacios (en Git Bash es habitual: `Program Files`).
- `export` lo deja exportado (el PATH ya lo estaba, pero no está de más).

> **⚠️ Cuidado:** si se te olvida el `:$PATH` del final, el PATH pasa a tener **solo tu carpeta** y la terminal deja de encontrar `ls`, `grep` y casi todo lo demás. No has roto nada del ordenador: cierra la terminal y abre otra ([error típico 3.6](#36-estropear-el-path-al-cambiarlo)).

Este cambio **dura lo que dura la terminal**. Al cerrarla, se pierde, y la próxima vez el PATH vuelve a ser el de siempre.

**Para siempre:** al abrirse, la terminal lee un **fichero de configuración** de tu carpeta personal y ejecuta las órdenes que tiene dentro. Si pones tu `export PATH=…` en ese fichero, se hará solo cada vez que abras una terminal. Es un [fichero oculto](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#115-ficheros-ocultos) (empieza por punto), y cuál es depende del sistema:

| Sistema y terminal | Fichero | Qué saber |
|---|---|---|
| Linux (bash) | `~/.bashrc` | Ya existe; añade tu línea al final |
| macOS (Terminal, con zsh) | `~/.zshrc` | Puede que no exista: si no está, se crea. La línea se escribe igual en zsh |
| Windows (Git Bash) | `~/.bashrc` | Puede que no exista: si no está, se crea. Ver la nota de abajo |

La forma más rápida de añadir la línea al final del fichero es con lo que ya sabes, `>>` (en macOS, cambia `~/.bashrc` por `~/.zshrc`):

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
```

Fíjate en las **comillas simples** de fuera: así, `$HOME` y `$PATH` se escriben en el fichero **tal cual**, con su `$`, y se calculan cada vez que se abre la terminal. Y en el `>>`: con un solo `>` **borrarías** toda tu configuración. (También puedes abrir el fichero con tu [editor de código](03-editor-de-codigo.md#14-abre-carpetas-no-ficheros-sueltos), el módulo siguiente, y escribir la línea al final.)

Después, **cierra la terminal y abre otra**: el fichero solo se lee al abrirse. Comprueba con `echo $PATH` que tu carpeta está al principio.

> **📌 Nota para Git Bash:** Git Bash, al abrirse, no lee `~/.bashrc` directamente, sino `~/.bash_profile`. Pero Git for Windows lo tiene previsto: si encuentra un `~/.bashrc` y no hay `~/.bash_profile` (ni `~/.bash_login` ni `~/.profile`), **crea él mismo un `~/.bash_profile`** que carga tu `~/.bashrc`, y te avisa con un mensaje en rojo que empieza por `WARNING: Found ~/.bashrc but no ~/.bash_profile…` y dice que lo ha creado por ti. Sale solo la primera vez y es normal (comprobado en el código de Git for Windows el 9 de noviembre de 2026). Si ya tenías un `~/.bash_profile`, asegúrate de que carga `~/.bashrc`, o pon tu línea directamente en él.

### 1.10. Permisos: quién puede leer, escribir y ejecutar

En Linux y macOS, cada fichero tiene un **propietario** (el usuario que lo creó, normalmente) y unos **permisos** que dicen qué puede hacer cada uno con él. Es una de las protecciones del [sistema operativo](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#17-el-sistema-operativo): tus ficheros no los puede cambiar otro usuario del ordenador, y los del sistema no los puedes estropear tú sin querer.

Los ves con **`ls -l`** (la `l` es de *long*, la lista larga):

```text
-rw-r--r-- 1 alumno alumno 77 ene 15  2026 hola.sh
```

Lo que importa ahora son los **diez primeros caracteres** y el **propietario**:

```text
-rw-r--r--   alumno
│└┬┘└┬┘└┬┘     └── el propietario
│ │  │  └──────── los demás:       r--  solo leer
│ │  └─────────── el grupo:        r--  solo leer
│ └────────────── el propietario:  rw-  leer y escribir
└──────────────── el tipo: - fichero, d carpeta
```

Detrás del tipo vienen **tres grupos de tres letras**: lo que puede hacer el propietario, lo que puede hacer su **grupo** (los usuarios se pueden agrupar; en tu ordenador personal casi nunca importa) y lo que pueden hacer **los demás**. En cada grupo, siempre en este orden:

| Letra | Permiso | En un fichero | En una carpeta |
|---|---|---|---|
| `r` | Leer (*read*) | Ver lo que tiene | Ver qué hay dentro (`ls`) |
| `w` | Escribir (*write*) | Cambiarlo | Crear, borrar y renombrar lo de dentro |
| `x` | Ejecutar (*execute*) | **Ejecutarlo como programa** | **Entrar** en ella (`cd`) |
| `-` | Sin ese permiso | | |

Así que `-rw-r--r--` es un fichero que su propietario puede leer y cambiar, y los demás solo leer. **Nadie puede ejecutarlo**: no tiene ninguna `x`. Y eso es justo lo que le pasa a un script recién escrito.

**Cambiar los permisos: `chmod`.** La forma más usada es con letras:

| Orden | Qué hace |
|---|---|
| `chmod +x script.sh` | Da permiso de **ejecución** (a todos los que ya pueden leerlo) |
| `chmod u+x script.sh` | Da permiso de ejecución solo al propietario (`u`, de *user*) |
| `chmod -w notas.txt` | Quita el permiso de escritura (para no cambiarlo sin querer) |

En tutoriales verás también permisos con **números**, como `chmod 755` o `chmod 644`. Son otra forma de escribir lo mismo: `755` es `rwxr-xr-x` (un programa que todos pueden usar y solo su dueño cambiar) y `644` es `rw-r--r--` (un fichero normal). Con `+x` tienes suficiente para este curso.

Solo puedes cambiar los permisos de **tus** ficheros. Los del sistema son del administrador.

> **📌 Nota para Git Bash:** Windows no guarda los permisos como Linux y macOS, así que Git Bash los **imita**, y `chmod +x` puede no cambiar nada. En la práctica, un script que empieza por `#!` ([apartado 1.14](#114-tu-primer-script)) se suele poder ejecutar con `./` aunque no hayas hecho `chmod`. Hazlo igualmente: no molesta, y así tu script funcionará también en Linux y macOS, que es donde acabará muchas veces. Y si en Git Bash algo no se comporta como dice el curso, `bash script.sh` funciona siempre.

> **📌 Nota para macOS:** `ls -l` muestra las mismas letras, pero a veces con un `@` o un `+` al final (`-rw-r--r--@`). Indican que el fichero tiene información extra (por ejemplo, que se descargó de internet). Puedes ignorarlos.

### 1.11. Administrador: sudo y cuándo no usarlo

En [02.01](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#17-el-sistema-operativo) viste que hay cuentas normales y cuentas de **administrador**. En Linux y macOS, el administrador total se llama **`root`**: puede leer, cambiar y borrar **cualquier** fichero, también los que hacen funcionar el sistema.

Tú trabajas con tu usuario normal, y por eso hay sitios donde no puedes escribir:

**En tu terminal** (`sesion.txt`):

```text
$ whoami
alumno
$ echo "prueba" > /etc/prueba.txt
bash: /etc/prueba.txt: Permiso denegado
$ echo "prueba" > ~/prueba.txt
$ cat ~/prueba.txt
prueba
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/1.11-carpeta-del-sistema/`](codigo/02-terminal-sacarle-partido/ejemplos/1.11-carpeta-del-sistema/)

`whoami` («¿quién soy?») te dice tu usuario. `/etc` es una carpeta del sistema (guarda su configuración): no te deja escribir en ella. En tu carpeta personal, en cambio, sí. Eso no es un fallo: es la protección funcionando.

Cuando **de verdad** necesitas hacer algo como administrador (instalar un programa para todo el sistema, cambiar su configuración), se pone **`sudo`** delante de la orden. Ya lo viste en [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#12-tres-formas-de-instalar) con `sudo apt install git`. `sudo` (de *superuser do*, «hazlo como administrador») te pide **tu** contraseña (al escribirla no se ve nada; es normal) y ejecuta **esa orden, y solo esa**, como `root`. Solo pueden usarlo las cuentas de administrador del ordenador.

`sudo` existe en Linux y en macOS. **Git Bash no lo trae**: en Windows, lo que necesita permisos de administrador lo hace un instalador (te pide permiso con una ventana) o un programa abierto con «Ejecutar como administrador».

**Cuándo no usar `sudo`** (casi siempre):

- **Para tu trabajo de cada día.** Tus proyectos, tus scripts y tus ficheros están en tu carpeta personal, y ahí no hace falta. Programar no es tarea de administrador.
- **Para «arreglar» un «Permiso denegado» que no entiendes.** Primero averigua por qué te lo niega (`ls -l`). Si es un fichero tuyo, el arreglo es otro (por ejemplo, `chmod +x`). Si lo «arreglas» con `sudo`, a menudo creas ficheros que son de `root`, y después tu usuario ya no puede tocarlos.
- **Con una orden que has copiado de internet y no entiendes.** Con `sudo`, esa orden puede hacer **cualquier cosa** en tu ordenador. Es como darle las llaves de casa a un desconocido (lo mismo que viste con los [instaladores](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#13-descarga-siempre-de-la-web-oficial)).

La idea de fondo tiene nombre: **mínimo privilegio**. Cada usuario y cada programa, con los permisos justos para su tarea y ni uno más. Si algo sale mal (un error tuyo, un programa malicioso), el daño se queda en lo poco que podía tocar. Lo verás de nuevo en «Seguridad básica» (fase 7).

### 1.12. Procesos: verlos y pararlos

En [02.01](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#18-programas-y-procesos) viste que un **proceso** es un programa en marcha, y miraste los procesos con el [Administrador de tareas o el Monitor de Actividad](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#24-mirar-los-programas-en-marcha). Desde la terminal también se ven y se paran.

Cada proceso tiene un número que lo identifica, el **PID** (del inglés *process identifier*). Con él le das órdenes.

| Para | Orden | Qué saber |
|---|---|---|
| Ver los procesos de esta terminal | `ps` | Una lista corta: el PID, el terminal (`TTY`), el tiempo de procesador que ha gastado (`TIME`) y la orden (`CMD`) |
| Ver todos los procesos del ordenador | `ps aux` | Una lista larguísima, con su usuario y cuánta memoria y procesador usan. Se combina con una tubería: `ps aux \| grep firefox` |
| Ver los que más gastan, en directo | `top` | Se actualiza cada pocos segundos. Se sale con <kbd>Q</kbd> |
| Parar la orden que tienes delante | <kbd>Ctrl</kbd>+<kbd>C</kbd> | Interrumpe la orden que está en marcha en la terminal y te devuelve el indicador |
| Pedirle a un proceso que termine | `kill PID` | Por ejemplo, `kill 4242`. El programa puede cerrar bien: guardar, soltar lo que usa… |
| Obligarle a terminar | `kill -9 PID` | El sistema lo mata al momento, sin dejarle hacer nada. **Último recurso** |

<kbd>Ctrl</kbd>+<kbd>C</kbd>, el freno de emergencia que ya conoces de [03.01](01-terminal-lo-basico.md#113-trucos-que-ahorran-tiempo), es lo que más vas a usar: un script que no termina (un [bucle infinito](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#19-repetición), por ejemplo), una orden que tarda demasiado o que lanzaste por error. Pulsas <kbd>Ctrl</kbd>+<kbd>C</kbd> y la terminal vuelve a ser tuya; verás `^C` en la pantalla.

`kill` sirve para un proceso que **no** tienes delante: uno que se ha quedado colgado en otra ventana, o uno que lanzaste **en segundo plano**. Una orden seguida de **`&`** (`sleep 300 &`) se queda trabajando en segundo plano y te devuelve el indicador enseguida; bash te dice su número de trabajo entre corchetes (`[1]`) y su PID. Para pararla, `kill` con su PID, o con `%` y su número de trabajo: `kill %1`. Lo verás en el [ejemplo 2.7](#27-parar-un-proceso).

> **⚠️ Cuidado:** lo que viste en 02.01 sobre [finalizar procesos a ciegas](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#36-finalizar-procesos-a-ciegas) vale igual aquí. No hagas `kill` a procesos que no reconoces, y empieza siempre por `kill` sin más: `kill -9` no deja al programa guardar nada.

> **📌 Nota para macOS y Git Bash:** `ps`, `kill` y <kbd>Ctrl</kbd>+<kbd>C</kbd> funcionan igual. `top` existe en macOS, pero su pantalla es distinta de la de Linux (más columnas y otro orden); en Git Bash, `ps` solo enseña los procesos de Git Bash, y para ver los de Windows lo más cómodo es el Administrador de tareas.

### 1.13. Códigos de salida

Cuando una orden termina, le devuelve al sistema un número que dice **cómo le ha ido**: el **código de salida** (en inglés, *exit code* o *exit status*).

- **0** quiere decir que **todo ha ido bien**.
- **Cualquier otro número** quiere decir que algo **ha fallado**. Qué significa cada número lo decide cada programa (lo dice su ayuda).

La terminal no lo enseña, pero lo guarda en una variable especial, **`$?`**, que siempre tiene el código de la **última** orden:

```bash
ls pedidos.txt
echo $?
```

Si `pedidos.txt` existe, `echo $?` escribe `0`; si no, otro número (`ls` usa el `2` para «no existe»). Tiene que ser **justo después**: la siguiente orden que escribas (aunque sea el propio `echo`) cambia `$?`.

> **⚠️ Cuidado:** un código distinto de 0 no siempre es una catástrofe. `grep` devuelve **1** cuando no encuentra lo que buscas: no ha fallado nada, simplemente no estaba. Por eso el significado exacto depende de cada orden.

¿Para qué sirve? Para **tomar decisiones según cómo fue la orden anterior**, sin leer sus mensajes. Es lo que hacen los scripts, las herramientas de integración continua y cualquier programa que lanza a otro. Dos formas cortas de hacerlo, que verás mucho:

| Escribes | Significa |
|---|---|
| `orden1 && orden2` | Ejecuta `orden2` **solo si** `orden1` fue bien (código 0) |
| `orden1 \|\| orden2` | Ejecuta `orden2` **solo si** `orden1` falló (código distinto de 0) |

Por ejemplo, `grep -q Bilbao pedidos.txt && echo "Hay pedidos de Bilbao"`: `grep -q` no escribe nada, solo devuelve 0 si lo encuentra y 1 si no, y el `echo` solo se ejecuta si lo encontró.

### 1.14. Tu primer script

En [03.01](01-terminal-lo-basico.md#11-por-qué-la-terminal) se presentó en una frase; ahora toca de verdad. Un **script** es un fichero de texto con órdenes, una detrás de otra, que se ejecutan como si las escribieras tú: un pequeño programa escrito en el lenguaje de la terminal. Lo que repites a menudo (preparar un informe, hacer una copia de seguridad, comprobar algo) se guarda en un script, y así se hace siempre igual, sin olvidar ningún paso, y se puede revisar y compartir. Por convención, los scripts de bash terminan en `.sh`.

El más sencillo posible:

```bash
#!/usr/bin/env bash
# Mi primer script: saluda
echo "¡Hola! Soy un script."
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.6-hacer-ejecutable-un-script/`](codigo/02-terminal-sacarle-partido/ejemplos/2.6-hacer-ejecutable-un-script/)

**Salida:**

```text
¡Hola! Soy un script.
```

**La primera línea, `#!/usr/bin/env bash`**, se llama ***shebang*** (por los dos caracteres con los que empieza, `#!`). Dice **con qué programa se ejecuta el script**. Verás dos formas:

| Primera línea | Qué hace |
|---|---|
| `#!/usr/bin/env bash` | Busca `bash` en el PATH y usa el primero que encuentra |
| `#!/bin/bash` | Usa el `bash` que está en `/bin/bash` |

Las dos funcionan en Linux, macOS y Git Bash. Este curso usa **`#!/usr/bin/env bash`**, que es la que más se recomienda hoy: si alguien tiene un bash más nuevo instalado en otra carpeta (en macOS es habitual, con Homebrew), se usa ese, y funciona aunque `bash` no esté en `/bin`, como pasa en algunos sistemas. Tiene que ser **la primera línea**, sin nada antes, ni siquiera una línea en blanco.

**Las líneas que empiezan por `#`** (salvo el *shebang*) son [comentarios](../fase-01-que-es-programar/01-que-es-programar.md#21-el-mismo-algoritmo-en-tres-lenguajes): bash las ignora. Úsalos para explicar qué hace el script y cómo se usa.

**Dos formas de ejecutarlo:**

| Forma | Qué necesita | Qué pasa |
|---|---|---|
| `bash hola.sh` | Nada especial | Le dices tú a `bash` que lea el fichero. Ni el permiso `x` ni el *shebang* importan |
| `./hola.sh` | El permiso de ejecución (`chmod +x hola.sh`) | El sistema mira la primera línea y lo ejecuta con ese programa, como cualquier otro programa |

¿Y por qué `./hola.sh` y no `hola.sh` sin más? Porque, escrito sin ruta, el sistema lo buscaría **en las carpetas del PATH**, y la carpeta actual no está en el PATH. Por eso dirá «orden no encontrada». `./hola.sh` es una [ruta relativa](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#110-las-carpetas-especiales-punto-y-punto-punto) que dice exactamente dónde está: «en esta carpeta (`.`), el fichero `hola.sh`». Si guardas tus scripts en una carpeta del PATH ([apartado 1.9](#19-cambiar-el-path-en-esta-terminal-y-para-siempre)), ya podrás escribir solo su nombre.

En este curso, los scripts se ejecutan con `bash script.sh`: es lo que funciona en cualquier sitio, sin preparar nada. Hacerlos ejecutables tiene sentido cuando un script lo vas a usar a menudo.

> **📌 Nota para macOS:** aunque tu terminal use zsh, el *shebang* y `bash script.sh` hacen que el script lo ejecute **bash**, en concreto el bash 3.2 que trae macOS. Todos los scripts de este curso están comprobados también con esa versión, así que funcionan igual.

### 1.15. Argumentos: lo que recibe un script

Un script es mucho más útil si le puedes decir **sobre qué** trabajar: qué carpeta copiar, qué fecha contar. Se hace igual que con cualquier orden: con [argumentos](01-terminal-lo-basico.md#12-cómo-se-escribe-una-orden), escritos detrás de su nombre y separados por espacios:

```bash
bash stock.sh Folios 8 10
```

Aquí el script recibe tres argumentos: `Folios`, `8` y `10`. Dentro del script, se leen con estas variables especiales:

| Variable | Qué tiene |
|---|---|
| `$1`, `$2`, `$3`… | El primer argumento, el segundo, el tercero… |
| `$#` | **Cuántos** argumentos ha recibido |
| `$0` | El nombre del propio script |

Son como los [parámetros de un subalgoritmo](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#111-subalgoritmos) de la fase 1: datos que recibe al llamarlo, en un orden fijo.

Lo primero que suele hacer un buen script es **darles nombre** (`producto=$1`) para que el resto se lea mejor, y **comprobar que le han dado lo que necesita**. Si no, explica cómo se usa, por la salida de error, y termina con un código distinto de 0. Para terminar un script con el código que tú quieras se usa **`exit`**: `exit 0` (todo bien), `exit 1`, `exit 2`… Si no escribes ningún `exit`, el script termina con el código de su última orden.

> **⚠️ Cuidado:** igual que en la terminal, **los espacios separan argumentos**. `bash stock.sh Papel A4 3 20` son **cuatro** argumentos (`Papel`, `A4`, `3` y `20`). Si un argumento tiene espacios, va entre comillas: `bash stock.sh "Papel A4" 3 20` ([error típico 3.8](#38-olvidar-las-comillas-en-un-argumento-con-espacios)).

Dos herramientas más que usarás dentro de los scripts:

- **`$(orden)`** se cambia por **lo que escribe esa orden**. Así guardas un resultado en una variable: `hoy=$(date +%Y-%m-%d)` guarda la fecha de hoy (`2026-11-09`); `total=$(grep -c ERROR tienda.log)`, cuántos errores hay. Se llama **sustitución de órdenes**.
- **`$((cuenta))`** hace **operaciones con números enteros**: `total=$((total + 1))` suma 1 a `total`. Se pueden usar `+`, `-`, `*`, `/` (división entera) y `%` (el resto, como el `MOD` del pseudocódigo).

> **📌 Nota para macOS:** `date +%Y-%m-%d` funciona igual en macOS y en Linux. Pero otras opciones de `date` cambian: para la fecha de ayer, en Linux se escribe `date -d yesterday` y en macOS `date -v-1d`. Si un script de internet usa `date -d`, en macOS fallará.

### 1.16. Decidir y repetir en un script: if y for

Las [tres estructuras de control](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#16-las-tres-estructuras-de-control) que aprendiste con el pseudocódigo existen también en bash. La **secuencia** ya la tienes: las órdenes de un script se ejecutan una detrás de otra. Faltan la **selección** y la **repetición**.

**Decidir: `if`.** Es la [selección](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#18-selección) del pseudocódigo:

```text
SI unidades < minimo ENTONCES
    ESCRIBIR "Reponer"
SI NO
    ESCRIBIR "Hay suficientes"
FIN SI
```

```bash
if [ "$unidades" -lt "$minimo" ]; then
    echo "Reponer"
else
    echo "Hay suficientes"
fi
```

- `if` es `SI`, `then` es `ENTONCES`, `else` es `SI NO` (se puede omitir) y `fi` (`if` al revés) es `FIN SI`.
- La condición va entre **corchetes**, `[ … ]`, con **un espacio a cada lado** por dentro: `[ "$unidades" -lt "$minimo" ]`. Sin esos espacios, bash no la entiende.
- El `;` separa la condición del `then`. (También se puede escribir `then` en la línea siguiente, sin `;`.)

Las comparaciones no se escriben con `<` o `>` (en bash esos símbolos son de redirección), sino así:

| Para comparar | Se escribe | Significa |
|---|---|---|
| Números | `-eq`, `-ne` | Igual, distinto (*equal*, *not equal*) |
| | `-lt`, `-le` | Menor, menor o igual (*less than*, *less or equal*) |
| | `-gt`, `-ge` | Mayor, mayor o igual (*greater than*, *greater or equal*) |
| Texto | `=`, `!=` | Igual, distinto |
| Ficheros | `-f ruta` | Existe y es un fichero |
| | `-d ruta` | Existe y es una carpeta |
| | `-e ruta` | Existe (fichero o carpeta) |
| Negar | `!` delante | Lo contrario: `[ ! -f "$fichero" ]` es «el fichero **no** existe» |

**Repetir: `for`.** Es el [PARA cada](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#para-cada-recorrer-una-lista) del pseudocódigo: recorre una lista, un elemento en cada vuelta.

```text
PARA cada tienda DE [Madrid, Sevilla, Valencia] HACER
    ESCRIBIR tienda
FIN PARA
```

```bash
for tienda in Madrid Sevilla Valencia; do
    echo "$tienda"
done
```

- `for tienda in …` es `PARA cada tienda DE …`; `do` es `HACER` y `done` es `FIN PARA`.
- La lista son palabras separadas por espacios. También puede ser un [comodín](01-terminal-lo-basico.md#114-comodines-y-comillas): `for fichero in *.txt` recorre los ficheros `.txt` de la carpeta.
- En cada vuelta, `$tienda` vale el siguiente elemento.

Con un `for` y `$(( ))` se hace el [contador](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#contador) de siempre:

```bash
total=0
for fichero in *.txt; do
    total=$((total + 1))
done
echo "Hay $total ficheros de texto"
```

Bash tiene también `while` (el `MIENTRAS`), `case` (el `SEGÚN`) y funciones (los subalgoritmos). No los necesitas todavía: con `if` y `for` puedes hacer la mayoría de los scripts del día a día, y si tu curso usa más bash, allí los verás.

## 2. Ejemplos de código

Todos los ejemplos son reales y los puedes repetir: descarga la carpeta de cada uno (su enlace «📁 Código»), abre la terminal en ella y escribe las mismas órdenes. Recuerda que tu salida no será idéntica letra a letra ([el aviso de 02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal)): fíjate en lo que dice el texto.

### 2.1. Salida y errores, cada uno a su sitio

**Situación real:** quieres comprobar si están dos ficheros de la tienda, `pedidos.txt` y `facturas.txt`. Solo existe el primero. Vas a ver por qué canal sale cada cosa.

**En tu terminal** (`sesion.txt`):

```text
$ ls pedidos.txt facturas.txt
ls: no se puede acceder a 'facturas.txt': No existe el archivo o el directorio
pedidos.txt
$ ls pedidos.txt facturas.txt > lista.txt
ls: no se puede acceder a 'facturas.txt': No existe el archivo o el directorio
$ cat lista.txt
pedidos.txt
$ ls pedidos.txt facturas.txt 2> errores.txt
pedidos.txt
$ cat errores.txt
ls: no se puede acceder a 'facturas.txt': No existe el archivo o el directorio
$ ls pedidos.txt facturas.txt > lista.txt 2> errores.txt
$ ls pedidos.txt facturas.txt 2> /dev/null
pedidos.txt
$ echo "Primera línea" > notas.txt
$ echo "Segunda línea" >> notas.txt
$ cat notas.txt
Primera línea
Segunda línea
$ echo "Esto lo borra todo" > notas.txt
$ cat notas.txt
Esto lo borra todo
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.1-salida-y-errores/`](codigo/02-terminal-sacarle-partido/ejemplos/2.1-salida-y-errores/)

**En qué fijarte:**

- **Sin redirigir**, los dos canales salen mezclados en la pantalla: el error (`no se puede acceder a 'facturas.txt'`) y el resultado (`pedidos.txt`).
- **Con `>`**, el resultado va a `lista.txt`, pero **el error sigue saliendo en la pantalla**: `>` solo se lleva la salida estándar.
- **Con `2>`**, al revés: el error va a `errores.txt` y el resultado se queda en la pantalla.
- **Con los dos a la vez**, la pantalla queda en silencio: cada canal está en su fichero.
- **Con `2> /dev/null`**, el error desaparece.
- **`>>` añade** (`notas.txt` tiene las dos líneas) y **`>` sustituye** todo lo que había: la última orden ha dejado una sola línea.

> **📌 Nota:** el mensaje de error de `ls` puede salirte con otras palabras o en inglés ([nota de 03.01](01-terminal-lo-basico.md#14-qué-hay-aquí-ls)). Lo que importa es lo que dice, y por qué canal sale.

### 2.2. Contar los pedidos de un día

**Situación real:** trabajas en una papelería con tiendas en varias ciudades. Cada pedido se apunta en una línea de `pedidos.txt`, con cinco datos separados por `;`: la fecha, la hora, la tienda, el producto y las unidades. Tu jefa te pregunta cuántos pedidos hubo el 9 de noviembre, y cuántos de ellos fueron en Madrid.

**En tu terminal** (`sesion.txt`):

```text
$ head -n 3 pedidos.txt
2026-11-08;09:15;Madrid;cuaderno;3
2026-11-08;10:02;Sevilla;bolígrafo;10
2026-11-08;12:47;Madrid;agenda;1
$ wc -l pedidos.txt
12 pedidos.txt
$ grep 2026-11-09 pedidos.txt
2026-11-09;09:05;Madrid;mochila;1
2026-11-09;09:41;Valencia;bolígrafo;25
2026-11-09;11:20;Sevilla;agenda;2
2026-11-09;12:03;Madrid;cuaderno;4
2026-11-09;13:58;Madrid;estuche;2
2026-11-09;16:12;Bilbao;cuaderno;6
2026-11-09;18:45;Sevilla;agenda;1
$ grep 2026-11-09 pedidos.txt | wc -l
7
$ grep -c 2026-11-09 pedidos.txt
7
$ grep 2026-11-09 pedidos.txt | grep Madrid
2026-11-09;09:05;Madrid;mochila;1
2026-11-09;12:03;Madrid;cuaderno;4
2026-11-09;13:58;Madrid;estuche;2
$ grep 2026-11-09 pedidos.txt | grep -c Madrid
3
$ grep -v 2026-11-09 pedidos.txt | wc -l
5
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.2-pedidos-de-un-dia/`](codigo/02-terminal-sacarle-partido/ejemplos/2.2-pedidos-de-un-dia/)

**En qué fijarte:**

- **Primero, mira los datos.** `head -n 3` enseña cómo son las líneas y `wc -l` cuántas hay (12). Antes de contar nada, conviene saber qué forma tienen.
- **`grep … | wc -l` y `grep -c …` dan lo mismo** (7 pedidos el día 9). La primera es una tubería de dos órdenes; la segunda, una sola orden con la opción de contar.
- **Dos `grep` seguidos son un «y»:** el primero deja las líneas del día 9, y el segundo, de esas, las de Madrid. Tres pedidos.
- **`grep -v` es el «no»:** las líneas que **no** son del día 9. 5 + 7 = 12: cuadra con el total. Comprobar así los resultados es una buena costumbre.

> **📌 Nota:** buscar `2026-11-09` funciona porque esa fecha solo aparece en la columna de la fecha. Si un producto se llamara «2026-11-09», también saldría. Con datos de verdad, piensa siempre si lo que buscas puede aparecer en otro sitio de la línea.

### 2.3. Qué tienda tiene más pedidos

**Situación real:** con el mismo `pedidos.txt`, ahora quieres saber qué tienda tiene más pedidos. Vas a construir la tubería **paso a paso**, mirando el resultado de cada pieza antes de añadir la siguiente.

**En tu terminal** (`sesion.txt`):

```text
$ cut -d ';' -f 3 pedidos.txt
Madrid
Sevilla
Madrid
Valencia
Madrid
Valencia
Sevilla
Madrid
Madrid
Bilbao
Sevilla
Sevilla
$ cut -d ';' -f 3 pedidos.txt | sort
Bilbao
Madrid
Madrid
Madrid
Madrid
Madrid
Sevilla
Sevilla
Sevilla
Sevilla
Valencia
Valencia
$ cut -d ';' -f 3 pedidos.txt | sort | uniq -c
      1 Bilbao
      5 Madrid
      4 Sevilla
      2 Valencia
$ cut -d ';' -f 3 pedidos.txt | sort | uniq -c | sort -rn
      5 Madrid
      4 Sevilla
      2 Valencia
      1 Bilbao
$ cut -d ';' -f 3 pedidos.txt | sort | uniq -c | sort -rn | head -n 1
      5 Madrid
$ cut -d ';' -f 3 pedidos.txt | uniq -c
      1 Madrid
      1 Sevilla
      1 Madrid
      1 Valencia
      1 Madrid
      1 Valencia
      1 Sevilla
      2 Madrid
      1 Bilbao
      2 Sevilla
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.3-pedidos-por-tienda/`](codigo/02-terminal-sacarle-partido/ejemplos/2.3-pedidos-por-tienda/)

**En qué fijarte:**

1. **`cut -d ';' -f 3`** se queda con la tercera columna (la tienda) de cada línea. El `';'` va entre comillas porque, suelto, el `;` tiene un significado especial en bash (separa órdenes).
2. **`sort`** las ordena: ahora las iguales están juntas.
3. **`uniq -c`** junta cada grupo de iguales en una línea y pone delante cuántas eran.
4. **`sort -rn`** ordena esas líneas **como números** (`-n`) y **de mayor a menor** (`-r`). Madrid, arriba.
5. **`head -n 1`** se queda con la primera: la respuesta es Madrid, con 5 pedidos.
6. La **última orden** es el error típico: `uniq -c` **sin** `sort`. Como las tiendas no están juntas, cuenta trocitos sueltos (Madrid aparece cuatro veces). Lo tienes en el [error típico 3.3](#33-contar-con-uniq-sin-ordenar-antes).

> **💡 Consejo:** construye las tuberías así, **una pieza cada vez**, comprobando lo que sale. Si escribes la línea entera de golpe y el resultado es raro, no sabrás qué pieza falla. Con la flecha hacia arriba (<kbd>↑</kbd>) recuperas la orden anterior y le añades la siguiente pieza.

### 2.4. Quedarse con los errores de un registro

**Situación real:** la tienda online de la papelería escribe un [registro](01-terminal-lo-basico.md#26-ver-un-fichero-de-texto-y-el-registro-de-una-aplicación) (*log*) en el que cada línea lleva su fecha, su hora y su **nivel**: `INFO` (información normal), `WARN` (un aviso) o `ERROR`. Es la forma habitual de los registros de las aplicaciones. Un cliente se queja de que algo falló esa mañana. El registro de un día de verdad tiene miles de líneas; este, para que lo veas entero, tiene diez:

```text
2026-11-09 08:00:01 INFO Arranca la tienda online
2026-11-09 08:00:03 INFO Conectada a la base de datos
2026-11-09 09:12:44 WARN El pago del pedido 1043 tarda más de 5 segundos
2026-11-09 09:13:02 INFO Pago del pedido 1043 confirmado
2026-11-09 10:27:19 ERROR No se pudo enviar el correo del pedido 1044
2026-11-09 11:02:51 INFO Pedido 1045 pagado
2026-11-09 11:40:07 ERROR La pasarela de pago no responde
2026-11-09 11:40:37 ERROR La pasarela de pago no responde
2026-11-09 12:15:00 WARN Quedan pocas unidades de mochila
2026-11-09 13:30:22 INFO Pedido 1046 pagado
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.4-errores-de-un-registro/`](codigo/02-terminal-sacarle-partido/ejemplos/2.4-errores-de-un-registro/)

**En tu terminal** (`sesion.txt`):

```text
$ grep ERROR tienda.log
2026-11-09 10:27:19 ERROR No se pudo enviar el correo del pedido 1044
2026-11-09 11:40:07 ERROR La pasarela de pago no responde
2026-11-09 11:40:37 ERROR La pasarela de pago no responde
$ grep -c ERROR tienda.log
3
$ grep -v INFO tienda.log
2026-11-09 09:12:44 WARN El pago del pedido 1043 tarda más de 5 segundos
2026-11-09 10:27:19 ERROR No se pudo enviar el correo del pedido 1044
2026-11-09 11:40:07 ERROR La pasarela de pago no responde
2026-11-09 11:40:37 ERROR La pasarela de pago no responde
2026-11-09 12:15:00 WARN Quedan pocas unidades de mochila
$ grep pago tienda.log
2026-11-09 09:12:44 WARN El pago del pedido 1043 tarda más de 5 segundos
2026-11-09 11:40:07 ERROR La pasarela de pago no responde
2026-11-09 11:40:37 ERROR La pasarela de pago no responde
$ grep -i pago tienda.log
2026-11-09 09:12:44 WARN El pago del pedido 1043 tarda más de 5 segundos
2026-11-09 09:13:02 INFO Pago del pedido 1043 confirmado
2026-11-09 11:40:07 ERROR La pasarela de pago no responde
2026-11-09 11:40:37 ERROR La pasarela de pago no responde
$ grep ERROR tienda.log > errores.txt
$ grep WARN tienda.log >> errores.txt
$ wc -l errores.txt
5 errores.txt
$ cut -d ' ' -f 3 tienda.log | sort | uniq -c
      3 ERROR
      5 INFO
      2 WARN
$ tail -n 2 tienda.log
2026-11-09 12:15:00 WARN Quedan pocas unidades de mochila
2026-11-09 13:30:22 INFO Pedido 1046 pagado
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.4-errores-de-un-registro/`](codigo/02-terminal-sacarle-partido/ejemplos/2.4-errores-de-un-registro/)

**En qué fijarte:**

- **`grep ERROR`** encuentra en un momento lo importante entre miles de líneas: el correo del pedido 1044 y la pasarela de pago, que falló dos veces seguidas.
- **`grep -v INFO`** quita lo normal y deja todo lo que merece atención: avisos y errores.
- **`grep pago` y `grep -i pago` no dan lo mismo.** Sin `-i`, «Pago» (con mayúscula) no coincide con «pago», y se pierde una línea. Las tildes, en cambio, sí cuentan siempre: buscar «mas» no encuentra «más».
- **`>` y luego `>>`** reúnen en `errores.txt` los errores y, detrás, los avisos: 3 + 2 = 5 líneas.
- **`cut -d ' ' -f 3`** usa el espacio como separador: la tercera «palabra» de cada línea es el nivel. Con `sort | uniq -c`, un resumen del día en una línea.
- **`tail`** enseña lo último que ha pasado, que en un registro suele ser lo más interesante.

Con estas piezas puedes analizar cualquier registro. En los retos de la fase las juntarás en un script.

### 2.5. Variables y export

**Situación real:** quieres comprobar cómo funcionan las variables y qué ve un script de ellas. Para eso tienes un script mínimo que solo escribe el valor de la variable `ciudad`, entre corchetes para que se note si está vacía:

```bash
#!/usr/bin/env bash
# Escribe el valor de la variable ciudad, tal como la ve este script
echo "El script ve ciudad = [$ciudad]"
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.5-variables-y-export/`](codigo/02-terminal-sacarle-partido/ejemplos/2.5-variables-y-export/)

Ejecutado así, sin más, no ve nada:

**Salida:**

```text
El script ve ciudad = []
```

Ahora, en la terminal:

**En tu terminal** (`sesion.txt`):

```text
$ echo $HOME
/home/alumno
$ echo $USER
alumno
$ echo $LANG
es_ES.UTF-8
$ echo "Mi carpeta personal es $HOME"
Mi carpeta personal es /home/alumno
$ ciudad=Sevilla
$ echo $ciudad
Sevilla
$ echo "Vivo en $ciudad"
Vivo en Sevilla
$ echo 'Vivo en $ciudad'
Vivo en $ciudad
$ bash muestra-ciudad.sh
El script ve ciudad = []
$ export ciudad
$ bash muestra-ciudad.sh
El script ve ciudad = [Sevilla]
$ ciudad = Madrid
bash: ciudad: orden no encontrada
$ echo "Vivo en $ciuda"
Vivo en
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.5-variables-y-export/`](codigo/02-terminal-sacarle-partido/ejemplos/2.5-variables-y-export/)

**En qué fijarte:**

- **`$HOME`, `$USER` y `$LANG` ya existían**: las prepara el sistema. Tu carpeta personal, tu usuario y tu idioma serán otros.
- **Comillas dobles, el valor; simples, el texto tal cual.**
- **Antes de `export`, el script no ve `ciudad`** (los corchetes salen vacíos), aunque en la terminal exista. **Después, sí**: la ha heredado.
- **`ciudad = Madrid`**, con espacios, no cambia la variable: bash ha buscado una orden llamada `ciudad`.
- **`$ciuda`**, mal escrita, no da error: sale vacía. Por eso `Vivo en` se queda a medias.

### 2.6. Hacer ejecutable un script

**Situación real:** has escrito el script `hola.sh` del [apartado 1.14](#114-tu-primer-script) y quieres ejecutarlo como un programa más, con `./hola.sh`.

**En tu terminal** (`sesion.txt`):

```text
$ ls -l hola.sh
-rw-r--r-- 1 alumno alumno 77 ene 15  2026 hola.sh
$ ./hola.sh
bash: ./hola.sh: Permiso denegado
$ bash hola.sh
¡Hola! Soy un script.
$ chmod +x hola.sh
$ ls -l hola.sh
-rwxr-xr-x 1 alumno alumno 77 ene 15  2026 hola.sh
$ ./hola.sh
¡Hola! Soy un script.
$ hola.sh
bash: hola.sh: orden no encontrada
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.6-hacer-ejecutable-un-script/`](codigo/02-terminal-sacarle-partido/ejemplos/2.6-hacer-ejecutable-un-script/)

**En qué fijarte:**

- **Recién escrito, el script es `-rw-r--r--`**: se puede leer, pero no ejecutar. Por eso `./hola.sh` da **«Permiso denegado»**.
- **`bash hola.sh` funciona igualmente**, porque así no se ejecuta el fichero: `bash` lo **lee**, y para leer basta la `r`.
- **Después de `chmod +x`**, los permisos son `-rwxr-xr-x`: hay una `x` en cada grupo. Ahora `./hola.sh` funciona.
- **`hola.sh` sin `./`** sigue sin funcionar, pero por otro motivo: «orden no encontrada». La carpeta actual no está en el PATH ([apartado 1.14](#114-tu-primer-script)).
- La fecha de `ls -l` será otra en tu ordenador ([nota de 03.01](01-terminal-lo-basico.md#14-qué-hay-aquí-ls)). En Git Bash, recuerda que los permisos se imitan ([nota del apartado 1.10](#110-permisos-quién-puede-leer-escribir-y-ejecutar)): verás la `x` aunque no hayas hecho `chmod`.

### 2.7. Parar un proceso

**Situación real:** has lanzado una orden que tarda demasiado y quieres pararla; después, lanzas otra en segundo plano y la paras desde la terminal. Para no depender de ningún programa, se usa **`sleep`**, una orden que solo espera los segundos que le digas: es la forma de imitar un programa que tarda.

**En tu terminal** (`sesion.txt`):

```text
$ sleep 60
^C
$ echo "La terminal vuelve a ser tuya"
La terminal vuelve a ser tuya
$ sleep 300 &
[1] 21
$ ps
    PID TTY          TIME CMD
     14 pts/0    00:00:00 bash
     21 pts/0    00:00:00 sleep
     22 pts/0    00:00:00 ps
$ kill %1
$ ps
    PID TTY          TIME CMD
     14 pts/0    00:00:00 bash
     23 pts/0    00:00:00 ps
[1]+  Terminado                  sleep 300
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.7-parar-un-proceso/`](codigo/02-terminal-sacarle-partido/ejemplos/2.7-parar-un-proceso/)

**En qué fijarte:**

- **`sleep 60` deja la terminal ocupada**: no vuelve el indicador. A los dos segundos se ha pulsado <kbd>Ctrl</kbd>+<kbd>C</kbd> (el `^C` de la pantalla) y la orden se ha parado al momento.
- **`sleep 300 &`** se queda en segundo plano y la terminal sigue libre. bash dice su número de trabajo (`[1]`) y su PID (`21`).
- **`ps`** enseña tres procesos: la propia terminal (`bash`), el `sleep` y el `ps` que está haciendo la lista.
- **Después de `kill %1`**, el `sleep` ya no está, y bash avisa: `[1]+  Terminado  sleep 300`.
- **Los PID serán otros en tu ordenador** (y distintos cada vez). Con un PID concreto, `kill 21` habría hecho lo mismo que `kill %1`.

### 2.8. Códigos de salida

**Situación real:** quieres ver qué código de salida deja cada orden, y usarlo para decidir qué hacer.

**En tu terminal** (`sesion.txt`):

```text
$ ls pedidos.txt
pedidos.txt
$ echo $?
0
$ ls facturas.txt
ls: no se puede acceder a 'facturas.txt': No existe el archivo o el directorio
$ echo $?
2
$ grep Bilbao pedidos.txt
2026-11-09;16:12;Bilbao;cuaderno;6
$ echo $?
0
$ grep Zaragoza pedidos.txt
$ echo $?
1
$ grep -q Bilbao pedidos.txt && echo "Hay pedidos de Bilbao"
Hay pedidos de Bilbao
$ grep -q Zaragoza pedidos.txt && echo "Hay pedidos de Zaragoza"
$ grep -q Zaragoza pedidos.txt || echo "No hay pedidos de Zaragoza"
No hay pedidos de Zaragoza
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.8-codigos-de-salida/`](codigo/02-terminal-sacarle-partido/ejemplos/2.8-codigos-de-salida/)

**En qué fijarte:**

- **Todo bien, 0.** `ls` de un fichero que existe y `grep` que encuentra algo.
- **`ls` de un fichero que no existe, 2**: para `ls`, un problema serio.
- **`grep` que no encuentra nada, 1**, y en silencio. No es un error de verdad: es la respuesta «no está». Cada orden decide qué significa cada número.
- **`&&` y `||` usan el código sin enseñarlo.** `grep -q` no escribe nada: solo deja su código, y según sea 0 o 1 se ejecuta o no el `echo`.

### 2.9. Un script con argumentos

**Situación real:** en el almacén de la papelería, cada mañana se comprueba si hay que reponer algún producto. Quieres un script al que le digas el producto, las unidades que quedan y el mínimo, y que diga si hay que reponer. Y que termine con un **código de salida** que sirva a otros scripts: 0 si hay suficientes, 1 si hay que reponer, 2 si se ha usado mal.

```bash
#!/usr/bin/env bash
# Comprueba si hay que reponer un producto del almacén.
# Uso: bash stock.sh PRODUCTO UNIDADES MINIMO
# Termina con 0 si hay suficiente, con 1 si hay que reponer y con 2 si se usa mal.

# Sin los tres argumentos no se puede comprobar nada: se explica cómo se usa y se termina con 2
if [ $# -ne 3 ]; then
    echo "Uso: bash stock.sh PRODUCTO UNIDADES MINIMO" >&2
    exit 2
fi

# Nombres claros para los argumentos
producto=$1
unidades=$2
minimo=$3

# -lt quiere decir «menor que» (en inglés, less than)
if [ "$unidades" -lt "$minimo" ]; then
    echo "Reponer $producto: quedan $unidades (mínimo $minimo)"
    exit 1
fi

echo "$producto: hay suficientes ($unidades unidades)"
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.9-script-con-argumentos/`](codigo/02-terminal-sacarle-partido/ejemplos/2.9-script-con-argumentos/)

Así se comporta en cada caso, con su código de salida:

**En tu terminal** (`sesion.txt`):

```text
$ bash stock.sh Bolígrafos 120 10
Bolígrafos: hay suficientes (120 unidades)
$ echo $?
0
$ bash stock.sh Folios 8 10
Reponer Folios: quedan 8 (mínimo 10)
$ echo $?
1
$ bash stock.sh Folios
Uso: bash stock.sh PRODUCTO UNIDADES MINIMO
$ echo $?
2
$ bash stock.sh "Papel A4" 3 20
Reponer Papel A4: quedan 3 (mínimo 20)
$ bash stock.sh Papel A4 3 20
Uso: bash stock.sh PRODUCTO UNIDADES MINIMO
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/2.9-script-con-argumentos/`](codigo/02-terminal-sacarle-partido/ejemplos/2.9-script-con-argumentos/)

**En qué fijarte:**

- **Lo primero, comprobar los argumentos** (`$# -ne 3`: «si no son tres»). Si faltan, el script no intenta nada: explica cómo se usa **por la salida de error** (`>&2`) y termina con 2.
- **Les pone nombre** (`producto=$1`…): el resto del script se lee como una frase.
- **Cada camino termina con su código**: `exit 1` si hay que reponer; si llega al final sin ningún `exit`, termina con el código del último `echo`, que es 0.
- **Las comillas cuentan**: con `"Papel A4"` son tres argumentos; sin ellas, cuatro, y el script dice cómo se usa.

> **📌 Nota:** si escribes una letra donde va un número (`bash stock.sh Folios ocho 10`), `-lt` no sabe compararla y bash da un error. Comprobar que un dato es un número de verdad es la [validación de un dato](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#validación-de-un-dato) de la fase 1; en bash se puede hacer, pero no la necesitas todavía.

## 3. Errores típicos

### 3.1. Machacar un fichero con > cuando querías añadir

**Qué pasa:** quieres añadir una línea a tus notas o a un registro, escribes `echo "…" > notas.txt` y el fichero se queda con esa línea sola. Todo lo anterior ha desaparecido.

**Por qué ocurre:** `>` vacía el fichero antes de escribir; el que añade es `>>`. Lo viste al final del [ejemplo 2.1](#21-salida-y-errores-cada-uno-a-su-sitio).

**Cómo se evita:** antes de pulsar <kbd>Intro</kbd> en una orden con `>`, pregúntate «¿quiero empezar de cero este fichero?». Si no, `>>`. Y no uses `>` sobre ficheros importantes de los que no tengas copia.

### 3.2. Leer y escribir el mismo fichero en una orden

**Qué pasa:** quieres ordenar un fichero y guardarlo con el mismo nombre, y te quedas sin nada:

**En tu terminal** (`sesion.txt`):

```text
$ wc -l pedidos.txt
12 pedidos.txt
$ sort pedidos.txt > pedidos.txt
$ wc -l pedidos.txt
0 pedidos.txt
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/3.2-leer-y-escribir-el-mismo-fichero/`](codigo/02-terminal-sacarle-partido/ejemplos/3.2-leer-y-escribir-el-mismo-fichero/)

**Por qué ocurre:** bash prepara las redirecciones **antes** de ejecutar la orden. Al ver `> pedidos.txt`, vacía el fichero; cuando `sort` empieza a leerlo, ya está vacío.

**Cómo se evita:** escribe el resultado en **otro** fichero (`sort pedidos.txt > pedidos-ordenados.txt`), compruébalo y, si quieres, renómbralo después con `mv`.

### 3.3. Contar con uniq sin ordenar antes

**Qué pasa:** `cut … | uniq -c` da una lista larga con la misma tienda repetida varias veces y cuentas pequeñas.

**Por qué ocurre:** `uniq` solo junta las líneas iguales **que están seguidas**. Si no están ordenadas, cuenta trozos sueltos (la última orden del [ejemplo 2.3](#23-qué-tienda-tiene-más-pedidos)).

**Cómo se evita:** pon siempre un `sort` antes del `uniq`: `… | sort | uniq -c`.

### 3.4. Poner espacios alrededor del =

**Qué pasa:** escribes `ciudad = Madrid` y la terminal contesta `bash: ciudad: orden no encontrada`.

**Por qué ocurre:** en bash, los espacios separan las palabras de una orden. Con espacios, la primera palabra (`ciudad`) se toma como el nombre de una orden, y los demás, como sus argumentos ([ejemplo 2.5](#25-variables-y-export)).

**Cómo se evita:** sin espacios: `ciudad=Madrid`. En la mayoría de los lenguajes de programación se escriben espacios alrededor del `=`; en bash, no. Es de los errores que más se repiten al empezar.

### 3.5. «Permiso denegado» u «orden no encontrada» al ejecutar tu script

**Qué pasa:** escribes `./mi-script.sh` y te dice «Permiso denegado»; o escribes `mi-script.sh` y te dice «orden no encontrada».

**Por qué ocurre:** son dos problemas distintos ([ejemplo 2.6](#26-hacer-ejecutable-un-script)):

- **«Permiso denegado»:** el fichero no tiene el permiso `x`.
- **«orden no encontrada»:** sin ruta, el sistema busca el script en el PATH, y la carpeta actual no está.

**Cómo se arregla:** `chmod +x mi-script.sh` y ejecútalo con `./mi-script.sh`. O, sin tocar nada, `bash mi-script.sh`. Si lo quieres usar por su nombre desde cualquier sitio, ponlo en una carpeta del PATH ([ejercicio 4](#ejercicio-4--añade-una-carpeta-al-path-y-ejecuta-un-script-desde-cualquier-sitio)). Y no lo «arregles» con `sudo`: no es un problema de administrador.

### 3.6. Estropear el PATH al cambiarlo

**Qué pasa:** después de cambiar el PATH, de repente no funciona nada:

**En tu terminal** (`sesion.txt`):

```text
$ export PATH=$HOME/bin
$ ls
bash: ls: orden no encontrada
$ echo $PATH
/home/alumno/bin
$ command -v ls
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejemplos/3.6-path-estropeado/`](codigo/02-terminal-sacarle-partido/ejemplos/3.6-path-estropeado/)

**Por qué ocurre:** se te ha olvidado el `:$PATH`. El PATH tiene ahora **una sola carpeta**, la tuya, y en ella no está `ls` ni casi nada.

**Cómo se arregla:** **cierra la terminal y abre otra**: el cambio solo afectaba a esa terminal. Si el error lo pusiste en `~/.bashrc` o `~/.zshrc`, ábrelo con tu editor de código (no desde esa terminal) y corrige la línea: `export PATH="$HOME/bin:$PATH"`.

### 3.7. Cambiar ~/.bashrc y no notar nada

**Qué pasa:** añades el `export PATH=…` a tu `~/.bashrc` (o `~/.zshrc`), escribes el nombre de tu script… y «orden no encontrada».

**Por qué ocurre:** ese fichero solo se lee **al abrir** una terminal. La que tienes abierta no se ha enterado (es lo mismo que el [«command not found» después de instalar](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#31-command-not-found-justo-después-de-instalar) de 02.03).

**Cómo se arregla:** cierra la terminal y abre otra. (También se puede hacer que la terminal abierta lo vuelva a leer, con `source ~/.bashrc`, pero abrir otra es más seguro.) Si sigue sin funcionar, comprueba con `tail ~/.bashrc` que la línea está bien escrita y que has elegido el fichero de tu sistema ([apartado 1.9](#19-cambiar-el-path-en-esta-terminal-y-para-siempre)).

### 3.8. Olvidar las comillas en un argumento con espacios

**Qué pasa:** `bash stock.sh Papel A4 3 20` te dice cómo se usa, como si le faltaran datos, aunque los has escrito todos.

**Por qué ocurre:** los espacios separan argumentos: para el script son cuatro (`Papel`, `A4`, `3` y `20`), no tres ([ejemplo 2.9](#29-un-script-con-argumentos)). Pasa lo mismo con los nombres de ficheros y carpetas con espacios.

**Cómo se arregla:** entre comillas: `bash stock.sh "Papel A4" 3 20`. Y dentro de tus scripts, las variables también entre comillas (`"$fichero"`), por el mismo motivo. Mejor aún: evita los espacios en los nombres de tus ficheros de trabajo, como viste en [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#34-espacios-tildes-y-eñes-en-las-carpetas-de-programación).

### 3.9. Usar sudo para arreglarlo todo

**Qué pasa:** algo da «Permiso denegado» y lo repites con `sudo` delante. Funciona… y al día siguiente tu usuario no puede cambiar sus propios ficheros, o has borrado algo del sistema.

**Por qué ocurre:** con `sudo`, la orden se ejecuta como `root`, que puede hacerlo todo. Los ficheros que crea son de `root`, no tuyos, y no hay ninguna protección si te equivocas ([apartado 1.11](#111-administrador-sudo-y-cuándo-no-usarlo)).

**Cómo se evita:** antes de usar `sudo`, entiende por qué te niega el permiso (`ls -l`). Úsalo solo para tareas de administrador de verdad, como instalar programas del sistema, y nunca con órdenes copiadas que no entiendes.

## 4. Buenas prácticas

- **Mira los datos antes de procesarlos**: `head` y `wc -l` te dicen cómo son y cuántos hay.
- **Construye las tuberías pieza a pieza**, comprobando la salida de cada una antes de añadir la siguiente.
- **Comprueba que los números cuadran** (los del día más los de los demás días, igual al total). Un resultado que no cuadra es una pista.
- **`>>` para añadir y `>` solo para empezar de cero.** Y nunca leas y escribas el mismo fichero en una orden.
- **Separa los resultados de los errores**: en tus scripts, los mensajes de error por la salida de error (`>&2`).
- **Variables entre comillas dobles** (`"$fichero"`), y sin espacios alrededor del `=` al crearlas.
- **Al cambiar el PATH, añade** (`"$HOME/bin:$PATH"`), no sustituyas. Y para que dure, en `~/.bashrc` (Linux y Git Bash) o `~/.zshrc` (macOS), con `>>`.
- **Empieza tus scripts con `#!/usr/bin/env bash`** y un comentario que diga qué hacen y cómo se usan.
- **Comprueba los argumentos al principio** del script y, si faltan, explica cómo se usa y termina con un código distinto de 0.
- **Termina con el código de salida correcto**: 0 si todo fue bien; otro número si no. Otros scripts y herramientas confían en él.
- **Trabaja como usuario normal.** `sudo`, solo para tareas de administrador y sabiendo qué hace la orden.
- **Para parar algo, de menos a más**: <kbd>Ctrl</kbd>+<kbd>C</kbd>, luego `kill`, y `kill -9` solo como último recurso.

**Lo que conviene evitar:**

- Copiar en tu terminal órdenes largas que no entiendes, sobre todo si llevan `sudo`, `>` o `rm`.
- Tirar los errores a `/dev/null` sin haberlos leído nunca.
- Guardar tus scripts en Descargas o en el Escritorio: mejor en una carpeta tuya, como `~/bin`.

## 5. Ejercicios prácticos resueltos

> **💡 Consejo:** intenta cada ejercicio **antes** de abrir las pistas y la solución. Los que llevan carpeta de código los puedes hacer en tu terminal: descarga la carpeta, abre la terminal en ella y prueba. Los demás son de **razonar**: escribe tu respuesta y compárala después. Recuerda que tus salidas pueden ser algo distintas ([el aviso de 02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal)).

### 🟢 Básico

#### Ejercicio 1 · Las reservas de un día

**Situación real:** un restaurante apunta sus reservas en `reservas.txt`, una por línea: fecha, hora, nombre, personas y estado (`confirmada` o `cancelada`), separados por `;`. El fichero:

```text
2026-11-13;21:00;García;4;confirmada
2026-11-13;21:30;López;2;confirmada
2026-11-14;14:00;Martín;6;confirmada
2026-11-14;14:30;Sánchez;2;cancelada
2026-11-14;21:00;Pérez;3;confirmada
2026-11-14;21:15;Gómez;5;confirmada
2026-11-14;22:00;Ruiz;2;cancelada
2026-11-15;14:00;Díaz;8;confirmada
2026-11-15;21:30;Moreno;2;confirmada
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej01-reservas-de-un-dia/`](codigo/02-terminal-sacarle-partido/ejercicios/ej01-reservas-de-un-dia/)

Para el sábado 14 de noviembre, consigue con órdenes de la terminal:

1. Las reservas de ese día.
2. Cuántas son.
3. Cuántas de ellas están canceladas.
4. Las que **no** están canceladas, y cuántas son.
5. Un fichero `sabado.txt` con las reservas que siguen en pie, para imprimirlo y dejarlo en la cocina.

<details>
<summary>Pista 1</summary>

Todo se hace con `grep`, sus opciones `-c` y `-v`, tuberías y `>`. Repasa el [ejemplo 2.2](#22-contar-los-pedidos-de-un-día).

</details>

<details>
<summary>Pista 2</summary>

Para quedarte con las del día que no están canceladas, encadena dos `grep`: el primero, por la fecha; el segundo, con `-v`.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se filtra por la fecha; sobre ese resultado se filtra por el estado (con `-c` para contar y con `-v` para quedarse con lo contrario), y al final se guarda con `>`.

**En tu terminal** (`sesion.txt`):

```text
$ grep 2026-11-14 reservas.txt
2026-11-14;14:00;Martín;6;confirmada
2026-11-14;14:30;Sánchez;2;cancelada
2026-11-14;21:00;Pérez;3;confirmada
2026-11-14;21:15;Gómez;5;confirmada
2026-11-14;22:00;Ruiz;2;cancelada
$ grep -c 2026-11-14 reservas.txt
5
$ grep 2026-11-14 reservas.txt | grep -c cancelada
2
$ grep 2026-11-14 reservas.txt | grep -v cancelada
2026-11-14;14:00;Martín;6;confirmada
2026-11-14;21:00;Pérez;3;confirmada
2026-11-14;21:15;Gómez;5;confirmada
$ grep 2026-11-14 reservas.txt | grep -v cancelada | wc -l
3
$ grep 2026-11-14 reservas.txt | grep -v cancelada > sabado.txt
$ cat sabado.txt
2026-11-14;14:00;Martín;6;confirmada
2026-11-14;21:00;Pérez;3;confirmada
2026-11-14;21:15;Gómez;5;confirmada
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej01-reservas-de-un-dia/`](codigo/02-terminal-sacarle-partido/ejercicios/ej01-reservas-de-un-dia/)

**Resultado:** el sábado hay 5 reservas, 2 canceladas y 3 en pie (Martín, Pérez y Gómez), que quedan en `sabado.txt`. Y cuadra: 2 + 3 = 5.

**Errores frecuentes al resolverlo:**

- Hacer `grep -v cancelada reservas.txt` sin filtrar antes por la fecha: salen las confirmadas de **todos** los días.
- Usar `grep -c` antes de una tubería (`grep -c 2026-11-14 reservas.txt | grep -v cancelada`): el primer `grep` ya solo escribe un número, y el segundo no tiene líneas que filtrar.
- Escribir `>>` en el último paso: si repites la orden, `sabado.txt` tendría las reservas dos veces.

</details>

#### Ejercicio 2 · Lee los permisos de ls -l

Lucía escribe `ls -l` en su carpeta de trabajo y obtiene esto:

```text
-rw-r--r-- 1 lucia lucia 2048 nov  9 10:15 notas.txt
-rwxr-xr-x 1 lucia lucia  312 nov  9 10:20 copia.sh
-rw------- 1 lucia lucia  120 nov  9 10:22 claves.txt
drwxr-xr-x 2 lucia lucia 4096 nov  9 10:30 fotos
-rw-r--r-- 1 lucia lucia  180 nov  9 10:41 limpiar.sh
```

1. ¿Cuál de ellos es una carpeta? ¿Cómo lo sabes?
2. ¿Quién puede leer `claves.txt`? ¿Tiene sentido para un fichero con ese nombre?
3. ¿Qué scripts puede ejecutar Lucía con `./`? ¿Y qué pasará si escribe `./limpiar.sh`?
4. ¿Qué orden le darías para arreglarlo, y cómo quedarían los permisos de `limpiar.sh`?
5. Otro usuario del mismo ordenador, ¿puede cambiar `notas.txt`?

<details>
<summary>Pista 1</summary>

El primer carácter es el tipo. Después vienen tres grupos de tres letras: propietario, grupo y demás ([apartado 1.10](#110-permisos-quién-puede-leer-escribir-y-ejecutar)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se lee cada línea por partes: el primer carácter (tipo) y, después, los tres grupos `rwx` en orden: propietario (Lucía), grupo y los demás.

1. **`fotos`**: su primer carácter es una `d` (de *directory*, carpeta). Las demás empiezan por `-`: son ficheros.
2. **Solo Lucía**: `rw-------` da leer y escribir al propietario y nada a nadie más. Tiene todo el sentido: un fichero de claves no debe poder leerlo cualquiera.
3. **Solo `copia.sh`**, el único fichero con `x` (`rwxr-xr-x`). `./limpiar.sh` dará **«Permiso denegado»**, porque es `rw-r--r--`: se puede leer, pero no ejecutar ([ejemplo 2.6](#26-hacer-ejecutable-un-script)). Con `bash limpiar.sh`, en cambio, sí funcionaría.
4. **`chmod +x limpiar.sh`**. Sus permisos pasan a ser `-rwxr-xr-x`, como los de `copia.sh`.
5. **No**: para los demás, `notas.txt` es `r--`, solo lectura.

**Errores frecuentes al resolverlo:**

- Leer los nueve caracteres como un bloque, sin separar los tres grupos.
- Pensar que `limpiar.sh` se puede ejecutar porque termina en `.sh`: la extensión no da permisos, solo la `x`.
- Responder `sudo ./limpiar.sh` en el apartado 4: no es un problema de administrador, y el fichero es suyo.

</details>

### 🟡 Intermedio

#### Ejercicio 3 · Los productos más vendidos

**Situación real:** la papelería guarda en `ventas.txt` una línea por cada producto vendido: la fecha, la tienda y el producto, separados por `;`:

```text
2026-11-02;Madrid;cuaderno
2026-11-02;Sevilla;bolígrafo
2026-11-02;Madrid;bolígrafo
2026-11-03;Valencia;agenda
2026-11-03;Madrid;cuaderno
2026-11-03;Sevilla;mochila
2026-11-04;Madrid;bolígrafo
2026-11-04;Valencia;cuaderno
2026-11-04;Sevilla;bolígrafo
2026-11-05;Madrid;estuche
2026-11-05;Valencia;bolígrafo
2026-11-05;Madrid;cuaderno
2026-11-06;Sevilla;agenda
2026-11-06;Sevilla;bolígrafo
2026-11-06;Valencia;agenda
2026-11-06;Valencia;estuche
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej03-productos-mas-vendidos/`](codigo/02-terminal-sacarle-partido/ejercicios/ej03-productos-mas-vendidos/)

1. Saca una lista de todos los productos con cuántas veces se ha vendido cada uno, del más vendido al menos.
2. Quédate solo con los **tres** más vendidos y guárdalos en `mas-vendidos.txt`.
3. ¿Cuál es el producto más vendido **en Madrid**?

<details>
<summary>Pista 1</summary>

Es la misma tubería del [ejemplo 2.3](#23-qué-tienda-tiene-más-pedidos), con otra columna. ¿En qué columna está el producto?

</details>

<details>
<summary>Pista 2</summary>

Para el apartado 3, pon delante de la tubería un `grep` que se quede solo con las líneas de Madrid.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el producto es la columna 3. Se corta con `cut`, se ordena para juntar los iguales, se cuentan con `uniq -c` y se ordenan los recuentos de mayor a menor con `sort -rn`. Para quedarse con los primeros, `head`; para Madrid, un `grep` al principio.

**En tu terminal** (`sesion.txt`):

```text
$ cut -d ';' -f 3 ventas.txt | sort | uniq -c | sort -rn
      6 bolígrafo
      4 cuaderno
      3 agenda
      2 estuche
      1 mochila
$ cut -d ';' -f 3 ventas.txt | sort | uniq -c | sort -rn | head -n 3
      6 bolígrafo
      4 cuaderno
      3 agenda
$ cut -d ';' -f 3 ventas.txt | sort | uniq -c | sort -rn | head -n 3 > mas-vendidos.txt
$ grep Madrid ventas.txt | cut -d ';' -f 3 | sort | uniq -c | sort -rn | head -n 1
      3 cuaderno
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej03-productos-mas-vendidos/`](codigo/02-terminal-sacarle-partido/ejercicios/ej03-productos-mas-vendidos/)

**Resultado:** el más vendido es el bolígrafo (6), seguido del cuaderno (4) y la agenda (3). En Madrid, el cuaderno (3).

**Errores frecuentes al resolverlo:**

- Olvidar el primer `sort`: `uniq -c` contaría trozos sueltos ([error típico 3.3](#33-contar-con-uniq-sin-ordenar-antes)).
- Usar `sort -r` sin `-n`: ordena el texto, no los números, y con recuentos de dos cifras (`10` frente a `9`) el orden saldría mal.
- Poner el `grep Madrid` al final de la tubería: para entonces las líneas ya no tienen la tienda, solo el recuento y el producto.

</details>

#### Ejercicio 4 · Añade una carpeta al PATH y ejecuta un script desde cualquier sitio

**Situación real:** te has hecho un script, `cuantos.sh`, que dice cuántos ficheros y carpetas hay en la carpeta donde estás. Lo quieres usar en cualquier carpeta escribiendo solo `cuantos.sh`, hoy y cada vez que abras la terminal. El script:

```bash
#!/usr/bin/env bash
# Dice cuántos ficheros y carpetas hay en la carpeta actual
total=0
for elemento in *; do
    # En una carpeta vacía, el * se queda tal cual y no hay nada que contar
    if [ -e "$elemento" ]; then
        total=$((total + 1))
    fi
done
echo "En $(pwd) hay $total elementos"
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej04-carpeta-en-el-path/`](codigo/02-terminal-sacarle-partido/ejercicios/ej04-carpeta-en-el-path/)

En la carpeta del ejercicio están `cuantos.sh` y una carpeta `fotos` con tres fotos. Con la terminal en esa carpeta:

1. Crea una carpeta `~/scripts` para tus scripts y mueve allí `cuantos.sh`.
2. Hazlo ejecutable.
3. Añade `~/scripts` al **principio** del PATH en tu terminal, y comprueba que el sistema lo encuentra.
4. Ejecútalo, solo por su nombre, en `~/fotos` y en tu carpeta personal. (Si haces el ejercicio en tu ordenador, usa la carpeta `fotos` del ejercicio, esté donde esté.)
5. Haz que el cambio del PATH **dure** al cerrar la terminal, y di cómo comprobarías que ha funcionado.

<details>
<summary>Pista 1</summary>

Para los pasos 1 a 3 necesitas `mkdir`, `mv` y `chmod +x` ([ejemplo 2.6](#26-hacer-ejecutable-un-script)), y la línea del `export` del [apartado 1.9](#19-cambiar-el-path-en-esta-terminal-y-para-siempre). Para comprobar que el sistema encuentra el script, `command -v`, que ya conoces de [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#111-cuando-el-sistema-no-encuentra-un-programa).

</details>

<details>
<summary>Pista 2</summary>

Para el paso 5, mira en el [apartado 1.9](#19-cambiar-el-path-en-esta-terminal-y-para-siempre) qué fichero lee tu terminal al abrirse y cómo se añade una línea al final sin borrar lo que tiene. Cuidado con las comillas.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** para que el sistema encuentre un programa por su nombre, tiene que estar en una carpeta del PATH y tener permiso de ejecución. Se crea la carpeta, se mueve el script, se le da la `x` y se añade la carpeta al PATH **sin perder las demás**. Para que dure, esa misma línea va en el fichero que la terminal lee al abrirse.

**En tu terminal** (`sesion.txt`):

```text
$ mkdir ~/scripts
$ mv cuantos.sh ~/scripts/
$ chmod +x ~/scripts/cuantos.sh
$ export PATH="$HOME/scripts:$PATH"
$ command -v cuantos.sh
/home/alumno/scripts/cuantos.sh
$ cd ~/fotos
$ cuantos.sh
En /home/alumno/fotos hay 3 elementos
$ cd
$ cuantos.sh
En /home/alumno hay 2 elementos
$ echo 'export PATH="$HOME/scripts:$PATH"' >> ~/.bashrc
$ tail -n 1 ~/.bashrc
export PATH="$HOME/scripts:$PATH"
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej04-carpeta-en-el-path/`](codigo/02-terminal-sacarle-partido/ejercicios/ej04-carpeta-en-el-path/)

Paso a paso:

1. **`mkdir ~/scripts` y `mv`**: el script queda en `/home/alumno/scripts/cuantos.sh`.
2. **`chmod +x`**: sin la `x`, aunque esté en el PATH, el sistema no lo ejecutaría.
3. **`export PATH="$HOME/scripts:$PATH"`**: tu carpeta, delante; las de antes, detrás. `command -v` lo confirma con su ruta.
4. **Se ejecuta desde cualquier carpeta** y cuenta lo que hay **donde estás**: 3 fotos en `~/fotos` y 2 elementos en la carpeta personal (`fotos` y `scripts`). En la tuya, los números serán otros.
5. **La misma línea, al final de tu fichero de configuración**, con `>>` (con `>` borrarías todo el fichero) y **comillas simples** fuera, para que se guarde con sus `$`. `tail -n 1` comprueba que ha quedado bien escrita. En **macOS**, el fichero es `~/.zshrc`; en **Git Bash**, `~/.bashrc` (la primera vez que abras Git Bash después, verás el aviso de que ha creado un `~/.bash_profile`: es normal).

**Cómo comprobar que dura:** **cierra la terminal, abre otra** y escribe `command -v cuantos.sh`. Tiene que salir su ruta. En la terminal de Linux en la que se ha comprobado el curso, una terminal nueva lo encuentra:

```text
$ command -v cuantos.sh
/home/alumno/scripts/cuantos.sh
```

**Errores frecuentes al resolverlo:**

- Escribir `export PATH="$HOME/scripts"`, sin `:$PATH`: a partir de ahí no funciona ni `ls` ([error típico 3.6](#36-estropear-el-path-al-cambiarlo)).
- Usar comillas **dobles** en el `echo` del paso 5: se guardaría en el fichero el PATH de **hoy** ya calculado, con todas sus carpetas escritas, en lugar de `$PATH`.
- Comprobarlo en la misma terminal: el fichero solo se lee al abrir una nueva ([error típico 3.7](#37-cambiar-bashrc-y-no-notar-nada)).
- En macOS, escribir en `~/.bashrc`: la terminal de macOS usa zsh y no lo lee.

</details>

### 🔴 Avanzado

#### Ejercicio 5 · Un script que cuenta las reservas de un día

**Situación real:** en el restaurante del [ejercicio 1](#ejercicio-1--las-reservas-de-un-día), el encargado quiere un script para consultar cualquier día sin acordarse de las tuberías. Escribe `reservas-dia.sh`, que:

- Reciba la fecha como **único argumento** (por ejemplo, `bash reservas-dia.sh 2026-11-14`) y trabaje con el `reservas.txt` de la carpeta donde se ejecuta.
- Escriba cuántas reservas hay ese día, cuántas confirmadas y cuántas canceladas.
- Si ese día no hay ninguna, lo diga con una frase.
- Si no le dan exactamente un argumento, explique cómo se usa (por la salida de error) y termine con el código 2. Si no encuentra `reservas.txt`, lo diga y termine con 1.

<details>
<summary>Pista 1</summary>

Empieza como `stock.sh` del [ejemplo 2.9](#29-un-script-con-argumentos): comprueba `$#` y da nombre al argumento. Para comprobar el fichero, `[ ! -f "$fichero" ]` («si **no** es un fichero», [apartado 1.16](#116-decidir-y-repetir-en-un-script-if-y-for)).

</details>

<details>
<summary>Pista 2</summary>

Guarda los recuentos en variables con `$( )`: el total, con `grep -c`; las canceladas, con una tubería de dos `grep`. Las confirmadas no hace falta contarlas: se calculan con `$(( ))`.

</details>

<details>
<summary>Pista 3</summary>

Busca la fecha con `"^$fecha;"`. El `^` quiere decir «al principio de la línea» (en `grep`, un símbolo de búsqueda): así solo coincide con la columna de la fecha.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero, las comprobaciones (argumentos y fichero), cada una con su mensaje y su código. Después, los recuentos con las mismas tuberías del ejercicio 1, guardados en variables. Por último, el resultado, y un `if` para el día sin reservas.

```bash
#!/usr/bin/env bash
# Resumen de las reservas de un día del restaurante.
# Uso: bash reservas-dia.sh FECHA      (la fecha, como en reservas.txt: 2026-11-14)
# Termina con 0 si todo va bien, con 1 si falta reservas.txt y con 2 si se usa mal.

if [ $# -ne 1 ]; then
    echo "Uso: bash reservas-dia.sh FECHA" >&2
    exit 2
fi

fecha=$1
fichero=reservas.txt

if [ ! -f "$fichero" ]; then
    echo "Error: no encuentro $fichero en esta carpeta" >&2
    exit 1
fi

# Las mismas tuberías que en la terminal, guardando el resultado en variables
total=$(grep -c "^$fecha;" "$fichero")
canceladas=$(grep "^$fecha;" "$fichero" | grep -c cancelada)
confirmadas=$((total - canceladas))

echo "Reservas del $fecha: $total"
echo "- Confirmadas: $confirmadas"
echo "- Canceladas: $canceladas"

if [ "$total" -eq 0 ]; then
    echo "Ese día no hay ninguna reserva."
fi
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej05-script-reservas-de-un-dia/`](codigo/02-terminal-sacarle-partido/ejercicios/ej05-script-reservas-de-un-dia/)

Con `bash reservas-dia.sh 2026-11-14`:

**Salida:**

```text
Reservas del 2026-11-14: 5
- Confirmadas: 3
- Canceladas: 2
```

Los demás casos:

**En tu terminal** (`sesion.txt`):

```text
$ bash reservas-dia.sh 2026-11-15
Reservas del 2026-11-15: 2
- Confirmadas: 2
- Canceladas: 0
$ bash reservas-dia.sh 2026-12-25
Reservas del 2026-12-25: 0
- Confirmadas: 0
- Canceladas: 0
Ese día no hay ninguna reserva.
$ bash reservas-dia.sh
Uso: bash reservas-dia.sh FECHA
$ echo $?
2
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej05-script-reservas-de-un-dia/`](codigo/02-terminal-sacarle-partido/ejercicios/ej05-script-reservas-de-un-dia/)

**Por qué así:**

- **Las comprobaciones, primero**: si algo falla, el script no hace nada a medias.
- **`"^$fecha;"`** busca la fecha solo al principio de la línea y seguida de `;`. Así no se confunde con un número de teléfono o una hora que se le parezca.
- **Las confirmadas se calculan**: total menos canceladas. Es más sencillo, y si añades otro estado (por ejemplo, «pendiente»), lo verías en la diferencia. (Para contarlas de verdad: `grep "^$fecha;" "$fichero" | grep -c confirmada`.)
- **El caso del 25 de diciembre** es un [caso límite](../fase-01-que-es-programar/03-probar-un-programa.md#14-qué-casos-elegir-normales-límite-y-no-válidos): un día sin reservas. El script lo dice con una frase y termina bien, porque no es un error.

**Errores frecuentes al resolverlo:**

- Olvidar las comillas en `"^$fecha;"`: aquí funcionaría, pero es una mala costumbre.
- Escribir `[ $total -eq 0 ]` sin espacios dentro de los corchetes (`[$total -eq 0]`): bash no lo entiende.
- Mandar el mensaje de uso a la salida estándar: quien guarde el resultado en un fichero se encontraría el mensaje dentro.
- Terminar con `exit 1` cuando no hay reservas: no es un error, es una respuesta válida.

</details>

### 🏆 Caso real

#### Ejercicio 6 · Copia de seguridad de una carpeta con la fecha

**Situación real:** llevas tus documentos de una reforma en la carpeta `documentos` y quieres hacer una copia de seguridad cada día, guardada aparte y con la fecha en el nombre, para poder volver atrás si borras o estropeas algo. Escribe `copia.sh`, que:

- Reciba como argumento la carpeta que hay que copiar (`bash copia.sh documentos`).
- La copie dentro de una carpeta `copias`, con el nombre de la carpeta y la fecha de hoy: `copias/documentos-2026-11-09`. Si `copias` no existe, que la cree.
- Si ya hay una copia de hoy, la sustituya por la nueva, avisando por la salida de error.
- Al terminar, diga dónde ha dejado la copia y cuántos ficheros tiene, para comprobar que no está vacía.
- Si no le dan una carpeta, o la carpeta no existe, lo diga por la salida de error y termine con un código distinto de 0 (2 si se usa mal y 1 si la carpeta no existe).
- Funcione igual en Linux, macOS y Git Bash.

<details>
<summary>Pista 1</summary>

Para la fecha, `date +%Y-%m-%d` dentro de `$( )` ([apartado 1.15](#115-argumentos-lo-que-recibe-un-script)): funciona igual en macOS y en Linux. Para crear `copias` sin error si ya existe, `mkdir -p`. Para copiar una carpeta con todo lo que tiene dentro, `cp -R`: es el `cp -r` de [03.01](01-terminal-lo-basico.md#17-copiar-mover-y-renombrar-cp-y-mv), con la `R` en mayúscula, porque el manual de `cp` de macOS desaconseja la `-r` minúscula.

</details>

<details>
<summary>Pista 2</summary>

Para saber si la carpeta existe, `[ -d "$origen" ]`; para saber si ya hay copia de hoy, `[ -e "$destino" ]`. Para contar los ficheros copiados, un `for` con un contador, como en el [apartado 1.16](#116-decidir-y-repetir-en-un-script-if-y-for).

</details>

<details>
<summary>Pista 3</summary>

Escribe primero en comentarios los pasos, como en pseudocódigo: comprobar el argumento, comprobar la carpeta, calcular el nombre de la copia, quitar la de hoy si existe, copiar, contar y avisar. Después, rellena cada paso con su orden.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el script sigue los pasos de la pista 3, cada uno con un comentario numerado. Primero se comprueba todo lo que puede fallar; después se calcula el nombre de la copia con la fecha; se quita la de hoy si ya existía (porque `cp -R` sobre una carpeta que ya existe metería la copia **dentro** de ella); se copia, y se cuenta lo copiado.

```bash
#!/usr/bin/env bash
# Copia de seguridad de una carpeta, con la fecha de hoy en el nombre.
# Uso: bash copia.sh CARPETA
# La copia se guarda en copias/CARPETA-AAAA-MM-DD (si ya hay una de hoy, la sustituye).
# Termina con 0 si la hace, con 1 si la carpeta no existe y con 2 si se usa mal.

# 1. Comprobar que se ha dicho qué carpeta copiar
if [ $# -ne 1 ]; then
    echo "Uso: bash copia.sh CARPETA" >&2
    exit 2
fi

origen=$1

# 2. Comprobar que la carpeta existe (-d: «existe y es una carpeta»)
if [ ! -d "$origen" ]; then
    echo "Error: no existe la carpeta $origen" >&2
    exit 1
fi

# 3. El nombre de la copia, con la fecha de hoy (por ejemplo, copias/documentos-2026-11-09)
hoy=$(date +%Y-%m-%d)
destino="copias/$origen-$hoy"

# 4. Si ya hay una copia de hoy, se sustituye por esta (avisando por la salida de error)
if [ -e "$destino" ]; then
    echo "Aviso: ya había una copia de hoy; la sustituyo por esta" >&2
    rm -r "$destino"
fi

# 5. Copiar
mkdir -p copias
cp -R "$origen" "$destino"

# 6. Contar lo copiado, para comprobar que no está vacía
total=0
for fichero in "$destino"/*; do
    total=$((total + 1))
done

echo "Copia hecha: $destino ($total ficheros)"
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej06-copia-de-seguridad/`](codigo/02-terminal-sacarle-partido/ejercicios/ej06-copia-de-seguridad/)

Con `bash copia.sh documentos`, en una carpeta con `documentos` y sus tres ficheros:

**Salida:**

```text
Copia hecha: copias/documentos-2026-11-09 (3 ficheros)
```

La fecha será la del día en que lo ejecutes. Y todos los casos, uno detrás de otro:

**En tu terminal** (`sesion.txt`):

```text
$ bash copia.sh documentos
Copia hecha: copias/documentos-2026-11-09 (3 ficheros)
$ ls copias
documentos-2026-11-09
$ ls copias/*
lista-compra.txt  notas.txt  presupuesto.txt
$ bash copia.sh documentos
Aviso: ya había una copia de hoy; la sustituyo por esta
Copia hecha: copias/documentos-2026-11-09 (3 ficheros)
$ bash copia.sh fotos
Error: no existe la carpeta fotos
$ echo $?
1
$ bash copia.sh
Uso: bash copia.sh CARPETA
$ echo $?
2
```

📁 **Código:** [`codigo/02-terminal-sacarle-partido/ejercicios/ej06-copia-de-seguridad/`](codigo/02-terminal-sacarle-partido/ejercicios/ej06-copia-de-seguridad/)

**Por qué así:**

- **Funciona en los tres sistemas** porque solo usa lo que es igual en todos: `date +%Y-%m-%d`, `mkdir -p`, `cp -R`, `rm -r`, `if`, `for` y `$(( ))`. Nada de `date -d` ni de opciones que solo existen en Linux.
- **La fecha en formato año-mes-día** (`2026-11-09`) hace que, al listar las copias, salgan **ordenadas por fecha** sin hacer nada: el orden alfabético y el de las fechas coinciden.
- **Comprueba antes de actuar** y cada fallo tiene su código: 2 si se usa mal, 1 si la carpeta no existe. Otro script podría decidir qué hacer según ese código.
- **El aviso va por la salida de error**: si guardas la salida en un registro de copias (`bash copia.sh documentos >> copias.log`), allí solo quedan las líneas de «Copia hecha», y los avisos siguen saliendo en la pantalla, donde los ves.
- **`rm -r` solo borra la copia de hoy**, nunca el original: `destino` siempre empieza por `copias/`. Aun así, un `rm -r` en un script merece siempre una segunda lectura.
- **Contar lo copiado** es una comprobación sencilla de que la copia no está vacía. Una copia de seguridad que nunca se comprueba no es de fiar.

**Errores frecuentes al resolverlo:**

- Usar `cp` sin `-R`: con una carpeta, `cp` se niega a copiar.
- Escribir `mkdir copias` sin `-p`: la segunda vez da error porque ya existe.
- No sustituir la copia de hoy: la segunda ejecución metería una copia **dentro** de la otra (`copias/documentos-2026-11-09/documentos`).
- Usar `date -d` o `date -v` para algo que no lo necesita: deja de funcionar en uno de los dos sistemas.
- Mandar los errores con `echo` normal, sin `>&2`.

</details>

## 6. Chuleta

### Redirecciones

| Escribes | Qué hace |
|---|---|
| `orden > f` | La salida, a `f`, **vaciándolo antes** |
| `orden >> f` | La salida, **al final** de `f` |
| `orden 2> f` | Los errores, a `f` |
| `orden 2> /dev/null` | Tira los errores |
| `orden > f 2>&1` | La salida y los errores, a `f` |
| `orden < f` | Lee de `f` en lugar del teclado |
| `orden1 \| orden2` | La salida de `orden1` es la entrada de `orden2` |
| `echo "…" >&2` | En un script, escribe por la salida de error |

### Filtros

| Orden | Qué hace |
|---|---|
| `grep texto f` | Las líneas con `texto` (`-i` sin mayúsculas, `-c` contar, `-v` las que no, `-q` sin escribir) |
| `sort` | Ordena (`-n` como números, `-r` al revés) |
| `uniq -c` | Cuenta las líneas iguales **seguidas** (siempre después de `sort`) |
| `wc -l` | Cuenta las líneas |
| `cut -d ';' -f 3` | La columna 3, separadas por `;` |
| `head -n 5` / `tail -n 5` | Las 5 primeras / últimas |

### Recetas

| Para | Escribe |
|---|---|
| Contar las líneas con algo | `grep -c texto f` |
| Las líneas con una cosa y otra | `grep uno f \| grep otro` |
| Cuántas veces sale cada valor de una columna | `cut -d ';' -f 3 f \| sort \| uniq -c \| sort -rn` |
| Los 3 que más salen | … `\| sort -rn \| head -n 3` |
| Guardar los errores de un registro | `grep ERROR app.log > errores.txt` |

### Variables y PATH

| Escribes | Qué hace |
|---|---|
| `nombre=valor` | Crea una variable (**sin espacios** alrededor del `=`) |
| `echo "$nombre"` | Usa su valor (comillas dobles: se sustituye; simples: tal cual) |
| `export nombre` | La pasan a heredar los programas que lances |
| `export PATH="$HOME/bin:$PATH"` | Añade `~/bin` al principio del PATH, en esta terminal |
| `echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc` | Lo mismo, para siempre (en macOS, `~/.zshrc`). Después, terminal nueva |

### Permisos, administrador y procesos

| Escribes | Qué hace |
|---|---|
| `ls -l` | Lista con permisos: tipo + propietario, grupo y demás (`rwx`) |
| `chmod +x script.sh` | Da permiso de ejecución |
| `sudo orden` | Ejecuta esa orden como administrador (Linux y macOS). Solo si hace falta |
| `ps` / `ps aux` | Los procesos de esta terminal / todos |
| `top` | Los que más gastan, en directo (<kbd>Q</kbd> para salir) |
| <kbd>Ctrl</kbd>+<kbd>C</kbd> | Para la orden que está en marcha |
| `kill PID` / `kill %1` | Pide a un proceso que termine (`kill -9`, último recurso) |
| `orden &` | La lanza en segundo plano |

### Códigos de salida

| Escribes | Qué hace |
|---|---|
| `echo $?` | El código de la última orden: **0, bien**; otro número, algo falló |
| `orden1 && orden2` | `orden2` solo si `orden1` fue bien |
| `orden1 \|\| orden2` | `orden2` solo si `orden1` falló |
| `exit 1` | En un script, termina con ese código |

### Plantilla de un script

```bash
#!/usr/bin/env bash
# Qué hace el script.
# Uso: bash mi-script.sh ARGUMENTO

if [ $# -ne 1 ]; then
    echo "Uso: bash mi-script.sh ARGUMENTO" >&2
    exit 2
fi

dato=$1

for elemento in uno dos tres; do
    echo "$dato: $elemento"
done
```

| En el script | Significa |
|---|---|
| `$1`, `$2`… / `$#` | Los argumentos / cuántos son |
| `$(orden)` | Lo que escribe esa orden |
| `$((total + 1))` | Una cuenta con enteros |
| `if [ … ]; then … else … fi` | `SI … ENTONCES … SI NO … FIN SI` |
| `for x in a b c; do … done` | `PARA cada x DE … HACER … FIN PARA` |
| `-eq -ne -lt -le -gt -ge` | Comparar números |
| `= !=` | Comparar texto |
| `-f` / `-d` / `-e` | Es un fichero / una carpeta / existe |
| `bash script.sh` / `./script.sh` | Ejecutarlo (para `./`, antes `chmod +x`) |

### Diferencias entre sistemas

| Qué | Linux | macOS | Git Bash |
|---|---|---|---|
| Fichero de configuración de la terminal | `~/.bashrc` | `~/.zshrc` | `~/.bashrc` (se carga a través de `~/.bash_profile`) |
| `chmod +x` | Funciona | Funciona | Casi sin efecto: es ejecutable lo que empieza por `#!` |
| `sudo` | Sí | Sí | No lo trae |
| `wc -l`, `uniq -c` | El número, con este espaciado | El mismo número, con otro espaciado | Como Linux |
| `date` de ayer | `date -d yesterday` | `date -v-1d` | Como Linux |
| `sed -i` | `sed -i …` | `sed -i '' …` | Como Linux |

## 7. Preguntas de repaso

1. ¿Cuáles son los tres canales de una orden y adónde van por defecto?

   <details>
   <summary>Ver respuesta</summary>

   La entrada estándar (del teclado), la salida estándar (a la pantalla) y la salida de error (también a la pantalla, pero por un canal aparte). Estar separadas permite guardar los resultados sin que se cuelen los errores. Lo tienes en [1.1. Los tres canales de una orden](#11-los-tres-canales-de-una-orden).

   </details>

2. ¿Qué diferencia hay entre `>` y `>>`? ¿Cuál es peligroso y por qué?

   <details>
   <summary>Ver respuesta</summary>

   `>` vacía el fichero y escribe desde el principio; `>>` añade al final sin tocar lo que había. El peligroso es `>`: si el fichero tenía algo, se pierde sin avisar. Lo tienes en [1.2. Mandar la salida a un fichero: > y >>](#12-mandar-la-salida-a-un-fichero--y-).

   </details>

3. ¿Qué hace una tubería? Explica qué hace cada pieza de `grep 2026-11-09 pedidos.txt | wc -l`.

   <details>
   <summary>Ver respuesta</summary>

   Pasa la salida de una orden como entrada de la siguiente, sin fichero de por medio. `grep` deja las líneas que contienen la fecha y se las pasa a `wc -l`, que las cuenta: en la pantalla solo sale el número de pedidos de ese día. Lo tienes en [1.5. Tuberías: la salida de una orden es la entrada de otra](#15-tuberías-la-salida-de-una-orden-es-la-entrada-de-otra).

   </details>

4. ¿Qué tres reglas hay que seguir al crear y usar una variable en bash?

   <details>
   <summary>Ver respuesta</summary>

   Sin espacios alrededor del `=` (`ciudad=Sevilla`); con `$` delante para usar su valor (`$ciudad`); y entre comillas si el valor tiene espacios. Además, al usarla, mejor entre comillas dobles, porque las simples no sustituyen el valor. Lo tienes en [1.7. Variables en la terminal](#17-variables-en-la-terminal).

   </details>

5. Has creado una variable en la terminal, pero el script que lanzas no la ve. ¿Qué falta y por qué?

   <details>
   <summary>Ver respuesta</summary>

   Falta exportarla con `export`. Cada programa que se lanza es un proceso nuevo que solo recibe una copia de las variables exportadas. Lo tienes en [1.8. export: variables que heredan los programas](#18-export-variables-que-heredan-los-programas).

   </details>

6. ¿Cómo añades la carpeta `~/bin` al PATH sin perder las demás? ¿Y cómo haces que dure en Linux, en macOS y en Git Bash?

   <details>
   <summary>Ver respuesta</summary>

   Con `export PATH="$HOME/bin:$PATH"`: el `:$PATH` conserva las carpetas de antes. Para que dure, esa línea va en `~/.bashrc` en Linux y en Git Bash (que lo carga a través de `~/.bash_profile`) y en `~/.zshrc` en macOS; y después se abre una terminal nueva. Lo tienes en [1.9. Cambiar el PATH: en esta terminal y para siempre](#19-cambiar-el-path-en-esta-terminal-y-para-siempre).

   </details>

7. ¿Qué significa `-rwxr-xr--`? ¿Qué orden pondrías para poder ejecutar un script recién escrito?

   <details>
   <summary>Ver respuesta</summary>

   Es un fichero (`-`) que su propietario puede leer, escribir y ejecutar (`rwx`), su grupo leer y ejecutar (`r-x`) y los demás solo leer (`r--`). Para ejecutar un script recién escrito, `chmod +x script.sh` (o ejecutarlo con `bash script.sh`, que no necesita ese permiso). Lo tienes en [1.10. Permisos: quién puede leer, escribir y ejecutar](#110-permisos-quién-puede-leer-escribir-y-ejecutar).

   </details>

8. ¿Qué hace `sudo` y cuándo no deberías usarlo?

   <details>
   <summary>Ver respuesta</summary>

   Ejecuta una orden como administrador (`root`), pidiendo tu contraseña. No se usa para el trabajo de cada día, ni para «arreglar» un «Permiso denegado» que no entiendes, ni con órdenes copiadas que no entiendes: con `sudo` pueden hacer cualquier cosa. Es la idea del mínimo privilegio. Lo tienes en [1.11. Administrador: sudo y cuándo no usarlo](#111-administrador-sudo-y-cuándo-no-usarlo).

   </details>

9. Un script se ha quedado en un bucle infinito en tu terminal. ¿Cómo lo paras? ¿Y si fuera un proceso de otra ventana?

   <details>
   <summary>Ver respuesta</summary>

   Con <kbd>Ctrl</kbd>+<kbd>C</kbd>, que para la orden que está en marcha en la terminal. Si es otro proceso, buscas su PID con `ps` (o `ps aux | grep …`) y le pides que termine con `kill PID`; `kill -9 PID` solo si no responde. Lo tienes en [1.12. Procesos: verlos y pararlos](#112-procesos-verlos-y-pararlos).

   </details>

10. ¿Qué es el código de salida? ¿Qué significa un 0? ¿Qué hacen `&&` y `||`?

    <details>
    <summary>Ver respuesta</summary>

    El número que devuelve una orden al terminar, que se consulta con `echo $?`. Un 0 quiere decir que fue bien; cualquier otro número, que algo falló (o, como en `grep`, que no encontró nada). `orden1 && orden2` ejecuta la segunda solo si la primera fue bien, y `orden1 || orden2`, solo si falló. Lo tienes en [1.13. Códigos de salida](#113-códigos-de-salida).

    </details>

11. ¿Qué diferencia hay entre ejecutar un script con `bash script.sh` y con `./script.sh`? ¿Por qué no basta con `script.sh`?

    <details>
    <summary>Ver respuesta</summary>

    `bash script.sh` le pide a bash que lea el fichero: no necesita el permiso de ejecución. `./script.sh` lo ejecuta como un programa: necesita la `x` y usa la primera línea (`#!/usr/bin/env bash`) para saber con qué ejecutarlo. Sin el `./`, el sistema lo busca en el PATH, y la carpeta actual no está en él. Lo tienes en [1.14. Tu primer script](#114-tu-primer-script).

    </details>

12. En un script, ¿qué tienen `$1` y `$#`? ¿Qué debe hacer un buen script si no le dan los argumentos que necesita?

    <details>
    <summary>Ver respuesta</summary>

    `$1` es el primer argumento y `$#`, cuántos ha recibido. Si faltan, debe explicar cómo se usa por la salida de error (`>&2`) y terminar con un código distinto de 0 (`exit 2`), sin hacer nada a medias. Lo tienes en [1.15. Argumentos: lo que recibe un script](#115-argumentos-lo-que-recibe-un-script).

    </details>

13. Traduce a bash este pseudocódigo: `PARA cada ciudad DE [Madrid, Sevilla] HACER ESCRIBIR ciudad FIN PARA`. ¿Qué tienes que recordar de los corchetes de un `if`?

    <details>
    <summary>Ver respuesta</summary>

    `for ciudad in Madrid Sevilla; do echo "$ciudad"; done` (o en varias líneas, con `do` y `done`). En un `if`, la condición va entre `[` y `]` con un espacio a cada lado por dentro, y los números se comparan con `-eq`, `-lt`, `-gt`… en lugar de `=`, `<` o `>`. Lo tienes en [1.16. Decidir y repetir en un script: if y for](#116-decidir-y-repetir-en-un-script-if-y-for).

    </details>

---
⬅️ [Anterior: La terminal: lo básico](01-terminal-lo-basico.md) · 📚 [Índice](../00-indice.md) · ➡️ [Siguiente: El editor de código](03-editor-de-codigo.md)
