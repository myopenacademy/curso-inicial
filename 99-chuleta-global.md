# Chuleta global

> Todas las chuletas de los módulos del curso, reunidas en un solo fichero para consultarlas rápido.
> Se genera con `generar_chuleta_global.py` del kit de cursos: no lo edites a mano.

📚 [Índice del curso](00-indice.md) · 🏠 [Portada](README.md)

## Contenido

- **Fase 01 — Qué es programar**
  - [01.01 Qué es programar](#0101-qué-es-programar)

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
📚 [Índice del curso](00-indice.md) · 🏠 [Portada](README.md)
