# 07.03 Buscar ayuda

> **Versiones:** ayuda de Google, Bing y DuckDuckGo, documentación de Git y de GitHub y centro de ayuda de Stack Overflow, consultados el 16 de noviembre de 2026; salidas de la terminal del curso (GNU coreutils 9.7, bash 5.3)
> **Conviene saber antes:** [03.01 La terminal: lo básico, 1.12](../fase-03-herramientas/01-terminal-lo-basico.md#112-pedir-ayuda---help-y-man) · [03.04 Errores y depuración, 1.13](../fase-03-herramientas/04-errores-y-depuracion.md#113-buscar-ayuda-internet-y-la-ia) · [05.03 GitHub, 1.11](../fase-05-git-y-github/03-github.md#111-issues-y-tableros) · [06.06 Qué es la IA y cómo funciona por dentro](../fase-06-internet-y-aplicaciones/06-que-es-la-ia.md)
> **Tiempo estimado:** 1 hora
> **Nivel:** Básico · Núcleo

## Qué aprenderás

- En qué **orden** conviene buscar ayuda, de lo más cercano y fiable a lo más lejano.
- Qué es la **documentación oficial** y sus tres piezas: **tutorial**, **guía** y **referencia**.
- A comprobar que lo que lees es **de tu versión**.
- A **buscar mejor** con los operadores de los buscadores: comillas, `-`, `site:`, `filetype:`…
- Dónde se pregunta: **foros**, ***issues*** y **Discussions** de un proyecto.
- A hacer **una buena pregunta**: título, contexto, **ejemplo mínimo que reproduce el fallo**, qué esperas y qué obtienes, qué has probado, versiones y **nada privado**.
- A usar la **IA** como una fuente más, con las mismas reglas.

## 1. Teoría

### 1.1. Saber buscar es parte del oficio

Nadie que programe se lo sabe todo. Lo que distingue a quien lleva años no es la memoria, sino **saber dónde mirar, qué preguntar y de qué fiarse**. Ya has dado los primeros pasos: la ayuda de la terminal ([03.01, 1.12](../fase-03-herramientas/01-terminal-lo-basico.md#112-pedir-ayuda---help-y-man)) y cómo buscar un mensaje de error copiándolo entre comillas ([03.04, 1.13](../fase-03-herramientas/04-errores-y-depuracion.md#113-buscar-ayuda-internet-y-la-ia)). Este módulo completa el método.

Un orden que funciona casi siempre, de lo más cercano a lo más lejano:

```mermaid
flowchart TD
    A["1. Lee el mensaje y aísla el problema"] --> B["2. La ayuda de la terminal: --help y man"]
    B --> C["3. La documentación oficial"]
    C --> D["4. Un buscador, con operadores"]
    D --> E["5. Preguntar: foro, issue o Discussions"]
    IA["La IA: en cualquier paso, y se comprueba"] -.-> C
```

En palabras: primero, tu propio razonamiento ([03.04](../fase-03-herramientas/04-errores-y-depuracion.md#12-un-método-para-depurar)); después, la ayuda que trae la herramienta; luego, su documentación oficial; si no basta, un buscador; y, al final, preguntar a otras personas. La IA puede ayudarte en cualquier paso, pero lo que te diga lo compruebas en la documentación oficial ([apartado 1.10](#110-la-ia-una-fuente-más)).

¿Por qué preguntar lo último? Porque es lo más lento (alguien tiene que leerte y contestar) y porque, si lo haces después de buscar, tu pregunta será mucho mejor.

### 1.2. La documentación oficial

La **documentación oficial** es la que publica **quien hace la herramienta**: el proyecto Git documenta Git; GitHub, GitHub. Es la fuente más fiable por tres motivos:

- **Es exacta**: dice lo que hace la herramienta, no lo que alguien recuerda.
- **Es de una versión concreta**, y lo dice ([apartado 1.4](#14-de-qué-versión-es-lo-que-lees)).
- **Avisa de lo raro**: casos especiales, opciones que se van a retirar, diferencias entre sistemas.

Se reconoce como la [web oficial](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#13-descarga-siempre-de-la-web-oficial) de la que descargas un programa: por su **dominio**. La de Git está en `git-scm.com/docs` y la de GitHub en `docs.github.com` (que tiene versión en español, `docs.github.com/es`). Un blog que copia esa documentación no es la documentación: puede estar desfasado o mal copiado.

> **📌 Nota:** casi toda la documentación oficial está **en inglés**, y alguna tiene traducciones. Si una página traducida y la original no dicen lo mismo, manda la original: la traducción suele ir por detrás.

### 1.3. Tutorial, guía y referencia

La documentación de un proyecto grande no es un único texto. Suele tener piezas distintas para necesidades distintas. Una forma muy conocida de ordenarlas, la de **Diátaxis** (`diataxis.fr`, a 16 de noviembre de 2026), distingue cuatro: **tutoriales**, **guías prácticas**, **referencia técnica** y **explicación**. Las tres primeras son las que más usarás:

| Pieza | Para qué | Cuándo la lees | En Git (a 16 de noviembre de 2026) |
|---|---|---|---|
| **Tutorial** | Aprender desde cero, paso a paso, con un ejemplo que te lleva de la mano | Cuando empiezas con una herramienta | En `git-scm.com/docs`, apartado **Guides**, el enlace **Tutorial** |
| **Guía** | Resolver una tarea concreta o entender un tema | Cuando sabes lo que quieres hacer, pero no cómo | El libro *Pro Git*, en `git-scm.com/book`, también en español (`git-scm.com/book/es/v2`) |
| **Referencia** | Describir **todo**: cada orden, cada opción, cada valor | Cuando necesitas un dato exacto: «¿qué hace esta opción?» | La página de cada orden en `git-scm.com/docs` (por ejemplo, `git-scm.com/docs/git-switch`); es el mismo manual que abre `git help switch` |

La **explicación** cuenta el porqué de las cosas (por qué Git guarda instantáneas y no diferencias, por ejemplo); en muchos proyectos está repartida por las guías.

La idea práctica: **no leas la referencia para aprender** (es un diccionario, no un libro) **ni un tutorial para buscar un dato** (tardarías mucho en encontrarlo).

**Cómo se lee una página de referencia.** Ya conoces su forma: es la de las páginas del manual de [03.01](../fase-03-herramientas/01-terminal-lo-basico.md#112-pedir-ayuda---help-y-man), con nombre, sinopsis, descripción y opciones, y muchas veces un apartado de ejemplos (*EXAMPLES*). Tres trucos: busca dentro de la página con <kbd>Ctrl</kbd>+<kbd>F</kbd> (en macOS, <kbd>Cmd</kbd>+<kbd>F</kbd>) la palabra que te interesa; mira **primero los ejemplos**, si los hay; y lee la descripción **entera** de la opción, no solo su nombre.

### 1.4. De qué versión es lo que lees

Las herramientas cambian: aparecen opciones nuevas y otras se retiran. Lo que vale para una versión puede no valer para la tuya. Por eso, antes de fiarte de una página, compara **dos versiones**:

1. **La tuya**, con `--version` (lo verás en el [ejemplo 2.1](#21-las-versiones-de-tus-herramientas)).
2. **La de lo que lees.** La documentación oficial lo suele decir. En la referencia de Git, cada página tiene arriba un selector con **Latest version** y la versión en la que cambió esa página por última vez; por ejemplo, la de `git switch` decía «last updated in 2.55.0» el 16 de noviembre de 2026, con la lista de versiones anteriores para consultar cualquiera de ellas. Y la propia página recuerda: «Check your version of git by running `git --version`».

Ya sabes leer un número de versión ([05.02, 1.15](../fase-05-git-y-github/02-ramas-y-conflictos.md#115-etiquetas-y-versionado-semántico)): si solo cambia el último número, casi nada debería romperse; si cambia el primero, cuidado.

Fuera de la documentación oficial, mira la **fecha** de cada respuesta, artículo o vídeo. Una respuesta de hace diez años puede ser perfecta… o hablar de una opción que ya no existe. Desconfía de los tutoriales **sin fecha** y sin versión.

### 1.5. Buscar mejor: los operadores

Un **operador de búsqueda** es una marca que le das al buscador para afinar lo que busca. Cada buscador tiene los suyos y los documenta en su ayuda. Estos son los que comparten los tres más usados, comprobados en su ayuda oficial el 16 de noviembre de 2026:

| Qué quieres | Cómo se escribe | Google | Bing | DuckDuckGo |
|---|---|---|---|---|
| Una frase **exacta** | `"carpeta de trabajo"` | Sí | Sí | Sí |
| **Quitar** una palabra | `jaguar -coche` | Sí | Sí | Sí |
| Solo **un sitio** | `site:git-scm.com rebase` | Sí | Sí | Sí |
| Solo **un tipo de fichero** | `filetype:pdf markdown` | Sí | Sí | Sí (`pdf`, `doc(x)`, `xls(x)`, `ppt(x)` y `html`) |
| Páginas **actualizadas antes o después** de una fecha | `git switch after:2025` | Sí: `before:` y `after:`, con un año o una fecha (`2025/11/01`) | No lo documenta | No lo documenta |

Las ayudas: Google, «Acotar las búsquedas de Google» (`support.google.com/websearch/answer/2466433`); Bing, «Advanced search options» y «Advanced search keywords» (en `support.microsoft.com`); DuckDuckGo, «How to use advanced syntax on DuckDuckGo Search» (en `duckduckgo.com/duckduckgo-help-pages`).

Dos reglas que dicen Google y Bing: **sin espacio después de los dos puntos** (`site:git-scm.com`, no `site: git-scm.com`), y se pueden **combinar**: `site:git-scm.com "detached HEAD"` busca esa frase exacta solo en la web de Git. Y una de DuckDuckGo que vale para quitar un sitio que no te interesa: `-site:example.com`.

> **📌 Nota:** los buscadores cambian sus operadores cuando quieren. Si uno no hace lo que esperas, mira la ayuda de tu buscador **ese día**.

Con los operadores, las ideas de [03.04](../fase-03-herramientas/04-errores-y-depuracion.md#113-buscar-ayuda-internet-y-la-ia) (el mensaje exacto entre comillas, sin lo que es solo tuyo, el nombre de la herramienta, probar en inglés) se vuelven más precisas: por ejemplo, `site:git-scm.com` te deja solo con la documentación oficial.

### 1.6. Juzgar lo que encuentras

Encontrar una respuesta no es lo mismo que encontrar **la buena**. Antes de usarla:

- **¿De quién es?** La documentación oficial, primero. Un foro con respuestas votadas, después. Un blog sin autor ni fecha, con cuidado.
- **¿De cuándo y de qué versión?** ([apartado 1.4](#14-de-qué-versión-es-lo-que-lees)).
- **¿Es tu mismo problema?** Un mensaje parecido puede tener otra causa. Compara tu sistema, tu herramienta y lo que estabas haciendo.
- **¿La entiendes?** No copies en tu terminal una orden que no entiendes, y menos si lleva `sudo` ([03.02, 1.11](../fase-03-herramientas/02-terminal-sacarle-partido.md#111-administrador-sudo-y-cuándo-no-usarlo)) o borra cosas. Búscala antes en la referencia oficial.
- **¿Funciona en tu caso?** Pruébala con tus [casos de prueba](../fase-01-que-es-programar/03-probar-un-programa.md#13-el-caso-de-prueba), no solo con el que te fallaba.

### 1.7. Dónde se pregunta

Si nada de lo anterior te da la respuesta, toca preguntar. Hay tres sitios habituales:

- **Foros de preguntas y respuestas.** El más conocido es **Stack Overflow** (`stackoverflow.com`). Según su centro de ayuda (a 16 de noviembre de 2026), solo admite preguntas sobre programación y desarrollo de software **escritas en inglés**, y pide buscar antes por si ya está respondida. Existe también **Stack Overflow en español** (`es.stackoverflow.com`). Las respuestas se votan, y quien pregunta puede **aceptar** la que le ha servido. Ojo: según el mismo centro de ayuda, aceptada solo quiere decir que **a esa persona le funcionó**, no que sea la mejor (puede llegar después otra mejor).
- **Las *issues* de un proyecto.** Las [*issues*](../fase-05-git-y-github/03-github.md#111-issues-y-tableros) son la lista de fallos y tareas de un proyecto. Ábrelas para avisar de **un fallo del propio proyecto** («la opción X hace Y, y la documentación dice Z»), no para dudas de cómo usarlo. Antes de abrir una, busca si ya existe, **también entre las cerradas**: en la pestaña **Issues**, la caja de búsqueda admite filtros como `is:issue is:closed sort` o `in:title error` (según la documentación de GitHub, a 16 de noviembre de 2026). Lee antes su `CONTRIBUTING.md`, si lo tiene ([05.03, 1.12](../fase-05-git-y-github/03-github.md#112-forks-contribuir-a-proyectos-ajenos)): ahí dice cómo quiere que se le avise. Muchos proyectos dan además una plantilla para rellenar (las verás en [07.02, apartado 1.7](02-organizar-tu-trabajo.md#17-plantillas-de-issue)).
- **Las Discussions de un proyecto.** Es la pestaña **Discussions** de un repositorio de GitHub. Según su documentación (a 16 de noviembre de 2026), sirven para hacer y responder preguntas, compartir información, hacer anuncios y conversar sobre el proyecto, y en las categorías de preguntas y respuestas se puede **marcar un comentario como la respuesta**. Es el sitio para las dudas de uso de un proyecto, cuando las tiene: no todos los repositorios muestran esa pestaña.

> **💡 Consejo:** si no sabes si algo es un fallo del proyecto o un error tuyo, **pregunta primero** (en Discussions o en un foro). Si resulta ser un fallo, entonces se abre la *issue*.

### 1.8. Cómo hacer una buena pregunta

Quien te contesta en un foro lo hace por ayudar, con su tiempo, y no ve tu pantalla. Una buena pregunta le da todo lo necesario para ayudarte **sin tener que preguntarte nada**. Tiene estas partes:

1. **Un título que resume el problema concreto.** No «Ayuda con bash», sino «sort -r no ordena bien los números de dos cifras». El centro de ayuda de Stack Overflow propone imaginar que se lo cuentas en una frase a un compañero con prisa.
2. **El contexto**: qué intentas conseguir, en pocas líneas. A veces la respuesta es «eso se hace de otra forma».
3. **Un ejemplo mínimo que reproduce el fallo** ([apartado 1.9](#19-el-ejemplo-mínimo-que-reproduce-el-fallo)), **como texto**, no como captura de pantalla: el texto se puede copiar, probar y buscar, y la captura no.
4. **Qué esperas y qué obtienes**, como en tus [casos de prueba](../fase-01-que-es-programar/03-probar-un-programa.md#13-el-caso-de-prueba). «No funciona» no dice nada; «espero `10` y después `9`, y obtengo `9` y después `10`» lo dice todo. Si hay mensaje de error, **copiado entero y exacto**.
5. **Qué has probado ya** y qué ha pasado. Ahorra respuestas que ya conoces y demuestra que has buscado.
6. **Las versiones y el sistema**: de la herramienta, de la terminal y del sistema operativo ([ejemplo 2.1](#21-las-versiones-de-tus-herramientas)).
7. **Nada privado.** Ni contraseñas, ni claves, ni [*tokens*](../fase-05-git-y-github/03-github.md#14-cómo-sabe-github-que-eres-tú-https), ni datos de otras personas (nombres, teléfonos, correos de clientes), ni nombres internos de tu empresa. Un foro es **público** y lo que publicas se queda.

Como lo vas a escribir en Markdown (los foros y GitHub lo usan), los bloques de código y las tablas de [04.02](../fase-04-formatos-y-diagramas/02-markdown.md) te sirven tal cual. Lo verás entero en el [ejemplo 2.3](#23-una-buena-pregunta-en-markdown).

### 1.9. El ejemplo mínimo que reproduce el fallo

Es la parte más importante de una pregunta. Stack Overflow lo llama ***minimal, reproducible example*** y le pide tres cosas (según su centro de ayuda, a 16 de noviembre de 2026):

- **Mínimo**: lo más pequeño posible que **siga dando el mismo fallo**. Nadie va a leer tus 200 líneas.
- **Completo**: con todo lo que otra persona necesita para ver el fallo, **en la propia pregunta**.
- **Reproducible**: **pruébalo antes** de publicarlo y comprueba que de verdad falla.

Para llegar a él hay dos caminos, los dos ya conocidos: **empezar de cero** con solo lo imprescindible, o **quitar trozos** del original, uno a uno o [por mitades](../fase-03-herramientas/04-errores-y-depuracion.md#15-aislar-el-problema-dividir-a-la-mitad), hasta que el fallo desaparece (y entonces devuelves el último trozo). Es [reproducir el error](../fase-03-herramientas/04-errores-y-depuracion.md#13-reproducir-el-error) y aislarlo, como en 03.04, pero pensando en otra persona. Cambia también los datos reales por otros inventados: así el ejemplo es más corto **y** no lleva nada privado.

**El premio escondido:** muchas veces, al preparar el ejemplo mínimo, **ves tú la solución** y ya no hace falta preguntar.

### 1.10. La IA: una fuente más

Un asistente de IA es una fuente más, y sirve en cualquier paso del [apartado 1.1](#11-saber-buscar-es-parte-del-oficio): para que te explique un mensaje, te diga qué opción podría servirte o te traduzca una página de referencia. Las reglas son las de un foro: se le pregunta igual de bien (con las partes del [apartado 1.8](#18-cómo-hacer-una-buena-pregunta)), sin nada privado ([06.06, 1.12](../fase-06-internet-y-aplicaciones/06-que-es-la-ia.md#112-privacidad-lo-que-escribes-sale-de-tu-ordenador)), y lo que te diga **se comprueba** en la referencia oficial de tu versión, porque puede inventarse una opción con total seguridad (una [alucinación](../fase-06-internet-y-aplicaciones/06-que-es-la-ia.md#19-las-alucinaciones)).

Cómo pedirle bien las cosas y cómo comprobar lo que te da lo verás en [07.04, apartados 1.5](04-programar-con-asistentes-de-ia.md#15-pedir-bien) y [1.7](04-programar-con-asistentes-de-ia.md#17-comprobar-siempre-con-tus-casos-de-prueba).

## 2. Ejemplos de código

### 2.1. Las versiones de tus herramientas

**Situación real:** antes de preguntar, Elsa apunta las versiones de lo que usa: la herramienta (`sort`), la terminal (`bash`) y el sistema. Con `head -n 1` se queda solo con la primera línea, que es la que dice la versión.

**En tu terminal** (`sesion.txt`):

```text
$ sort --version | head -n 1
sort (GNU coreutils) 9.7
$ bash --version | head -n 1
GNU bash, versión 5.3.9(1)-release (x86_64-pc-linux-gnu)
$ uname -s
Linux
```

📁 **Código:** [`codigo/03-buscar-ayuda/ejemplos/2.1-las-versiones-de-tus-herramientas/`](codigo/03-buscar-ayuda/ejemplos/2.1-las-versiones-de-tus-herramientas/)

**En qué fijarte:**

- Casi todas las herramientas dicen su versión con `--version`. La de `sort` dice además **de qué paquete es** (GNU coreutils), que es lo que hay que buscar en su documentación.
- `uname -s` dice el nombre del sistema (en la terminal del curso, `Linux`). En Git Bash y en macOS dice otra cosa, la que corresponde a cada uno; añade además en tu pregunta qué sistema usas (por ejemplo, «Git Bash en Windows 11»).
- En **macOS**, las órdenes son de otra familia (las de BSD, [03.01, 1.12](../fase-03-herramientas/01-terminal-lo-basico.md#112-pedir-ayuda---help-y-man)), y alguna no entiende `--version`. Si se queja, dilo así en tu pregunta: «el `sort` que trae macOS» y la versión de macOS. Eso ya avisa a quien te lea de que no es el de GNU.

### 2.2. Del problema al ejemplo mínimo

**Situación real:** Elsa quiere la clasificación de más a menos puntos y prueba `sort -r`. El resultado no le cuadra.

**En tu terminal** (`sesion-original.txt`):

```text
$ sort -r puntos.txt
9 Rubén
7 Martina
15 Leandro
12 Elsa
10 Ciro
```

📁 **Código:** [`codigo/03-buscar-ayuda/ejemplos/2.2-del-problema-al-ejemplo-minimo/`](codigo/03-buscar-ayuda/ejemplos/2.2-del-problema-al-ejemplo-minimo/)

Leandro, con 15 puntos, debería ir el primero. Antes de preguntar, Elsa reduce el problema: ¿hacen falta los nombres? ¿Hacen falta cinco líneas? Quita todo lo que puede **mientras siga fallando**, y se queda con dos números:

**En tu terminal** (`sesion-minimo.txt`):

```text
$ printf '9\n10\n' | sort -r
9
10
```

📁 **Código:** [`codigo/03-buscar-ayuda/ejemplos/2.2-del-problema-al-ejemplo-minimo/`](codigo/03-buscar-ayuda/ejemplos/2.2-del-problema-al-ejemplo-minimo/)

Una línea, sin fichero y sin nombres de nadie, y el fallo sigue ahí: el `10` sale detrás del `9`. Con esto, cualquiera puede verlo en su terminal en un segundo. Y al verlo tan pelado, Elsa recuerda que `sort` compara **texto** si no le dices otra cosa: carácter a carácter, y el `9` va después del `1` con el que empieza `10`, igual que la «z» va después de la «a» (con `-r`, al revés). Para comparar como números está `-n` ([03.02, 1.6](../fase-03-herramientas/02-terminal-sacarle-partido.md#16-los-filtros-grep-sort-uniq-wc-cut-head-y-tail)):

**En tu terminal** (`sesion-arreglado.txt`):

```text
$ sort -rn puntos.txt
15 Leandro
12 Elsa
10 Ciro
9 Rubén
7 Martina
```

📁 **Código:** [`codigo/03-buscar-ayuda/ejemplos/2.2-del-problema-al-ejemplo-minimo/`](codigo/03-buscar-ayuda/ejemplos/2.2-del-problema-al-ejemplo-minimo/)

**En qué fijarte:** el ejemplo mínimo le ha dado la solución sin preguntar a nadie. Es lo que pasa muchas veces ([apartado 1.9](#19-el-ejemplo-mínimo-que-reproduce-el-fallo)).

### 2.3. Una buena pregunta en Markdown

**Situación real:** supón que a Elsa no se le hubiera ocurrido la solución. Esta sería su pregunta para un foro, escrita en Markdown con todas las partes del [apartado 1.8](#18-cómo-hacer-una-buena-pregunta).

````markdown
# sort -r no ordena bien los números de dos cifras

Llevo la clasificación de un club en un fichero de texto, una línea por
persona, con los puntos delante del nombre. Quiero ordenarla de más a
menos puntos con `sort -r`, pero los números de dos cifras salen detrás
de los de una.

## Ejemplo mínimo

```bash
printf '9\n10\n' | sort -r
```

## Qué espero y qué obtengo

| Espero | Obtengo |
|---|---|
| `10` y después `9` | `9` y después `10` |

No sale ningún mensaje de error: solo el orden equivocado.

## Qué he probado

- Sin `-r`, que ordena de menos a más: sale `10` y después `9`,
  también al revés.
- He leído `sort --help`, pero no sé qué opción es la que me falta.

## Versiones

- sort (GNU coreutils) 9.7
- GNU bash, versión 5.3.9(1)-release
- Linux
````

📁 **Código:** [`codigo/03-buscar-ayuda/ejemplos/2.3-una-buena-pregunta/`](codigo/03-buscar-ayuda/ejemplos/2.3-una-buena-pregunta/)

**En qué fijarte:**

- El **título** dice qué orden, qué opción y qué pasa. Alguien con el mismo problema la encontrará buscando.
- El ejemplo va en un **bloque de código**: se copia y se prueba tal cual.
- La tabla **espero / obtengo** deja claro el fallo sin explicaciones largas.
- No aparecen el fichero real ni los nombres de los socios: **no hacen falta** para ver el fallo, y son datos de otras personas.
- Si la publicara en Stack Overflow, tendría que estar en inglés ([apartado 1.7](#17-dónde-se-pregunta)); en Stack Overflow en español, así vale.

## 3. Errores típicos

### 3.1. Una captura de pantalla en lugar del texto

**Qué pasa:** pegas una foto de la pantalla con el código y el error. Te piden que lo pegues como texto, o te ignoran.

**Por qué ocurre:** una imagen no se puede copiar para probarla, ni buscar, y a veces ni leer. El centro de ayuda de Stack Overflow pide expresamente **no** publicar imágenes del código, los datos ni los mensajes de error (a 16 de noviembre de 2026).

**Cómo se arregla:** copia el texto de la terminal o del editor y ponlo en un bloque de código. La imagen, solo si el problema es algo que se ve (cómo se dibuja una página, por ejemplo).

### 3.2. Pegar datos privados

**Qué pasa:** para que se entienda, pegas el fichero entero: con los teléfonos de los socios, la contraseña de la base de datos o tu *token* de GitHub.

**Por qué ocurre:** con las prisas, no revisas lo que pegas.

**Cómo se arregla:** el ejemplo mínimo, con **datos inventados**. Si ya lo has publicado, borrarlo no basta: alguien puede haberlo copiado. Una contraseña o un *token* que se ha visto **se cambia o se anula ya**; lo verás en [07.05, apartado 1.15](05-seguridad-basica.md#115-si-se-escapa-un-secreto).

### 3.3. Una issue para una duda

**Qué pasa:** abres una *issue* en un proyecto para preguntar cómo se usa algo, y te la cierran.

**Por qué ocurre:** las *issues* son para fallos y tareas del proyecto, no para dudas de uso.

**Cómo se arregla:** pregunta en sus Discussions, si las tiene, o en un foro. Y antes de abrir una *issue* de verdad, busca también entre las cerradas ([apartado 1.7](#17-dónde-se-pregunta)).

## 4. Buenas prácticas

- **Sigue el orden**: tu razonamiento, la ayuda de la terminal, la documentación oficial, el buscador y, al final, preguntar.
- **Ten a mano la referencia oficial** de lo que más uses: en los favoritos del navegador.
- **Comprueba siempre las dos versiones**: la tuya y la de lo que lees.
- **Usa operadores**: comillas, `-` y `site:` resuelven casi todo.
- **Reduce el problema a un ejemplo mínimo** antes de preguntar: muchas veces te da la respuesta.
- **Pregunta como te gustaría que te preguntaran**: título concreto, ejemplo como texto, esperado y obtenido, qué has probado y versiones.
- **Nunca publiques nada privado**, ni en un foro ni en un chat de IA.
- **Cierra el círculo**: contesta a lo que te pidan, di qué te funcionó, marca la respuesta buena. Y si lo resuelves tú, escribe cómo: a la siguiente persona le servirá.

## 5. Ejercicios prácticos resueltos

> **💡 Consejo:** los ejercicios 1 a 3 son de razonar; el 4 se escribe en un fichero `.md` de tu editor, y el 5, en tu terminal. Intenta cada uno **antes** de abrir las pistas y la solución.

### 🟢 Básico

#### Ejercicio 1 · Tutorial, guía o referencia

Di qué pieza de la documentación ([apartado 1.3](#13-tutorial-guía-y-referencia)) leerías en cada caso:

1. Nunca has usado Git y quieres hacer tu primer repositorio siguiendo los pasos.
2. Quieres saber qué hace exactamente la opción `--force` de `git switch`.
3. Sabes usar Git y hoy necesitas, por primera vez, deshacer un commit que ya habías subido.
4. Una compañera te pregunta si `git restore` existe en la versión 2.20 de Git.

<details>
<summary>Pista 1</summary>

Pregúntate si buscas **aprender desde cero**, **resolver una tarea** o **un dato exacto**.

</details>

<details>
<summary>Ver solución</summary>

| # | Pieza | Por qué |
|---|---|---|
| 1 | **Tutorial** | Empiezas desde cero y quieres que te lleve de la mano |
| 2 | **Referencia** | Es un dato exacto de una opción: la página de `git switch` |
| 3 | **Guía** | Es una tarea concreta, y ya sabes lo básico. Un capítulo de *Pro Git* sobre deshacer cambios es justo eso |
| 4 | **Referencia**, de **esa versión** | La página de `git restore`, con su lista de versiones ([apartado 1.4](#14-de-qué-versión-es-lo-que-lees)) |

**Errores frecuentes al resolverlo:**

- Elegir la referencia en el caso 1: lo tiene todo, pero no enseña por dónde empezar.
- En el caso 4, buscar en un blog o preguntar a una IA: la respuesta está en la fuente oficial, y es un dato que se puede comprobar.

</details>

#### Ejercicio 2 · Escribe la búsqueda

Escribe la búsqueda para cada caso, con los operadores del [apartado 1.5](#15-buscar-mejor-los-operadores):

1. La frase exacta `detached HEAD`, solo en la web oficial de Git.
2. Cómo se escriben tablas en Markdown, pero sin resultados de Excel.
3. Una guía en PDF sobre Markdown.
4. En Google, páginas sobre `git switch` actualizadas desde 2025.

<details>
<summary>Pista 1</summary>

Comillas para la frase exacta, `site:` para un sitio, `-` para quitar, `filetype:` para el tipo de fichero y, en Google, `after:`. Sin espacio después de los dos puntos.

</details>

<details>
<summary>Ver solución</summary>

```text
site:git-scm.com "detached HEAD"
tablas markdown -excel
markdown guía filetype:pdf
"git switch" after:2025
```

1. `site:` y la frase entre comillas, combinados.
2. `-excel` quita las páginas que hablan de Excel.
3. `filetype:pdf` se queda solo con ficheros PDF (los tres buscadores lo documentan).
4. `after:` es de Google; Bing y DuckDuckGo no lo documentan (a 16 de noviembre de 2026). Las comillas evitan páginas que solo hablan de `switch` en general.

**Error frecuente al resolverlo:** escribir `site: git-scm.com`, con espacio: deja de ser un operador.

</details>

### 🟡 Intermedio

#### Ejercicio 3 · Sirve esta respuesta para tu versión

Tienes Git 2.56. Buscando cómo cambiar de rama, encuentras estas cuatro fuentes. Ordénalas de más a menos fiable para ti y di qué comprobarías en cada una:

- A. La página de `git switch` en `git-scm.com/docs`.
- B. Una respuesta de un foro, muy votada, de hace doce años, que usa `git checkout`.
- C. Un blog sin fecha ni autor que copia trozos de la documentación de Git.
- D. Lo que te dice un asistente de IA, que menciona una opción que no te suena.

<details>
<summary>Pista 1</summary>

Para cada una: ¿de quién es?, ¿de cuándo y de qué versión?, ¿se puede comprobar? ([apartados 1.4](#14-de-qué-versión-es-lo-que-lees) y [1.6](#16-juzgar-lo-que-encuentras)).

</details>

<details>
<summary>Ver solución</summary>

1. **A**: es la referencia oficial. Comprueba en su selector de versiones que la página vale para la tuya.
2. **B**: un foro con votos es útil, pero tiene doce años. `git checkout` sigue existiendo, aunque hoy hay órdenes más claras para cambiar de rama (la de A). Comprueba en la referencia que lo que propone vale en tu versión.
3. **D**: puede ayudarte a entender, pero esa opción que no te suena puede ser inventada (una alucinación). Búscala en A antes de usarla.
4. **C**: sin fecha, sin autor y copiando: no sabes de qué versión es ni si copió bien. Si dice algo útil, búscalo en A.

C y D pueden cambiar de sitio: lo importante es que **ninguna de las dos se usa sin comprobarla en A**.

**Error frecuente al resolverlo:** poner B la primera por los votos. Los votos dicen que **fue** útil, no que siga valiendo hoy.

</details>

### 🔴 Avanzado

#### Ejercicio 4 · Arregla la pregunta de Adrián

Adrián publica esto en un foro:

```text
AYUDA URGENTE!!! git no funciona

Hola, estoy desesperado, llevo toda la tarde. Hago lo que dice el
tutorial y me sale un error (adjunto captura). Estoy en
C:\Users\adrian.lopez\Reformas López SL\clientes y ahí he clonado
https://adrian-lopez:CAMBIAME@github.com/usuario/web-de-prueba.git
He probado de todo. Uso la última versión. ¿Alguien sabe?
```

La captura dice `fatal: no es un repositorio git (ni ninguno de los directorios superiores): .git` después de un `git status`. Ha probado a clonar otra vez en otra carpeta, y `ls`, después de clonar, le enseña una carpeta nueva, `web-de-prueba`. Usa Git Bash en Windows 11, y `git --version` le dice `git version 2.56.0.windows.4`.

1. Señala todo lo que está mal en la pregunta.
2. Escríbela bien, en un fichero `pregunta.md`.

<details>
<summary>Pista 1</summary>

Repasa las siete partes del [apartado 1.8](#18-cómo-hacer-una-buena-pregunta), una a una, y busca qué falta, qué sobra y qué **no debería estar ahí nunca**.

</details>

<details>
<summary>Ver solución</summary>

**1. Lo que está mal:**

- **El título** no dice nada: «git no funciona» le pasa a todo el mundo alguna vez. Las mayúsculas y las exclamaciones no ayudan.
- **El error, en una captura**: hay que copiarlo como texto ([error típico 3.1](#31-una-captura-de-pantalla-en-lugar-del-texto)).
- **Datos privados**: la ruta lleva su nombre y el de su empresa, y la dirección del repositorio **lleva una contraseña dentro** (lo que va entre `:` y `@`). Esa contraseña, aunque borre el mensaje, **hay que cambiarla ya** ([error típico 3.2](#32-pegar-datos-privados)).
- **«He probado de todo»** no dice qué. **«La última versión»** tampoco: hay que dar el número.
- **No dice qué órdenes ha escrito** ni qué esperaba.

**2. La pregunta, bien escrita:**

````markdown
# git status dice «no es un repositorio git» justo después de clonar

Acabo de clonar mi primer repositorio de GitHub con `git clone` y,
al hacer `git status`, Git dice que no es un repositorio.

## Qué hago, paso a paso

```bash
git clone https://github.com/usuario/web-de-prueba.git
git status
```

## Qué espero y qué obtengo

Espero que `git status` me diga en qué rama estoy. Obtengo esto:

```text
fatal: no es un repositorio git (ni ninguno de los directorios superiores): .git
```

## Qué he probado

- Clonarlo otra vez, en otra carpeta: pasa lo mismo.
- `ls` justo después de clonar: sale una carpeta nueva, `web-de-prueba`.

## Versiones

- git version 2.56.0.windows.4
- Git Bash, en Windows 11
````

📁 **Código:** [`codigo/03-buscar-ayuda/ejercicios/ej04-arregla-la-pregunta-de-adrian/`](codigo/03-buscar-ayuda/ejercicios/ej04-arregla-la-pregunta-de-adrian/)

**Por qué así:** el título cuenta el problema; los pasos permiten repetirlo; el error va como texto; lo probado lleva su resultado; y no queda nada privado (ni la ruta con su nombre y su empresa ni la contraseña). Y fíjate en el premio escondido del [apartado 1.9](#19-el-ejemplo-mínimo-que-reproduce-el-fallo): al escribir «sale una carpeta nueva», la respuesta está casi a la vista. `git clone` crea el repositorio **dentro** de esa carpeta nueva, y Adrián sigue en la de arriba: le falta un `cd web-de-prueba` antes del `git status`. Es el error típico 3.1 de [05.01](../fase-05-git-y-github/01-git-fundamentos.md#31-no-es-un-repositorio-git).

**Errores frecuentes al resolverlo:**

- Quitar la contraseña de la dirección y pensar que ya está: la contraseña **se ha publicado** y hay que cambiarla.
- Dejar «la última versión»: dentro de un año, nadie sabrá cuál era.

</details>

### 🏆 Caso real

#### Ejercicio 5 · La pregunta del club de ajedrez

Samuel apunta las jugadas de las partidas del Club de Ajedrez Enroque en un fichero, varias jugadas por línea, junto a los nombres y los teléfonos de quienes jugaron. Quiere saber cuántas veces se ha movido un peón en total, y `grep -c peón` le da menos de las que cuenta a mano. Ha buscado `grep -c "cuenta mal"` y lo que encuentra habla de otras cosas.

Prepara todo lo necesario para pedir ayuda en un foro:

1. Un **ejemplo mínimo** de una línea que reproduzca el fallo, probado en tu terminal.
2. Las **versiones** que pondrás en la pregunta.
3. Las partes de la pregunta, una línea por parte.
4. Cuando te contesten «usa `-o` y cuenta las líneas con `wc -l`», **compruébalo en la referencia** antes de usarlo, y pruébalo.

<details>
<summary>Pista 1</summary>

¿Qué hace falta para que `grep -c` cuente «de menos»? Una línea en la que la palabra salga **dos veces**. No hace falta el fichero de Samuel (y tiene teléfonos).

</details>

<details>
<summary>Pista 2</summary>

Para el paso 4: la referencia más cercana es `grep --help`. Puedes buscar en ella con otro `grep`, con `-e` delante de cada patrón que empieza por guion.

</details>

<details>
<summary>Ver solución</summary>

**1. El ejemplo mínimo.** Una línea con dos peones y otra sin ninguno:

**En tu terminal** (`sesion-minimo.txt`):

```text
$ printf 'peón e4 peón d4\ncaballo f3\n' | grep -c peón
1
```

📁 **Código:** [`codigo/03-buscar-ayuda/ejercicios/ej05-la-pregunta-del-club-de-ajedrez/`](codigo/03-buscar-ayuda/ejercicios/ej05-la-pregunta-del-club-de-ajedrez/)

Hay dos `peón` y dice `1`: el fallo se reproduce, sin el fichero y sin los teléfonos de nadie.

**2. Las versiones**, como en el [ejemplo 2.1](#21-las-versiones-de-tus-herramientas), pero de `grep`: `grep --version | head -n 1`, `bash --version | head -n 1` y `uname -s`. La primera línea de `grep --version` dice qué `grep` es y su número de versión; pon en la pregunta lo que te salga a ti.

**3. La pregunta**, con las partes del [apartado 1.8](#18-cómo-hacer-una-buena-pregunta), como la del [ejemplo 2.3](#23-una-buena-pregunta-en-markdown): de título, «grep -c cuenta 1 cuando la palabra aparece dos veces en la línea»; el contexto (cuenta palabras en un fichero de jugadas, con varias por línea); el ejemplo mínimo en un bloque de código; **espero** `2` y **obtengo** `1`, sin mensaje de error; lo que ha probado (con la palabra en dos líneas distintas sí cuenta 2, y la búsqueda `grep -c "cuenta mal"` solo trae otros problemas); las versiones del paso 2; y nada privado: ni el fichero, ni los nombres, ni los teléfonos.

**4. Comprobar la respuesta.** Antes de fiarse, Samuel mira las dos opciones en la referencia de su `grep`, y prueba la propuesta con su ejemplo mínimo:

**En tu terminal** (`sesion-respuesta.txt`):

```text
$ grep --help | grep -e '-c,' -e '-o,'
  -o, --only-matching       muestra solamente las partes no-vacías de líneas
  -c, --count               muestra solamente el total de líneas que coinciden
$ printf 'peón e4 peón d4\ncaballo f3\n' | grep -o peón | wc -l
2
```

📁 **Código:** [`codigo/03-buscar-ayuda/ejercicios/ej05-la-pregunta-del-club-de-ajedrez/`](codigo/03-buscar-ayuda/ejercicios/ej05-la-pregunta-del-club-de-ajedrez/)

La referencia lo explica todo: `-c` cuenta **líneas** que coinciden, no apariciones. `-o` escribe **cada aparición** en su propia línea, y `wc -l` las cuenta. Con su ejemplo da `2`, lo esperado. Ahora sí, Samuel lo usa con su fichero.

**Lo importante:** el ejemplo mínimo y la referencia **te dan a ti la respuesta** o te permiten comprobar la que te den. Y si la respuesta te la hubiera dado una IA, el paso 4 sería exactamente el mismo.

**Errores frecuentes al resolverlo:**

- Pegar el fichero de Samuel «para que se entienda mejor»: lleva teléfonos de otras personas y no aporta nada al fallo.
- Escribir `grep --help | grep -c,`: el patrón empieza por guion y `grep` lo toma por una opción. Por eso va `-e` delante.

</details>

## 6. Chuleta

### Operadores (a 16 de noviembre de 2026)

| Operador | Para qué | Dónde |
|---|---|---|
| `"frase exacta"` | Esa frase, tal cual | Google, Bing y DuckDuckGo |
| `-palabra` | Quitarla | Los tres |
| `site:dominio` | Solo ese sitio | Los tres |
| `filetype:pdf` | Solo ese tipo de fichero | Los tres |
| `before:` / `after:` | Actualizadas antes o después de una fecha | Google |

Sin espacio después de los dos puntos.

### Una buena pregunta

1. Título que resume el problema concreto.
2. Contexto: qué intentas.
3. Ejemplo mínimo, completo y reproducible, como texto.
4. Qué esperas y qué obtienes; el mensaje de error exacto.
5. Qué has probado.
6. Versiones y sistema (`--version`, `uname -s`).
7. Nada privado.

### Dónde preguntar

| Sitio | Para qué |
|---|---|
| *Issues* | Fallos del proyecto (busca antes, también en las cerradas) |
| Discussions | Dudas e ideas sobre el proyecto |
| Foro (Stack Overflow, en inglés; Stack Overflow en español) | Dudas que no son de un proyecto concreto |

## 7. Preguntas de repaso

1. ¿En qué orden conviene buscar ayuda, y por qué preguntar a otras personas va al final?

   <details>
   <summary>Ver respuesta</summary>

   Tu razonamiento y el mensaje; la ayuda de la terminal; la documentación oficial; un buscador; y, por último, preguntar. Preguntar va al final porque es lo más lento y porque, después de buscar, tu pregunta será mucho mejor. Lo tienes en [1.1. Saber buscar es parte del oficio](#11-saber-buscar-es-parte-del-oficio).

   </details>

2. ¿Qué diferencia hay entre un tutorial, una guía y una referencia?

   <details>
   <summary>Ver respuesta</summary>

   El tutorial enseña desde cero, paso a paso; la guía resuelve una tarea concreta; la referencia describe todo con exactitud, para buscar un dato. Lo tienes en [1.3. Tutorial, guía y referencia](#13-tutorial-guía-y-referencia).

   </details>

3. ¿Qué dos versiones compruebas antes de fiarte de una página?

   <details>
   <summary>Ver respuesta</summary>

   La de tu herramienta (con `--version`) y la de la página que lees (la documentación oficial lo suele decir; fuera de ella, mira la fecha). Lo tienes en [1.4. De qué versión es lo que lees](#14-de-qué-versión-es-lo-que-lees).

   </details>

4. ¿Qué hace `site:git-scm.com "detached HEAD"`? ¿Qué pasa si escribes `site: git-scm.com`?

   <details>
   <summary>Ver respuesta</summary>

   Busca la frase exacta «detached HEAD» solo en la web oficial de Git. Con un espacio después de los dos puntos, `site:` deja de funcionar como operador. Lo tienes en [1.5. Buscar mejor: los operadores](#15-buscar-mejor-los-operadores).

   </details>

5. ¿Cuándo abres una *issue* en un proyecto y cuándo preguntas en sus Discussions?

   <details>
   <summary>Ver respuesta</summary>

   La *issue*, para avisar de un fallo del propio proyecto, después de buscar si ya existe (también entre las cerradas). Las Discussions, para dudas de uso e ideas. Si no sabes si es un fallo, pregunta primero. Lo tienes en [1.7. Dónde se pregunta](#17-dónde-se-pregunta).

   </details>

6. ¿Qué tres cosas pide un ejemplo mínimo y reproducible?

   <details>
   <summary>Ver respuesta</summary>

   Que sea mínimo (lo más pequeño que siga fallando), completo (con todo lo necesario para ver el fallo, en la propia pregunta) y reproducible (probado antes de publicarlo). Lo tienes en [1.9. El ejemplo mínimo que reproduce el fallo](#19-el-ejemplo-mínimo-que-reproduce-el-fallo).

   </details>

7. Has pegado sin querer una contraseña en un foro y la borras a los dos minutos. ¿Ya está?

   <details>
   <summary>Ver respuesta</summary>

   No: alguien puede haberla copiado. Hay que cambiarla ya. Y la próxima vez, ejemplo mínimo con datos inventados. Lo tienes en [3.2. Pegar datos privados](#32-pegar-datos-privados).

   </details>

8. ¿Qué haces con una opción que te propone un asistente de IA y que no conoces?

   <details>
   <summary>Ver respuesta</summary>

   Buscarla en la referencia oficial de tu versión y probarla con tus casos antes de usarla: puede ser inventada. Lo tienes en [1.10. La IA: una fuente más](#110-la-ia-una-fuente-más).

   </details>

---
⬅️ [Anterior: Organizar tu trabajo](02-organizar-tu-trabajo.md) · 📚 [Índice](../00-indice.md) · ➡️ [Siguiente: Programar con asistentes de IA](04-programar-con-asistentes-de-ia.md)
