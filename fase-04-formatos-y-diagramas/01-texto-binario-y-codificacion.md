# 04.01 Texto, binario y codificación

> **Versiones:** Unicode 18.0 (septiembre de 2026), comprobada el 9 de noviembre de 2026; las sesiones, con `file` 5.46 e `iconv` de glibc 2.43
> **Conviene saber antes:** [02.01 Cómo funciona un ordenador, 1.2](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#12-bits-y-bytes-todo-son-números) · [02.02 Archivos, carpetas y rutas, 1.14](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#114-la-extensión) · [03.02 La terminal: sacarle partido](../fase-03-herramientas/02-terminal-sacarle-partido.md)
> **Tiempo estimado:** 1,5 horas
> **Nivel:** Básico · Ampliación

## Qué aprenderás

- Por qué **todo fichero son bytes**, y qué diferencia un **fichero de texto** de uno **binario**.
- Por qué **la extensión no decide** lo que hay dentro de un fichero, y cómo lo averigua la orden `file`.
- Cómo se convierten las letras en números: **ASCII**, las tablas de cada idioma (**Latin-1** y **Windows-1252**) y **Unicode**.
- Qué es **UTF-8**, por qué una `ñ` ocupa **dos bytes** y cómo lo compruebas con `wc -c` y `wc -m`.
- Cómo **ver los bytes** de un fichero con `od`.
- Por qué a veces salen **caracteres estropeados** («Ã±», «�») y cómo saber qué ha pasado.
- Qué es el **BOM** y por qué conviene no ponerlo.
- Cómo **convertir** un fichero de una codificación a otra con `iconv`, y cómo ver y cambiar la codificación en VS Code.
- Las dos reglas de este módulo: **UTF-8 sin BOM** y **saltos de línea LF**.

## 1. Teoría

### 1.1. Todo son bytes

En [02.01](../fase-02-tu-ordenador/01-como-funciona-un-ordenador.md#12-bits-y-bytes-todo-son-números) viste que dentro del ordenador todo acaba siendo **bytes**: grupos de 8 bits, cada uno con un valor de 0 a 255. Un fichero no es una excepción: **un fichero es una fila de bytes**, uno detrás de otro, y nada más. Da igual que sea una receta, una foto o un programa.

Lo que cambia de un fichero a otro es **qué significan esos bytes**. Los bytes no dicen nada por sí solos: el número 65 puede ser la letra `A`, un trozo del color de un píxel o una parte de una instrucción del procesador. **Quien da sentido a los bytes es el programa que los lee**: un visor de fotos los interpreta como píxeles; un editor de código, como letras.

Por eso, para entender un fichero hay que saber dos cosas: **qué tipo de contenido tiene** (texto, imagen, sonido…) y, si es texto, **qué tabla convierte sus bytes en letras**. Eso es este módulo.

### 1.2. Ficheros de texto y ficheros binarios

Los ficheros se dividen en dos grandes familias:

- Un **fichero de texto** es aquel en el que **cada byte (o cada grupo de bytes) es un carácter**: letras, números, signos, espacios y saltos de línea. Es el [texto plano](../fase-03-herramientas/03-editor-de-codigo.md#11-qué-es-un-editor-de-código) que ya conoces: código fuente, scripts, configuración, CSV, Markdown, JSON… Lo puedes abrir con cualquier editor y leerlo.
- Un **fichero binario** es **todo lo demás**: sus bytes no son caracteres, sino datos con el formato propio de un programa. Fotos (`.png`, `.jpg`), sonido (`.mp3`), vídeo, documentos de oficina (`.docx`, `.pdf`), ficheros comprimidos (`.zip`) y programas ya compilados (`.exe`). Para leerlos hace falta **el programa que entiende ese formato**.

| | Fichero de texto | Fichero binario |
|---|---|---|
| **Qué son sus bytes** | Caracteres, según una tabla (la codificación) | Datos con el formato de un programa |
| **Ejemplos** | `.txt`, `.md`, `.csv`, `.json`, `.sh`, `.html` | `.png`, `.jpg`, `.mp3`, `.pdf`, `.docx`, `.zip`, `.exe` |
| **Se abre con** | Cualquier editor de código | El programa de su formato |
| **En el editor se ve** | Texto que se entiende | Símbolos sin sentido |

> **📌 Nota:** un `.docx` de Word **es binario**, aunque por dentro tenga texto: es un fichero comprimido (como un `.zip`) con el texto, el formato y las imágenes. Por eso no sirve para programar ([03.03](../fase-03-herramientas/03-editor-de-codigo.md#12-editor-procesador-de-textos-e-ide)).

**Por qué te importa.** Casi todo lo que vas a escribir como programador son ficheros de texto, y las herramientas del programador están hechas para ellos: la terminal (`cat`, `grep`, `wc`…), el editor y, en la fase 5, Git. Con un binario, esas herramientas no sirven de mucho: `cat` llenaría la pantalla de símbolos raros y `grep` no encontraría nada útil.

### 1.3. La extensión no decide el contenido

En [02.02](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#114-la-extensión) viste que la [extensión](../glosario.md#extensión) es solo **parte del nombre**: una pista para el sistema y para ti. Cambiar `logo.png` por `logo.txt` no convierte la imagen en texto: los bytes siguen siendo los mismos.

Entonces, ¿cómo se sabe qué hay de verdad en un fichero? **Mirando dentro**. Muchos formatos binarios empiezan siempre con los mismos bytes, una especie de **firma** (en inglés, *magic number*): todo PNG empieza por los caracteres `PNG` (detrás de un primer byte especial), todo PDF por `%PDF` y todo ZIP por `PK`. Con un fichero de texto no hay firma, pero se nota en que todos sus bytes son caracteres válidos.

La orden **`file`** hace justo eso: lee el principio del fichero y te dice qué parece que contiene, **sin mirar la extensión**:

```text
$ file notas.txt logo.png
notas.txt: Unicode text, UTF-8 text
logo.png:  PNG image data, 16 x 16, 8-bit/color RGB, non-interlaced
```

Lo verás entero en el [ejemplo 2.1](#21-qué-hay-dentro-de-cada-fichero).

> **📌 Nota:** `file` **adivina**: con los binarios acierta casi siempre, porque tienen firma; con el texto reconoce ASCII y UTF-8, pero con las tablas de un byte del [apartado 1.5](#15-una-tabla-por-idioma-latin-1-y-windows-1252) solo puede decir algo como `ISO-8859 text` o `Non-ISO extended-ASCII text`, que **no es la codificación, sino una pista** (y cambia de un sistema a otro). Sus respuestas están **en inglés** (no las traduce) y pueden cambiar un poco de una versión a otra. `file` viene en Linux y macOS, y normalmente también en **Git Bash**; si en tu equipo responde «orden no encontrada», no te preocupes: la barra de estado de VS Code te dice la codificación de un fichero de texto ([apartado 1.13](#113-la-codificación-en-vs-code)).

### 1.4. ASCII: los primeros 128 caracteres

Si un fichero de texto son bytes, hace falta una **tabla** que diga qué número corresponde a cada carácter. Esa tabla es la [codificación de caracteres](../glosario.md#codificación-de-caracteres), y ya la conociste en [01.01](../fase-01-que-es-programar/01-que-es-programar.md#35-las-tildes-y-las-eñes-salen-mal-en-la-consola), cuando las tildes salían mal en la consola. Ahora vas a ver de dónde vienen esos problemas.

La primera tabla que se impuso fue **ASCII** (de 1963, hecha en Estados Unidos). Tiene **128 caracteres**, numerados del 0 al 127: las letras inglesas en mayúscula y minúscula, las cifras, los signos de puntuación, el espacio y unos cuantos **caracteres de control** que no se ven, como el salto de línea. Algunos ejemplos:

| Carácter | Número | Carácter | Número |
|---|---|---|---|
| `A` | 65 | `a` | 97 |
| `B` | 66 | `0` (la cifra) | 48 |
| `Z` | 90 | espacio | 32 |
| salto de línea (LF) | 10 | retorno de carro (CR) | 13 |

No hace falta que te los aprendas. Fíjate en dos cosas:

- **La cifra `0` no es el número 0**: es el carácter 48. En un fichero de texto, `25` son dos caracteres, `2` y `5`, y ocupan dos bytes.
- **No hay `ñ`, ni tildes, ni `¿`, ni `€`**. ASCII se pensó para el inglés.

### 1.5. Una tabla por idioma: Latin-1 y Windows-1252

ASCII usa 128 de los 256 valores que caben en un byte. Así que se aprovecharon los otros 128 (del 128 al 255) para los caracteres de cada idioma. El problema es que **cada región los llenó a su manera**, y salieron decenas de tablas distintas. Las dos que más te vas a encontrar con textos en español:

- **Latin-1** (su nombre oficial es **ISO-8859-1**): la de Europa occidental. Tiene la `ñ`, las vocales con tilde, la `ü`, `¿` y `¡`. En ella, la `ñ` es el **241**.
- **Windows-1252** (o **CP1252**): la que usaba Windows en España y en América. Es **casi igual que Latin-1**, pero aprovecha unos huecos que Latin-1 dejaba para caracteres de control (del 128 al 159) y pone ahí otros, como el **`€`**, que es el **128**. Latin-1 **no tiene el símbolo del euro**.

Con estas tablas, cada carácter ocupa **un byte**. El problema es que **el fichero no dice qué tabla se usó**: un byte 241 es una `ñ` en Latin-1, pero otra letra en la tabla del griego o del ruso. Si quien lo lee usa una tabla distinta de la de quien lo escribió, las letras cambian. Y no hay forma de escribir en una misma tabla de un byte el español, el griego y el japonés a la vez.

> **📌 Nota:** hoy apenas se crean ficheros nuevos en estas tablas, pero los vas a recibir: exportaciones de programas antiguos, ficheros de bancos o de administraciones, datos de hace años… Es el caso del [ejemplo 2.5](#25-pasar-un-csv-de-windows-1252-a-utf-8).

### 1.6. Unicode: un número para cada carácter

La solución fue **Unicode**: **una sola tabla para todos los caracteres de todos los idiomas**. A cada carácter le da un número propio, que no cambia nunca y que se escribe con `U+` y el número en hexadecimal (base 16, con las cifras del 0 al 9 y las letras de la `a` a la `f`; no necesitas saber pasar números a hexadecimal):

| Carácter | Número en Unicode | Qué es |
|---|---|---|
| `A` | `U+0041` (65) | Igual que en ASCII |
| `ñ` | `U+00F1` (241) | Igual que en Latin-1 |
| `€` | `U+20AC` (8364) | El euro |
| `我` | `U+6211` | «Yo», en chino |
| `😀` | `U+1F600` | Un emoji |

Los primeros 128 números de Unicode son los de ASCII, y los primeros 256, los de Latin-1, para que lo antiguo encaje. La versión vigente a 9 de noviembre de 2026 es **Unicode 18.0**, de septiembre de 2026, con más de **172.000 caracteres** (según la web oficial de Unicode, unicode.org). Cada año suele salir una versión que añade caracteres nuevos, como emojis o escrituras antiguas.

Pero Unicode solo dice **qué número tiene cada carácter**. Falta decidir **cómo se guarda ese número en bytes**, porque ya no cabe en uno solo: hay números de más de 1 millón. Eso lo hace una **codificación de Unicode**, y la que se usa hoy en casi todas partes es UTF-8.

### 1.7. UTF-8: cómo se guardan los caracteres de Unicode

**[UTF-8](../glosario.md#utf-8)** guarda cada carácter de Unicode en **entre 1 y 4 bytes**, según su número:

| Caracteres | Bytes | Ejemplo | Sus bytes (en hexadecimal) |
|---|---|---|---|
| Los de ASCII (letras inglesas, cifras, signos) | 1 | `A` | `41` |
| La mayoría de los de Europa: `ñ`, `á`, `ü`, `ç`… | 2 | `ñ` | `c3 b1` |
| El resto de los habituales: `€`, el chino, el japonés… | 3 | `€` | `e2 82 ac` |
| Emojis y caracteres poco frecuentes | 4 | `😀` | `f0 9f 98 80` |

Tres ideas importantes:

- **Un texto en ASCII es también UTF-8 válido**, byte a byte. Por eso un fichero sin tildes no da nunca problemas de codificación: solo los da en cuanto aparece una `ñ`.
- **En UTF-8, un carácter no es un byte.** La `ñ` ocupa dos bytes (`c3 b1`) y el `€`, tres. Lo vas a comprobar en el [apartado siguiente](#18-caracteres-y-bytes-wc--m-y-wc--c).
- **Sirve para todos los idiomas a la vez**: en un mismo fichero UTF-8 caben el español, el griego, el chino y los emojis.

UTF-8 es hoy **la codificación de casi todo**: de las páginas web (el 99,1 % de las webs cuya codificación se conoce, según W3Techs a 9 de noviembre de 2026), de Linux y macOS, de Git, de JSON y de lo que vas a escribir en este curso. Windows también la usa cada vez más, aunque arrastra programas antiguos con Windows-1252.

> **📌 Nota:** hay otras codificaciones de Unicode, como **UTF-16**, que usan por dentro Windows, Java o JavaScript. No te las vas a encontrar en ficheros de texto normales; si un día te topas con una, `file` te lo dirá.

### 1.8. Caracteres y bytes: wc -m y wc -c

En [03.02](../fase-03-herramientas/02-terminal-sacarle-partido.md#16-los-filtros-grep-sort-uniq-wc-cut-head-y-tail) usaste `wc -l` para contar líneas. La misma orden cuenta también **bytes** y **caracteres**, y con UTF-8 no son lo mismo:

| Orden | Qué cuenta |
|---|---|
| `wc -c fichero` | **Bytes** (lo que ocupa el fichero) |
| `wc -m fichero` | **Caracteres** (lo que tú ves como letras, signos y saltos de línea) |

En un fichero con solo ASCII, los dos números coinciden. Cada `ñ` o vocal con tilde añade un byte de más; cada `€`, dos. En el [ejemplo 2.2](#22-caracteres-y-bytes), `Begoña` son 6 caracteres y 7 bytes.

> **⚠️ Ojo:** `wc -m` necesita saber que el texto está en UTF-8, y eso lo dice la configuración de idioma de la terminal: la variable `LANG` que viste en [02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#19-variables-de-entorno) (o `LC_ALL`, que manda sobre ella). Con un valor como `es_ES.UTF-8`, cuenta caracteres. Con `C` o con uno que no sea UTF-8, **cuenta bytes**, igual que `wc -c`. Lo verás en el ejemplo 2.2.

### 1.9. Ver los bytes de un fichero: od

Un editor te enseña el texto ya traducido a letras. Para ver **los bytes de verdad**, la terminal tiene **`od`** (de *octal dump*, «volcado en octal»), que existe en Linux, macOS y Git Bash. Dos formas de usarlo:

- **`od -c fichero`**: enseña cada byte como un carácter si es ASCII y, si no, como su número en **octal** (base 8). Los invisibles salen con una barra: `\n` es el salto de línea (LF), `\r` el retorno de carro (CR) y `\0` un byte a cero.
- **`od -t x1 fichero`**: enseña cada byte (`1`) en **hexadecimal** (`x`), la forma más habitual de escribir bytes.

```text
$ od -c saludo.txt
0000000   H   o   l   a   ,       B   e   g   o 303 261   a  \n
0000016
```

Cómo se lee: la primera columna es la **posición** del primer byte de esa línea, también en octal (`0000016` en octal es 14: el fichero ocupa 14 bytes); no necesitas calcularla. Detrás, un byte por casilla. La `ñ` de `Begoña` no es una casilla, sino **dos**, `303 261`: son sus dos bytes de UTF-8 (los mismos `c3 b1` de la tabla de 1.7, escritos en octal). Lo tienes completo en el [ejemplo 2.3](#23-los-bytes-de-un-saludo).

> **📌 Nota:** en macOS, `od` es otra versión (la de BSD) y puede espaciar las columnas de otra forma. Los bytes son los mismos.

### 1.10. Caracteres estropeados: mojibake

Cuando un programa lee un texto **con una tabla distinta de la que se usó al escribirlo**, salen caracteres equivocados. Tiene hasta nombre: **mojibake** (del japonés, algo así como «caracteres transformados»). Hay dos casos que te vas a encontrar una y otra vez:

**1. Un texto UTF-8 leído como Latin-1 o Windows-1252: «Ã±».** La `ñ` en UTF-8 son dos bytes, `c3 b1`. Un programa que cree que cada byte es un carácter de Latin-1 los lee por separado: `c3` es `Ã` y `b1` es `±`. Así que cada `ñ` se convierte en **`Ã±`**, cada `é` en **`Ã©`**, cada `á` en **`Ã¡`**… Si ves una `Ã` donde debería haber una letra con tilde, el texto estaba bien en UTF-8 y lo han leído mal.

**2. Un texto Latin-1 o Windows-1252 leído como UTF-8: «�».** La `ñ` en Latin-1 es un solo byte, `f1`. Pero en UTF-8 ese byte suelto **no es válido**: los bytes por encima de 127 siempre van en grupos con una forma concreta. El programa no sabe qué carácter es, y pone en su lugar el **carácter de sustitución**, **`�`** (un rombo con una interrogación, `U+FFFD`). Algunos programas ponen un `?` normal, que es lo que viste en la consola de [01.01](../fase-01-que-es-programar/01-que-es-programar.md#35-las-tildes-y-las-eñes-salen-mal-en-la-consola).

| Lo que ves | Qué pasó | Qué hay en el fichero |
|---|---|---|
| `EspaÃ±a`, `cafÃ©` | Un texto **UTF-8** leído como Latin-1 o Windows-1252 | UTF-8 correcto |
| `Espa�a`, `caf�` (o `Espa?a`) | Un texto **Latin-1 o Windows-1252** leído como UTF-8 | Latin-1 o Windows-1252 |
| `EspaÃƒÂ±a` | Un texto UTF-8 leído mal **y guardado así**, y otra vez lo mismo | Un fichero estropeado dos veces |

> **💡 Consejo:** lo importante es la **pista**: la `Ã` delata que el fichero está en UTF-8 y lo lee un programa que espera otra cosa; el `�`, que el fichero **no** está en UTF-8. Saber eso te dice qué tienes que arreglar: el programa que lee, o el fichero.

### 1.11. El BOM

Algunos programas de Windows, al guardar en UTF-8, añaden al principio del fichero **tres bytes invisibles**, `ef bb bf`. Es el **BOM** (de *byte order mark*, «marca de orden de bytes»): una firma que dice «este fichero está en UTF-8». En `od -c` aparece como `357 273 277` antes del primer carácter, y `file` lo dice: `UTF-8 (with BOM) text`.

En UTF-8 **no hace falta**: el estándar de Unicode dice que no es necesario (y no lo recomienda ni lo desaconseja; comprobado en su capítulo 2.6 el 9 de noviembre de 2026). Pero da problemas, porque los programas que no lo esperan lo leen **como parte del texto**:

- **Un script de bash con BOM** no arranca bien: su primera línea ya no empieza por `#!`, sino por tres bytes raros delante, y bash no la reconoce (lo arreglarás en el [ejercicio 5](#ejercicio-5--el-script-que-no-arranca)).
- **JSON**: su norma, el RFC 8259 (un **RFC** es un documento de la IETF, el organismo que publica las normas técnicas de internet), dice en su apartado 8.1 que quien escribe un JSON para enviarlo **no debe** ponerle BOM, y deja que quien lo lee lo ignore o lo trate como un error: según el programa, el fichero se lee o no.
- **Un CSV**: la primera columna de la cabecera ya no se llama `nombre`, sino «BOM + `nombre`», y un programa que busque la columna `nombre` no la encuentra.

Como el BOM es invisible en el editor, el fichero **parece perfecto**. Por eso la regla es **UTF-8 sin BOM**.

> **📌 Nota:** algunos programas ponen el BOM como **firma**, para reconocer después que el fichero está en UTF-8. Salvo que el programa que va a leer tu fichero lo pida, sin BOM.

### 1.12. Convertir de una codificación a otra: iconv

Para pasar un fichero de una codificación a otra, la terminal tiene **`iconv`**, que existe en Linux, macOS y Git Bash:

```text
iconv -f ORIGEN -t DESTINO fichero > fichero-nuevo
```

- **`-f`** (de *from*, «desde»): la codificación **en la que está** el fichero. Tienes que saberla tú: `iconv` no la adivina.
- **`-t`** (de *to*, «a»): la codificación **a la que quieres pasarlo**.
- El resultado sale por la [salida estándar](../glosario.md#salida-estándar): lo guardas en **otro fichero** con `>`.

Los nombres que usarás: `UTF-8`, `WINDOWS-1252` (también vale `CP1252`) y `LATIN1` (o `ISO-8859-1`). `iconv -l` da la lista completa, que es muy larga.

Por ejemplo, para pasar a UTF-8 un CSV que te han dado en Windows-1252:

```text
iconv -f WINDOWS-1252 -t UTF-8 clientes.csv > clientes-utf8.csv
```

Si el fichero tiene bytes que **no son válidos** en la codificación de origen que le has dicho, `iconv` se para con un error que dice en qué posición está el primer byte malo. Es una buena señal: te avisa de que te has equivocado de origen ([error típico 3.4](#34-decirle-a-iconv-la-codificación-equivocada)).

> **⚠️ Cuidado:** no escribas nunca `iconv … datos.csv > datos.csv`: el `>` vacía el fichero **antes** de que `iconv` lo lea, y lo pierdes. Es el mismo problema del [error típico 3.2 de 03.02](../fase-03-herramientas/02-terminal-sacarle-partido.md#32-leer-y-escribir-el-mismo-fichero-en-una-orden). Escribe siempre en un fichero nuevo.

> **📌 Nota:** el `iconv` de Linux (y el de la terminal de este curso) es el de la biblioteca **glibc**; el de macOS es **otra versión**, así que sus mensajes de error pueden ser distintos y algún nombre de codificación poco habitual puede cambiar. Los nombres de este módulo (`UTF-8`, `WINDOWS-1252`, `LATIN1`) son de los más comunes; si alguno no lo acepta, búscalo con `iconv -l`.

### 1.13. La codificación en VS Code

En [03.03](../fase-03-herramientas/03-editor-de-codigo.md#115-lo-que-verás-más-adelante) viste que la barra de estado de VS Code dice la codificación del fichero abierto (`UTF-8`) y que de momento no la cambiaras. Ahora ya sabes qué es. Según la documentación oficial de VS Code (consultada el 9 de noviembre de 2026):

- **Los ficheros nuevos se crean en UTF-8**, sin BOM. Es lo que quieres; el ajuste que lo decide es `files.encoding`, y no hace falta tocarlo.
- **Haciendo clic en la codificación** de la barra de estado, VS Code te ofrece dos cosas: **Reopen with Encoding** (**Volver a abrir con codificación**) y **Save with Encoding** (**Guardar con codificación**). Son muy distintas:
  - **Volver a abrir** relee los mismos bytes **con otra tabla**. No cambia el fichero: cambia cómo lo ves. Es lo que usas si ves `�` y sospechas que el fichero está en Windows-1252: lo vuelves a abrir con Windows-1252 y, si las eñes salen bien, acertaste.
  - **Guardar con** escribe el fichero **en otra codificación**. Eso sí lo cambia: es la forma de convertirlo desde el editor.

El orden para pasar a UTF-8 un fichero que está en Windows-1252 es, por tanto: **primero «Volver a abrir» con Windows-1252** (para leerlo bien) y **después «Guardar con» UTF-8**. Al revés estropearías el texto.

> **📌 Nota:** VS Code abre los ficheros como UTF-8 si no le dices otra cosa. Por eso un fichero en Windows-1252 se ve con `�` en VS Code: es el caso 2 del [apartado 1.10](#110-caracteres-estropeados-mojibake).

### 1.14. Los saltos de línea también son bytes

El [salto de línea](../glosario.md#salto-de-línea-lf-y-crlf) que viste en [03.04](../fase-03-herramientas/04-errores-y-depuracion.md#32-un-script-con-los-saltos-de-línea-de-windows) también es uno o dos bytes, y ahora puedes verlos con `od`:

- **LF** (Linux y macOS) es **un byte**, el 10: `\n` en `od -c`, `0a` en hexadecimal.
- **CRLF** (Windows) son **dos bytes**, el 13 y el 10: `\r \n` en `od -c`, `0d 0a` en hexadecimal.

Así que un fichero con CRLF ocupa un byte más por línea, y una orden como `grep` o bash ve ese `\r` como un carácter más. Ya sabes arreglarlo (en VS Code, en la barra de estado; en la terminal, con `tr -d '\r'`), y en el [ejercicio 6](#ejercicio-6--los-socios-del-club-de-montaña) lo comprobarás en un fichero que viene de Windows.

### 1.15. Los ficheros binarios y Git

En la fase 5 vas a usar **Git**, que guarda la historia de tus ficheros. Te adelanto solo una idea: Git trabaja muy bien con **ficheros de texto**, porque puede comparar dos versiones **línea a línea** y enseñarte exactamente qué ha cambiado. Con un **binario** (una imagen, un `.docx`) no puede: solo sabe decir que el fichero ha cambiado, no qué. Es otra razón para guardar en texto (Markdown, CSV, JSON) todo lo que se pueda. Lo verás en «Git: fundamentos».

## 2. Ejemplos de código

Todos los ejemplos son reales y los puedes repetir: descarga la carpeta de cada uno (su enlace «📁 Código»), abre la terminal en ella y escribe las mismas órdenes. Recuerda que tu salida no será idéntica letra a letra ([el aviso de 02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal)): fíjate en lo que dice el texto.

### 2.1. Qué hay dentro de cada fichero

**Situación real:** en la carpeta de una panadería hay cuatro ficheros: una lista de la compra, unas notas, un script y el logotipo. Vas a preguntarle a `file` qué es cada uno y a comprobar que la extensión no cambia nada.

El script es este:

```bash
#!/usr/bin/env bash
# Saluda a quien lo ejecuta
echo "Hola"
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.1-que-hay-dentro/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.1-que-hay-dentro/)

**Salida:**

```text
Hola
```

**En tu terminal** (`sesion.txt`):

```text
$ file lista.txt notas.txt saludo.sh logo.png
lista.txt: ASCII text
notas.txt: Unicode text, UTF-8 text
saludo.sh: Bourne-Again shell script, ASCII text executable
logo.png:  PNG image data, 16 x 16, 8-bit/color RGB, non-interlaced
$ od -c logo.png | head -n 1
0000000 211   P   N   G  \r  \n 032  \n  \0  \0  \0  \r   I   H   D   R
$ cp logo.png logo.txt
$ file logo.txt
logo.txt: PNG image data, 16 x 16, 8-bit/color RGB, non-interlaced
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.1-que-hay-dentro/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.1-que-hay-dentro/)

**En qué fijarte:**

- **`lista.txt` es `ASCII text`**: solo tiene letras sin tilde. **`notas.txt` es `UTF-8 text`**, porque `azúcar` lleva una `ú`: en cuanto aparece un carácter que no es ASCII, `file` puede reconocer el UTF-8.
- **`saludo.sh` es un `Bourne-Again shell script`** (un script de bash). `file` lo sabe por la primera línea, `#!/usr/bin/env bash`, no por el `.sh`. Su `executable` quiere decir que tiene esa primera línea, no que tenga el permiso de ejecución.
- **`logo.png` es una imagen PNG** de 16 por 16 píxeles. `od -c` enseña su firma: los bytes `P N G` al principio, detrás de un primer byte que no es ASCII (`211`). Todo PNG empieza así.
- **`logo.txt`** es una copia con otro nombre, y **`file` sigue diciendo que es un PNG**: la extensión no cambia el contenido.

> **📌 Nota:** en macOS, `file` puede describir algunos ficheros con otras palabras (por ejemplo, el de texto UTF-8). Lo importante es si dice texto o imagen, y qué codificación.

### 2.2. Caracteres y bytes

**Situación real:** vas a comprobar cuántos bytes ocupa cada carácter y qué cuentan `wc -c` y `wc -m` en una lista de nombres.

**En tu terminal** (`sesion.txt`):

```text
$ printf 'n' | wc -c
1
$ printf 'ñ' | wc -c
2
$ printf '€' | wc -c
3
$ cat nombres.txt
Ana
Begoña
José
$ wc -c nombres.txt
18 nombres.txt
$ wc -m nombres.txt
16 nombres.txt
$ LC_ALL=C wc -m nombres.txt
18 nombres.txt
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.2-caracteres-y-bytes/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.2-caracteres-y-bytes/)

**En qué fijarte:**

- **`printf` escribe el texto sin salto de línea**, así que `wc -c` cuenta solo ese carácter: la `n` ocupa 1 byte; la `ñ`, 2; el `€`, 3. Es la tabla del [apartado 1.7](#17-utf-8-cómo-se-guardan-los-caracteres-de-unicode).
- **`nombres.txt` tiene 16 caracteres**: `Ana` (3), `Begoña` (6), `José` (4) y tres saltos de línea. Pero **ocupa 18 bytes**: la `ñ` y la `é` ocupan dos cada una.
- **Con `LC_ALL=C` delante**, `wc -m` se ejecuta con la configuración de idioma más básica, sin UTF-8, y **cuenta bytes**: 18. Poner una variable delante de una orden la cambia solo para esa orden.

> **📌 Nota:** en macOS, `wc` escribe los números con espacios delante (`      18 nombres.txt`). El número es el mismo. En Git Bash, si `wc -m` te da lo mismo que `wc -c` en un fichero con eñes, mira tu `LANG` con `echo $LANG`: tiene que terminar en `UTF-8`.

### 2.3. Los bytes de un saludo

**Situación real:** quieres ver los bytes de un fichero de una línea, `Hola, Begoña`, de las dos formas de `od`, y cómo se ve un salto de línea de Windows.

**En tu terminal** (`sesion.txt`):

```text
$ od -c saludo.txt
0000000   H   o   l   a   ,       B   e   g   o 303 261   a  \n
0000016
$ od -t x1 saludo.txt
0000000 48 6f 6c 61 2c 20 42 65 67 6f c3 b1 61 0a
0000016
$ printf 'sí\r\n' > windows.txt
$ od -c windows.txt
0000000   s 303 255  \r  \n
0000005
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.3-ver-los-bytes/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.3-ver-los-bytes/)

**En qué fijarte:**

- **Cada casilla es un byte.** En `od -c`, los ASCII salen como su letra (el espacio sale como un hueco); los demás, como un número en octal.
- **La `ñ` son dos casillas**: `303 261` en octal, que son `c3 b1` en hexadecimal (`od -t x1`). Son los dos bytes de UTF-8 de la tabla del apartado 1.7.
- **Con `od -t x1` lo ves todo en hexadecimal**: `48` es la `H`, `20` es el espacio, `0a` es el salto de línea.
- **La última línea de `od`** es solo la posición final, en octal: `0000016` son 14 bytes (12 caracteres, uno de ellos de dos bytes, y el salto de línea).
- **`windows.txt`** lo crea la sesión con un salto de Windows: al final, `\r \n`, dos bytes. Y la `í` también son dos (`303 255`).

### 2.4. Así se estropean las eñes

**Situación real:** una cafetería tiene el mismo pedido guardado dos veces: `pedido.txt`, en UTF-8, y `pedido-latin1.txt`, en Latin-1, que sacó un programa antiguo. Vas a provocar las dos formas de mojibake del [apartado 1.10](#110-caracteres-estropeados-mojibake).

**En tu terminal** (`sesion.txt`):

```text
$ cat pedido.txt
Señora Muñoz: 2 cafés
$ iconv -f LATIN1 -t UTF-8 pedido.txt
SeÃ±ora MuÃ±oz: 2 cafÃ©s
$ cat pedido-latin1.txt
Se�ora Mu�oz: 2 caf�s
$ od -c pedido.txt | head -n 1
0000000   S   e 303 261   o   r   a       M   u 303 261   o   z   :
$ od -c pedido-latin1.txt | head -n 1
0000000   S   e 361   o   r   a       M   u 361   o   z   :       2
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.4-caracteres-estropeados/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.4-caracteres-estropeados/)

**En qué fijarte:**

- **`cat pedido.txt` sale bien**: el fichero está en UTF-8 y la terminal también.
- **El `iconv` de la segunda orden miente a propósito**: le dice que `pedido.txt` está en Latin-1. Cada byte de la `ñ` (`c3` y `b1`) se convierte en un carácter: `Ã` y `±`. Es exactamente lo que hace un programa que lee UTF-8 creyendo que es Latin-1: **caso 1, «Ã±»**.
- **`cat pedido-latin1.txt` sale con `�`**: la terminal espera UTF-8 y se encuentra un byte suelto que no es válido. **Caso 2.**
- **`od` enseña por qué**: en UTF-8 la `ñ` son dos bytes (`303 261`); en Latin-1, uno solo (`361`, que es 241 en decimal, el número de la `ñ` en Latin-1).

> **📌 Nota:** cómo dibuja tu terminal un byte que no es válido depende de la terminal: `�`, un `?` o un hueco. En todos los casos, el fichero es el mismo.

### 2.5. Pasar un CSV de Windows-1252 a UTF-8

**Situación real:** una tienda de Logroño te pasa `clientes.csv`, exportado de su programa de facturación, que es antiguo y guarda en Windows-1252. Lo quieres en UTF-8 para trabajar con él. (El fichero está en Windows-1252 a propósito: por eso su carpeta lleva un `codificacion.txt`, que le dice al comprobador del curso en qué codificación está.)

**En tu terminal** (`sesion.txt`):

```text
$ file clientes.csv
clientes.csv: ISO-8859 text
$ iconv -f WINDOWS-1252 -t UTF-8 clientes.csv > clientes-utf8.csv
$ file clientes-utf8.csv
clientes-utf8.csv: Unicode text, UTF-8 text
$ cat clientes-utf8.csv
nombre,ciudad
María Núñez,Logroño
Iñaki Ibáñez,Cádiz
Álvaro Peña,Málaga
$ wc -c clientes.csv clientes-utf8.csv
 72 clientes.csv
 83 clientes-utf8.csv
155 total
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.5-convertir-con-iconv/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.5-convertir-con-iconv/)

**En qué fijarte:**

- **`file` dice `ISO-8859 text`**: «es texto en una tabla de un byte», sin poder decir cuál (Latin-1, Windows-1252 y otras se parecen mucho). Es una **pista**, no la codificación. Sabes que es Windows-1252 porque **te lo han dicho**, o porque viene de un programa de Windows; si no lo sabes, **pregúntalo**. Y lo confirmas al convertir: si las eñes y las tildes salen bien, acertaste.
- **`iconv` no escribe nada en la pantalla**: todo va a `clientes-utf8.csv`. El original no se toca.
- **`file` ya dice `UTF-8 text`**, y `cat` lo enseña bien: la conversión era la buena.
- **El fichero nuevo ocupa 11 bytes más**: hay 11 letras con tilde o eñe, y cada una pasa de un byte a dos. Es una comprobación rápida de que la conversión ha hecho algo.

> **📌 Nota:** en macOS, `file` puede llamar de otra forma a un fichero en Windows-1252, y `wc` alinea los números de otra manera. En Git Bash, como en Linux.

### 2.6. Encontrar y quitar un BOM

**Situación real:** Lucía te pasa la lista de teléfonos de su equipo, guardada en UTF-8 por un programa de Windows que le ha puesto BOM. Vas a encontrarlo y a quitarlo.

**En tu terminal** (`sesion.txt`):

```text
$ file con-bom.txt
con-bom.txt: Unicode text, UTF-8 (with BOM) text
$ od -c con-bom.txt | head -n 1
0000000 357 273 277   n   o   m   b   r   e   ,   t   e   l 303 251   f
$ tail -c +4 con-bom.txt > sin-bom.txt
$ file sin-bom.txt
sin-bom.txt: Unicode text, UTF-8 text
$ od -c sin-bom.txt | head -n 1
0000000   n   o   m   b   r   e   ,   t   e   l 303 251   f   o   n   o
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.6-el-bom/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.6-el-bom/)

**En qué fijarte:**

- **`file` lo dice claro**: `UTF-8 (with BOM)`.
- **`od` lo enseña**: tres bytes, `357 273 277` (`ef bb bf` en hexadecimal), antes de la `n` de `nombre`. En el editor no se ven.
- **`tail -c +4`** escribe el fichero **a partir del byte 4**, es decir, sin los tres primeros. Funciona igual en Linux, macOS y Git Bash. Úsalo **solo si `file` te ha dicho que hay BOM**: si no lo hay, te comerías las tres primeras letras.
- **Desde VS Code** también se quita: clic en la codificación de la barra de estado (pondrá `UTF-8 with BOM`), **Save with Encoding** (**Guardar con codificación**) y **UTF-8**.

## 3. Errores típicos

### 3.1. «Ã±» donde debería haber una «ñ»

**Qué pasa:** abres un fichero o una página y, en lugar de `España`, ves `EspaÃ±a`; en lugar de `café`, `cafÃ©`.

**Por qué ocurre:** el texto está en **UTF-8**, pero el programa que lo enseña lo lee como **Latin-1 o Windows-1252**: cada letra de dos bytes sale como dos caracteres ([apartado 1.10](#110-caracteres-estropeados-mojibake)). El fichero está bien.

**Cómo se arregla:** dile al programa que lea **UTF-8**. En VS Code, clic en la codificación, **Reopen with Encoding** y **UTF-8**. **No conviertas el fichero**: ya está bien, y convertirlo lo estropearía de verdad ([error típico 3.5](#35-convertir-dos-veces-el-mismo-fichero)). Si el texto estropeado ya está **guardado** así en el fichero (alguien lo leyó mal y lo guardó), entonces sí hay que repararlo, y conviene pedir el original.

### 3.2. «�» o «?» donde debería haber una letra

**Qué pasa:** ves `Espa�a` o `Espa?a`.

**Por qué ocurre:** el fichero **no está en UTF-8** (casi seguro, en Windows-1252 o Latin-1) y el programa lo lee como UTF-8. Los bytes de las letras con tilde, sueltos, no son válidos en UTF-8 ([apartado 1.10](#110-caracteres-estropeados-mojibake)).

**Cómo se arregla:** convierte el fichero a UTF-8 con `iconv -f WINDOWS-1252 -t UTF-8` ([ejemplo 2.5](#25-pasar-un-csv-de-windows-1252-a-utf-8)) o, en VS Code, **Reopen with Encoding** con **Western (Windows 1252)** y, si se ve bien, **Save with Encoding** con **UTF-8** ([apartado 1.13](#113-la-codificación-en-vs-code)).

> **⚠️ Cuidado:** si el `�` está **guardado dentro del fichero** (porque un programa lo leyó mal y lo guardó así), la letra original **se ha perdido**: el `�` no recuerda qué había. Solo te queda volver a pedir el fichero original.

### 3.3. Abrir un binario en el editor y guardarlo

**Qué pasa:** abres una imagen o un `.docx` en VS Code (por curiosidad o por error), ves símbolos raros, tocas algo y guardas. La imagen ya no se abre.

**Por qué ocurre:** el editor trata los bytes como texto. Al guardar, puede cambiar bytes que no entiende (por ejemplo, sustituir los no válidos o los saltos de línea), y el formato binario, que es muy estricto, queda roto.

**Cómo se arregla:** si no has guardado, cierra sin guardar. Si ya lo has hecho, recupera una copia (en la fase 5, Git te permitirá volver a la versión anterior). **Los binarios se abren con su programa**. VS Code ya te protege: las imágenes las abre en una vista previa, no como texto, y con otros binarios suele avisarte de que no los muestra en el editor porque son binarios o usan una codificación que no admite, con la opción de abrirlos igualmente. No la uses.

### 3.4. Decirle a iconv la codificación equivocada

**Qué pasa:** `iconv` se para con un error y el fichero nuevo queda a medias.

**Por qué ocurre:** le has dicho que el fichero está en una codificación y tiene bytes que en ella no son válidos. Aquí, `clientes.csv` (en Windows-1252) se intenta leer como UTF-8:

**En tu terminal** (`sesion-origen-equivocado.txt`):

```text
$ iconv -f UTF-8 -t UTF-8 clientes.csv > copia.csv
iconv: illegal input sequence at position 17
$ echo $?
1
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejemplos/2.5-convertir-con-iconv/`](codigo/01-texto-binario-y-codificacion/ejemplos/2.5-convertir-con-iconv/)

El mensaje («secuencia de entrada ilegal en la posición 17») sale en inglés aunque la terminal esté en español: la traducción de `iconv` no lo incluye. La posición 17 es la `í` de `María`, el primer byte que no es UTF-8 válido. Y el [código de salida](../glosario.md#código-de-salida) es 1: ha fallado.

**Cómo se arregla:** averigua la codificación de verdad (preguntar a quien te lo pasó, mirar los bytes con `od`, abrirlo en VS Code con **Reopen with Encoding**; `file` solo da una pista) y repite con el `-f` correcto. Borra el fichero a medias que ha quedado.

### 3.5. Convertir dos veces el mismo fichero

**Qué pasa:** conviertes a UTF-8 un fichero que ya estaba en UTF-8 (o lo conviertes dos veces sin darte cuenta) y aparecen `Ã±` y `Ã©` **dentro del fichero**.

**Por qué ocurre:** `iconv -f WINDOWS-1252` lee los dos bytes de cada `ñ` como si fueran dos caracteres de Windows-1252 y los guarda como dos caracteres en UTF-8. No da error, porque en Windows-1252 casi cualquier byte es válido: el resultado es el mojibake del [ejemplo 2.4](#24-así-se-estropean-las-eñes), pero guardado.

**Cómo se arregla:** **mira antes de convertir**: si `file` ya dice `UTF-8 text`, no hay nada que hacer. Y conviertes siempre a un fichero nuevo, así que el original sigue ahí: borra el fichero estropeado y vuelve a empezar desde el original.

## 4. Buenas prácticas

### 4.1. UTF-8 sin BOM y LF, siempre

Todo fichero de texto que crees: en **UTF-8**, **sin BOM** y con **saltos de línea LF**. Es lo que esperan Linux, macOS, Git, la web, JSON y bash, y lo que usa este curso. VS Code ya lo hace si lo preparaste como en [03.03](../fase-03-herramientas/03-editor-de-codigo.md#21-preparar-vs-code-para-el-curso): fíjate en que la barra de estado diga `UTF-8` y `LF`.

### 4.2. Mira antes de tocar

Antes de convertir o de «arreglar» un fichero, averigua qué tiene: `file` para una pista de la codificación (y el BOM), `od -c | head` para los bytes y la barra de estado de VS Code. Recuerda las pistas: la `Ã` dice que el fichero es UTF-8 y lo lee mal un programa; el `�`, que el fichero no es UTF-8.

### 4.3. Convierte una vez, a un fichero nuevo, y comprueba

`iconv` siempre a **otro fichero**, nunca encima del original. Después, **comprueba** el resultado: `file` debe decir `UTF-8 text`, `cat` debe enseñar bien las eñes y, si sabes cuántas letras con tilde hay, `wc -c` debe haber crecido en esa cantidad. Solo entonces sustituyes el original, si hace falta.

### 4.4. Cuando recibas datos, pregunta la codificación

`file` no distingue Latin-1 de Windows-1252 (solo da una pista), y `iconv` no adivina la codificación. Si te pasan un fichero de otro programa o de otra empresa, **pregunta en qué codificación está** (o mira si su documentación lo dice). Y cuando seas tú quien da datos, **dilo**: «el CSV va en UTF-8».

## 5. Ejercicios prácticos resueltos

> **💡 Consejo:** intenta cada ejercicio **antes** de abrir las pistas y la solución. Los que llevan carpeta de código los puedes hacer en tu terminal: descarga la carpeta, abre la terminal en ella y prueba. Los demás son de **razonar**: escribe tu respuesta y compárala después.

### 🟢 Básico

#### Ejercicio 1 · ¿Texto o binario?

En la carpeta de una asociación de vecinos hay estos ficheros. Para cada uno, di si es **de texto** o **binario**, y si lo podrías leer con `cat` o con VS Code:

1. `actas-2026.md`
2. `cartel-fiestas.png`
3. `socios.csv`
4. `presupuesto.xlsx`
5. `copia.sh`
6. `himno.mp3`
7. `config.json`
8. `estatutos.pdf`

Y una pregunta más: alguien ha cambiado el nombre de `cartel-fiestas.png` a `cartel-fiestas.txt`. ¿Ahora es de texto?

<details>
<summary>Pista 1</summary>

Pregúntate si sus bytes son caracteres que podrías escribir con el teclado o datos de un programa concreto ([apartado 1.2](#12-ficheros-de-texto-y-ficheros-binarios)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** son de texto los formatos que se escriben con caracteres (Markdown, CSV, scripts, JSON); son binarios los que guardan datos con el formato de un programa (imágenes, sonido, documentos de oficina, PDF).

| Fichero | Tipo | ¿Con `cat` o VS Code? |
|---|---|---|
| `actas-2026.md` | Texto (Markdown) | Sí |
| `cartel-fiestas.png` | Binario (imagen) | No: con un visor de imágenes |
| `socios.csv` | Texto (CSV) | Sí |
| `presupuesto.xlsx` | Binario (hoja de cálculo de Excel, comprimida) | No: con Excel o LibreOffice Calc |
| `copia.sh` | Texto (script de bash) | Sí |
| `himno.mp3` | Binario (sonido) | No: con un reproductor |
| `config.json` | Texto (JSON) | Sí |
| `estatutos.pdf` | Binario (PDF) | No: con un lector de PDF |

**`cartel-fiestas.txt` sigue siendo una imagen PNG**: cambiar la extensión no cambia sus bytes. `file cartel-fiestas.txt` diría `PNG image data`, y abrirlo como texto solo enseñaría símbolos raros ([apartado 1.3](#13-la-extensión-no-decide-el-contenido)).

**Errores frecuentes al resolverlo:**

- Pensar que el `.xlsx` o el `.pdf` son de texto porque «tienen texto dentro»: el texto va mezclado con el formato y, en el `.xlsx`, además comprimido.
- Creer que la extensión `.txt` hace texto a cualquier fichero.

</details>

#### Ejercicio 2 · Bytes y caracteres

El equipo de pelota de un pueblo guarda los nombres de sus jugadores en `equipo.txt`, en UTF-8:

```text
Íñigo
Ainhoa
Begoña
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejercicios/ej02-bytes-y-caracteres/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej02-bytes-y-caracteres/)

**Antes de usar la terminal**, calcula cuánto darán `wc -l`, `wc -m` y `wc -c` con este fichero. Después, compruébalo.

<details>
<summary>Pista 1</summary>

Cuenta los saltos de línea: hay uno al final de cada nombre, también del último.

</details>

<details>
<summary>Pista 2</summary>

En UTF-8, cada letra de ASCII ocupa 1 byte, y cada letra con tilde o eñe, 2 ([apartado 1.7](#17-utf-8-cómo-se-guardan-los-caracteres-de-unicode)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:**

| Línea | Caracteres (con el salto) | Letras de 2 bytes | Bytes |
|---|---|---|---|
| `Íñigo` | 6 | 2 (`Í` y `ñ`) | 8 |
| `Ainhoa` | 7 | 0 | 7 |
| `Begoña` | 7 | 1 (`ñ`) | 8 |
| **Total** | **20** | **3** | **23** |

Tres líneas, 20 caracteres y 23 bytes: 20 + 3, uno de más por cada letra de dos bytes.

**En tu terminal** (`sesion.txt`):

```text
$ wc -l equipo.txt
3 equipo.txt
$ wc -m equipo.txt
20 equipo.txt
$ wc -c equipo.txt
23 equipo.txt
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejercicios/ej02-bytes-y-caracteres/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej02-bytes-y-caracteres/)

**Errores frecuentes al resolverlo:**

- Olvidar los saltos de línea: también son caracteres, y bytes.
- Contar la `Í` mayúscula como un byte: también es de dos, como cualquier vocal con tilde.
- Obtener 23 con `wc -m`: la terminal no está en UTF-8 ([apartado 1.8](#18-caracteres-y-bytes-wc--m-y-wc--c)). Mira `echo $LANG`.

</details>

### 🟡 Intermedio

#### Ejercicio 3 · Lee la salida de od

Un compañero ha recibido `mensaje.txt` y te enseña lo que le da `od -c`:

```text
0000000   S   e 303 261   a   l   :       5 342 202 254  \n
0000015
```

Sin abrir el fichero:

1. ¿Qué texto tiene? (Una pista: es una señal de un pago.)
2. ¿Cuántos bytes ocupa? ¿Y cuántos caracteres tiene?
3. ¿Está en UTF-8? ¿Cómo lo sabes?
4. ¿Tiene saltos de línea de Windows?

<details>
<summary>Pista 1</summary>

Cada casilla es un byte. Busca grupos de casillas con números: `303 261` ya lo has visto en el [ejemplo 2.3](#23-los-bytes-de-un-saludo). Un grupo de tres que empieza por `342` es un carácter de tres bytes, como el `€`.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se recorren las casillas una a una; las letras son caracteres de un byte, y los grupos de números son caracteres de varios bytes de UTF-8.

1. **`Señal: 5€`**. `303 261` es la `ñ` (como en `Begoña`), y `342 202 254` es el `€` (`e2 82 ac` en hexadecimal, la tabla del [apartado 1.7](#17-utf-8-cómo-se-guardan-los-caracteres-de-unicode)).
2. **13 bytes** (las casillas: 2 + 2 + 4 + 1 + 3 + 1, o la posición final, `0000015` en octal) y **10 caracteres**: `S`, `e`, `ñ`, `a`, `l`, `:`, espacio, `5`, `€` y el salto de línea.
3. **Sí**: la `ñ` son dos bytes con la forma de UTF-8. En Latin-1 sería uno solo, `361`, y el `€` ni existiría.
4. **No**: termina en `\n` solo. Con CRLF sería `\r  \n`.

Para comprobarlo:

**En tu terminal** (`sesion.txt`):

```text
$ od -c mensaje.txt
0000000   S   e 303 261   a   l   :       5 342 202 254  \n
0000015
$ wc -c mensaje.txt
13 mensaje.txt
$ wc -m mensaje.txt
10 mensaje.txt
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejercicios/ej03-lee-los-bytes/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej03-lee-los-bytes/)

**Errores frecuentes al resolverlo:**

- Contar cada número como un carácter: `342 202 254` son tres bytes, pero **un solo carácter**.
- Olvidar el espacio, que en `od -c` es una casilla en blanco, o el `\n` del final.
- Leer `0000015` como quince: está en octal (13).

</details>

### 🔴 Avanzado

#### Ejercicio 4 · Los precios de la academia de baile

Una academia de baile de Sevilla te manda `precios.txt`, sacado de su programa de gestión de Windows. Lo quieres en UTF-8.

1. Averigua en qué está con `file`.
2. Prueba a convertirlo **como si fuera Latin-1** y mira los bytes del resultado con `od -c`. ¿Qué ha pasado con el símbolo del euro?
3. Conviértelo bien a `precios-utf8.txt` y comprueba el resultado.

El fichero está en la carpeta del ejercicio: [`codigo/01-texto-binario-y-codificacion/ejercicios/ej04-precios-academia-de-baile/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej04-precios-academia-de-baile/). No lo copies del texto: lo que importa son sus bytes.

<details>
<summary>Pista 1</summary>

Si `file` no dice `ISO-8859`, sino otra cosa, hay bytes que en Latin-1 no son caracteres normales. ¿Qué carácter tiene Windows-1252 que no tiene Latin-1? ([apartado 1.5](#15-una-tabla-por-idioma-latin-1-y-windows-1252)).

</details>

<details>
<summary>Pista 2</summary>

Para ver los bytes de la conversión sin guardarla, pásala a `od -c` con una tubería, y quédate con la primera línea con `head -n 1`.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el fichero viene de Windows y tiene precios en euros. El `€` es el byte 128 en Windows-1252, pero en Latin-1 ese hueco es un carácter de control invisible. Si se convierte como Latin-1, `iconv` no da error (el byte es válido), pero el euro se pierde.

**En tu terminal** (`sesion.txt`):

```text
$ file precios.txt
precios.txt: Non-ISO extended-ASCII text
$ od -c precios.txt | head -n 1
0000000   S   a   l   s   a   :       3   5     200       a   l       m
$ iconv -f LATIN1 -t UTF-8 precios.txt | od -c | head -n 1
0000000   S   a   l   s   a   :       3   5     302 200       a   l
$ iconv -f WINDOWS-1252 -t UTF-8 precios.txt > precios-utf8.txt
$ file precios-utf8.txt
precios-utf8.txt: Unicode text, UTF-8 text
$ cat precios-utf8.txt
Salsa: 35 € al mes
Bachata: 30 € al mes
Tango: 40 € al mes
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejercicios/ej04-precios-academia-de-baile/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej04-precios-academia-de-baile/)

1. **`Non-ISO extended-ASCII text`**: `file` ve bytes por encima de 127 que no encajan en Latin-1. Es solo una **pista** (y otro sistema puede describirlo con otras palabras). **`od` la confirma**: donde va el euro hay un byte `200` en octal, el 128, que es el `€` de Windows-1252 y en Latin-1 no es ningún carácter visible.
2. **Como Latin-1, el euro se convierte en `302 200`**: es el carácter de control `U+0080`, que no se ve. **No hay error**, y por eso es peligroso: el fichero parece convertido, pero en la pantalla los precios saldrían sin euro (o con un hueco).
3. **Como Windows-1252, sale bien**: `file` dice `UTF-8 text` y `cat` enseña los euros.

**Errores frecuentes al resolverlo:**

- Dar por buena la conversión a Latin-1 porque no ha dado error: `iconv` solo avisa de los bytes **no válidos**, no de los que significan otra cosa.
- Tratar Latin-1 y Windows-1252 como si fueran lo mismo. Casi lo son, salvo en esos huecos, donde está el `€`.

</details>

#### Ejercicio 5 · El script que no arranca

Mario te pasa `bienvenida.sh`, un script de bash que escribió en Windows. En el editor se ve así, y la primera línea parece perfecta:

```bash
#!/usr/bin/env bash
# Saluda
echo "Bienvenida, $1"
```

Para tener en tu terminal el fichero **con los mismos bytes** que te ha llegado, créalo con esta orden (cópiala tal cual; `printf` escribe lo que va entre las comillas simples, y `\n` es un salto de línea):

```bash
printf '\357\273\277#!/usr/bin/env bash\n# Saluda\necho "Bienvenida, $1"\n' > bienvenida.sh
```

Al ejecutarlo con `bash bienvenida.sh Marta`, el saludo sale, pero antes aparece un error en la línea 1. Averigua qué le pasa, arréglalo en `bienvenida-arreglado.sh` y comprueba que funciona sin errores.

<details>
<summary>Pista 1</summary>

Si una línea parece perfecta y falla, hay algo **invisible**. Pregúntale a `file` y mira los primeros bytes con `od -c`.

</details>

<details>
<summary>Pista 2</summary>

Repasa el [ejemplo 2.6](#26-encontrar-y-quitar-un-bom).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el editor de Mario lo guardó **con BOM**. Los tres bytes invisibles van antes del `#!`, así que la primera línea ya no empieza por `#!` y bash la intenta ejecutar como una orden.

**En tu terminal** (`sesion.txt`):

```text
$ printf '\357\273\277#!/usr/bin/env bash\n# Saluda\necho "Bienvenida, $1"\n' > bienvenida.sh
$ bash bienvenida.sh Marta
bienvenida.sh: línea 1: ﻿#!/usr/bin/env: No existe el archivo o el directorio
Bienvenida, Marta
$ file bienvenida.sh
bienvenida.sh: Bourne-Again shell script, Unicode text, UTF-8 (with BOM) text executable
$ od -c bienvenida.sh | head -n 1
0000000 357 273 277   #   !   /   u   s   r   /   b   i   n   /   e   n
$ tail -c +4 bienvenida.sh > bienvenida-arreglado.sh
$ file bienvenida-arreglado.sh
bienvenida-arreglado.sh: Bourne-Again shell script, ASCII text executable
$ bash bienvenida-arreglado.sh Marta
Bienvenida, Marta
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejercicios/ej05-script-que-no-arranca/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej05-script-que-no-arranca/)

- **El error** dice que no existe `#!/usr/bin/env`: bash ha tomado la primera línea por una orden, con el BOM pegado delante (va ahí, aunque no se vea). Después sigue con el resto del script, y por eso el saludo sale igualmente. En un script más largo, ese fallo podría tener consecuencias peores.
- **`file`** dice `UTF-8 (with BOM)`, y **`od -c`** enseña los tres bytes `357 273 277` antes del `#!`: los mismos que escribía el `\357\273\277` del principio del `printf`, que es como llegó el fichero de Mario.
- **`tail -c +4`** los quita. `file` ya no habla de BOM (y, sin la `ñ` ni tildes, dice `ASCII text`), y el script funciona sin errores.
- **Para que no vuelva a pasar**, Mario debe guardar en **UTF-8** sin BOM (en VS Code, la barra de estado debe decir `UTF-8`, no `UTF-8 with BOM`) y con **LF**.

**Errores frecuentes al resolverlo:**

- Reescribir la primera línea en el editor: el BOM sigue ahí, porque el editor no lo enseña.
- Usar `tail -c +4` con un script que no tiene BOM: te comerías `#!/`. Comprueba siempre antes con `file` u `od`.

</details>

### 🏆 Caso real

#### Ejercicio 6 · Los socios del club de montaña

Eres la nueva tesorera del Club de Montaña Cumbres, de Huesca. El programa antiguo del club, de Windows, exporta la lista de socios a `socios.csv`. Quieres trabajar con ella en la terminal y, más adelante, guardarla en Git, pero hay algo raro: `grep Peñ socios.csv` no encuentra a nadie, y sabes que hay socios de Peñíscola.

Averigua qué le pasa al fichero y déjalo en `socios-utf8.csv` cumpliendo las reglas del curso (**UTF-8 sin BOM y LF**): comprueba también sus saltos de línea, que con un programa de Windows nunca se sabe. Al final, comprueba que `grep` ya encuentra lo que buscas.

El fichero está en la carpeta del ejercicio: [`codigo/01-texto-binario-y-codificacion/ejercicios/ej06-socios-del-club-de-montana/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej06-socios-del-club-de-montana/). No está en UTF-8 a propósito: por eso la carpeta lleva un `codificacion.txt`, que le dice al comprobador del curso en qué codificación está.

<details>
<summary>Pista 1</summary>

`grep` busca **bytes**. La `ñ` que escribes en tu terminal son los bytes de UTF-8. ¿Y la del fichero?

</details>

<details>
<summary>Pista 2</summary>

Un programa antiguo de Windows puede dar dos sorpresas: la codificación y los saltos de línea. Para los saltos, mira los bytes de la primera línea (`head -n 1 socios.csv | od -c`): ¿termina en `\n` o en `\r  \n`? ([apartado 1.14](#114-los-saltos-de-línea-también-son-bytes)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** `grep Peñ` no encuentra nada porque busca la `ñ` de UTF-8 (`c3 b1`) y en el fichero está en Windows-1252 (`f1`): son bytes distintos. Antes de convertir, se miran también los saltos de línea, porque viene de Windows. Después se convierte con `iconv` y se comprueba.

**En tu terminal** (`sesion.txt`):

```text
$ file socios.csv
socios.csv: CSV ISO-8859 text
$ head -n 1 socios.csv | od -c
0000000   n   o   m   b   r   e   ,   l   o   c   a   l   i   d   a   d
0000020   ,   c   u   o   t   a  \n
0000027
$ grep -c Peñ socios.csv
0
$ iconv -f WINDOWS-1252 -t UTF-8 socios.csv > socios-utf8.csv
$ file socios-utf8.csv
socios-utf8.csv: CSV Unicode text, UTF-8 text
$ cat socios-utf8.csv
nombre,localidad,cuota
Begoña Ruiz,Peñíscola,25
José Ortuño,Alcañiz,25
Nuria Peña,Logroño,30
Óscar Gómez,Jaén,25
$ grep -c Peñ socios-utf8.csv
2
$ grep Peñ socios-utf8.csv
Begoña Ruiz,Peñíscola,25
Nuria Peña,Logroño,30
```

📁 **Código:** [`codigo/01-texto-binario-y-codificacion/ejercicios/ej06-socios-del-club-de-montana/`](codigo/01-texto-binario-y-codificacion/ejercicios/ej06-socios-del-club-de-montana/)

Paso a paso:

1. **`file`** dice `CSV ISO-8859 text`: un CSV en una tabla de un byte. Es una pista: viniendo de un programa de Windows, lo más probable es Windows-1252, y lo confirmará la conversión, si las eñes salen bien. (Aquí `file` no dice nada de los saltos de línea, así que hay que mirarlos.)
2. **`od -c` de la primera línea** termina en `\n` solo: los saltos ya son **LF**. Este programa lo hace bien; si hubieras visto `\r  \n`, añadirías `| tr -d '\r'` detrás del `iconv`, antes del `>` ([03.04](../fase-03-herramientas/04-errores-y-depuracion.md#32-un-script-con-los-saltos-de-línea-de-windows)).
3. **`grep -c Peñ`** da 0 en el original: la `ñ` del fichero no es la de tu terminal.
4. **La conversión**: `iconv` pasa a UTF-8 en un fichero nuevo. El original no se toca.
5. **Las comprobaciones**: `file` dice `UTF-8 text` (sin BOM); `cat` enseña bien las eñes y las tildes; y `grep` ya encuentra a los dos socios con `Peñ`: Begoña, de Peñíscola, y Nuria Peña.

**Errores frecuentes al resolverlo:**

- No mirar los saltos de línea: si hubieran sido CRLF, `grep` funcionaría igual, pero la última columna valdría `25\r` en vez de `25` para cualquier programa que la lea.
- Convertir sobre el mismo fichero (`… > socios.csv`): lo vaciarías ([apartado 1.12](#112-convertir-de-una-codificación-a-otra-iconv)).
- Convertir desde `LATIN1`: aquí daría el mismo resultado, porque no hay euros; pero con el programa de Windows, lo seguro es `WINDOWS-1252` ([ejercicio 4](#ejercicio-4--los-precios-de-la-academia-de-baile)).

</details>

## 6. Chuleta

### Bytes en UTF-8

| Carácter | Bytes | Hexadecimal | `od -c` |
|---|---|---|---|
| `A` | 1 | `41` | `A` |
| `ñ` | 2 | `c3 b1` | `303 261` |
| `€` | 3 | `e2 82 ac` | `342 202 254` |
| LF | 1 | `0a` | `\n` |
| CRLF | 2 | `0d 0a` | `\r  \n` |
| BOM | 3 | `ef bb bf` | `357 273 277` |

### Órdenes

| Escribes | Qué hace |
|---|---|
| `file f` | Qué contiene `f`, sin mirar la extensión: si es texto, una pista de su codificación (y si tiene BOM) |
| `wc -c f` / `wc -m f` | Bytes / caracteres (`-m`, solo con la terminal en UTF-8) |
| `od -c f` | Los bytes, como caracteres o en octal |
| `od -t x1 f` | Los bytes, en hexadecimal |
| `iconv -f WINDOWS-1252 -t UTF-8 f > f-utf8` | Convierte a UTF-8, en un fichero nuevo |
| `tail -c +4 f > f-sin-bom` | Quita los 3 bytes del BOM (solo si lo tiene) |
| `tr -d '\r' < f > f-lf` | Pasa de CRLF a LF |

### Diagnóstico rápido

| Ves | Qué pasa | Qué haces |
|---|---|---|
| `Ã±`, `Ã©` | UTF-8 leído como Windows-1252 | Que el programa lea UTF-8. El fichero está bien |
| `�` o `?` | Windows-1252 leído como UTF-8 | Convertir el fichero a UTF-8 |
| `UTF-8 (with BOM)` | Tiene BOM | Quitarlo |
| `\r  \n` en `od -c` | Saltos de Windows | Pasar a LF |

### En VS Code

| Dónde | Qué |
|---|---|
| Barra de estado, `UTF-8` | La codificación del fichero. Clic para cambiarla |
| **Reopen with Encoding** (**Volver a abrir con codificación**) | Relee el fichero con otra tabla. No lo cambia |
| **Save with Encoding** (**Guardar con codificación**) | Lo guarda en otra codificación. Sí lo cambia |

**Regla de oro:** UTF-8 sin BOM y LF.

## 7. Preguntas de repaso

1. ¿Qué diferencia hay entre un fichero de texto y uno binario? Pon dos ejemplos de cada uno.

   <details>
   <summary>Ver respuesta</summary>

   Los dos son bytes. En uno de texto, cada byte o grupo de bytes es un carácter según una codificación, y se lee con cualquier editor (`.txt`, `.csv`, `.json`, `.sh`). En uno binario, los bytes son datos con el formato de un programa, y hace falta ese programa (`.png`, `.pdf`, `.docx`, `.mp3`). Lo tienes en [1.2. Ficheros de texto y ficheros binarios](#12-ficheros-de-texto-y-ficheros-binarios).

   </details>

2. Si cambias `foto.jpg` por `foto.txt`, ¿qué cambia? ¿Cómo sabe `file` qué es de verdad?

   <details>
   <summary>Ver respuesta</summary>

   Solo el nombre: los bytes son los mismos y sigue siendo una imagen. `file` no mira la extensión, sino el principio del fichero, donde los formatos binarios tienen su firma. Lo tienes en [1.3. La extensión no decide el contenido](#13-la-extensión-no-decide-el-contenido).

   </details>

3. ¿Qué diferencia hay entre Unicode y UTF-8? ¿Cuántos bytes ocupan en UTF-8 una `a`, una `ñ` y un `€`?

   <details>
   <summary>Ver respuesta</summary>

   Unicode dice qué número tiene cada carácter; UTF-8 dice cómo se guarda ese número en bytes. La `a`, 1 byte; la `ñ`, 2; el `€`, 3. Lo tienes en [1.7. UTF-8: cómo se guardan los caracteres de Unicode](#17-utf-8-cómo-se-guardan-los-caracteres-de-unicode).

   </details>

4. ¿Qué cuentan `wc -c` y `wc -m`? ¿Cuándo dan lo mismo?

   <details>
   <summary>Ver respuesta</summary>

   `wc -c` cuenta bytes y `wc -m`, caracteres. Dan lo mismo si el fichero solo tiene ASCII, o si la terminal no está configurada en UTF-8 (con `LANG` o `LC_ALL` a `C`, por ejemplo), porque entonces `wc -m` también cuenta bytes. Lo tienes en [1.8. Caracteres y bytes: wc -m y wc -c](#18-caracteres-y-bytes-wc--m-y-wc--c).

   </details>

5. Ves `PeÃ±a` en una página. ¿Y si ves `Pe�a`? ¿Qué ha pasado en cada caso?

   <details>
   <summary>Ver respuesta</summary>

   `PeÃ±a`: el texto está en UTF-8 y se ha leído como Latin-1 o Windows-1252; el fichero está bien y hay que arreglar el programa que lo lee. `Pe�a`: el texto no está en UTF-8 (casi seguro, en Windows-1252) y se ha leído como UTF-8; hay que convertir el fichero. Lo tienes en [1.10. Caracteres estropeados: mojibake](#110-caracteres-estropeados-mojibake).

   </details>

6. ¿Qué es el BOM y por qué conviene no ponerlo?

   <details>
   <summary>Ver respuesta</summary>

   Tres bytes invisibles (`ef bb bf`) que algunos programas ponen al principio de un fichero UTF-8. No hacen falta, y los programas que no los esperan los leen como parte del texto: un script deja de empezar por `#!`, un JSON puede ser rechazado y la primera columna de un CSV cambia de nombre. Lo tienes en [1.11. El BOM](#111-el-bom).

   </details>

7. ¿Cómo pasas `datos.csv`, que está en Windows-1252, a UTF-8? ¿Qué no debes hacer nunca?

   <details>
   <summary>Ver respuesta</summary>

   `iconv -f WINDOWS-1252 -t UTF-8 datos.csv > datos-utf8.csv`, y después compruebas con `file` y `cat` que es UTF-8 y que las tildes salen bien. Nunca redirigir al mismo fichero (`> datos.csv`), porque se vacía antes de leerlo; y nunca convertir un fichero que ya está en UTF-8. Lo tienes en [1.12. Convertir de una codificación a otra: iconv](#112-convertir-de-una-codificación-a-otra-iconv).

   </details>

8. En VS Code, ¿qué diferencia hay entre «Reopen with Encoding» y «Save with Encoding»? ¿En qué orden se usan para convertir un fichero?

   <details>
   <summary>Ver respuesta</summary>

   «Reopen with Encoding» relee los mismos bytes con otra tabla, sin cambiar el fichero; «Save with Encoding» lo guarda en otra codificación. Para convertir, primero se vuelve a abrir con la codificación en la que está (para leerlo bien) y después se guarda con UTF-8. Lo tienes en [1.13. La codificación en VS Code](#113-la-codificación-en-vs-code).

   </details>

---
⬅️ [Anterior: Retos de la fase 3](../fase-03-herramientas/retos.md) · 📚 [Índice](../00-indice.md) · ➡️ [Siguiente: Markdown](02-markdown.md)
