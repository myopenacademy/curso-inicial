# Chuleta global

> Todas las chuletas de los módulos del curso, reunidas en un solo fichero para consultarlas rápido.
> Se genera con `generar_chuleta_global.py` del kit de cursos: no lo edites a mano.

📚 [Índice del curso](00-indice.md) · 🏠 [Portada](README.md)

## Contenido

- **Fase 01 — Qué es programar**
  - [01.01 Qué es programar](#0101-qué-es-programar)
  - [01.02 Algoritmos y pseudocódigo](#0102-algoritmos-y-pseudocódigo)

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
📚 [Índice del curso](00-indice.md) · 🏠 [Portada](README.md)
