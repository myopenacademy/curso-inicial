# 04.03 JSON y YAML

> **Versiones:** JSON según el RFC 8259 y ECMA-404 (2.ª edición), los dos de diciembre de 2017 · YAML 1.2.2 (1 de octubre de 2021) y YAML 1.1 (2005) · Visual Studio Code 1.145; comprobado el 9 de noviembre de 2026
> **Conviene saber antes:** [03.03 El editor de código](../fase-03-herramientas/03-editor-de-codigo.md) · [01.02 Algoritmos y pseudocódigo, tipos de datos](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#tipos-de-datos) · [01.02 Algoritmos y pseudocódigo, listas y datos con partes](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#listas-y-datos-con-partes)
> **Tiempo estimado:** 2,5 horas
> **Nivel:** Básico · Núcleo

## Qué aprenderás

- Qué es un **formato de datos** y para qué sirven los dos más usados para datos con estructura: **guardar configuración**, **intercambiar datos** entre programas (las API) y **guardar datos** en ficheros de texto.
- Las tres piezas con las que se construye cualquier dato estructurado: **valores sueltos**, **listas** y **objetos** (pares de **clave y valor**), y cómo se **anidan** unas dentro de otras.
- A leer y escribir **JSON**: sus seis tipos de valores y sus **reglas estrictas** (comillas dobles, sin coma al final, sin comentarios, punto decimal).
- A leer y escribir **YAML**: mapas, listas y valores, la **sangría con espacios** (nunca tabuladores), los comentarios, las comillas, los textos de varias líneas y los ficheros con **varios documentos**.
- Por qué YAML a veces **cambia el tipo** de un valor sin avisar (`NO`, `01001`, `1.10`) y qué tienen que ver las **versiones 1.1 y 1.2**.
- A pasar el mismo dato de JSON a YAML y al revés.
- A encontrar los errores con **VS Code**: lo que hace de serie con JSON y lo que necesita para YAML.
- Dónde te los vas a encontrar: `package.json`, `compose.yaml`, GitHub Actions, la configuración de VS Code, las respuestas de las API…

## 1. Teoría

### 1.1. Datos con estructura: para qué sirven los formatos

Los programas no viven solos. Una aplicación del móvil le pide a un servidor los horarios del autobús; una tienda online le manda un pedido al almacén; un programa lee al arrancar en qué puerto tiene que escuchar y a qué base de datos se conecta. En todos esos casos hay **datos que salen de un programa** y tienen que llegar a otro, o a un fichero, y volver a leerse después.

Mientras un programa trabaja, sus datos están en la memoria, organizados a su manera. Para sacarlos de ahí hay que escribirlos como **texto** siguiendo unas reglas que conozcan los dos lados: quien escribe y quien lee. Esas reglas son un **formato de datos**.

Ya conoces uno: el [CSV](../fase-03-herramientas/01-terminal-lo-basico.md#19-ver-qué-hay-dentro-de-un-fichero-cat-less-head-y-tail), una tabla escrita en texto, con una fila por línea y las columnas separadas por comas. Funciona muy bien para tablas, pero muchos datos no son tablas. Piensa en la ficha de un club de montaña: tiene un nombre, una ciudad y una cuota, pero también una **lista** de socios, y cada socio tiene a su vez su nombre, su número de carnet y **su propia lista** de actividades. Eso es un **dato estructurado**: un dato con partes, que a su vez pueden tener partes. Una tabla plana no lo cuenta bien.

Para eso están **JSON** y **YAML**, los dos formatos más usados para datos estructurados. Los dos son [texto plano](../fase-03-herramientas/03-editor-de-codigo.md#11-qué-es-un-editor-de-código): se abren con cualquier editor, se leen con `cat` y se guardan en Git como cualquier otro fichero de texto. Y los dos sirven para lo mismo, con distinto acento:

| Para qué | Qué se usa casi siempre | Ejemplo |
|---|---|---|
| **Intercambiar datos** entre programas, sobre todo en la web (las API) | JSON | La respuesta de un servidor con el tiempo de mañana |
| **Configurar** un programa o una herramienta (lo escribe una persona) | YAML (y a veces JSON) | Los servicios que arranca Docker, los pasos de GitHub Actions |
| **Guardar datos** en un fichero para leerlos después | JSON (y a veces YAML) | Las preferencias de un programa, una copia de seguridad de unas reservas |

Una **API** es la puerta por la que un programa le pide datos o servicios a otro, por ejemplo a un servidor; la verás en [06.03 La web: HTTP, peticiones, respuestas y APIs](../fase-06-internet-y-aplicaciones/03-la-web-http-y-apis.md#111-qué-es-una-api-web).

> **📌 Nota:** convertir los datos de la memoria en texto para guardarlos o enviarlos se llama **serializar**, y hacer lo contrario, leer un texto y convertirlo en datos, **analizar** o *parsear* (del inglés *parse*). El programa que lo lee se llama **analizador** o *parser*. No hace falta que te aprendas las palabras; sí la idea: **quien lee un JSON o un YAML es un programa**, y un programa no adivina lo que querías decir. Si el texto no sigue las reglas, no lo lee.

### 1.2. Las tres piezas: valores, listas y objetos

Los datos estructurados se construyen siempre con **tres piezas**. Ya las conoces del pseudocódigo ([01.02](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#listas-y-datos-con-partes)), con otros nombres:

| Pieza | Qué es | En pseudocódigo (01.02) | En JSON | En YAML |
|---|---|---|---|---|
| **Valor suelto** | Un dato de un [tipo](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#tipos-de-datos): un texto, un número, verdadero o falso | `"Huesca"`, `1987`, `VERDADERO` | Valor (texto, número, booleano, `null`) | Escalar |
| **Lista** | Varios valores **en orden** | `[1250, 980, 1430]` | Array (lista) | Secuencia (lista) |
| **Objeto** | Un dato **con partes con nombre**: cada parte es un par **clave: valor** | Un dato con partes (`pedido`, con su código, sus libros…; se lee `pedido.libros`) | Objeto | Mapa |

Un **par clave-valor** es un nombre (la **clave**) y el dato que le corresponde (el **valor**): `"ciudad": "Huesca"` dice que la parte llamada `ciudad` vale `"Huesca"`. Es como una ficha de papel con casillas: la etiqueta de la casilla es la clave y lo que escribes dentro, el valor.

Lo potente es que **las piezas se meten unas dentro de otras**: el valor de una clave puede ser una lista; cada elemento de una lista puede ser un objeto; dentro de ese objeto, otra lista… Meter una pieza dentro de otra se llama **anidar**. Con eso se describe casi cualquier cosa: un club con sus socios, un pedido con sus líneas, una configuración con sus apartados.

Este es el club de montaña del apartado anterior, dibujado como un árbol (como el árbol de carpetas de la fase 2, pero con datos):

```text
club (objeto)
├── club: "Club de Montaña Cumbres"   (texto)
├── fundado: 1987                     (número)
├── socios (lista)
│   ├── [0] (objeto)
│   │   ├── nombre: "Lucía Martín"
│   │   └── actividades (lista): "senderismo", "escalada"
│   └── [1] (objeto)
│       ├── nombre: "Javier Ruiz"
│       └── actividades (lista vacía)
└── sede (objeto)
    └── calle: "Calle Mayor, 12"
```

JSON y YAML escriben **este mismo árbol** con símbolos distintos. Si entiendes el árbol, entiendes los dos formatos.

### 1.3. JSON: el formato para intercambiar datos

**JSON** (*JavaScript Object Notation*, «notación de objetos de JavaScript») nació a principios de los 2000 a partir de la forma de escribir los objetos en el lenguaje JavaScript, pero hoy **no depende de ningún lenguaje**: todos saben leerlo y escribirlo. Es el formato normal para que los programas se manden datos por internet, y lo verás en cuanto empieces a trabajar con API (fase 6).

Lo definen dos normas que describen el mismo formato: el **RFC 8259** y la **ECMA-404** (2.ª edición), las dos de diciembre de 2017 (comprobado el 9 de noviembre de 2026). Los ficheros JSON llevan la [extensión](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#114-la-extensión) `.json`, y el [RFC](01-texto-binario-y-codificacion.md#111-el-bom) 8259 pide que el texto que se intercambia vaya en [UTF-8](01-texto-binario-y-codificacion.md#17-utf-8-cómo-se-guardan-los-caracteres-de-unicode), sin BOM.

Así es la ficha de una socia del club en JSON:

```json
{
  "nombre": "Lucía Martín",
  "edad": 34,
  "federada": true
}
```

Fíjate en los símbolos, que son pocos:

- Las **llaves** `{ }` encierran un **objeto**.
- Dentro, cada **par clave-valor** se escribe `"clave": valor`: la clave **entre comillas dobles**, dos puntos y el valor.
- Los pares se separan con **comas**. Después del último, **ninguna**.
- Los **corchetes** `[ ]` (que verás enseguida) encierran una **lista**.

### 1.4. Los seis tipos de valores de JSON

Un valor de JSON solo puede ser de **seis tipos**, ni uno más:

| Tipo | Cómo se escribe | Ejemplos | Ojo |
|---|---|---|---|
| **Texto** (en inglés, *string*) | Entre **comillas dobles** | `"Lucía Martín"`, `"C-0012"`, `""` (texto vacío) | Comillas simples, no: `'Lucía'` es un error |
| **Número** | Sin comillas, con **punto** decimal | `34`, `45.5`, `-3`, `0.25` | Ni coma decimal (`45,5`) ni ceros delante (`034`) |
| **Booleano** (el tipo **lógico** de 01.02) | `true` o `false`, en minúsculas | `true` | `True`, `TRUE` o `verdadero` no valen |
| **Nulo** | `null`, en minúsculas | `null` | Quiere decir «no hay valor»: es distinto de `""` y de `0` |
| **Objeto** | Pares `"clave": valor` entre llaves, separados por comas | `{"ciudad": "Huesca"}`, `{}` (vacío) | Las claves, siempre texto entre comillas dobles |
| **Lista** (en inglés, *array*) | Valores entre corchetes, separados por comas | `["senderismo", "escalada"]`, `[]` (vacía) | Puede mezclar tipos, pero lo normal es que no |

Dos detalles que conviene tener claros desde el principio:

- **`34` y `"34"` no son lo mismo.** El primero es un número; el segundo, un texto de dos caracteres. Es la misma diferencia que viste en [01.02](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#tipos-de-datos) entre `53` y `"53"`. Por eso un teléfono o un código postal se guardan como **texto**: nadie los suma, y `"08001"` como número perdería su cero.
- **`null` no es «nada escrito»**: es un valor que dice expresamente «este dato no existe o no se sabe». Un socio sin teléfono puede tener `"telefono": null`.

> **📌 Nota:** JSON **no tiene un tipo para las fechas**. Se escriben como texto, y la costumbre es el orden año-mes-día, con guiones: `"2026-11-09"`. Es una norma internacional (ISO 8601) que tiene una ventaja práctica: si ordenas esas fechas como texto, quedan ordenadas en el tiempo.

### 1.5. Anidar: objetos dentro de listas dentro de objetos

Con los seis tipos y la posibilidad de anidar, ya puedes escribir el club entero. Este es el árbol del [apartado 1.2](#12-las-tres-piezas-valores-listas-y-objetos) en JSON (lo tienes completo en el [ejemplo 2.2](#22-un-club-con-datos-anidados)):

```json
{
  "club": "Club de Montaña Cumbres",
  "fundado": 1987,
  "socios": [
    {
      "nombre": "Lucía Martín",
      "actividades": ["senderismo", "escalada"]
    },
    {
      "nombre": "Javier Ruiz",
      "actividades": []
    }
  ],
  "sede": {
    "calle": "Calle Mayor, 12"
  }
}
```

Cómo leerlo sin perderse:

1. **Busca la pareja de cada llave y de cada corchete.** Lo que se abre se cierra, y en el mismo orden: la última llave abierta es la primera que se cierra. VS Code te ayuda: si pones el cursor junto a una llave, marca su pareja.
2. **Fíjate en la sangría.** Cada nivel va dos espacios más adentro. En JSON la sangría **no es obligatoria** (es solo para las personas, [apartado 1.7](#17-los-espacios-y-el-orden)), pero hace que el árbol se vea.
3. **Lee la ruta de un dato** de fuera hacia dentro, como una ruta de carpetas: las actividades del primer socio son `socios[0].actividades`, con la [primera posición en la 0](../fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md#listas-y-datos-con-partes), como en pseudocódigo. Es la forma en que te referirás a un dato concreto cuando trabajes con un lenguaje de programación.

> **💡 Consejo:** cuando un JSON te parezca un muro de llaves, **pliégalo**. En VS Code, al pasar el ratón junto a los números de línea aparecen unas flechitas (˅) al lado de cada llave o corchete que se abre: un clic esconde todo lo de dentro, y otro lo vuelve a mostrar. Así ves primero la forma general y después entras en el detalle.

### 1.6. Las reglas estrictas de JSON

JSON es **muy estricto**, y a propósito: como lo leen programas de todo tipo, cuantas menos variantes admita, menos malentendidos. Estas son las reglas que más se olvidan; cualquiera de ellas hace que **el fichero entero no se pueda leer**:

| Regla | Mal | Bien |
|---|---|---|
| Las claves y los textos van entre **comillas dobles** | `{'nombre': 'Ana'}`, `{nombre: "Ana"}` | `{"nombre": "Ana"}` |
| **Sin coma después del último** elemento de un objeto o de una lista | `{"edad": 34,}`, `[1, 2, 3,]` | `{"edad": 34}`, `[1, 2, 3]` |
| **Una coma entre cada dos** elementos | `{"edad": 34 "federada": true}` | `{"edad": 34, "federada": true}` |
| **Sin comentarios** (ni `//` ni `/* */`) | `// la ficha de Ana` | Nada: JSON no tiene comentarios |
| Números con **punto** decimal y **sin ceros delante** | `12,50`, `012` | `12.50`, `12` (o `"012"` si es un texto) |
| `true`, `false` y `null`, **en minúsculas** | `True`, `NULL` | `true`, `null` |
| Dentro de un texto, la comilla doble y la barra invertida se **escapan** con `\` | `"dijo "hola""` | `"dijo \"hola\""` |
| **Un solo valor** de primer nivel: si hay varios datos, van dentro de un objeto o de una lista | `{"a": 1} {"b": 2}` | `[{"a": 1}, {"b": 2}]` |

Sobre la penúltima fila, [escapar](02-markdown.md#114-escapar-caracteres) en JSON se hace también con la barra invertida: dentro de un texto, `\"` es una comilla doble, `\\` es una barra invertida y `\n` es un salto de línea. Por eso una ruta de Windows en JSON se escribe `"C:\\Users\\ana"`: cada barra, doblada.

Y una regla que no rompe el fichero, pero que conviene cumplir: **cada clave, una sola vez en cada objeto**. El RFC 8259 dice que las claves de un objeto *deberían* ser únicas y que, si no lo son, lo que haga el programa que lee es imprevisible. VS Code avisa (**Duplicate object key**), pero muchos programas lo leen sin quejarse y **se quedan con el último valor**, sin decir nada: así lo hacen el lector de JSON de Python y PyYAML (comprobado el 9 de noviembre de 2026). Haz caso al aviso aunque el programa «funcione».

> **⚠️ Cuidado:** muchos tutoriales enseñan objetos de **JavaScript** y los llaman JSON. Se parecen mucho, pero JavaScript admite comillas simples, claves sin comillas, comas finales y comentarios, y JSON no. Si copias algo de una web y no funciona, sospecha de eso primero.

### 1.7. Los espacios y el orden

**Los espacios, las sangrías y los saltos de línea entre los elementos no cuentan** en JSON (el RFC 8259 los llama «espacios en blanco insignificantes»). Estos dos JSON son exactamente el mismo dato:

```json
{"nombre": "Lucía Martín", "edad": 34}
```

```json
{
  "nombre": "Lucía Martín",
  "edad": 34
}
```

El primero se llama **compacto** (o «minificado»): sin espacios de sobra, todo en una línea. Es lo que mandan los servidores, porque ocupa menos. El segundo está **formateado** para leerlo, con un elemento por línea y dos espacios por nivel. Lo verás con ficheros reales en el [ejemplo 2.3](#23-espacios-que-no-cuentan).

Para pasar un JSON compacto a formateado no tienes que hacerlo a mano: VS Code lo hace con **Format Document** (**Dar formato al documento**), que ya conoces de [03.03](../fase-03-herramientas/03-editor-de-codigo.md#115-lo-que-verás-más-adelante): <kbd>Mayús</kbd>+<kbd>Alt</kbd>+<kbd>F</kbd> en Windows, <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>I</kbd> en Linux y <kbd>Mayús</kbd>+<kbd>Opción</kbd>+<kbd>F</kbd> en macOS (según la documentación de VS Code, a 9 de noviembre de 2026).

**¿Y el orden?**

- El orden de las **claves de un objeto no importa**: `{"nombre": "Ana", "edad": 34}` y `{"edad": 34, "nombre": "Ana"}` dicen lo mismo, porque cada valor se busca por su clave.
- El orden de los **elementos de una lista sí importa**: `["Ana", "Luis"]` no es lo mismo que `["Luis", "Ana"]`, porque cada elemento se busca por su posición. En una lista de clasificación, el orden es justo lo importante.

### 1.8. Comprobar un JSON en VS Code

No hace falta ningún programa para saber si un JSON está bien escrito: **VS Code lo comprueba de serie** mientras escribes, sin instalar nada (según su documentación, a 9 de noviembre de 2026). Al abrir un fichero `.json`:

- Cada error sale **subrayado con una línea ondulada roja**, como ya viste en el [ejemplo 2.2 de 03.03](../fase-03-herramientas/03-editor-de-codigo.md#22-tu-primer-fichero-en-el-editor). Si pasas el ratón por encima, te dice qué pasa.
- El panel **Problems** (**Problemas**) reúne todos los errores de los ficheros abiertos, con su línea y su columna. Se abre desde **View > Problems** (**Ver > Problemas**) o con <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>M</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>M</kbd>). Un clic en un error te lleva a su sitio; <kbd>F8</kbd> salta al siguiente.
- En la barra de estado, abajo a la izquierda, un contador con una ✕ te dice cuántos errores hay. Si es 0, el fichero está bien escrito.

Los mensajes vienen en inglés o, con el paquete de idioma español, traducidos. Estos son los que más vas a ver, comprobados en el código de VS Code y en su traducción oficial el 9 de noviembre de 2026:

| Mensaje en inglés | Con el paquete de español | Qué suele querer decir |
|---|---|---|
| Trailing comma | Coma final | Sobra la coma después del último elemento |
| Expected comma | Se esperaba una coma | Falta una coma entre dos elementos (mira el **final de la línea anterior**) |
| Property keys must be doublequoted | Las claves de propiedad deberán tener comillas dobles | Una clave sin comillas o con comillas simples |
| Value expected | Se esperaba un valor | Algo que no es un valor de JSON: `True`, un texto con comillas simples… |
| Property expected | Propiedad esperada | Después de una coma, el programa esperaba otra clave (a menudo, por una coma decimal: `2,40`) |
| Comments are not permitted in JSON. | No se permiten comentarios en JSON. | Un `//` o un `/* */` |
| Duplicate object key | Clave de objeto duplicada | La misma clave dos veces en un objeto |

Igual que con los mensajes de la terminal ([03.04](../fase-03-herramientas/04-errores-y-depuracion.md#14-leer-el-mensaje-entero)), **lee el mensaje entero y mira la línea y la columna**. Pero recuerda que el programa marca **dónde se dio cuenta** del error, que no siempre es donde está: si falta una coma al final de la línea 3, el aviso sale al principio de la línea 4, donde aparece algo que no esperaba.

> **📌 Nota:** la configuración del propio VS Code (`settings.json`) parece JSON, pero admite **comentarios** y avisa (sin dar error) de las comas finales. Es una variante que VS Code llama **JSON with Comments** (*jsonc*), y la usa en sus ficheros de configuración. Si ves comentarios en un `settings.json`, no te extrañe; pero en un `.json` normal, siguen sin valer.

### 1.9. YAML: el formato para que lo escriban personas

**YAML** es un juego de palabras recursivo: *YAML Ain't Markup Language*, «YAML no es un lenguaje de marcas». Está pensado para que lo **escriban y lo lean personas**: casi sin comillas, sin llaves y sin comas, con la estructura marcada por la **sangría**. Por eso es el formato preferido para la **configuración**: los servicios de Docker Compose, los flujos de trabajo de GitHub Actions, Kubernetes y muchas herramientas más.

Los ficheros YAML llevan la extensión `.yaml` o `.yml`; las dos funcionan, y lo único importante es usar la que pida cada herramienta (Docker Compose, por ejemplo, busca primero `compose.yaml`).

La misma socia del [apartado 1.3](#13-json-el-formato-para-intercambiar-datos), en YAML:

```yaml
nombre: Lucía Martín
edad: 34
federada: true
```

Sin llaves, sin comillas, sin comas: una línea por par clave-valor. Es el mismo dato; la diferencia es solo de escritura.

**Las versiones.** La versión actual es la **YAML 1.2**, de 2009, cuya última revisión, la 1.2.2, es del 1 de octubre de 2021. Pero muchos programas siguen leyendo con las reglas de la **YAML 1.1**, de 2005, y la diferencia se nota en un punto muy concreto que verás en el [apartado 1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12). (Fechas comprobadas en yaml.org el 9 de noviembre de 2026.)

> **📌 Nota:** la YAML 1.2 se diseñó para que **todo JSON sea también YAML válido**. Un programa que lee YAML 1.2 lee sin problemas un fichero JSON. Al revés, no: casi ningún YAML es JSON.

### 1.10. Mapas, listas y sangría

YAML tiene las mismas tres piezas del [apartado 1.2](#12-las-tres-piezas-valores-listas-y-objetos), con sus propios nombres: **mapas** (los objetos de JSON), **secuencias** o listas, y **escalares** (los valores sueltos).

**Un mapa** es una serie de líneas `clave: valor`. Las reglas:

- **Después de los dos puntos, un espacio.** `ciudad: Huesca` es una clave y su valor; `ciudad:Huesca`, sin el espacio, no es un par clave-valor ([error típico 3.7](#37-dos-puntos-en-el-valor)).
- **La sangría dice qué va dentro de qué.** Si el valor de una clave es otro mapa, se deja vacío lo que va detrás de los dos puntos y las claves de dentro van en las líneas de abajo, **más adentro**:

  ```yaml
  sede:
    ciudad: Huesca
    calle: Calle Mayor, 12
  ```

  `ciudad` y `calle` están dentro de `sede` porque están dos espacios más adentro. Todas las claves de un mismo mapa tienen que empezar **exactamente en la misma columna**.
- **La sangría se hace con espacios, nunca con tabuladores.** Lo dice la propia norma: los tabuladores no se pueden usar para sangrar, porque cada sistema los muestra de una forma. Cuántos espacios, da igual, siempre que sean los mismos en todo el nivel; lo habitual son **dos** ([error típico 3.5](#35-un-tabulador-en-la-sangría)).

**Una lista** es una serie de líneas que empiezan por **guion y espacio** (`- `), todas en la misma columna:

```yaml
actividades:
  - senderismo
  - escalada
```

**Una lista de mapas** es lo que en JSON era una lista de objetos: cada elemento empieza por `- ` y sus claves siguen alineadas detrás del guion:

```yaml
socios:
  - nombre: Lucía Martín
    carnet: C-0012
  - nombre: Javier Ruiz
    carnet: C-0047
```

Fíjate bien en esta forma, porque es la que más cuesta al principio: `nombre` va detrás del guion y `carnet`, en la línea de abajo, **alineado con `nombre`** (no con el guion). Cada guion abre un elemento nuevo; todo lo que va alineado con su primera clave es de ese elemento.

**La forma en línea.** Para listas y mapas cortos, YAML admite también la escritura de JSON, entre corchetes y llaves:

```yaml
idiomas: [es, en, fr]
sede: {ciudad: Huesca, calle: "Calle Mayor, 12"}
```

Se usa para cosas cortas; para lo demás, la forma con sangría se lee mejor. Una lista vacía se escribe `[]` y un mapa vacío, `{}`.

> **⚠️ Cuidado:** en YAML, un espacio de más o de menos **cambia el significado**: mueve una clave de un mapa a otro o rompe el fichero. Cuando un YAML falle, lo primero que tienes que mirar es la sangría.

### 1.11. Comentarios, comillas y textos largos

**Comentarios.** A diferencia de JSON, YAML sí tiene [comentarios](../fase-01-que-es-programar/01-que-es-programar.md#21-el-mismo-algoritmo-en-tres-lenguajes): desde una almohadilla (`#`) hasta el final de la línea. Puede ocupar una línea entera o ir detrás de un valor, **separada por un espacio**:

```yaml
# Configuración de la web del club
puerto: 8080
modo_pruebas: false   # true solo en el ordenador de quien programa
```

Es una de las razones por las que YAML se prefiere para la configuración: puedes explicar por qué cada opción tiene el valor que tiene.

**Comillas.** En YAML, los textos casi nunca necesitan comillas: `ciudad: Huesca` ya es un texto. Pero hay casos en que **son obligatorias o muy recomendables**:

| Cuándo | Ejemplo sin comillas (mal) | Con comillas (bien) |
|---|---|---|
| El texto lleva **dos puntos y un espacio** | `lema: Subir: siempre` | `lema: "Subir: siempre"` |
| El texto lleva **espacio y almohadilla** o **empieza por** `#` | `color: #2e7d32` | `color: "#2e7d32"` |
| El texto **parece un número, un booleano o `null`** y quieres que sea texto | `codigo_postal: 01001` | `codigo_postal: "01001"` |
| El texto **empieza por** un carácter especial: `[`, `{`, `-` seguido de espacio, `&`, `*`, `!`, `\|`, `>`, `'`, `"`, `%`, `@` o `` ` `` | `nota: * provisional` | `nota: "* provisional"` |

Se pueden usar comillas **dobles** (`"…"`, que admiten escapes como `\n`, igual que en JSON) o **simples** (`'…'`, que lo dejan todo tal cual). Para empezar, quédate con las dobles: son las mismas de JSON.

> **💡 Consejo:** ante la duda, **pon comillas**. Un texto entre comillas es siempre un texto, en cualquier versión de YAML y con cualquier programa. Que sobren nunca rompe nada.

**Textos de varias líneas.** Para un texto largo, como el pie de un correo, YAML tiene dos símbolos que se ponen detrás de los dos puntos; el texto va en las líneas de abajo, sangrado:

| Símbolo | Qué hace | Para qué |
|---|---|---|
| `\|` (barra vertical) | **Conserva** los saltos de línea tal como los escribes | Direcciones, poemas, un script dentro de un fichero de configuración |
| `>` (mayor que) | **Junta** las líneas en una sola, con un espacio entre ellas | Un párrafo largo que quieres partir en el fichero para que se lea bien |

Los dos dejan un salto de línea al final del texto. Lo verás funcionando en el [ejemplo 2.5](#25-configuración-de-una-web). Hay variantes para quitar ese último salto o conservar varios, pero no las necesitas ahora: cuando te hagan falta, sabrás dónde buscarlas.

### 1.12. Los tipos que adivina YAML: las versiones 1.1 y 1.2

En JSON, el tipo de cada valor se ve en cómo está escrito: con comillas, texto; sin comillas, número, booleano o `null`. En YAML, como los textos van sin comillas, **el programa que lee tiene que adivinar** el tipo de cada valor: si parece un número, será un número; si parece un booleano, un booleano. Casi siempre acierta:

| Escrito así | YAML lo lee como |
|---|---|
| `Huesca`, `Calle Mayor, 12`, `C-0012` | Texto |
| `1987`, `45.5`, `-3` | Número |
| `true`, `false` | Booleano |
| `null`, `~` o nada detrás de los dos puntos | Nulo |
| `"1987"`, `"true"`, `"null"` | Texto: las comillas mandan |

El problema viene cuando un **texto parece otra cosa**. Y aquí importan las versiones: la **YAML 1.1** adivinaba mucho más que la **1.2**. Esto es lo que pasa con unos valores reales, probado el 9 de noviembre de 2026 con dos **bibliotecas** (código ya hecho que un programa usa para una tarea concreta; aquí, leer YAML): PyYAML 6.0.3, muy usada en Python, que sigue la 1.1, y `yaml` 2.8.3, de JavaScript, que sigue la 1.2:

| Escrito sin comillas | Querías el texto | Con YAML 1.1 | Con YAML 1.2 |
|---|---|---|---|
| `pais: NO` | `"NO"` (Noruega) | `false` (booleano) | `"NO"` (texto) |
| `confirmado: yes` | `"yes"` | `true` | `"yes"` |
| `wifi: off` | `"off"` | `false` | `"off"` |
| `codigo_postal: 01001` | `"01001"` (Vitoria) | `513` (número, leído en octal) | `1001` (número: pierde el cero) |
| `version: 1.10` | `"1.10"` | `1.1` (número) | `1.1` (número) |
| `hora: 12:30` | `"12:30"` | `750` (número: lo lee en base 60) | `"12:30"` (texto) |

Fíjate en tres cosas:

- **Lo de `NO`, `yes`, `on` y `off`** es tan famoso que tiene nombre: «el problema de Noruega». En YAML 1.1, `yes`, `no`, `on` y `off` (en minúsculas, con mayúscula inicial o en mayúsculas) son booleanos. En la 1.2, solo lo son `true` y `false`.
- **Los números con ceros delante y las versiones** dan problemas **en las dos**: ningún lector guarda `01001` ni `1.10` como texto si no se lo pides.
- **No da ningún error.** El fichero se lee sin problemas… con un dato equivocado. Es el peor tipo de fallo, porque no avisa: lo descubres cuando el envío a Noruega sale como «false» en una factura.

¿Y cuál usa cada programa? **Depende del programa**, y no siempre lo dice: los hay que siguen la 1.1, los que siguen la 1.2 y los que mezclan. Por eso la regla práctica no es aprenderse qué lee cada uno, sino esta: **pon entre comillas todo texto que pueda parecer otra cosa** (`"NO"`, `"01001"`, `"1.10"`, `"12:30"`). Con comillas, todos los lectores leen lo mismo.

> **📌 Nota:** las fechas tienen su propia trampa. Escrita sin comillas, `2026-11-09` es **una fecha** para los lectores de YAML 1.1 (un tipo que JSON no tiene), mientras que para otros es un texto. Si la quieres como texto, que es lo más seguro al pasar los datos a JSON, ponla entre comillas: `"2026-11-09"`.

### 1.13. Varios documentos en un fichero

Un fichero YAML puede llevar **varios documentos**, uno detrás de otro, separados por una línea con **tres guiones** (`---`). Cada documento es un dato completo e independiente:

```yaml
salida: Pico Aneto
plazas: 12
---
salida: Valle de Ordesa
plazas: 20
```

Se usa cuando una herramienta quiere varias piezas de configuración en un solo fichero (en Kubernetes, por ejemplo, es habitual). También verás ficheros que **empiezan** por `---`: marca el principio del primer documento y no cambia nada. Lo tienes completo en el [ejemplo 2.6](#26-varios-documentos).

> **📌 Nota:** en JSON no existe nada parecido: un fichero JSON es **un solo valor**. Si necesitas varios, van dentro de una lista.

### 1.14. Comprobar un YAML en VS Code

Aquí hay una diferencia importante con JSON: **VS Code, de serie, no comprueba los YAML**. Solo los **colorea**. La parte de YAML que trae se llama **YAML Language Basics** y, según su propia descripción en el código de VS Code, da «resaltado de sintaxis y emparejamiento de corchetes»: nada más. Puedes tener un tabulador en la sangría o una clave mal alineada y no verás ninguna línea roja (comprobado el 9 de noviembre de 2026).

Lo que sí hace de serie, y ayuda mucho: en los ficheros YAML, la tecla <kbd>Tab</kbd> **escribe espacios** (dos), no un tabulador. Los tabuladores se cuelan sobre todo al **copiar y pegar** desde otro sitio.

Para que VS Code compruebe los YAML como comprueba los JSON, hace falta una **extensión**: la de YAML de **Red Hat**, que ya viste recomendada en [03.03](../fase-03-herramientas/03-editor-de-codigo.md#111-extensiones-útiles-para-este-curso). Antes de instalarla, aplica los criterios de [03.03, apartado 1.10](../fase-03-herramientas/03-editor-de-codigo.md#110-extensiones-ampliar-el-editor-con-cuidado). En el Marketplace se llama **YAML** y la publica **Red Hat** (`redhat.com`). Según su página (a 9 de noviembre de 2026), «detecta si el fichero entero es YAML válido», y además autocompleta y comprueba ficheros conocidos.

Con la extensión, los errores salen igual que en JSON: subrayados en rojo y en el panel **Problems**. Sus mensajes vienen **en inglés** (no tiene traducción al español). Los más habituales, comprobados con el lector que usa la extensión el 9 de noviembre de 2026:

| Mensaje | Qué suele querer decir |
|---|---|
| Tabs are not allowed as indentation | Hay un tabulador en la sangría |
| All mapping items must start at the same column | Las claves de un mismo mapa no están alineadas |
| Nested mappings are not allowed in compact mappings | Unos dos puntos con espacio donde no tocan: un valor con `: ` sin comillas, o una clave con espacios de más en la sangría |
| Implicit keys need to be on a single line | Suele salir junto al anterior: algo que el lector ha tomado por una clave partida en dos líneas |
| Map keys must be unique | La misma clave dos veces en un mapa |

> **⚠️ Cuidado:** la extensión lee los ficheros como **YAML 1.2** salvo que cambies su ajuste `yaml.yamlVersion` (según su documentación, a 9 de noviembre de 2026). Así que **no te avisará** de que `pais: NO` sería `false` para un programa que lea con la 1.1: para ella, es un texto correcto. Las trampas del [apartado 1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12) se evitan con comillas, no con el editor.

> **📌 Nota:** fuera del editor existen programas de terminal para comprobar y consultar JSON y YAML, como `jq` (para JSON) o `yq` (para YAML). No vienen con Git Bash (algunas versiones recientes de macOS pueden traer `jq`, pero no `yq`), y para este curso no los necesitas: con VS Code tienes bastante.

### 1.15. El mismo dato en JSON y en YAML

Ya has visto que JSON y YAML escriben el mismo árbol de datos. Pasar de uno a otro es **traducir los símbolos**, sin cambiar el árbol:

| En JSON | En YAML |
|---|---|
| `{` y `}` de un objeto | Desaparecen: las claves de dentro van una por línea, más adentro |
| `"clave": valor` | `clave: valor` (la clave, sin comillas) |
| Las comas entre elementos | Desaparecen: un elemento por línea |
| `[` y `]` de una lista con elementos | Desaparecen: cada elemento, en su línea, con `- ` delante |
| `[]` y `{}` vacíos | Igual: `[]` y `{}` |
| `"texto"` | `texto`, sin comillas… **salvo que parezca otra cosa** (apartados [1.11](#111-comentarios-comillas-y-textos-largos) y [1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12)): `"22001"`, `"NO"`, `"#2e7d32"` |
| `34`, `45.5`, `true`, `false`, `null` | Igual |
| No hay comentarios | Puedes añadirlos con `#` |

Y la comparación de los dos formatos:

| | JSON | YAML |
|---|---|---|
| **Pensado para** | Que lo lean programas | Que lo escriban personas |
| **La estructura la marcan** | Llaves, corchetes y comas | La sangría y los guiones |
| **Comentarios** | No | Sí, con `#` |
| **Tipos** | Se ven en la escritura | Los adivina el lector (con trampas) |
| **Lo que más falla** | Comas y comillas | Sangría y tipos adivinados |
| **Más usado para** | Intercambiar datos (API), guardar datos | Configuración |

**¿Cuál elijo?** Normalmente no eliges tú: lo decide la herramienta o el programa con el que trabajas (Docker Compose quiere YAML; una API, JSON). Cuando sí puedas elegir: **JSON para datos que se intercambian o que genera un programa**, y **YAML para configuración que escribe y mantiene una persona**, sobre todo si necesita comentarios. Para tablas, otros formatos, como el CSV o el XML, que verás en [04.04 XML, CSV y otros](04-xml-csv-y-otros.md).

### 1.16. Dónde los verás

No te hace falta saber qué significa cada línea de estos ficheros (te lo enseñará el curso que use cada herramienta); sí **reconocerlos** y saber que siguen las reglas de este módulo.

| Fichero | Formato | Qué es |
|---|---|---|
| `package.json` | JSON | La ficha de un proyecto de JavaScript: su nombre, su versión y los paquetes que necesita. VS Code conoce su forma y te propone las claves mientras escribes |
| La respuesta de una API | JSON | Lo que contesta un servidor cuando un programa le pide datos ([06.03](../fase-06-internet-y-aplicaciones/03-la-web-http-y-apis.md#111-qué-es-una-api-web)) |
| `compose.yaml` (o `docker-compose.yml`) | YAML | Los servicios que arranca Docker Compose: la aplicación, la base de datos… |
| `.github/workflows/*.yml` | YAML | Los flujos de trabajo de GitHub Actions: lo que se ejecuta solo cada vez que subes un cambio (la [integración continua](../fase-01-que-es-programar/03-probar-un-programa.md#19-las-pruebas-automáticas)) |
| `curso.json` | JSON | Sin ir más lejos, la ficha de este curso: la academia lo lee para saber qué fases, módulos y ejercicios tiene |

(Nombres de ficheros comprobados en la documentación oficial de Docker y de GitHub el 9 de noviembre de 2026.)

## 2. Ejemplos de código

En este módulo los ejemplos son **ficheros de datos**. Todos están comprobados: los buenos se leen sin errores, y los de la [sección 3](#3-errores-típicos), que están mal a propósito, fallan. Descarga la carpeta de cada uno (su enlace «📁 Código»), ábrela en VS Code y juega con ellos: cambia algo, rómpelo y mira qué te dice el editor.

### 2.1. La ficha de una socia

**Situación real:** el Club de Montaña Cumbres, de Huesca, quiere guardar los datos de cada socia en un fichero que pueda leer el programa de su web.

```json
{
  "nombre": "Lucía Martín",
  "edad": 34,
  "cuota": 45.5,
  "federada": true,
  "telefono": "600123456",
  "segundo_apellido": null
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.1-ficha-de-una-socia/`](codigo/03-json-y-yaml/ejemplos/2.1-ficha-de-una-socia/)

**En qué fijarte:**

- Están **cinco de los seis tipos**: texto (`"Lucía Martín"`), número entero (`34`), número con decimales (`45.5`, con punto), booleano (`true`) y nulo (`null`).
- **`"telefono"` es un texto**, no un número: nadie suma teléfonos, y así no hay peligro de perder un cero o un prefijo.
- **`"segundo_apellido": null`** dice «este dato no existe»: Lucía tiene un solo apellido en la ficha. Es distinto de no poner la clave (el programa no sabría si se ha olvidado) y de `""` (un texto vacío).
- Las claves van **sin tildes ni espacios** (`segundo_apellido`), como los nombres del pseudocódigo. JSON las admitiría, pero muchos programas las usan como nombres de variables, y así no dan problemas.

### 2.2. Un club con datos anidados

**Situación real:** ahora el club quiere su ficha completa: sus datos, la lista de socios con sus actividades y la dirección de la sede.

```json
{
  "club": "Club de Montaña Cumbres",
  "ciudad": "Huesca",
  "fundado": 1987,
  "web": "https://cumbres.example.com",
  "cuota_anual": 45.5,
  "admite_menores": true,
  "socios": [
    {
      "nombre": "Lucía Martín",
      "carnet": "C-0012",
      "federada": true,
      "actividades": ["senderismo", "escalada"]
    },
    {
      "nombre": "Javier Ruiz",
      "carnet": "C-0047",
      "federada": false,
      "actividades": []
    }
  ],
  "sede": {
    "calle": "Calle Mayor, 12",
    "codigo_postal": "22001",
    "telefono": null
  }
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.2-un-club-con-datos-anidados/`](codigo/03-json-y-yaml/ejemplos/2.2-un-club-con-datos-anidados/)

**En qué fijarte:**

- **Tres niveles de anidación:** el club es un objeto; `socios` es una lista de objetos; y dentro de cada socio, `actividades` es otra lista. Es el árbol del [apartado 1.2](#12-las-tres-piezas-valores-listas-y-objetos), entero.
- **Cada socio tiene las mismas claves**, en el mismo orden. JSON no lo exige, pero es lo que espera quien lea la lista: si al segundo socio le faltara `carnet`, el programa de la web podría fallar al buscarlo.
- **`"actividades": []`**: Javier no tiene ninguna actividad todavía. Una lista vacía sigue siendo una lista; el programa puede recorrerla sin problema (cero vueltas).
- **`"codigo_postal": "22001"`**, como texto, por lo mismo que el teléfono.
- **La lista de actividades va en una sola línea** y los socios, en varias. Las dos formas valen ([apartado 1.7](#17-los-espacios-y-el-orden)): las listas cortas de valores sueltos se suelen escribir en una línea.
- **Las comas:** detrás de cada elemento menos del último de su objeto o su lista. Fíjate en `}` y `},` al cerrar cada socio, y en `]` y `],` al cerrar las listas.
- **Ruta de un dato:** la segunda actividad de Lucía es `socios[0].actividades[1]`, es decir, `"escalada"`.

### 2.3. Espacios que no cuentan

**Situación real:** el servidor de la web del club manda la ficha del club **compacta**, en una sola línea, para que ocupe menos. Tienes las dos versiones, la formateada (`club.json`, la del ejemplo anterior) y la compacta (`club-compacto.json`), y quieres compararlas desde la terminal.

Este es `club-compacto.json`, todo en una sola línea (desplázate a la derecha para verla entera):

```json
{"club":"Club de Montaña Cumbres","ciudad":"Huesca","fundado":1987,"web":"https://cumbres.example.com","cuota_anual":45.5,"admite_menores":true,"socios":[{"nombre":"Lucía Martín","carnet":"C-0012","federada":true,"actividades":["senderismo","escalada"]},{"nombre":"Javier Ruiz","carnet":"C-0047","federada":false,"actividades":[]}],"sede":{"calle":"Calle Mayor, 12","codigo_postal":"22001","telefono":null}}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.3-espacios-que-no-cuentan/`](codigo/03-json-y-yaml/ejemplos/2.3-espacios-que-no-cuentan/)

**En tu terminal** (`sesion.txt`):

```text
$ wc -l club.json club-compacto.json
 27 club.json
  1 club-compacto.json
 28 total
$ wc -c club.json club-compacto.json
553 club.json
411 club-compacto.json
964 total
$ head -n 3 club.json
{
  "club": "Club de Montaña Cumbres",
  "ciudad": "Huesca",
$ grep carnet club.json
      "carnet": "C-0012",
      "carnet": "C-0047",
$ grep -c carnet club-compacto.json
1
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.3-espacios-que-no-cuentan/`](codigo/03-json-y-yaml/ejemplos/2.3-espacios-que-no-cuentan/)

**En qué fijarte:**

- **Son el mismo dato:** las mismas claves y los mismos valores. Solo cambian los espacios y los saltos de línea, que en JSON no cuentan ([apartado 1.7](#17-los-espacios-y-el-orden)).
- **`wc -l`** cuenta líneas: 27 la formateada y 1 la compacta. **`wc -c`** cuenta bytes: la compacta ocupa alrededor de una cuarta parte menos (411 frente a 553). Con un fichero de miles de socios, esa diferencia es la que hace que los servidores manden el JSON compacto.
- **Un JSON es texto**: `head`, `grep` y el resto de los filtros de [03.02](../fase-03-herramientas/02-terminal-sacarle-partido.md#16-los-filtros-grep-sort-uniq-wc-cut-head-y-tail) funcionan con él.
- **Pero `grep` trabaja por líneas**: en la versión formateada encuentra los dos carnets, cada uno en su línea; en la compacta, `grep -c` dice **1**, porque todo el fichero es una sola línea. Para mirar un JSON compacto, mejor ábrelo en VS Code y dale formato (**Format Document**, [apartado 1.7](#17-los-espacios-y-el-orden)).

### 2.4. El mismo club en YAML

**Situación real:** el club quiere guardar su ficha en un fichero que la secretaria pueda editar a mano, con un comentario arriba. Lo pasas a YAML.

```yaml
# El mismo club que club.json, ahora en YAML
club: Club de Montaña Cumbres
ciudad: Huesca
fundado: 1987
web: https://cumbres.example.com
cuota_anual: 45.5
admite_menores: true
socios:
  - nombre: Lucía Martín
    carnet: C-0012
    federada: true
    actividades:
      - senderismo
      - escalada
  - nombre: Javier Ruiz
    carnet: C-0047
    federada: false
    actividades: []
sede:
  calle: Calle Mayor, 12
  codigo_postal: "22001"
  telefono: null
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.4-el-mismo-club-en-yaml/`](codigo/03-json-y-yaml/ejemplos/2.4-el-mismo-club-en-yaml/)

En la carpeta están `club.yaml` y `club.json` (el del [ejemplo 2.2](#22-un-club-con-datos-anidados)), y se ha comprobado que **los dos se leen como el mismo dato**.

**En qué fijarte:**

- **Ocupa menos y se lee mejor**: 22 líneas frente a 27, sin llaves, comas ni comillas. Y lleva un comentario, que en JSON no cabría.
- **Cada traducción de la tabla del [apartado 1.15](#115-el-mismo-dato-en-json-y-en-yaml)**: las llaves del club desaparecen; la lista de socios se convierte en dos elementos con `- `; dentro de cada uno, `carnet`, `federada` y `actividades` van **alineadas con `nombre`**.
- **Las listas vacías siguen siendo `[]`.** Sin los corchetes, `actividades:` a secas sería `null`, otro dato distinto.
- **`codigo_postal: "22001"` lleva comillas, y `calle: Calle Mayor, 12`, no.** El código postal, sin comillas, se leería como el número 22001: se perdería que es un texto, y la comparación con el JSON fallaría. La calle no parece ni un número ni un booleano, así que no las necesita; la coma, dentro de un texto en esta forma, no es especial.
- **`web: https://cumbres.example.com` no necesita comillas**, aunque lleve dos puntos: los dos puntos solo son especiales si van **seguidos de un espacio**, y aquí van seguidos de `//`.
- **`carnet: C-0012` es texto** sin comillas: empieza por una letra, así que no parece un número.

### 2.5. Configuración de una web

**Situación real:** la web del club necesita un fichero de configuración: en qué puerto arranca, el servidor de correo, los idiomas, el color de la marca y dos textos para los correos. Lo escribirá y lo cambiará una persona, así que va en YAML, con comentarios.

```yaml
# Configuración de la web del club
nombre: Club de Montaña Cumbres
puerto: 8080
modo_pruebas: false   # true solo en el ordenador de quien programa

# Un mapa dentro de otro: lo que va dentro, sangrado con dos espacios
correo:
  servidor: correo.cumbres.example.com
  remitente: hola@cumbres.example.com

# Una lista corta, escrita en una línea
idiomas: [es, en, fr]

# Textos que parecen otra cosa: entre comillas
version: "1.10"
codigo_postal: "22001"
color_principal: "#2e7d32"

# Un texto de varias líneas: | conserva los saltos de línea
pie_de_correo: |
  Club de Montaña Cumbres
  Calle Mayor, 12 · Huesca

# > junta las líneas en una sola
aviso_salidas: >
  Las salidas se confirman
  el jueves anterior.
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.5-configuracion-de-una-web/`](codigo/03-json-y-yaml/ejemplos/2.5-configuracion-de-una-web/)

Para que veas exactamente **qué lee un programa** de ese YAML, este es el mismo dato en JSON (en la carpeta, `configuracion.json`; se ha comprobado que los dos se leen igual):

```json
{
  "nombre": "Club de Montaña Cumbres",
  "puerto": 8080,
  "modo_pruebas": false,
  "correo": {
    "servidor": "correo.cumbres.example.com",
    "remitente": "hola@cumbres.example.com"
  },
  "idiomas": ["es", "en", "fr"],
  "version": "1.10",
  "codigo_postal": "22001",
  "color_principal": "#2e7d32",
  "pie_de_correo": "Club de Montaña Cumbres\nCalle Mayor, 12 · Huesca\n",
  "aviso_salidas": "Las salidas se confirman el jueves anterior.\n"
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.5-configuracion-de-una-web/`](codigo/03-json-y-yaml/ejemplos/2.5-configuracion-de-una-web/)

**En qué fijarte:**

- **Los comentarios desaparecen** en el JSON: son para las personas que editan el fichero, y el programa no los ve.
- **Las líneas en blanco** que separan los bloques del YAML tampoco cuentan: solo ayudan a leerlo.
- **`idiomas: [es, en, fr]`** es una lista en la forma en línea ([apartado 1.10](#110-mapas-listas-y-sangría)): en JSON, la misma lista con comillas.
- **Las tres comillas** del bloque central evitan tres trampas: `1.10` sería el número 1.1; `22001`, un número; y `#2e7d32`, sin comillas, ni siquiera sería un texto: la `#` empezaría un comentario y el valor quedaría vacío, es decir, `null`, sin ningún error ([apartado 1.11](#111-comentarios-comillas-y-textos-largos)). Fíjate en el editor: el color de los comentarios delata el problema en cuanto lo escribes.
- **`|` conserva el salto de línea** entre «Cumbres» y «Calle Mayor»: en el JSON se ve como `\n`. **`>` junta** las dos líneas del aviso en una, con un espacio. Y los dos dejan un `\n` al final, como dice el [apartado 1.11](#111-comentarios-comillas-y-textos-largos).
- **La sangría del texto largo** (dos espacios) no forma parte del texto: YAML la quita al leerlo.

### 2.6. Varios documentos

**Situación real:** el club apunta las salidas del verano en un solo fichero, una detrás de otra, y el programa que manda los avisos las lee de una en una.

```yaml
# Las salidas del verano: un documento por salida
---
salida: Pico Aneto
fecha: "2026-07-12"
plazas: 12
guia: Lucía Martín
---
salida: Valle de Ordesa
fecha: "2026-08-02"
plazas: 20
guia: Javier Ruiz
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/2.6-varios-documentos/`](codigo/03-json-y-yaml/ejemplos/2.6-varios-documentos/)

**En qué fijarte:**

- **Dos documentos**, cada uno detrás de su `---`. El primer `---` es opcional (marca el principio del primero); el segundo es el que los separa. El comentario de arriba no es de ningún documento.
- **Cada documento es un dato completo**, con las mismas claves. El programa que los lee recibe dos fichas por separado, no una lista.
- **Las fechas van entre comillas**, para que todos los lectores las lean como texto ([apartado 1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12)).

## 3. Errores típicos

Los errores de esta sección tienen su fichero roto en su carpeta, comprobado: todos fallan al leerlos. Ábrelos en VS Code para ver el error en el editor (los YAML, con la extensión de Red Hat; [apartado 1.14](#114-comprobar-un-yaml-en-vs-code)).

### 3.1. Una coma después del último elemento

```json
{
  "nombre": "Lucía Martín",
  "edad": 34,
  "federada": true,
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/3.1-coma-final/`](codigo/03-json-y-yaml/ejemplos/3.1-coma-final/)

**Qué pasa:** el fichero no se lee. VS Code subraya la última coma con el mensaje **Trailing comma** (**Coma final**), en la línea 4.

**Por qué ocurre:** JSON no admite una coma detrás del último elemento de un objeto o de una lista. Suele pasar al **borrar o mover** la última línea: la que queda la última conserva su coma. También al copiar de un objeto de JavaScript, que sí la admite ([apartado 1.6](#16-las-reglas-estrictas-de-json)).

**Cómo se arregla:** quita la coma después de `true`. Al añadir o quitar elementos al final, revisa siempre la línea que ha quedado la última.

### 3.2. Comillas simples o claves sin comillas

```json
{
  'nombre': 'Lucía Martín',
  edad: 34
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/3.2-comillas-simples/`](codigo/03-json-y-yaml/ejemplos/3.2-comillas-simples/)

**Qué pasa:** VS Code marca **Property keys must be doublequoted** (**Las claves de propiedad deberán tener comillas dobles**) en las líneas 2 y 3, y **Value expected** (**Se esperaba un valor**) en `'Lucía Martín'`.

**Por qué ocurre:** en JSON, los textos, también las claves, van **siempre entre comillas dobles**. Las simples son de JavaScript o de Python, y las claves sin comillas, de JavaScript.

**Cómo se arregla:** `"nombre": "Lucía Martín"` y `"edad": 34`. Con **buscar y reemplazar** ([03.03](../fase-03-herramientas/03-editor-de-codigo.md#18-buscar-y-reemplazar)) puedes cambiar todas las `'` por `"` de golpe, pero revisa antes los resultados: un apóstrofo dentro de un texto (`"O'Donnell"`) tiene que quedarse como está.

### 3.3. Comentarios en un JSON

```json
{
  // Ficha de una socia del club
  "nombre": "Lucía Martín",
  "edad": 34
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/3.3-comentarios-en-json/`](codigo/03-json-y-yaml/ejemplos/3.3-comentarios-en-json/)

**Qué pasa:** VS Code marca **Comments are not permitted in JSON.** (**No se permiten comentarios en JSON.**) en la línea 2, y cualquier programa que lea el fichero falla.

**Por qué ocurre:** JSON no tiene comentarios, ni `//` ni `/* */`. Confunde porque hay ficheros con aspecto de JSON que sí los admiten, como el `settings.json` de VS Code ([apartado 1.8](#18-comprobar-un-json-en-vs-code)).

**Cómo se arregla:** quita el comentario. Si necesitas explicar los datos, hazlo en otro sitio (el `README.md` del proyecto), o usa YAML si el formato lo eliges tú. Algunos añaden una clave como `"_comentario": "…"`, pero eso ya es un dato más, que el programa recibe.

### 3.4. Una coma olvidada

```json
{
  "nombre": "Lucía Martín",
  "edad": 34
  "federada": true
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/3.4-coma-olvidada/`](codigo/03-json-y-yaml/ejemplos/3.4-coma-olvidada/)

**Qué pasa:** VS Code marca **Expected comma** (**Se esperaba una coma**) **al principio de la línea 4**, en `"federada"`.

**Por qué ocurre:** falta la coma al final de la línea 3. Es el error más habitual al **añadir** una línea al final: la que antes era la última no tenía coma, y nadie se la pone. El aviso sale en la línea 4 porque es ahí donde el programa encuentra algo que no esperaba ([apartado 1.8](#18-comprobar-un-json-en-vs-code)).

**Cómo se arregla:** pon la coma detrás de `34`. Regla práctica: si el error está al principio de una línea, **mira el final de la anterior**.

### 3.5. Un tabulador en la sangría

En el bloque de abajo, la sangría de las líneas 3 y 4 es un **tabulador**, aunque se vea como espacios:

```yaml
club: Club de Montaña Cumbres
sede:
	ciudad: Huesca
	calle: Calle Mayor, 12
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/3.5-tabulador-en-yaml/`](codigo/03-json-y-yaml/ejemplos/3.5-tabulador-en-yaml/)

**Qué pasa:** el fichero no se lee. Con la extensión de Red Hat, VS Code marca **Tabs are not allowed as indentation** en las líneas 3 y 4. Sin la extensión, no ves nada raro: el fichero parece perfecto.

**Por qué ocurre:** YAML **prohíbe los tabuladores en la sangría** ([apartado 1.10](#110-mapas-listas-y-sangría)). En VS Code, la tecla <kbd>Tab</kbd> escribe espacios en los YAML, así que el tabulador casi siempre llega **al copiar y pegar** de una web, de un documento o de un fichero escrito con otro editor.

**Cómo se arregla:** cambia cada tabulador por dos espacios. Para verlos, activa **View > Appearance > Render Whitespace** (**Ver > Apariencia > Representar espacio en blanco**): los espacios se ven como puntos (`·`) y los tabuladores, como flechas (`→`). Si son muchos, la orden **Convert Indentation to Spaces** (**Convertir sangría en espacios**) de la paleta de comandos los cambia todos.

### 3.6. Sangría desigual

```yaml
club: Club de Montaña Cumbres
sede:
  ciudad: Huesca
 calle: Calle Mayor, 12
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/3.6-sangria-desigual/`](codigo/03-json-y-yaml/ejemplos/3.6-sangria-desigual/)

**Qué pasa:** el fichero no se lee. La extensión de Red Hat marca **All mapping items must start at the same column** en la línea 4.

**Por qué ocurre:** `ciudad` y `calle` son claves del mismo mapa (`sede`), pero `ciudad` empieza con dos espacios y `calle`, con uno. Para YAML, `calle` no está ni dentro de `sede` ni fuera: no sabe dónde ponerla. Con **un espacio de más** (tres) pasa lo mismo, pero el aviso es más raro: **Nested mappings are not allowed in compact mappings**, y sale **en la línea de antes**, porque el lector cree que `calle` sigue el valor de `ciudad`.

**Cómo se arregla:** alinea todas las claves de un mismo mapa en la misma columna (aquí, dos espacios). Activa **Render Whitespace** para contar los espacios si no lo ves claro, y fíjate en las guías verticales que dibuja VS Code en la sangría.

### 3.7. Dos puntos en el valor

```yaml
club: Club de Montaña Cumbres
lema: Subir: siempre; bajar: con cuidado
```

📁 **Código:** [`codigo/03-json-y-yaml/ejemplos/3.7-dos-puntos-en-el-valor/`](codigo/03-json-y-yaml/ejemplos/3.7-dos-puntos-en-el-valor/)

**Qué pasa:** el fichero no se lee. La extensión de Red Hat marca **Nested mappings are not allowed in compact mappings** en la línea 2.

**Por qué ocurre:** en YAML, **dos puntos seguidos de un espacio** separan una clave de su valor. En `lema: Subir: siempre…` hay tres, y el lector cree que `Subir` es otra clave dentro del valor de `lema`, cosa que no se puede escribir en una sola línea.

**Cómo se arregla:** pon el texto entre comillas: `lema: "Subir: siempre; bajar: con cuidado"`.

El caso contrario, **olvidar el espacio después de los dos puntos**, no siempre da error, y es peor:

```yaml
nombre:Lucía
```

Esto se lee sin problemas… como **un texto suelto**, `"nombre:Lucía"`, no como una clave con su valor. Si la línea de debajo es una clave bien escrita (con su espacio), el fichero falla; si también le falta el espacio, se junta todo en un solo texto, sin error (comprobado con PyYAML el 16 de noviembre de 2026). Mira siempre que haya un espacio detrás de los dos puntos.

### 3.8. YAML cambia el tipo de un valor

```yaml
pais: NO
codigo_postal: 01001
version: 1.10
```

**Qué pasa:** no sale ningún error, ni en el editor ni al leer el fichero. Pero el programa recibe `false` en lugar de «NO» (si lee con YAML 1.1), un número en lugar del código postal, y la versión `1.1` en lugar de la `1.10`.

**Por qué ocurre:** YAML adivina el tipo de los valores sin comillas, y estos textos parecen un booleano y dos números ([apartado 1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12)). La extensión de VS Code tampoco avisa: no es un error de escritura.

**Cómo se arregla:** comillas en todo lo que sea un texto y parezca otra cosa:

```yaml
pais: "NO"
codigo_postal: "01001"
version: "1.10"
```

## 4. Buenas prácticas

- **Escribe JSON y YAML en el editor de código**, nunca en un procesador de textos: cambiaría las comillas rectas por tipográficas ([03.03](../fase-03-herramientas/03-editor-de-codigo.md#33-escribir-código-en-un-procesador-de-textos)).
- **Mira el panel Problems antes de dar un fichero por bueno.** Con JSON, VS Code ya te avisa; con YAML, instala la extensión de Red Hat si vas a escribir YAML a menudo.
- **Da formato a los JSON** con **Format Document**: la sangría hace visible el árbol y los errores de llaves y corchetes.
- **Sangría de dos espacios en YAML**, y ningún tabulador. Activa **Render Whitespace** cuando dudes.
- **En YAML, comillas para todo texto que pueda parecer otra cosa**: códigos postales, teléfonos, versiones, horas, fechas, `NO`, `yes`, `on`, `off`, colores con `#` y textos con `: `.
- **Teléfonos, códigos postales, códigos de producto y DNI, como texto**, en los dos formatos: no son números con los que se calcula.
- **Fechas como texto en formato año-mes-día** (`"2026-11-09"`).
- **Claves claras, sin tildes ni espacios** (`codigo_postal`), y **las mismas claves en todos los elementos** de una lista de objetos.
- **`null` para lo que no existe**, no `""` ni `0`, y `[]` para una lista vacía.
- **Cada clave, una sola vez** en cada objeto.
- **Comenta la configuración en YAML**: el porqué de cada valor raro, para quien la toque después (que puedes ser tú dentro de un año).
- **Cambia un fichero de configuración poco a poco** y comprueba después de cada cambio: si algo falla, sabrás qué lo ha roto ([03.04](../fase-03-herramientas/04-errores-y-depuracion.md#16-una-hipótesis-y-un-solo-cambio-cada-vez)).

## 5. Ejercicios prácticos resueltos

> **💡 Consejo:** hay ejercicios de **razonar** y ejercicios de **escribir** un fichero. Los de escribir, hazlos en VS Code, en un fichero con la extensión correcta (`.json` o `.yaml`), y mira el panel **Problems** antes de abrir la solución. Para los YAML, mejor con la extensión de Red Hat instalada ([apartado 1.14](#114-comprobar-un-yaml-en-vs-code)).

### 🟢 Básico

#### Ejercicio 1 · Qué tipo tiene cada valor

Este es un trozo de la respuesta de la web de una biblioteca. Di el tipo de cada valor (texto, número, booleano, nulo, objeto o lista) y contesta a las preguntas de debajo.

```json
{
  "id": 4021,
  "titulo": "Nada",
  "anio": "1945",
  "prestado": false,
  "devolver_antes_de": null,
  "copias": 3,
  "temas": ["novela", "posguerra"],
  "biblioteca": {"nombre": "Biblioteca Municipal de Teruel"},
  "valoracion": 4.5,
  "nota": ""
}
```

1. ¿Qué tipo tiene cada uno de los diez valores?
2. ¿Qué diferencia hay entre `"devolver_antes_de": null` y `"nota": ""`?
3. Un programa quiere calcular cuántos años tiene el libro restando `anio` al año actual. ¿Qué problema va a tener?

<details>
<summary>Pista 1</summary>

Mira **cómo está escrito** cada valor: con comillas dobles, es texto, aunque dentro haya cifras; `true` y `false` son booleanos; con llaves, un objeto; con corchetes, una lista ([apartado 1.4](#14-los-seis-tipos-de-valores-de-json)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** en JSON, el tipo se ve en la escritura ([apartado 1.4](#14-los-seis-tipos-de-valores-de-json)).

1. Los tipos:

   | Clave | Valor | Tipo |
   |---|---|---|
   | `id` | `4021` | Número |
   | `titulo` | `"Nada"` | Texto |
   | `anio` | `"1945"` | **Texto** (lleva comillas) |
   | `prestado` | `false` | Booleano |
   | `devolver_antes_de` | `null` | Nulo |
   | `copias` | `3` | Número |
   | `temas` | `["novela", "posguerra"]` | Lista (de dos textos) |
   | `biblioteca` | `{"nombre": "…"}` | Objeto (con una clave) |
   | `valoracion` | `4.5` | Número (con decimales, con punto) |
   | `nota` | `""` | Texto (vacío) |

2. **`null` dice que el dato no existe**: el libro no está prestado, así que no hay fecha de devolución. **`""` es un texto que existe pero está vacío**: hay nota, y no dice nada. Para un programa son cosas distintas: puede escribir «Nota: » con `""`, y nada con `null`.
3. **`anio` es un texto**, `"1945"`, no el número `1945`. Restar un texto a un número da un error o un resultado raro, según el lenguaje. Lo correcto sería `"anio": 1945`, sin comillas: un año sí es un número con el que se calcula (a diferencia de un código postal).

**Errores frecuentes al resolverlo:**

- Decir que `"1945"` es un número porque «son cifras». Las comillas mandan.
- Decir que `""` y `null` son lo mismo porque «los dos están vacíos».
- Pensar que `4.5` está mal porque en España se escribe 4,5. En JSON, el decimal es siempre el punto.

</details>

#### Ejercicio 2 · La ficha de un libro

Andrés tiene prestado en la biblioteca un ejemplar de *La sombra del viento*, de Carlos Ruiz Zafón (2001), ISBN 978-84-08-04363-7, de 576 páginas, que cuesta 10,95 €. Ahora mismo no está disponible para otros socios. Los temas del libro son novela, misterio y Barcelona. El préstamo es a nombre de Andrés Gil y tiene que devolverlo antes del 23 de noviembre de 2026.

Escribe en VS Code un fichero `libro.json` con todos esos datos. Decide tú el nombre de las claves y el tipo de cada valor; el préstamo, como un objeto aparte dentro de la ficha.

<details>
<summary>Pista 1</summary>

Piensa para cada dato: ¿se calcula con él? Entonces, número. ¿Es un sí o un no? Booleano. ¿Varios valores? Lista. ¿Un grupo de datos sobre lo mismo? Objeto. El ISBN tiene guiones y nadie lo suma.

</details>

<details>
<summary>Pista 2</summary>

Las claves, sin tildes ni espacios: `anio` mejor que `año`. La fecha, como texto, en el orden año-mes-día ([apartado 1.4](#14-los-seis-tipos-de-valores-de-json)). El precio, con punto decimal.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** cada dato con su tipo ([apartado 1.4](#14-los-seis-tipos-de-valores-de-json)), las claves sin tildes, y el préstamo como un objeto anidado ([apartado 1.5](#15-anidar-objetos-dentro-de-listas-dentro-de-objetos)).

```json
{
  "titulo": "La sombra del viento",
  "autor": "Carlos Ruiz Zafón",
  "anio": 2001,
  "isbn": "978-84-08-04363-7",
  "paginas": 576,
  "precio": 10.95,
  "disponible": false,
  "temas": ["novela", "misterio", "Barcelona"],
  "prestamo": {
    "socio": "Andrés Gil",
    "devolver_antes_de": "2026-11-23"
  }
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej02-ficha-de-un-libro/`](codigo/03-json-y-yaml/ejercicios/ej02-ficha-de-un-libro/)

- **`anio`, `paginas` y `precio` son números**: con ellos se calcula (la antigüedad del libro, el total de una compra). El precio, `10.95`, con punto.
- **`isbn` es texto**: tiene guiones y nadie lo suma.
- **`disponible` es booleano**: la respuesta a «¿se puede prestar?» es sí o no.
- **`temas` es una lista** de textos.
- **`prestamo` es un objeto** con sus dos datos, y la fecha va como texto, `"2026-11-23"`.

Tu solución puede tener otras claves (`año_publicacion`, `tematicas`…) y otro orden: vale si el fichero no tiene errores en el panel **Problems** y cada dato tiene un tipo que se pueda defender. Lo que no valdría: el precio como `"10,95 €"` (sería un texto con el que no se puede calcular) o la fecha como `23/11/2026` sin comillas (no es ningún tipo de JSON: error).

**Errores frecuentes al resolverlo:**

- Escribir `10,95`: con coma, el programa lee `10` y luego no entiende el `95` (**Property expected**).
- Escribir el ISBN sin comillas: `978-84-…` no es un número válido de JSON.
- Poner coma detrás de la última clave del préstamo o de la ficha.
- Escribir `"disponible": "no"`: funciona, pero es un texto, y el programa tendría que comparar palabras en lugar de mirar un sí o un no.

</details>

### 🟡 Intermedio

#### Ejercicio 3 · Arregla el pedido de la panadería

La web de la Panadería Sol ha recibido este pedido y su programa no lo puede leer. **Tiene cuatro errores.** Encuéntralos sin ejecutar nada (después, ábrelo en VS Code para comprobar) y escribe el pedido corregido.

```json
{
  "pedido": "P-2041",
  'cliente': "Marta Sanz",
  "fecha": "2026-11-09",
  "lineas": [
    {"producto": "Pan de centeno", "unidades": 2, "precio": 2,40},
    {"producto": "Ensaimada", "unidades": 1, "precio": 3.50}
  ],
  "pagado": True,
  "notas": null,
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej03-pedido-con-errores/`](codigo/03-json-y-yaml/ejercicios/ej03-pedido-con-errores/)

<details>
<summary>Pista 1</summary>

Recorre la tabla de reglas del [apartado 1.6](#16-las-reglas-estrictas-de-json) fila a fila: comillas, comas finales, números, `true`/`false`/`null`.

</details>

<details>
<summary>Pista 2</summary>

Hay un error en la línea 3, otro en la 6, otro en la 9 y otro en la 10.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se comprueba cada regla del [apartado 1.6](#16-las-reglas-estrictas-de-json). Estos son los cuatro errores y lo que dice VS Code de cada uno:

| Línea | Error | Mensaje de VS Code | Corrección |
|---|---|---|---|
| 3 | La clave `'cliente'` va con comillas simples | Property keys must be doublequoted | `"cliente"` |
| 6 | Coma decimal en `2,40`: el programa lee el número `2`, toma la coma por un separador y espera otra clave | Property expected | `2.40` |
| 9 | `True` con mayúscula (es de Python) | Value expected | `true` |
| 10 | Coma detrás del último par, `"notas": null,` | Trailing comma | `"notas": null` |

El pedido corregido:

```json
{
  "pedido": "P-2041",
  "cliente": "Marta Sanz",
  "fecha": "2026-11-09",
  "lineas": [
    {"producto": "Pan de centeno", "unidades": 2, "precio": 2.40},
    {"producto": "Ensaimada", "unidades": 1, "precio": 3.50}
  ],
  "pagado": true,
  "notas": null
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej03-pedido-corregido/`](codigo/03-json-y-yaml/ejercicios/ej03-pedido-corregido/)

Fíjate en el error de la línea 6: el aviso sale **en la columna del `40`**, no en la coma, porque es ahí donde el programa se da cuenta. Y fíjate en lo que **no** era un error: `"notas": null` es correcto, y las líneas del pedido escritas cada una en una sola línea, también.

**Errores frecuentes al resolverlo:**

- Encontrar tres y dar el fichero por bueno: después de corregir, **comprueba otra vez** en el panel **Problems**, hasta que diga 0.
- «Arreglar» `2,40` como `"2,40"`: el fichero se lee, pero el precio pasa a ser un texto y el programa no podrá sumarlo.
- Quitar la coma de la línea 8 (`],`) en lugar de la de la 10: esa coma separa la lista `lineas` de la clave `pagado` y está bien. La línea 7, el último elemento de la lista, ya va sin coma.

</details>

#### Ejercicio 4 · De JSON a YAML

Este JSON describe una ruta del club de montaña. Pásalo a YAML, en un fichero `ruta.yaml`, sin usar la forma en línea (ni llaves ni corchetes, salvo que hagan falta).

```json
{
  "ruta": "Circular de Linás de Broto",
  "dificultad": "media",
  "distancia_km": 12.5,
  "desnivel_m": 850,
  "circular": true,
  "puntos": [
    {"nombre": "Linás de Broto", "altitud_m": 1250},
    {"nombre": "Collado de Otal", "altitud_m": 2010}
  ],
  "material": ["botas", "agua", "chubasquero"],
  "guia": {
    "nombre": "Lucía Martín",
    "telefono": "600123456"
  },
  "observaciones": null
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej04-de-json-a-yaml/`](codigo/03-json-y-yaml/ejercicios/ej04-de-json-a-yaml/)

<details>
<summary>Pista 1</summary>

Sigue la tabla del [apartado 1.15](#115-el-mismo-dato-en-json-y-en-yaml): fuera llaves, comas y comillas de las claves; cada lista, con `- `; cada objeto de dentro, sangrado dos espacios.

</details>

<details>
<summary>Pista 2</summary>

Repasa cada texto: ¿alguno parece un número? Ese tiene que conservar las comillas. Y los `puntos` son una **lista de mapas**: mira cómo se alinean en el [apartado 1.10](#110-mapas-listas-y-sangría).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** se traduce cada símbolo sin cambiar el árbol ([apartado 1.15](#115-el-mismo-dato-en-json-y-en-yaml)), y se mira qué textos necesitan comillas ([apartado 1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12)).

```yaml
ruta: Circular de Linás de Broto
dificultad: media
distancia_km: 12.5
desnivel_m: 850
circular: true
puntos:
  - nombre: Linás de Broto
    altitud_m: 1250
  - nombre: Collado de Otal
    altitud_m: 2010
material:
  - botas
  - agua
  - chubasquero
guia:
  nombre: Lucía Martín
  telefono: "600123456"
observaciones: null
```

En la carpeta de la solución están `ruta.json` y `ruta.yaml`, y se ha comprobado que **los dos se leen como el mismo dato**.

- **Los puntos de la ruta** son una lista de mapas: cada uno empieza con `- nombre:` y su `altitud_m` va alineada con `nombre`.
- **`telefono: "600123456"` conserva las comillas**: sin ellas, sería el número 600123456 y ya no sería el mismo dato que en el JSON.
- **El resto de textos va sin comillas**: «media», «botas» o «Linás de Broto» no parecen ningún otro tipo.
- **`observaciones: null`**: se podría dejar vacío (`observaciones:`), que también es nulo, pero `null` se lee más claro.
- Los números (`12.5`, `850`) y el booleano (`true`) se quedan igual.

**Errores frecuentes al resolverlo:**

- Quitar las comillas del teléfono: el YAML se lee sin errores, pero el dato cambia de tipo, y nadie te avisa.
- Alinear `altitud_m` con el guion en lugar de con `nombre`: la clave quedaría fuera del elemento de la lista y el fichero fallaría.
- Usar tabuladores para sangrar, si copias de otro sitio.
- Dejar las comas al final de las líneas: en YAML, una coma al final de un valor forma parte del texto (`media,`).

</details>

### 🔴 Avanzado

#### Ejercicio 5 · Las trampas de un viaje a Noruega

El club prepara un viaje y alguien ha escrito esta configuración para la web de inscripciones. Al leerla, el programa (que usa un lector de YAML 1.1) muestra datos absurdos.

```yaml
destino: Noruega
pais: NO
codigo_postal_salida: 01001
version_programa: 1.10
hora_salida: 7:30
seguro_incluido: yes
color_camiseta: #1565c0
```

1. ¿Qué valor recibe el programa en cada clave, con YAML 1.1? ¿Y con un lector de YAML 1.2?
2. Escribe el fichero corregido, sabiendo que `seguro_incluido` es un sí o un no (booleano) y todo lo demás son textos.

<details>
<summary>Pista 1</summary>

La tabla del [apartado 1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12) tiene casi todos los casos. Para el color, repasa el [ejemplo 2.5](#25-configuración-de-una-web).

</details>

<details>
<summary>Pista 2</summary>

Para la hora: en YAML 1.1, `7:30` se lee en base 60, como los minutos de un reloj: 7 × 60 + 30.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** cada valor sin comillas que parece un booleano o un número se convierte en ese tipo; y una `#` precedida de un espacio empieza un comentario ([apartados 1.11](#111-comentarios-comillas-y-textos-largos) y [1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12)).

**1. Lo que recibe el programa** (comprobado con PyYAML, YAML 1.1, y con la biblioteca `yaml`, YAML 1.2, el 9 de noviembre de 2026):

| Clave | Con YAML 1.1 | Con YAML 1.2 | ¿Qué se quería? |
|---|---|---|---|
| `destino` | `"Noruega"` | `"Noruega"` | Bien en las dos |
| `pais` | `false` | `"NO"` | El texto «NO» |
| `codigo_postal_salida` | `513` | `1001` | El texto «01001» |
| `version_programa` | `1.1` | `1.1` | El texto «1.10» |
| `hora_salida` | `450` | `"7:30"` | El texto «7:30» |
| `seguro_incluido` | `true` | `"yes"` | El booleano `true` |
| `color_camiseta` | `null` | `null` | El texto «#1565c0» |

Fíjate en que **con la 1.2 también hay problemas**: el código postal, la versión y el color salen mal en las dos, y `yes` pasa a ser un texto, así que el programa no recibe el booleano que esperaba.

**2. El fichero corregido:**

```yaml
# Viaje del club a Noruega, con las trampas resueltas
destino: Noruega
pais: "NO"
codigo_postal_salida: "01001"
version_programa: "1.10"
hora_salida: "7:30"
seguro_incluido: true
color_camiseta: "#1565c0"
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej05-trampas-de-yaml/`](codigo/03-json-y-yaml/ejercicios/ej05-trampas-de-yaml/)

En la carpeta está también `viaje.json`, con los datos que se querían, y se ha comprobado que el YAML corregido **se lee igual que ese JSON** con un lector de YAML 1.1, el más tramposo.

- **Comillas en todos los textos que parecen otra cosa**: `"NO"`, `"01001"`, `"1.10"`, `"7:30"` y `"#1565c0"`.
- **`seguro_incluido: true`**, no `yes`: el único booleano que leen igual todas las versiones es `true` o `false`.
- `destino: Noruega` no necesita comillas: no parece nada más que un texto.

**Errores frecuentes al resolverlo:**

- Poner `seguro_incluido: "yes"`: queda un texto, no un booleano, y el programa preguntará «¿es verdadero?» a un texto.
- Creer que con un lector de YAML 1.2 no hay que hacer nada: el código postal, la versión y el color fallan igual.
- Fiarse de que el editor no marca nada: estos fallos **no son errores de escritura**, y ni la extensión de Red Hat los señala ([apartado 1.14](#114-comprobar-un-yaml-en-vs-code)).

</details>

#### Ejercicio 6 · Un YAML mal sangrado

Javier ha escrito la lista de inscritos a la salida de Ordesa, y el programa de avisos no la puede leer.

```yaml
salida: Valle de Ordesa
inscritos:
  - nombre: Lucía Martín
    federada: true
  - nombre: Javier Ruiz
     federada: false
material_comun:
- botiquín
  - cuerda
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej06-yaml-mal-sangrado/`](codigo/03-json-y-yaml/ejercicios/ej06-yaml-mal-sangrado/)

1. Encuentra el error que impide leer el fichero. ¿En qué línea lo marca la extensión de Red Hat, y por qué ahí?
2. Hay un **segundo problema** que no da ningún error. ¿Cuál es y qué recibiría el programa?
3. Escribe el fichero corregido, con la sangría de dos espacios en todo.

<details>
<summary>Pista 1</summary>

Cuenta los espacios de delante de cada `federada`. Y repasa lo que dice el [error típico 3.6](#36-sangría-desigual) sobre un espacio **de más**.

</details>

<details>
<summary>Pista 2</summary>

Para el segundo problema: una línea más sangrada que la anterior, que no es una clave… ¿puede ser la continuación del texto de arriba?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** todas las claves de un mismo mapa y todos los guiones de una misma lista tienen que estar en la misma columna ([apartado 1.10](#110-mapas-listas-y-sangría)).

1. **El error está en la línea 6**: `federada` de Javier tiene cinco espacios delante, y `nombre`, en la línea de arriba, empieza en la columna 5 (detrás de `  - `). Debería tener cuatro, como la de Lucía. La extensión de Red Hat lo marca **en la línea 5** (**Nested mappings are not allowed in compact mappings**), no en la 6: con un espacio de más, el lector cree que `federada` sigue el valor de `nombre`, y protesta al ver que ese valor se ha convertido en otro mapa. Es lo que avisaba el [error típico 3.6](#36-sangría-desigual): **el aviso puede salir una línea antes**.
2. **El material:** `- cuerda` está más sangrado que `- botiquín`, así que no es otro elemento de la lista, sino **la continuación del texto** de arriba. El programa recibiría una lista con un solo elemento: el texto `"botiquín - cuerda"`. No da error, y por eso es peor (comprobado con PyYAML el 9 de noviembre de 2026). Que el guion de `- botiquín` esté en la misma columna que `material_comun` **no es un error**: YAML lo admite. Pero mejor sangrarlo, como el resto del fichero.
3. El fichero corregido:

```yaml
salida: Valle de Ordesa
inscritos:
  - nombre: Lucía Martín
    federada: true
  - nombre: Javier Ruiz
    federada: false
material_comun:
  - botiquín
  - cuerda
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej06-yaml-corregido/`](codigo/03-json-y-yaml/ejercicios/ej06-yaml-corregido/)

Ahora `inscritos` es una lista de dos mapas, cada uno con su `nombre` y su `federada`, y `material_comun`, una lista de dos textos.

**Errores frecuentes al resolverlo:**

- Arreglar la línea 6, ver que el fichero ya se lee y darlo por bueno, sin mirar qué datos salen. Que un YAML se lea no quiere decir que diga lo que querías.
- Buscar el error en la línea 5 porque ahí está el aviso: la línea 5 está bien; el aviso sale ahí por cómo lee el programa.
- Alinear `federada` con el guion (dos espacios): entonces sería otra clave de la lista, no del elemento de Javier, y el fichero volvería a fallar.

</details>

### 🏆 Caso real

#### Ejercicio 7 · Las reservas de una casa rural

Elena lleva la Casa Rural El Roble, en el Pirineo, y apunta las reservas en una libreta. Quiere pasarlas a una aplicación de reservas, que las importa en **JSON**, y guardar además una copia en **YAML** que pueda leer y corregir ella misma, con algún comentario. Estas son las de diciembre:

- **R-0107**: Carmen Torres, teléfono 612 345 678. Llega el 5 de diciembre de 2026, 2 noches, 4 personas, sin mascota. Ha pedido desayuno y leña. Sin comentarios.
- **R-0108**: Pablo Navarro, teléfono 698 765 432. Llega el 19 de diciembre de 2026, 3 noches, 2 personas, con mascota. No ha pedido extras. Comentario: «Llegarán tarde, hacia las 22:00».

1. Escribe `reservas.json`: un objeto con el nombre de la casa (`casa`) y una lista `reservas`, con un objeto por reserva. Decide las claves y los tipos.
2. Escribe `reservas.yaml` con **exactamente los mismos datos**, más algún comentario que explique tus decisiones.
3. Explica qué datos podrían cambiar de tipo sin querer al pasar a YAML y cómo lo has evitado.

<details>
<summary>Pista 1</summary>

Antes de escribir, decide el tipo de cada dato: ¿con cuáles se calcula (noches, personas)? ¿Cuáles son un sí o un no? ¿Cuáles pueden no existir? ¿Y cuáles son listas, aunque estén vacías?

</details>

<details>
<summary>Pista 2</summary>

En el YAML, piensa en los teléfonos, las fechas y la hora del comentario de Pablo. Repasa los apartados [1.11](#111-comentarios-comillas-y-textos-largos) y [1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se decide el tipo de cada dato (apartados [1.4](#14-los-seis-tipos-de-valores-de-json) y [1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12)); después se escribe el JSON, y el YAML se traduce de él ([apartado 1.15](#115-el-mismo-dato-en-json-y-en-yaml)), con comillas donde haga falta.

| Dato | Tipo | Por qué |
|---|---|---|
| Código, huésped | Texto | Son nombres |
| Teléfono | Texto | No se calcula con él; sin espacios, para que sea fácil de buscar |
| Fecha de llegada | Texto, `"2026-12-05"` | JSON no tiene fechas; año-mes-día |
| Noches, personas | Número | Se calcula con ellos (el precio, las camas) |
| Mascota | Booleano | Sí o no |
| Extras | Lista de textos | Varios; vacía si no hay |
| Comentario | Texto, o `null` si no hay | «No hay comentario» no es un texto vacío |

**1. `reservas.json`:**

```json
{
  "casa": "Casa Rural El Roble",
  "reservas": [
    {
      "codigo": "R-0107",
      "huesped": "Carmen Torres",
      "telefono": "612345678",
      "llegada": "2026-12-05",
      "noches": 2,
      "personas": 4,
      "mascota": false,
      "extras": ["desayuno", "leña"],
      "comentario": null
    },
    {
      "codigo": "R-0108",
      "huesped": "Pablo Navarro",
      "telefono": "698765432",
      "llegada": "2026-12-19",
      "noches": 3,
      "personas": 2,
      "mascota": true,
      "extras": [],
      "comentario": "Llegarán tarde, hacia las 22:00"
    }
  ]
}
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej07-reservas-casa-rural/`](codigo/03-json-y-yaml/ejercicios/ej07-reservas-casa-rural/)

**2. `reservas.yaml`:**

```yaml
# Reservas de diciembre de Casa Rural El Roble
casa: Casa Rural El Roble
reservas:
  - codigo: R-0107
    huesped: Carmen Torres
    telefono: "612345678"    # texto: nadie suma teléfonos
    llegada: "2026-12-05"    # entre comillas, para que sea texto
    noches: 2
    personas: 4
    mascota: false
    extras: [desayuno, leña]
    comentario: null
  - codigo: R-0108
    huesped: Pablo Navarro
    telefono: "698765432"
    llegada: "2026-12-19"
    noches: 3
    personas: 2
    mascota: true
    extras: []
    comentario: "Llegarán tarde, hacia las 22:00"
```

📁 **Código:** [`codigo/03-json-y-yaml/ejercicios/ej07-reservas-casa-rural/`](codigo/03-json-y-yaml/ejercicios/ej07-reservas-casa-rural/)

Se ha comprobado que los dos ficheros **se leen como el mismo dato**.

**3. Lo que podía cambiar de tipo, y cómo se ha evitado:**

- **Los teléfonos**, sin comillas, serían números: en YAML van entre comillas. (En JSON ya eran texto, porque llevaban comillas.)
- **Las fechas**, sin comillas, serían fechas para un lector de YAML 1.1, un tipo que JSON no tiene, y los dos ficheros ya no dirían lo mismo ([apartado 1.12](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12)): entre comillas.
- **El comentario de Pablo** lleva `22:00`: sin espacio detrás de los dos puntos no rompería el fichero, pero con comillas no hay ninguna duda, y no cuestan nada.
- **Los extras de Pablo**, `[]`, y no vacío: vacío sería `null`, y la aplicación esperaría una lista que pueda recorrer.
- `R-0107` no necesita comillas: empieza por una letra.

**Por qué los dos formatos:** el JSON es para la aplicación, que lo importa (intercambio de datos); el YAML es para Elena, que lo lee, lo corrige y lo comenta (escrito por una persona). Es el reparto del [apartado 1.15](#115-el-mismo-dato-en-json-y-en-yaml).

**Errores frecuentes al resolverlo:**

- Escribir el teléfono con espacios, `"612 345 678"`: no es un error, pero dificulta buscarlo y compararlo. Decide un formato y úsalo en todas las reservas.
- Escribir `"noches": "2"`: la aplicación no podría multiplicar las noches por el precio.
- Poner `"comentario": ""` en la reserva de Carmen: dice «hay un comentario vacío», no «no hay comentario».
- Que cada reserva tenga claves distintas (`mascota` en una y `animales` en otra): la aplicación buscaría una clave que no existe.
- En el YAML, olvidar las comillas de las fechas: el fichero se lee, pero no es el mismo dato que el JSON.

</details>

## 6. Chuleta

### Conceptos clave

| Concepto | En una línea |
|---|---|
| **YAML 1.1 / 1.2** | La 1.1 lee `yes`, `no`, `on` y `off` como booleanos; la 1.2, solo `true` y `false` |
| **JSON with Comments** | Variante de JSON con comentarios que usa VS Code en su `settings.json` |

### JSON

```json
{
  "texto": "con comillas dobles",
  "numero": 12.5,
  "booleano": true,
  "nulo": null,
  "lista": ["a", "b"],
  "objeto": {"clave": "valor"},
  "vacios": [[], {}, ""]
}
```

Comillas dobles · coma entre elementos y ninguna tras el último · sin comentarios · punto decimal y sin ceros delante · `true`, `false` y `null` en minúsculas · un solo valor de primer nivel · UTF-8

### YAML

```yaml
# Comentario
clave: valor                # espacio tras los dos puntos
mapa:
  dentro: 1                 # sangría con ESPACIOS, nunca tabuladores
lista:
  - a
  - b
lista_de_mapas:
  - nombre: Ana
    edad: 34                # alineada con nombre, no con el guion
en_linea: [a, b]
vacios: []
texto_largo: |              # | conserva los saltos de línea; > los junta
  línea 1
  línea 2
seguro: "NO"                # comillas: NO, yes, on, off, 01001, 1.10, 12:30, #color, fechas
---
otro_documento: true
```

### En VS Code

| Para | Qué hacer |
|---|---|
| Ver los errores | Panel **Problems**: <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>M</kbd> (macOS: <kbd>Cmd</kbd>+<kbd>Mayús</kbd>+<kbd>M</kbd>); <kbd>F8</kbd>, el siguiente |
| Dar formato a un JSON | **Format Document**: <kbd>Mayús</kbd>+<kbd>Alt</kbd>+<kbd>F</kbd> (Windows), <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>I</kbd> (Linux), <kbd>Mayús</kbd>+<kbd>Opción</kbd>+<kbd>F</kbd> (macOS) |
| Comprobar un YAML | Extensión **YAML** de Red Hat (de serie, solo colores) |
| Ver espacios y tabuladores | **View > Appearance > Render Whitespace** |

### Cuál elegir

| Para | Formato |
|---|---|
| Intercambiar datos entre programas, API | JSON |
| Configuración escrita y comentada por personas | YAML |
| Lo que pida la herramienta | Lo que pida la herramienta |
| Tablas | CSV ([04.04](04-xml-csv-y-otros.md)) |

## 7. Preguntas de repaso

1. ¿Para qué sirve un formato de datos? Pon un ejemplo de cada uso de JSON y YAML.

   <details>
   <summary>Ver respuesta</summary>

   Para escribir datos como texto con unas reglas que conozcan quien escribe y quien lee, de modo que un programa pueda leer lo que escribió otro (o él mismo, más tarde). Los usos: intercambiar datos entre programas (la respuesta de una API, en JSON), configurar un programa (`compose.yaml`, en YAML) y guardar datos en un fichero (las reservas de una casa rural). Lo tienes en [1.1. Datos con estructura: para qué sirven los formatos](#11-datos-con-estructura-para-qué-sirven-los-formatos).

   </details>

2. ¿Cuáles son los seis tipos de valores de JSON?

   <details>
   <summary>Ver respuesta</summary>

   Texto (entre comillas dobles), número (con punto decimal), booleano (`true` o `false`), nulo (`null`), objeto (pares clave-valor entre llaves) y lista (valores entre corchetes). Lo tienes en [1.4. Los seis tipos de valores de JSON](#14-los-seis-tipos-de-valores-de-json).

   </details>

3. Di cuatro reglas de JSON que no se cumplen en los objetos de JavaScript o que se olvidan a menudo.

   <details>
   <summary>Ver respuesta</summary>

   Claves y textos siempre entre comillas dobles; ninguna coma después del último elemento; sin comentarios; números con punto decimal y sin ceros delante; `true`, `false` y `null` en minúsculas. Lo tienes en [1.6. Las reglas estrictas de JSON](#16-las-reglas-estrictas-de-json).

   </details>

4. ¿Importa el orden de las claves de un objeto? ¿Y el de los elementos de una lista? ¿Y los espacios?

   <details>
   <summary>Ver respuesta</summary>

   El de las claves no, porque cada valor se busca por su clave. El de la lista sí, porque cada elemento se busca por su posición. Los espacios y los saltos de línea entre los elementos de un JSON no cuentan: un JSON compacto y uno formateado son el mismo dato. Lo tienes en [1.7. Los espacios y el orden](#17-los-espacios-y-el-orden).

   </details>

5. ¿Qué comprueba VS Code de serie en un JSON y en un YAML?

   <details>
   <summary>Ver respuesta</summary>

   En un JSON, todo: marca los errores con una línea roja y los reúne en el panel **Problems**. En un YAML, de serie, solo pone colores; para que compruebe los errores hace falta una extensión, como la de YAML de Red Hat. Lo tienes en [1.8. Comprobar un JSON en VS Code](#18-comprobar-un-json-en-vs-code) y [1.14. Comprobar un YAML en VS Code](#114-comprobar-un-yaml-en-vs-code).

   </details>

6. En YAML, ¿qué marca qué va dentro de qué? ¿Qué no se puede usar para eso?

   <details>
   <summary>Ver respuesta</summary>

   La sangría: lo que va más adentro, en las líneas de debajo de una clave, está dentro de ella; todas las claves de un mismo mapa empiezan en la misma columna. Se sangra con espacios, nunca con tabuladores. Lo tienes en [1.10. Mapas, listas y sangría](#110-mapas-listas-y-sangría).

   </details>

7. ¿Qué es «el problema de Noruega» y cómo se evita?

   <details>
   <summary>Ver respuesta</summary>

   Que en YAML 1.1, `pais: NO` se lee como el booleano `false`, porque `yes`, `no`, `on` y `off` son booleanos en esa versión (en la 1.2, solo `true` y `false`). No da ningún error. Se evita poniendo entre comillas los textos que puedan parecer otra cosa: `pais: "NO"`. Lo tienes en [1.12. Los tipos que adivina YAML: las versiones 1.1 y 1.2](#112-los-tipos-que-adivina-yaml-las-versiones-11-y-12).

   </details>

8. ¿Para qué sirve `---` en un fichero YAML? ¿Existe algo así en JSON?

   <details>
   <summary>Ver respuesta</summary>

   Separa varios documentos dentro del mismo fichero: cada uno es un dato completo. En JSON no existe: un fichero JSON es un solo valor, y si hacen falta varios, van dentro de una lista. Lo tienes en [1.13. Varios documentos en un fichero](#113-varios-documentos-en-un-fichero).

   </details>

9. Tienes que elegir formato para la configuración de una herramienta que mantendrá tu equipo a mano, y para los datos que tu programa manda a otro. ¿Cuál eliges para cada cosa y por qué?

   <details>
   <summary>Ver respuesta</summary>

   YAML para la configuración, porque la escriben personas, se lee bien y admite comentarios para explicar cada valor; JSON para los datos entre programas, porque es estricto, todos los lenguajes lo leen igual y no adivina tipos. Si la herramienta pide uno concreto, ese. Lo tienes en [1.15. El mismo dato en JSON y en YAML](#115-el-mismo-dato-en-json-y-en-yaml).

   </details>

---
⬅️ [Anterior: Markdown](02-markdown.md) · 📚 [Índice](../00-indice.md) · ➡️ [Siguiente: XML, CSV y otros](04-xml-csv-y-otros.md)
