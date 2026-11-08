# Retos de la fase 01 — Qué es programar

> **Conviene saber antes:** los módulos de la fase.
> **Tiempo estimado:** 3 horas

Estos retos mezclan lo que has aprendido en los cuatro módulos de la fase: entender bien un problema y detectar lo que no está claro ([01.01](01-que-es-programar.md)), escribir y trazar algoritmos en pseudocódigo ([01.02](02-algoritmos-y-pseudocodigo.md)), probarlos con una tabla de casos normales, límite y no válidos ([01.03](03-probar-un-programa.md)) y plantear un mismo cálculo en otro de los grandes estilos de programar, como el funcional o el orientado a objetos ([01.04](04-paradigmas-de-programacion.md)).

Van de menor a mayor dificultad, y el último es el más completo. Son **opcionales**: sirven para afianzar lo aprendido y no bloquean nada. Como el pseudocódigo no lo ejecuta ningún ordenador, las soluciones son **razonadas**, con el pseudocódigo completo y su tabla de prueba o su traza. Hazlos en papel o en un documento, abre las pistas solo si te atascas y, si tu solución es distinta de la propuesta, compruébala con los mismos casos de prueba: puede estar igual de bien.

## Reto 1 · El riego automático de un huerto

**Situación real:** un huerto urbano quiere automatizar el riego. Un sensor comprueba el estado del huerto una vez cada hora y le pasa al sistema cuatro datos: la **hora** (de 0 a 23), el **mes** (de 1 a 12), la **lluvia** caída hoy (en litros por metro cuadrado, un número entero de 0 en adelante) y la **humedad** de la tierra (en tanto por ciento, de 0 a 100). Tras hablar con el jardinero, las normas han quedado así:

- No se riega nunca entre las **12 y las 17, ambas incluidas**: a mediodía el agua se evapora.
- Solo se riega si hoy han caído **menos de 5 litros** y la humedad es **menor del 30 %**.
- De **junio a septiembre** (meses 6 a 9) se riegan **20 minutos**; el resto del año, **10**.
- Si algún dato está fuera de su rango, el sistema debe responder «Datos no válidos».

Un compañero ha escrito este subalgoritmo, que devuelve los minutos de riego:

```text
SUBALGORITMO MinutosDeRiego(hora, mes, lluvia, humedad)
    SI hora > 12 Y hora < 17 ENTONCES
        DEVOLVER 0
    SI NO SI lluvia < 5 O humedad < 30 ENTONCES
        SI mes ≥ 6 Y mes ≤ 9 ENTONCES
            DEVOLVER 20
        SI NO
            DEVOLVER 10
        FIN SI
    SI NO
        DEVOLVER 0
    FIN SI
FIN SUBALGORITMO
```

1. **Antes de mirar el subalgoritmo con detalle**, escribe la tabla de casos de prueba: normales, límite y no válidos, con la salida esperada calculada a partir de las normas.
2. Haz la traza del subalgoritmo con la hora 12, el mes 7, 0 litros de lluvia y un 20 % de humedad.
3. Prueba el subalgoritmo con toda tu tabla. Hay **tres** errores: encuéntralos y di de qué tipo son (de escritura, de ejecución o de lógica).
4. Escribe la versión corregida.

<details>
<summary>Pista 1</summary>

Cada norma tiene sus fronteras: las horas 11 y 12, y 17 y 18; la lluvia de 4 y de 5 litros; la humedad del 29 % y del 30 %; los meses 5 y 6, y 9 y 10. Prueba cada frontera con valores normales en los demás datos (por ejemplo, las 8 de la mañana, julio, sin lluvia y con la tierra seca).

</details>

<details>
<summary>Pista 2</summary>

Repasa la [tabla de verdad](02-algoritmos-y-pseudocodigo.md#operadores-lógicos): las normas dicen que hay que cumplir **las dos** condiciones de la lluvia y la humedad. Y fíjate en qué hace el subalgoritmo con una hora 24 o un mes 13.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se sacan de las normas los grupos y las fronteras de cada dato, y se calcula la salida esperada de cada caso **sin mirar el subalgoritmo**. Después se prueba el subalgoritmo con la tabla, y los casos que fallan, agrupados por lo que tienen en común, señalan los errores.

**1. La tabla de casos de prueba** (hora, mes, lluvia, humedad):

| Nº | Qué se prueba | Entrada | Esperada |
|---|---|---|---|
| 1 | Normal: riega en verano | 8, 7, 0, 20 | 20 |
| 2 | Normal: riega fuera del verano | 8, 3, 0, 20 | 10 |
| 3 | Normal: la tierra está húmeda | 8, 7, 0, 50 | 0 |
| 4 | Normal: ha llovido | 8, 7, 10, 20 | 0 |
| 5 | Límite: las 11, todavía se riega | 11, 7, 0, 20 | 20 |
| 6 | Límite: las 12, empieza la franja sin riego | 12, 7, 0, 20 | 0 |
| 7 | Límite: las 17, última hora sin riego | 17, 7, 0, 20 | 0 |
| 8 | Límite: las 18, ya se riega | 18, 7, 0, 20 | 20 |
| 9 | Límite: 4 litros de lluvia | 8, 7, 4, 20 | 20 |
| 10 | Límite: 5 litros de lluvia | 8, 7, 5, 20 | 0 |
| 11 | Límite: humedad del 29 % | 8, 7, 0, 29 | 20 |
| 12 | Límite: humedad del 30 % | 8, 7, 0, 30 | 0 |
| 13 | Límite: mayo y junio | 8, 5, 0, 20 y 8, 6, 0, 20 | 10 y 20 |
| 14 | Límite: septiembre y octubre | 8, 9, 0, 20 y 8, 10, 0, 20 | 20 y 10 |
| 15 | No válido: hora 24 | 24, 7, 0, 20 | Datos no válidos |
| 16 | No válido: mes 13 | 8, 13, 0, 20 | Datos no válidos |
| 17 | No válido: lluvia negativa | 8, 7, −1, 20 | Datos no válidos |
| 18 | No válido: humedad del 101 % | 8, 7, 0, 101 | Datos no válidos |

**2. La traza con 12, 7, 0 y 20:**

| Paso | Instrucción | Condición | Devuelve |
|---|---|---|---|
| 1 | `SI hora > 12 Y hora < 17` | ¿12 > 12? **No**, así que `FALSO Y …` es FALSO | — |
| 2 | `SI NO SI lluvia < 5 O humedad < 30` | ¿0 < 5? **Sí**, así que `VERDADERO O …` es VERDADERO | — |
| 3 | `SI mes ≥ 6 Y mes ≤ 9` | ¿7 ≥ 6? Sí; ¿7 ≤ 9? Sí → VERDADERO | — |
| 4 | `DEVOLVER 20` | — | **20** |

Salida obtenida: 20. Esperada: 0 (a las 12 no se riega). **Falla** en el paso 1: la condición deja fuera la propia hora 12.

**3. La prueba completa:**

| Nº | Esperada | Obtenida | ¿Pasa? |
|---|---|---|---|
| 1, 2 | 20 y 10 | 20 y 10 | ✅ |
| 3 | 0 | 20 | ❌ |
| 4 | 0 | 20 | ❌ |
| 5 | 20 | 20 | ✅ |
| 6 | 0 | 20 | ❌ |
| 7 | 0 | 20 | ❌ |
| 8, 9 | 20 y 20 | 20 y 20 | ✅ |
| 10 | 0 | 20 | ❌ |
| 11 | 20 | 20 | ✅ |
| 12 | 0 | 20 | ❌ |
| 13, 14 | 10, 20, 20 y 10 | 10, 20, 20 y 10 | ✅ |
| 15 | Datos no válidos | 20 | ❌ |
| 16 | Datos no válidos | 10 | ❌ |
| 17, 18 | Datos no válidos | 20 | ❌ |

Agrupando los fallos salen los tres errores:

- **La franja sin riego deja fuera sus extremos** (casos 6 y 7). `hora > 12 Y hora < 17` no incluye ni las 12 ni las 17, y las normas dicen «ambas incluidas»: tiene que ser `hora ≥ 12 Y hora ≤ 17`. Es el [error de límites](02-algoritmos-y-pseudocodigo.md#35-equivocarse-en-los-límites-mayor-frente-a-mayor-o-igual) de siempre, y solo lo descubren los casos límite.
- **`O` en lugar de `Y`** (casos 3, 4, 10 y 12). Con `O` basta con que se cumpla una de las dos condiciones, así que riega con la tierra empapada si no ha llovido, o después de un chaparrón si la tierra está seca. Las normas piden las dos.
- **No comprueba los datos** (casos 15 a 18). Con una hora 24 o un mes 13, se inventa un resultado.

Los tres son **errores de lógica**: el subalgoritmo está bien escrito y se ejecuta sin quejarse, pero hace otra cosa de la que piden las normas. Por eso solo los encuentran las pruebas ([01.03, apartado 1.7](03-probar-un-programa.md#17-qué-errores-encuentran-las-pruebas)).

**4. La versión corregida.** La comprobación de los datos va primero y en su propio subalgoritmo, para que se lea mejor:

```text
SUBALGORITMO DatosValidos(hora, mes, lluvia, humedad)
    DEVOLVER hora ≥ 0 Y hora ≤ 23 Y mes ≥ 1 Y mes ≤ 12
             Y lluvia ≥ 0 Y humedad ≥ 0 Y humedad ≤ 100
FIN SUBALGORITMO

SUBALGORITMO MinutosDeRiego(hora, mes, lluvia, humedad)
    SI NO DatosValidos(hora, mes, lluvia, humedad) ENTONCES
        DEVOLVER "Datos no válidos"
    SI NO SI hora ≥ 12 Y hora ≤ 17 ENTONCES         // franja sin riego, extremos incluidos
        DEVOLVER 0
    SI NO SI lluvia < 5 Y humedad < 30 ENTONCES     // las dos condiciones
        SI mes ≥ 6 Y mes ≤ 9 ENTONCES
            DEVOLVER 20
        SI NO
            DEVOLVER 10
        FIN SI
    SI NO
        DEVOLVER 0
    FIN SI
FIN SUBALGORITMO
```

Con esta versión se vuelven a pasar **los 18 casos**, también los que ya pasaban: todos dan la salida esperada.

**Errores frecuentes al resolverlo:**

- Calcular las salidas esperadas siguiendo el subalgoritmo en vez de las normas: entonces todos los casos «pasan» y no se encuentra nada.
- Arreglar solo el error de la traza (la hora 12) y no probar los demás casos. Los otros dos errores siguen ahí.
- Probar los límites de la hora solo por un lado (12 sin 11, o 17 sin 18).

</details>

## Reto 2 · El resumen de una carrera popular

**Situación real:** la organización de una carrera popular de 10 km recibe, al terminar, la lista de los tiempos de los corredores que han llegado a meta, en segundos. Quiere un resumen con tres datos: **cuántos han llegado**, **cuántos han bajado de 50 minutos** (menos de 3000 segundos, que tienen premio) y el **mejor tiempo**, escrito en minutos y segundos (por ejemplo, «49 min 10 s»). Si no ha llegado nadie, el resumen debe decir «Nadie ha llegado a meta».

1. Escribe la tabla de casos de prueba. Incluye, al menos, un caso normal, el límite de los 50 minutos, un solo corredor y la lista vacía.
2. Escribe el algoritmo en pseudocódigo, en estilo imperativo, y haz su traza con el caso normal.
3. Describe el mismo cálculo como una cadena de operaciones del estilo funcional.

<details>
<summary>Pista 1</summary>

Son tres patrones del [módulo de algoritmos](02-algoritmos-y-pseudocodigo.md#110-patrones-que-se-repiten-en-todos-los-programas): dos contadores y un mínimo. El mínimo empieza con el **primer** tiempo de la lista, `tiempos[0]`, y por eso hay que comprobar antes que la lista no esté vacía.

</details>

<details>
<summary>Pista 2</summary>

Para pasar segundos a minutos y segundos sirven `DIV` y `MOD` con 60. Y «bajar de 50 minutos» es `< 3000`: un corredor que tarda 3000 segundos justos no tiene premio.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** es un recorrido de la lista con dos contadores (los que llegan y los que bajan de 50 minutos) y un mínimo (el mejor tiempo). El caso vacío se trata **antes** del recorrido, porque sin tiempos no hay ningún primer valor con el que empezar el mínimo. Los casos de prueba se eligen antes, mirando las fronteras del enunciado.

**1. La tabla de casos de prueba:**

| Nº | Qué se prueba | Entrada (segundos) | Esperada |
|---|---|---|---|
| 1 | Normal, con el límite por los dos lados (2999 y 3000) | 3125, 2950, 3410, 2999, 3000 | 5 llegados; 2 por debajo de 50 min; mejor, 49 min 10 s |
| 2 | Un solo corredor | 3600 | 1 llegado; 0 por debajo; mejor, 60 min 0 s |
| 3 | Empate en el mejor tiempo | 2400, 2400 | 2 llegados; 2 por debajo; mejor, 40 min 0 s |
| 4 | Nadie ha llegado | (lista vacía) | «Nadie ha llegado a meta» |

**2. El algoritmo:**

```text
ALGORITMO ResumenCarrera
    ENTRADA: la lista de tiempos de llegada, en segundos
    SALIDA: cuántos han llegado, cuántos bajan de 50 minutos y el mejor tiempo

    CONSTANTE LIMITE_PREMIO ← 3000          // 50 minutos, en segundos

INICIO
    LEER tiempos
    SI tiempos = [] ENTONCES
        ESCRIBIR "Nadie ha llegado a meta"
    SI NO
        llegados ← 0                        // contador
        premiados ← 0                       // contador
        mejor ← tiempos[0]                  // mínimo: el primero, de momento
        PARA cada tiempo DE tiempos HACER
            llegados ← llegados + 1
            SI tiempo < LIMITE_PREMIO ENTONCES
                premiados ← premiados + 1
            FIN SI
            SI tiempo < mejor ENTONCES
                mejor ← tiempo
            FIN SI
        FIN PARA
        ESCRIBIR "Han llegado: ", llegados
        ESCRIBIR "Por debajo de 50 minutos: ", premiados
        ESCRIBIR "Mejor tiempo: ", mejor DIV 60, " min ", mejor MOD 60, " s"
    FIN SI
FIN
```

**La traza con el caso 1:**

| Vuelta | `tiempo` | `llegados` | ¿`tiempo < 3000`? | `premiados` | ¿`tiempo < mejor`? | `mejor` |
|---|---|---|---|---|---|---|
| Antes del bucle | — | 0 | — | 0 | — | 3125 |
| 1 | 3125 | 1 | No | 0 | No (3125 < 3125 es falso) | 3125 |
| 2 | 2950 | 2 | Sí | 1 | Sí | 2950 |
| 3 | 3410 | 3 | No | 1 | No | 2950 |
| 4 | 2999 | 4 | Sí | 2 | No | 2950 |
| 5 | 3000 | 5 | **No** | 2 | No | 2950 |

Al final, 2950 DIV 60 = 49 y 2950 MOD 60 = 10, así que escribe:

```text
Han llegado: 5
Por debajo de 50 minutos: 2
Mejor tiempo: 49 min 10 s
```

Coincide con lo esperado. Con los otros casos: el 2 escribe 1, 0 y «60 min 0 s»; el 3, 2, 2 y «40 min 0 s» (el empate no cambia el mejor tiempo); el 4 no entra en el bucle y escribe «Nadie ha llegado a meta». Los cuatro pasan.

**3. En estilo funcional**, sin contadores que vayan cambiando:

```text
premiados ← tiempos
    → FILTRAR los que son < LIMITE_PREMIO

mejor ← tiempos
    → REDUCIR quedándote con el menor
```

Los llegados son el número de elementos de `tiempos`; los premiados, el número de elementos de `premiados`. Fíjate en que el caso vacío sigue haciendo falta: con una lista vacía no hay ningún «menor» que devolver, así que la comprobación `SI tiempos = []` va antes, igual que en la versión imperativa.

**Errores frecuentes al resolverlo:**

- Empezar el mínimo en 0: ningún tiempo es menor que 0, y el «mejor tiempo» saldría 0 min 0 s.
- Usar `≤ 3000` y dar premio a quien tarda 50 minutos justos. Por eso el caso 1 lleva un 3000 y un 2999.
- Olvidar la lista vacía: `tiempos[0]` no existe si no hay ningún tiempo.

</details>

## Reto 3 · La tarifa de un taxi

**Situación real:** la asociación de taxistas de un pueblo te encarga el cálculo del precio de las carreras para una aplicación. (Las tarifas de este reto son inventadas.) Esto es lo que te mandan por correo:

> «La carrera empieza con 2,50 € de bajada de bandera. Luego se cobra la distancia: 1,20 € el kilómetro de día y 1,50 € de noche y en festivos. El taxímetro cuenta por tramos de 100 metros. La carrera mínima son 4 €. Si vas o vienes del aeropuerto, hay un suplemento de 5 €.»

1. **Entiende el problema.** Escribe la entrada y la salida, y las preguntas que le harías a la asociación antes de programar nada.
2. **Diseña el algoritmo** en pseudocódigo, con las respuestas que te ha dado la asociación (están en la pista 1), descompuesto en subalgoritmos.
3. **Pruébalo:** escribe la tabla de casos de prueba con casos normales, límite y no válidos, calcula la salida esperada de cada uno a partir de las normas y haz la traza de uno de ellos.
4. **Opcional:** ¿cómo se plantearía en otro de los grandes estilos del [módulo de paradigmas](04-paradigmas-de-programacion.md), como el orientado a objetos o el declarativo?

<details>
<summary>Pista 1</summary>

Estas son las respuestas de la asociación a las preguntas que suelen surgir:

- **De noche** es de 21:00 a 6:59, y cuenta la hora a la que **empieza** la carrera. Un festivo, a cualquier hora, se cobra como la noche; festivo y noche a la vez no suman nada más.
- Se cobra cada tramo de 100 metros **empezado**: 1.250 metros son 13 tramos. Un tramo cuesta 12 céntimos de día y 15 de noche (1,20 € y 1,50 € el kilómetro).
- El mínimo de 4 € se aplica a la carrera **sin** el suplemento; el suplemento del aeropuerto se suma después.
- Los metros negativos y una hora fuera de 0 a 23 son datos no válidos.
- El tiempo de espera en los atascos no se cobra (es una simplificación del reto).

</details>

<details>
<summary>Pista 2</summary>

Trabaja en **céntimos**, como el aparcamiento del [módulo de algoritmos](02-algoritmos-y-pseudocodigo.md#21-secuencia-y-selección-la-tarifa-de-un-aparcamiento), para que todos los números sean enteros. Contar los tramos empezados es el mismo cálculo que `CalcularCajas`: tramos llenos, y uno más si sobra algún metro.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se aclara el problema, porque el correo deja muchas cosas en el aire; después se descompone el cálculo en piezas pequeñas (¿qué tarifa toca?, ¿cuántos tramos?, ¿cuánto cuesta?), y por último se preparan los casos de prueba a partir de las normas, poniendo el foco en las fronteras: las horas en las que cambia la tarifa, los metros que completan un tramo, el mínimo y el suplemento.

**1. El problema.**

- **Entrada:** los metros recorridos, la hora a la que empieza la carrera (de 0 a 23), si es festivo y si va o viene del aeropuerto.
- **Salida:** el precio de la carrera, en céntimos, o «Datos no válidos».

Preguntas para la asociación (todas tienen respuesta en la pista 1):

| Lo que dice el correo | Lo que no está claro |
|---|---|
| «De noche» | ¿Desde qué hora hasta qué hora? ¿Cuenta la hora de empezar o la de terminar? |
| «De noche y en festivos» | ¿Un festivo por la noche paga algo más? |
| «Tramos de 100 metros» | ¿Se cobra el tramo empezado o solo los completos? |
| «La carrera mínima son 4 €» | ¿Con el suplemento del aeropuerto o sin él? |
| (lo que no se dice) | ¿Qué pasa con los datos imposibles? ¿Se cobran las esperas? |

**2. El algoritmo**, descompuesto en tres subalgoritmos y con los importes en céntimos:

```text
CONSTANTE BAJADA_BANDERA ← 250             // céntimos
CONSTANTE TRAMO_DIA ← 12                   // céntimos por cada 100 m
CONSTANTE TRAMO_NOCHE ← 15
CONSTANTE MINIMO ← 400
CONSTANTE SUPLEMENTO_AEROPUERTO ← 500

SUBALGORITMO EsTarifaNocturna(hora, esFestivo)
    DEVOLVER esFestivo O hora ≥ 21 O hora < 7
FIN SUBALGORITMO

SUBALGORITMO Tramos(metros)
    tramos ← metros DIV 100
    SI metros MOD 100 > 0 ENTONCES
        tramos ← tramos + 1                 // el tramo empezado se cobra entero
    FIN SI
    DEVOLVER tramos
FIN SUBALGORITMO

SUBALGORITMO PrecioCarrera(metros, hora, esFestivo, esAeropuerto)
    SI metros < 0 O hora < 0 O hora > 23 ENTONCES
        DEVOLVER "Datos no válidos"
    FIN SI
    SI EsTarifaNocturna(hora, esFestivo) ENTONCES
        precioTramo ← TRAMO_NOCHE
    SI NO
        precioTramo ← TRAMO_DIA
    FIN SI
    precio ← BAJADA_BANDERA + Tramos(metros) * precioTramo
    SI precio < MINIMO ENTONCES
        precio ← MINIMO                     // el mínimo, antes del suplemento
    FIN SI
    SI esAeropuerto ENTONCES
        precio ← precio + SUPLEMENTO_AEROPUERTO
    FIN SI
    DEVOLVER precio
FIN SUBALGORITMO

ALGORITMO TarifaTaxi
    ENTRADA: metros, hora de inicio, si es festivo y si va o viene del aeropuerto
    SALIDA: el precio de la carrera en céntimos, o un aviso si los datos no son válidos

INICIO
    LEER metros, hora, esFestivo, esAeropuerto
    ESCRIBIR PrecioCarrera(metros, hora, esFestivo, esAeropuerto)
FIN
```

`Tramos` hace lo mismo que `CalcularCajas(metros, 100)`; con su propio nombre, el algoritmo se entiende mejor. Y `EsTarifaNocturna` deja la regla de la noche y los festivos en un único sitio: si mañana la noche empieza a las 22, se cambia solo ahí.

**3. La tabla de casos de prueba** (metros, hora, festivo, aeropuerto), con las esperadas calculadas a mano con las normas:

| Nº | Qué se prueba | Entrada | Cuenta | Esperada |
|---|---|---|---|---|
| 1 | Normal: de día | 5000, 10, no, no | 250 + 50 × 12 | 850 |
| 2 | Normal: de noche | 5000, 23, no, no | 250 + 50 × 15 | 1000 |
| 3 | Normal: festivo de día | 5000, 10, sí, no | 250 + 50 × 15 | 1000 |
| 4 | Límite: las 6, todavía es de noche | 2000, 6, no, no | 250 + 20 × 15 | 550 |
| 5 | Límite: las 7, ya es de día | 2000, 7, no, no | 250 + 20 × 12 | 490 |
| 6 | Límite: las 20, todavía es de día | 2000, 20, no, no | 250 + 20 × 12 | 490 |
| 7 | Límite: las 21, ya es de noche | 2000, 21, no, no | 250 + 20 × 15 | 550 |
| 8 | Límite: un metro menos que 20 tramos | 1999, 10, no, no | 250 + 20 × 12 | 490 |
| 9 | Límite: un metro más que 20 tramos | 2001, 10, no, no | 250 + 21 × 12 | 502 |
| 10 | Límite: justo por debajo del mínimo | 1200, 10, no, no | 250 + 12 × 12 = 394 → mínimo | 400 |
| 11 | Límite: justo por encima del mínimo | 1201, 10, no, no | 250 + 13 × 12 | 406 |
| 12 | Carrera sin recorrido | 0, 10, no, no | 250 → mínimo | 400 |
| 13 | Aeropuerto, carrera larga | 20000, 10, no, sí | 250 + 200 × 12 + 500 | 3150 |
| 14 | Aeropuerto, carrera corta: mínimo y después suplemento | 1000, 10, no, sí | 250 + 10 × 12 = 370 → 400 + 500 | 900 |
| 15 | No válido: metros negativos | −1, 10, no, no | — | Datos no válidos |
| 16 | No válido: hora 24 | 5000, 24, no, no | — | Datos no válidos |
| 17 | No válido: hora negativa | 5000, −1, no, no | — | Datos no válidos |

**La traza con el caso 14** (1000 metros, a las 10, laborable, aeropuerto), el que combina más reglas:

| Paso | Instrucción | Condición o cálculo | `precioTramo` | `precio` |
|---|---|---|---|---|
| 1 | `SI metros < 0 O hora < 0 O hora > 23` | ¿1000 < 0? No; ¿10 < 0? No; ¿10 > 23? No → FALSO | — | — |
| 2 | `SI EsTarifaNocturna(10, FALSO)` | ¿FALSO O 10 ≥ 21 O 10 < 7? → FALSO | — | — |
| 3 | `precioTramo ← TRAMO_DIA` | — | 12 | — |
| 4 | `precio ← BAJADA_BANDERA + Tramos(1000) * precioTramo` | `Tramos(1000)`: 1000 DIV 100 = 10; 1000 MOD 100 = 0, no suma → 10. 250 + 10 × 12 = 370 | 12 | 370 |
| 5 | `SI precio < MINIMO` | ¿370 < 400? **Sí** | 12 | 400 |
| 6 | `SI esAeropuerto` | VERDADERO: se suma el suplemento | 12 | 900 |
| 7 | `DEVOLVER precio` | — | 12 | **900** |

Salida obtenida: 900. Esperada: 900 ✅. Con el resto de la tabla pasa lo mismo: los 17 casos dan la salida esperada.

Fíjate en el caso 14: si el algoritmo sumara el suplemento **antes** de aplicar el mínimo, daría 370 + 500 = 870, que ya supera los 4 € y no se tocaría. Esa diferencia de 30 céntimos solo la descubre un caso que junte una carrera corta con el aeropuerto: por eso conviene probar también **las combinaciones** de reglas, no solo cada regla por separado.

**4. Opcional: en otro estilo.**

- **Orientado a objetos:** cada carrera sería un objeto que reúne sus datos y sabe calcular su precio. El cálculo no cambia, pero queda junto a los datos a los que se refiere:

  ```text
  OBJETO Carrera
      DATOS: metros, hora, esFestivo, esAeropuerto
      SUBALGORITMO Precio()
          DEVOLVER PrecioCarrera(metros, hora, esFestivo, esAeropuerto)
      FIN SUBALGORITMO
  FIN OBJETO
  ```

  La aplicación le preguntaría a cada carrera: `carrera.Precio()`.
- **Declarativo:** las tarifas (bajada de bandera, precio del tramo de día y de noche, mínimo y suplemento) podrían guardarse como una tabla de datos o un fichero de configuración, en lugar de como constantes del algoritmo. Cuando el ayuntamiento actualizara las tarifas, se cambiaría el fichero sin tocar el algoritmo.

**Errores frecuentes al resolverlo:**

- Inventarse las respuestas a las dudas del correo en lugar de preguntarlas. En un encargo real, cada suposición es un riesgo.
- Cobrar solo los tramos completos (1999 metros como 19 tramos): se olvida el tramo empezado.
- Poner las horas de la noche al revés (`hora ≥ 21 Y hora < 7`): ninguna hora cumple las dos cosas a la vez, así que de noche se cobraría la tarifa de día. Los casos 2, 4 y 7 lo descubren.
- Aplicar el mínimo después del suplemento. Solo lo descubre el caso 14.
- Trabajar con euros y decimales en lugar de céntimos, y arrastrar redondeos.

</details>

---
⬅️ [Anterior: Paradigmas de programación](04-paradigmas-de-programacion.md) · 📚 [Índice](../00-indice.md)
