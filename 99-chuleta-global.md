# Chuleta global

> Todas las chuletas de los módulos del curso, reunidas en un solo fichero para consultarlas rápido.
> Se genera con `generar_chuleta_global.py` del kit de cursos: no lo edites a mano.

📚 [Índice del curso](00-indice.md) · 🏠 [Portada](README.md)

## Contenido

- **Fase 01 — Qué es programar**
  - [01.01 Qué es programar](#0101-qué-es-programar)
  - [01.02 Algoritmos y pseudocódigo](#0102-algoritmos-y-pseudocódigo)
  - [01.03 ¿Cómo sé que funciona? Probar un programa](#0103-cómo-sé-que-funciona-probar-un-programa)
  - [01.04 Paradigmas de programación](#0104-paradigmas-de-programación)
- **Fase 02 — Tu ordenador por dentro**
  - [02.01 Cómo funciona un ordenador](#0201-cómo-funciona-un-ordenador)
  - [02.02 Archivos, carpetas y rutas](#0202-archivos-carpetas-y-rutas)
  - [02.03 Instalar programas, variables de entorno y PATH](#0203-instalar-programas-variables-de-entorno-y-path)
- **Fase 03 — Herramientas del programador**
  - [03.01 La terminal: lo básico](#0301-la-terminal-lo-básico)

---

## Fase 01 — Qué es programar

---

### 01.01 Qué es programar

📖 Módulo completo: [fase-01-que-es-programar/01-que-es-programar.md](fase-01-que-es-programar/01-que-es-programar.md)

#### Conceptos clave

| Concepto | Definición en una línea |
|---|---|
| **Programar** | Escribir instrucciones precisas para que un ordenador resuelva un problema |
| **Entrada / proceso / salida** | Los datos que recibe un programa, lo que hace con ellos y el resultado que entrega |
| **Algoritmo** | Secuencia ordenada, finita y precisa de pasos que resuelve un problema; no depende del lenguaje |
| **Programa** | Un algoritmo escrito en un lenguaje de programación |
| **Código fuente** | El texto del programa que escribe una persona |
| **Ejecutar** | Poner en marcha un programa para que el ordenador siga sus instrucciones |
| **Código máquina** | Instrucciones en binario, las únicas que entiende el procesador |
| **Lenguaje de alto nivel** | Lenguaje pensado para personas, que oculta los detalles de la máquina |
| **Compilador** | Programa que traduce el código fuente entero antes de ejecutarlo |
| **Intérprete** | Programa que lee y ejecuta el código instrucción a instrucción, en el momento |
| **Máquina virtual** | Programa que ejecuta un código intermedio ya compilado (así funcionan Java y C#) |

#### Compilado frente a interpretado

| | Compilado | Interpretado |
|---|---|---|
| Traducción | Una vez, antes de ejecutar | En cada ejecución |
| Errores de escritura | Antes de ejecutar | Al llegar a la línea |
| Probar un cambio | Hay que compilar primero | Al instante |
| Dónde funciona | Hay que compilar para cada sistema | Donde haya intérprete |
| Ejemplos | C, C++, Rust, Go | Python, JavaScript, Ruby, PHP |

Mixtos: Java y C# compilan a un código intermedio que ejecuta una máquina virtual.

#### Tres tipos de errores

| Tipo | Síntoma | Quién lo detecta |
|---|---|---|
| De escritura (sintaxis) | El código no sigue las reglas del lenguaje | El compilador, o el intérprete al llegar a la línea |
| De ejecución | El programa se para con un mensaje mientras funciona | Nadie, hasta que ocurre |
| De lógica | El programa termina, pero el resultado está mal | Solo tus casos de prueba |

#### Cómo leer un mensaje de error

1. **Dónde:** fichero y línea (`CajasConError.java:16`, `line 14`).
2. **Qué:** el tipo de error (`cannot find symbol`, `NameError`, `';' expected`).
3. **La marca** (`^`) señala el sitio exacto.
4. Si hay varios errores, arregla **el primero** y vuelve a probar.
5. Si en la línea indicada no ves nada, mira también la de arriba.

#### Antes de programar, pregúntate

1. ¿Qué datos tengo (**entrada**)?
2. ¿Qué tengo que obtener (**salida**)?
3. ¿Qué pasos me llevan de una a otra (**proceso**)?
4. ¿Qué pasa en los **casos límite**: cero, ninguno, el valor justo del límite?
5. ¿Qué **resultado espero** en cada caso, antes de ejecutar nada?

#### División entera y resto

| Operación | Ejemplo | Para qué sirve |
|---|---|---|
| División entera | 53 entre 12 = 4 | Cuántas veces cabe algo: cajas llenas, mesas completas |
| Resto | 53 entre 12, sobran 5 | Cuánto sobra: libros sueltos, personas sin mesa |
| Repartir redondeando hacia arriba | 4 llenas, y una más si sobra algo | Cajas, mesas, autobuses, páginas |

---

### 01.02 Algoritmos y pseudocódigo

📖 Módulo completo: [fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md](fase-01-que-es-programar/02-algoritmos-y-pseudocodigo.md)

#### Convenciones de pseudocódigo del curso

```text
ALGORITMO Nombre
    ENTRADA: ...
    SALIDA: ...

    CONSTANTE NOMBRE ← valor

INICIO
    LEER x
    x ← expresión
    ESCRIBIR "texto", x
FIN
```

| Elemento | Significado |
|---|---|
| `ALGORITMO`, `INICIO`, `FIN` | Nombre, principio y final del algoritmo |
| `ENTRADA` / `SALIDA` | Qué recibe y qué produce (y sus suposiciones) |
| `CONSTANTE NOMBRE ← valor` | Constante, antes de `INICIO`, en MAYÚSCULAS con guiones bajos |
| `LEER x` | Obtiene un dato del exterior y lo guarda en `x` |
| `ESCRIBIR "texto", x` | Muestra un resultado: el texto entre comillas tal cual y `x` por su valor |
| `x ← expresión` | Asignación: `x` toma el valor de la expresión |
| `=` | Comparación («¿es igual a?»), nunca asignación |
| `//` | Comentario |
| `VERDADERO`, `FALSO` | Los dos valores lógicos |
| `[1250, 980, 1430]`, `[]` | Una lista con sus valores; una lista vacía |
| `ventas[0]`, `LETRAS[i]` | El elemento de una lista (o de un texto) en una posición; **la primera es la 0** |
| `pedido.libros` | Una parte de un dato con partes («los libros del pedido») |
| `4.95` | Los decimales, con punto |
| Sangría | Lo que va dentro de otra instrucción, más a la derecha |
| Nombres | Variables en *camelCase* (`horaEntrada`); algoritmos con mayúscula inicial en cada palabra (`CalcularCajas`); sin tildes ni eñes (`anio`) |

#### Estructuras de control

| Estructura | Pseudocódigo |
|---|---|
| Selección simple | `SI c ENTONCES ... FIN SI` |
| Selección doble | `SI c ENTONCES ... SI NO ... FIN SI` |
| Selección encadenada | `SI c1 ENTONCES ... SI NO SI c2 ENTONCES ... SI NO ... FIN SI` |
| Por casos | `SEGÚN x HACER` / `1, 2: ...` / `DE OTRO MODO: ...` / `FIN SEGÚN` |
| Mientras | `MIENTRAS c HACER ... FIN MIENTRAS` |
| Repetir hasta | `REPETIR ... HASTA QUE c` |
| Para | `PARA i DESDE 1 HASTA n HACER ... FIN PARA` |
| Para cada | `PARA cada elemento DE lista HACER ... FIN PARA` |
| Subalgoritmo | `SUBALGORITMO F(p1, p2) ... DEVOLVER r ... FIN SUBALGORITMO` |
| Llamada | `r ← F(a, b)` o `F()` si no tiene parámetros |

> **⚠️ Cuidado:** `REPETIR ... HASTA QUE c` repite **hasta que** `c` sea verdadera. El `do ... while` de algunos lenguajes repite **mientras** su condición sea verdadera: al traducir, la condición se niega.

#### ¿Qué bucle uso?

| ¿Sé cuántas vueltas? | ¿Al menos una seguro? | Bucle |
|---|---|---|
| Sí (o recorro una lista entera) | — | `PARA` / `PARA cada` |
| No | No (pueden ser cero) | `MIENTRAS` |
| No | Sí | `REPETIR ... HASTA QUE` |

#### Operadores

| Tipo | Operadores |
|---|---|
| Aritméticos | `+` `-` `*` `/` `DIV` (división entera) `MOD` (resto) |
| Comparación | `=` `≠` `<` `>` `≤` `≥` |
| Lógicos | `Y` (las dos), `O` (al menos una), `NO` (invierte) |
| Asignación | `←` |

**Orden de evaluación:** paréntesis → `*` `/` `DIV` `MOD` → `+` `-` → comparaciones → `NO` → `Y` → `O`. Ante la duda, paréntesis.

#### Tipos de datos

| Tipo | Ejemplos |
|---|---|
| Entero | `53`, `0`, `-7` |
| Real | `4.95`, `-0.5` |
| Texto | `"Calle Mayor 5"`, `"Z"` |
| Lógico | `VERDADERO`, `FALSO` |

#### Patrones

| Patrón | Inicialización (antes del bucle) | En cada vuelta |
|---|---|---|
| Contador | `n ← 0` | `SI condición ENTONCES n ← n + 1` |
| Acumulador | `total ← 0` (suma) o `1` (producto) | `total ← total + valor` |
| Máximo | `max ← primer valor` | `SI valor > max ENTONCES max ← valor` |
| Mínimo | `min ← primer valor` | `SI valor < min ENTONCES min ← valor` |
| Bandera | `encontrado ← FALSO` | `SI ocurre ENTONCES encontrado ← VERDADERO` |
| Validación | — | `REPETIR LEER x HASTA QUE x es válido` |

#### Trucos con DIV y MOD

| Para... | Expresión |
|---|---|
| Saber si `n` es par | `n MOD 2 = 0` |
| Saber si `a` es divisible entre `b` | `a MOD b = 0` |
| Pasar minutos a horas y minutos | `m DIV 60` h y `m MOD 60` min |
| Repartir `n` cosas en grupos de `g` (redondeando hacia arriba) | `n DIV g`, más 1 si `n MOD g > 0` |
| Obtener la última cifra de un número | `n MOD 10` |

#### Símbolos de los diagramas de flujo

| Símbolo | Forma | Uso |
|---|---|---|
| Terminal | Óvalo | Inicio y fin |
| Proceso | Rectángulo | Asignación o cálculo |
| Decisión | Rombo | Condición con salidas «Sí» y «No» |
| Entrada / salida | Paralelogramo | Leer o escribir |
| Subproceso | Rectángulo con dobles líneas laterales | Llamada a un subalgoritmo |

#### La traza, paso a paso

1. Elige unos datos de entrada concretos.
2. Una columna por variable (y por condición); una fila por paso o por vuelta.
3. Sigue el algoritmo línea a línea, sin saltarte nada, y apunta cada cambio.
4. Compara el resultado con el esperado.

Mínimo: la **primera** vuelta, la **última** y algún caso en la **frontera**.

#### Errores típicos

| Error | Síntoma | Remedio |
|---|---|---|
| Bucle infinito | No termina | Algo debe avanzar en cada vuelta |
| Una vuelta de más o de menos | Falta o sobra un elemento | Traza de la primera y la última vuelta |
| Acumulador sin inicializar | Resultados absurdos | Inicializar **antes** del bucle |
| Condiciones mal ordenadas | Casos en el bloque equivocado | De la más restrictiva a la más general |
| `>` en lugar de `≥` | Falla justo en el límite | Probar el valor exacto del límite |
| División entre cero | Error con listas vacías | Comprobar el divisor antes |
| Confundir `←` y `=` | Condiciones u órdenes sin sentido | `←` guarda; `=` pregunta |

---

### 01.03 ¿Cómo sé que funciona? Probar un programa

📖 Módulo completo: [fase-01-que-es-programar/03-probar-un-programa.md](fase-01-que-es-programar/03-probar-un-programa.md)

#### El caso de prueba

| Parte | Qué es | Cuándo se sabe |
|---|---|---|
| Entrada | Los datos que se dan | Antes |
| Salida esperada | Lo que **debería** salir, según el enunciado | **Antes** de ejecutar |
| Salida obtenida (real) | Lo que **ha salido** de verdad | Después |
| Veredicto | Pasa ✅ si son iguales; falla ❌ si no | Después |

#### Tabla de casos de prueba

| Nº | Qué se prueba | Entrada | Salida esperada | Salida obtenida | ¿Pasa? |
|---|---|---|---|---|---|

Las cuatro primeras columnas, **antes** de ejecutar; las dos últimas, después.

#### Qué casos elegir

| Tipo | Qué es | Ejemplo (piscina: gratis hasta 3 años, 2,50 € de 4 a 17…) |
|---|---|---|
| Normales | Uno de cada grupo | 2, 10, 30, 80 años |
| Límite | Los dos lados de cada frontera | 3 y 4, 17 y 18, 64 y 65 |
| No válidos | Lo que debe rechazarse | −1, 121 |

**Prueba siempre:** el cero, el uno y el ninguno · el primero y el último · los muy grandes · los vacíos · un tipo inesperado (texto en lugar de número).

#### Probar a mano

1. Tabla de casos de prueba (mejor antes del algoritmo).
2. Una traza por caso: valor de cada variable en cada paso; en las condiciones, el cálculo **y** el resultado.
3. Compara obtenida con esperada.
4. Si falla, la traza te dice en qué paso se tuerce.
5. Tras corregir, vuelve a pasar **todos** los casos.

#### Qué errores encuentran las pruebas

| Tipo | Quién lo encuentra |
|---|---|
| Escritura (sintaxis) | El lenguaje, antes de que el programa haga nada |
| Ejecución | Las pruebas de casos límite, vacíos y no válidos (o el cliente, si no las hay) |
| Lógica | **Solo las pruebas** |

#### Pruebas automáticas

| Concepto | Qué es |
|---|---|
| Prueba automática | Un programa que prueba otro: entrada, esperado, obtenido, ¿coinciden? |
| Prueba unitaria | Prueba una pieza sola. Rápida y precisa |
| Prueba de integración | Prueba varias piezas juntas. Encuentra los errores en las uniones |
| Aserción | La comprobación: «esto debe ser igual a esto» |
| Regresión | Algo que funcionaba y se ha estropeado al cambiar otra cosa |
| Integración continua (CI) | Un servidor ejecuta todas las pruebas con cada cambio |
| TDD | Escribir cada prueba antes que el código: rojo, verde, refactorizar |
| Refactorizar | Cambiar cómo está escrito el código sin cambiar lo que hace |

```text
PRUEBA "Nombre que dice qué se prueba"
    resultado ← Subalgoritmo(entrada)      // preparar y ejecutar
    COMPROBAR resultado = esperado         // comprobar
FIN PRUEBA
```

#### Leer un corrector automático

| Busca | Python (`unittest`) | Otras herramientas |
|---|---|---|
| Cuántas fallan | `FAILED (failures=1)` | `fail 1`, `1 failed` |
| Cuál | `FAIL: test_…` | El nombre de la prueba, marcado con `FAIL` o ✖ |
| Dónde | `File "…", line 10` | Un fichero y un número de línea |
| Obtenido y esperado | `obtenido != esperado` (mira la línea de la aserción) | `actual` (o `got`, `received`) y `expected` |

Pasos: cuántas fallan → cuál → dónde → esperado y obtenido (¡cuál es cuál!) → compáralos → traza con esa entrada.

#### Recuerda

- Funcionar con un ejemplo **no** es funcionar.
- La salida esperada sale del **enunciado**, nunca del programa.
- Probar demuestra que **hay** errores, nunca que **no** los hay.
- No cambies una prueba para que pase: averigua primero quién tiene razón.

---

### 01.04 Paradigmas de programación

📖 Módulo completo: [fase-01-que-es-programar/04-paradigmas-de-programacion.md](fase-01-que-es-programar/04-paradigmas-de-programacion.md)

#### Los paradigmas de un vistazo

| Paradigma | Idea clave | Analogía |
|---|---|---|
| **Imperativo / estructurado** | Pasos que cambian variables; secuencia, selección y repetición | Una receta |
| **Orientado a objetos** | Objetos que juntan datos y comportamiento | Una empresa con empleados |
| **Funcional** | Funciones sin efectos secundarios; cadenas de transformaciones | Una cadena de montaje |
| **Declarativo** | Decir qué, no cómo | El taxi: «a la Plaza Mayor» |
| **Concurrente / paralelo** | Varias tareas a la vez (en curso o literalmente a la vez) | Uno o varios camareros |
| **Asíncrono** | Lanzar y seguir; aviso al terminar | El avisador del restaurante |
| **Orientado a eventos** | Reaccionar a lo que ocurre | El timbre de casa |
| **Reactivo** | Flujos de datos que se propagan solos | Una hoja de cálculo |
| **Orientado a aspectos** | Tareas transversales escritas una vez | El control de seguridad del aeropuerto |
| **Genérico** | Código válido para cualquier tipo de dato | Un molde de repostería |
| **Lógico** | Hechos y reglas; el programa deduce | Un detective que razona con pistas |

#### Imperativo frente a declarativo

| | Imperativo | Declarativo |
|---|---|---|
| Describe | **Cómo** (el camino) | **Qué** (el destino) |
| Ejemplos | Bucles, pseudocódigo, recetas | SQL, HTML, CSS, fórmulas de hoja de cálculo |
| Ventaja | Control total | Más corto y legible; el motor se encarga |
| Inconveniente | Más detalles en los que equivocarse | Hay que entender lo que hace el motor por debajo |

#### Las tres operaciones funcionales

| Operación | Qué hace | Nombre habitual en los lenguajes |
|---|---|---|
| Filtrar | Quedarse con los elementos que cumplen una condición | `filter` |
| Transformar | Convertir cada elemento en otra cosa | `map` |
| Reducir | Combinar todos en un único resultado | `reduce`, `sum`, `count` |

#### Notaciones de este módulo

```text
OBJETO Nombre                          // orientado a objetos
    DATOS: dato1, dato2
    SUBALGORITMO Pregunta() ... DEVOLVER ... FIN SUBALGORITMO
FIN OBJETO
objeto.Pregunta()                      // se le pregunta al objeto

resultado ← lista                      // funcional
    → FILTRAR los que cumplen ...
    → TRANSFORMAR cada uno en ...
    → REDUCIR sumándolos
```

#### Para elegir

- ¿Un cálculo sencillo? → **Imperativo**, sin complicarlo.
- ¿Muchos conceptos con datos y reglas? → **Objetos**.
- ¿Procesar una colección? → **Funcional**.
- ¿Hay un motor que sepa resolver el «cómo»? → **Declarativo**.
- ¿Una tarea lenta que no debe bloquear lo demás? → **Asíncrono**.
- ¿Varias partes reaccionan a un hecho? → **Eventos**.
- ¿Datos que llegan sin parar a muchos usuarios? → **Reactivo**.
- ¿Algo que se repite en todas las operaciones? → **Aspectos**.

---

## Fase 02 — Tu ordenador por dentro

---

### 02.01 Cómo funciona un ordenador

📖 Módulo completo: [fase-02-tu-ordenador/01-como-funciona-un-ordenador.md](fase-02-tu-ordenador/01-como-funciona-un-ordenador.md)

#### Las piezas y lo que hacen

| Pieza | Qué hace | Se mide en | Al apagar |
|---|---|---|---|
| **Procesador (CPU)** | Ejecuta las instrucciones | Núcleos y GHz | — |
| **Memoria RAM** | Guarda lo que se usa ahora | GB (8, 16, 32…) | Se borra |
| **Almacenamiento** (SSD o disco duro) | Guarda ficheros y programas | GB o TB | Se conserva |
| **Tarjeta gráfica (GPU)** | Dibuja la pantalla; cálculos en paralelo | — | — |
| **Sistema operativo** | Administra todo lo anterior | — | — |

#### Unidades

| Unidad | Qué es |
|---|---|
| 1 bit | Un 0 o un 1 |
| 1 byte (B) | 8 bits: 256 combinaciones |
| KB, MB, GB, TB | Cada uno, 1000 veces el anterior |
| KiB, MiB, GiB, TiB | Cada uno, 1024 veces el anterior (Windows los muestra como «KB», «MB», «GB», «TB») |
| Mb/s (b minúscula) | Megabits por segundo: velocidad de internet. Entre 8 → MB/s |
| 1 TB del fabricante | Unos 931 GB en Windows |

#### Qué hace el sistema operativo

Programas (los pone en marcha y reparte el procesador) · memoria (y la memoria virtual si se llena) · ficheros y carpetas · dispositivos (con controladores) · usuarios y permisos.

#### Programa y proceso

| Programa | Proceso |
|---|---|
| Ficheros en el disco | Un programa en marcha |
| Ocupa almacenamiento | Ocupa RAM y procesador |
| Uno | Puede haber varios del mismo programa |

**Ver los procesos:** Administrador de tareas (Windows, <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>Esc</kbd>) · Monitor de Actividad (macOS) · Recursos o Monitor del sistema (Linux). **Solo para mirar.**

#### Abrir, guardar y apagar

1. Abrir: del disco a la RAM.
2. Trabajar: los cambios están solo en la RAM.
3. Guardar: de la RAM al disco.
4. Apagar o cortar la corriente: se borra la RAM. Suspender: la RAM se conserva. Hibernar: la RAM se copia al disco.

#### Qué instalador descargar

| Si tu ordenador dice… | Arquitectura | Busca |
|---|---|---|
| x64, x86_64, amd64, Intel, AMD | x86-64 | `x64` |
| ARM, arm64, aarch64, Snapdragon | ARM | `arm64` |
| Mac con «Chip: Apple M…» | ARM (Apple Silicon) | `Apple Silicon` o `Universal` |
| Mac con «Procesador: Intel…» | x86-64 | `Intel` o `Universal` |

Siempre de 64 bits si hay elección, y siempre desde la página oficial.

#### Dónde mirar tus datos

- **Windows 11:** Configuración → Sistema → Información → Tipo de sistema.
- **macOS:** menú Apple → Acerca de este Mac → Chip o Procesador.
- **Linux (Ubuntu):** Configuración → Sistema.

#### Para elegir un ordenador para programar

1. **RAM** suficiente (16 GB va holgado, a 8 de noviembre de 2026), mejor si es ampliable.
2. **SSD**, no disco duro.
3. Procesador: cualquiera actual sirve para empezar.

---

### 02.02 Archivos, carpetas y rutas

📖 Módulo completo: [fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md](fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md)

#### Conceptos clave

| Concepto | En una línea |
|---|---|
| **Fichero (archivo)** | Datos guardados en el disco con un nombre |
| **Carpeta (directorio)** | Contenedor de ficheros y de otras carpetas |
| **Carpeta padre** | La carpeta que contiene a otra o a un fichero |
| **Árbol de carpetas** | Las carpetas unas dentro de otras, desde la raíz |
| **Raíz** | La carpeta de la que cuelga todo: `/` en Linux y macOS, `C:\` (una por unidad) en Windows |
| **Carpeta personal** | Tu carpeta: documentos, descargas, proyectos. Se abrevia `~` |
| **Ruta** | La dirección de un fichero o carpeta en el árbol |
| **Ruta absoluta** | Empieza en la raíz; sirve desde cualquier sitio, pero solo en ese ordenador |
| **Ruta relativa** | Empieza en la carpeta actual; sirve en cualquier ordenador si el proyecto viaja entero |
| **Carpeta actual (de trabajo)** | La carpeta desde la que se cuentan las rutas relativas de un programa en marcha |
| **Extensión** | Lo que va tras el último punto del nombre: pista del tipo de fichero |
| **Fichero oculto** | No se ve en el explorador; en Linux y macOS, los que empiezan por `.` |

#### La misma ruta en cada sistema

| Sistema | Carpeta personal | Ejemplo | Separador |
|---|---|---|---|
| Windows | `C:\Users\ana` | `C:\Users\ana\proyectos\web\index.html` | `\` |
| macOS | `/Users/ana` | `/Users/ana/proyectos/web/index.html` | `/` |
| Linux | `/home/ana` | `/home/ana/proyectos/web/index.html` | `/` |
| Git Bash | `/c/Users/ana` | `/c/Users/ana/proyectos/web/index.html` | `/` |

De Windows a Git Bash: `C:` → `/c` y cada `\` → `/`. `~` es la carpeta personal en macOS, Linux y Git Bash (no en el Explorador de archivos de Windows).

#### Moverse con rutas relativas

| Escribes | Significa |
|---|---|
| `nombre` | Entra en esa carpeta (o es ese fichero) |
| `.` | Esta misma carpeta |
| `..` | La carpeta padre: sube un nivel |
| `../..` | Sube dos niveles |
| `../img/logo.png` | Sube uno, entra en `img`, coge `logo.png` |

Para resolverla: empieza en la carpeta actual y sigue la ruta parte a parte, apuntando dónde estás.

#### ¿Desde dónde se cuenta una ruta relativa?

| Quién la usa | Se cuenta desde |
|---|---|
| Una página web | La carpeta donde está la página |
| Una hoja de estilos | La carpeta donde está la hoja de estilos |
| Un programa en marcha | Su **carpeta actual**, no la carpeta donde está guardado |

#### Ver rutas, extensiones y ocultos (8 de noviembre de 2026)

| | Windows 11 | macOS | Linux (GNOME) |
|---|---|---|---|
| Ver la ruta de la carpeta | Clic en un hueco de la barra de direcciones | Visualización › Mostrar barra de ruta | Barra de rutas; Propiedades › Carpeta padre |
| Copiar la ruta de un fichero | Clic derecho › opción de copiar la ruta | Clic derecho con <kbd>Opción</kbd> pulsada › opción de copiar la ruta | Propiedades › Carpeta padre, más el nombre |
| Ver las extensiones | Menú Ver › Extensiones de nombre de archivo | Finder › Ajustes › Avanzado › Mostrar todas las extensiones de los archivos | Siempre visibles |
| Ver los ocultos | Menú Ver › Elementos ocultos | Un atajo del Finder (o la terminal, fase 3) | <kbd>Ctrl</kbd>+<kbd>H</kbd> |

#### Nombres en las carpetas de programación

- Minúsculas, sin espacios, sin tildes, sin eñes: `web-panaderia`, `ventas-2026.csv`.
- Solo letras, números, `-` y `_`.
- Linux distingue mayúsculas (`Logo.png` ≠ `logo.png`); Windows y macOS normalmente no. Escribe las rutas letra a letra.
- Ruta con espacios: entre comillas, `"C:\Users\ana\Mis proyectos"`.

#### Si un programa no encuentra un fichero

1. Lee la ruta del mensaje **letra a letra**, mayúsculas incluidas.
2. ¿Es **relativa**? Averigua la **carpeta actual**.
3. Une las dos y comprueba en el explorador si esa ruta absoluta existe.

---

### 02.03 Instalar programas, variables de entorno y PATH

📖 Módulo completo: [fase-02-tu-ordenador/03-instalar-programas-y-path.md](fase-02-tu-ordenador/03-instalar-programas-y-path.md)

#### Conceptos clave

| Concepto | Definición en una línea |
|---|---|
| **Instalar** | Copiar los ficheros de un programa, avisar al sistema de que existe y prepararlo para que lo encuentren |
| **Instalador** | Programa que te guía, pantalla a pantalla, para instalar otro programa |
| **Gestor de paquetes** | Programa que instala, actualiza y desinstala otros programas con una orden: winget, Homebrew, apt, dnf |
| **Paquete** | Un programa preparado para instalarse con un gestor de paquetes |
| **Terminal** | Ventana en la que escribes órdenes y el ordenador te contesta con texto |
| **Git Bash** | La terminal con bash que trae Git for Windows; la del curso en Windows |
| **bash / zsh** | Los «idiomas» de órdenes de la terminal de Linux (y Git Bash) y de macOS; las órdenes del curso funcionan en los dos |
| **Indicador** (*prompt*) | El texto con el que la terminal espera una orden; termina en `$` (bash) o `%` (zsh) |
| **Variable de entorno** | Dato con nombre que guarda el sistema y pueden leer todos los programas |
| **PATH** | Variable de entorno con la lista ordenada de carpetas donde se buscan los programas |

#### Instalar Git y VS Code (a 8 de noviembre de 2026)

| Sistema | VS Code | Git |
|---|---|---|
| Windows | `code.visualstudio.com`, instalador de usuario (con *Add to PATH*) | `git-scm.com`, Git for Windows (x64 o ARM64): editor VS Code y rama `main`; el resto, como viene |
| macOS | `.dmg`, arrastrar a `Aplicaciones` (Universal) | Escribir `git --version` y aceptar las herramientas de Apple, o `brew install git` |
| Linux | `.deb` (o `.rpm`) de `code.visualstudio.com` | `sudo apt install git` o `sudo dnf install git` |

#### Las tres órdenes de comprobación

| Orden | Qué dice | Qué tienes que ver |
|---|---|---|
| `git --version` | La versión de Git | `git version` y un número |
| `echo $PATH` | Las carpetas donde se buscan los programas | Una lista separada por `:` |
| `command -v git` | En qué carpeta está el `git` que se ejecuta | Una ruta; si no sale nada, no está en el PATH |

#### Cómo busca el sistema un programa

1. Mira las carpetas del PATH **en orden**.
2. Ejecuta el **primero** que encuentra con ese nombre exacto.
3. Si no está en ninguna: «command not found», «orden no encontrada» o «no se reconoce como un comando».

#### Ante un «command not found»

1. ¿Lo has escrito bien? (minúsculas, sin tildes).
2. ¿Has abierto una terminal **nueva** después de instalar?
3. ¿Qué dice `command -v`?
4. ¿Está la carpeta del programa en el PATH (`echo $PATH`)?

#### Reglas de oro

- Descarga solo de la **web oficial** (mira el dominio desde el final).
- Elige el instalador de tu **sistema** y tu **arquitectura**.
- En Windows, usa **Git Bash** para seguir el curso.
- El `$` (o `%`) de las sesiones del curso **no se escribe**.
- Tu salida no será idéntica a la del curso: fíjate en **lo importante**.

---

## Fase 03 — Herramientas del programador

---

### 03.01 La terminal: lo básico

📖 Módulo completo: [fase-03-herramientas/01-terminal-lo-basico.md](fase-03-herramientas/01-terminal-lo-basico.md)

#### Cómo es una orden

```text
nombre  -opciones  argumentos       ls -lh img
```

- Opciones cortas con un guion (`-l`), que se pueden juntar (`-lah`); largas, con dos (`--help`).
- El espacio separa las piezas; un nombre con espacios va entre comillas.
- Las mayúsculas cuentan. El `$` de las sesiones del curso no se escribe.

#### Mirar y moverse

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

#### Crear, copiar, mover y borrar

| Orden | Qué hace |
|---|---|
| `mkdir a b` · `mkdir -p a/b/c` | Crea carpetas · crea también las carpetas padre que falten |
| `touch fichero` | Crea un fichero vacío (o le pone la fecha de ahora) |
| `cp origen destino` · `cp -r carpeta copia` | Copia un fichero · una carpeta entera |
| `mv origen destino` | Mueve, o renombra si el destino no es una carpeta |
| `rm fichero` · `rm -r carpeta` | Borra un fichero · una carpeta con todo (**sin papelera**) |
| `rmdir carpeta` | Borra una carpeta solo si está vacía |
| `-i` (en `cp`, `mv`, `rm`) | Pregunta antes de sustituir o borrar |

#### Ver y buscar

| Orden | Qué hace |
|---|---|
| `cat fichero` | Escribe el fichero entero |
| `less fichero` | Lo enseña página a página (<kbd>Espacio</kbd> avanza, <kbd>/</kbd> busca, <kbd>Q</kbd> sale) |
| `head -n 5 fichero` · `tail -n 5 fichero` | Las 5 primeras · las 5 últimas líneas (sin `-n`, 10) |
| `grep texto fichero` | Las líneas que contienen el texto (`-i` sin mayúsculas, `-n` con número de línea) |
| `find . -name "nombre"` | Busca ficheros por su nombre desde aquí hacia abajo |
| `echo texto` | Escribe el texto (y enseña cómo entiende bash lo que escribes) |

#### Ayuda y trucos

| Qué | Cómo |
|---|---|
| Ayuda de una orden | `orden --help`; `man orden` (no en Git Bash); `help cd` para las de bash |
| Autocompletar | <kbd>Tab</kbd> (dos veces: ver las opciones) |
| Historial | <kbd>↑</kbd> y <kbd>↓</kbd>; buscar con <kbd>Ctrl</kbd>+<kbd>R</kbd> |
| Parar una orden | <kbd>Ctrl</kbd>+<kbd>C</kbd> (en `less` y `man`, <kbd>Q</kbd>) |
| Limpiar la pantalla | `clear` o <kbd>Ctrl</kbd>+<kbd>L</kbd> |
| Escribir una ruta sin errores | Arrastra el fichero o la carpeta a la ventana de la terminal |
| Copiar y pegar | Linux: <kbd>Ctrl</kbd>+<kbd>Mayús</kbd>+<kbd>C</kbd> / <kbd>V</kbd> · macOS: <kbd>Cmd</kbd>+<kbd>C</kbd> / <kbd>V</kbd> · Git Bash: seleccionar copia, <kbd>Mayús</kbd>+<kbd>Insert</kbd> pega |

#### Comodines y comillas

| Escribes | Significa |
|---|---|
| `*` | Cualquier texto, también ninguno: `*.jpg`, `informe*`, `*2026*` |
| `?` | Exactamente un carácter: `foto-0?.jpg` |
| `"Mis fotos"` o `Mis\ fotos` | Un nombre con espacios, como una sola pieza |
| `"*.txt"` | El patrón tal cual, sin cambiarlo por los ficheros |

#### Antes de borrar

1. `pwd`: ¿estoy donde creo?
2. `ls` con **el mismo patrón** que vas a borrar: ¿es eso lo que quiero borrar?
3. ¿Tengo copia? Si no, `cp -r`.
4. Lee la orden entera, espacio a espacio, y entonces <kbd>Intro</kbd>.

#### PowerShell y cmd, para reconocerlas

| bash | PowerShell | cmd |
|---|---|---|
| `pwd` · `ls` · `cd` | `Get-Location` · `Get-ChildItem` · `Set-Location` | `cd` · `dir` · `cd` |
| `cp` · `mv` · `rm` | `Copy-Item` · `Move-Item` · `Remove-Item` | `copy` · `move` · `del` |
| `cat` · `grep` · `clear` | `Get-Content` · `Select-String` · `Clear-Host` | `type` · `findstr` · `cls` |

---
📚 [Índice del curso](00-indice.md) · 🏠 [Portada](README.md)
