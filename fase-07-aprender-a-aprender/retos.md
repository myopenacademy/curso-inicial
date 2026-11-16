# Retos de la fase 07 — Aprender a aprender

> **Versiones:** Git 2.56; salidas de la 2.56.0; la más reciente, la 2.56.1 (a 16 de noviembre de 2026) · Plantillas de *issue* de GitHub, según su documentación a 16 de noviembre de 2026
> **Conviene saber antes:** [07.01 Cómo estudiar con estos cursos](01-como-estudiar.md) · [07.02 Organizar tu trabajo](02-organizar-tu-trabajo.md) · [07.03 Buscar ayuda](03-buscar-ayuda.md) · [07.04 Programar con asistentes de IA](04-programar-con-asistentes-de-ia.md) · [07.05 Seguridad básica](05-seguridad-basica.md)
> **Tiempo estimado:** 2 horas

Estos retos mezclan lo que has aprendido en la fase: cómo estudiar ([07.01](01-como-estudiar.md)), dividir el trabajo en tareas y llevarlo en un tablero ([07.02](02-organizar-tu-trabajo.md)), pedir ayuda bien ([07.03](03-buscar-ayuda.md)), trabajar con un asistente de IA sin dejar de comprobar ([07.04](04-programar-con-asistentes-de-ia.md)) y guardar los secretos donde deben estar ([07.05](05-seguridad-basica.md)). Usarás también Git y el `.gitignore` de la [fase 5](../fase-05-git-y-github/01-git-fundamentos.md#112-lo-que-no-va-en-git-gitignore).

Van de menor a mayor dificultad, y el último es el más completo. Son **opcionales**: sirven para afianzar lo aprendido y no bloquean nada. El primero se resuelve pensando y escribiendo; el 2 y el 3, **en tu terminal**: descarga la carpeta de cada reto (su enlace «📁 Código»), abre la terminal en ella y trabaja ahí. Cada uno crea su repositorio en una carpeta nueva dentro de esa carpeta, así que, si lo estropeas, borra lo que hayas creado y empieza otra vez. Abre las pistas solo si te atascas y, si tu solución es distinta de la propuesta, comprueba que deja los mismos ficheros en Git y los mismos fuera: puede estar igual de bien.

Recuerda que los identificadores de tus commits, sus fechas y su autor serán distintos de los del curso ([el aviso de 02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal)), y que en Git Bash verás además el aviso de los saltos de línea en los `git add` ([05.01, apartado 1.16](../fase-05-git-y-github/01-git-fundamentos.md#116-un-recordatorio-los-saltos-de-línea)). Todas las claves de estos retos son **de mentira** (`clave-de-prueba-123`), y los nombres, teléfonos y dominios, inventados.

## Reto 1 · El plan de estudio de Esther

**Situación real:** Esther acaba de terminar la fase 7. En enero empezará a ayudar con la web de su asociación de vecinos, que está en GitHub y se organiza con *issues* y *pull requests*. Hizo la fase 5 deprisa, y no se siente segura con Git. Quiere llegar a enero con Git dominado, y tiene **cuatro semanas**, del lunes 23 de noviembre al sábado 19 de diciembre de 2026. Puede estudiar **30 minutos los lunes, miércoles y jueves**, al volver del trabajo, y **hora y media los sábados** por la mañana: tres horas a la semana.

En su diario de lo aprendido quedan cuatro dudas sin resolver:

- ¿Cuándo hay que poner comillas en un valor de YAML?
- Si `git pull` dice `CONFLICT`, ¿qué hago?
- ¿Qué diferencia hay entre `git fetch` y `git pull`?
- ¿Una plantilla de *issue* tiene que estar en `main`?

Y este es el borrador de su plan:

1. Repasar Git.
2. Releer enteros 05.01, 05.02 y 05.03.
3. El sábado 28, seis horas seguidas de Git, para quitármelo de encima.
4. Resolver las dudas del diario.
5. Hacer los retos de la fase 5 con la solución abierta al lado, para ir más rápido.
6. Pedirle a un asistente de IA que me haga los ejercicios de conflictos, y leerlos.
7. Montar en GitHub Projects un tablero con diez columnas, colores y *labels* para todo.

Tu trabajo:

1. **Revisa el borrador:** para cada punto, di qué falla y cómo lo cambiarías.
2. **Escribe el plan como tareas**, entre 6 y 8, cada una con su **criterio de hecho**, y que quepan en las sesiones que tiene Esther.
3. **Repártelas** en sus cuatro semanas y dale un **límite de trabajo en curso**, explicando por qué.
4. **La segunda semana pasan dos cosas.** El lunes, al rehacer el [ejercicio 3 de 05.02](../fase-05-git-y-github/02-ramas-y-conflictos.md#ejercicio-3--resuelve-el-conflicto), su `git log --oneline --graph` no se parece al de la solución, y no sabe por qué. Y el miércoles, la presidenta de la asociación le pregunta si puede ir mirando ya cómo está hecha la web. ¿Qué hace Esther con cada cosa, y cómo queda su tablero el sábado por la mañana?
5. **Y ahora, el tuyo:** escribe tu propio plan para lo que vas a estudiar el próximo mes, con las mismas reglas. Este no tiene solución: es tuyo.

<details>
<summary>Pista 1</summary>

Para el punto 1, pásale a cada línea dos filtros: lo que **funciona al estudiar** ([07.01, apartado 1.8](01-como-estudiar.md#18-lo-que-funciona-al-estudiar) y [1.9](01-como-estudiar.md#19-sesiones-cortas-con-descansos-y-repartidas)) y lo que hace **una buena tarea** ([07.02, apartado 1.2](02-organizar-tu-trabajo.md#12-dividir-un-problema-en-tareas)). Hay una línea que choca además con una de las [cinco normas](04-programar-con-asistentes-de-ia.md#110-las-cinco-normas-de-la-academia).

</details>

<details>
<summary>Pista 2</summary>

¿Cómo sabe Esther qué parte de Git tiene floja, sin releerlo todo? Ponerse a prueba sirve también para eso: empieza por ahí. Y para el criterio de hecho de una tarea de estudio, piensa en algo que se compruebe **sin mirar**: contestar, rehacer, llegar al mismo resultado.

</details>

<details>
<summary>Pista 3</summary>

Para el punto 4: un fallo que no entiendes se reduce y se pregunta bien ([07.03, apartados 1.8](03-buscar-ayuda.md#18-cómo-hacer-una-buena-pregunta) y [1.9](03-buscar-ayuda.md#19-el-ejemplo-mínimo-que-reproduce-el-fallo)), y una tarea que espera una respuesta sigue ocupando su sitio en «En curso». Lo nuevo, ¿dónde entra ([07.02, ejemplo 2.2](02-organizar-tu-trabajo.md#22-un-día-en-el-tablero))?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el borrador mezcla dos problemas. Unos puntos son **tareas mal escritas** (no se sabe cuándo están hechas); otros son **formas de estudiar que parecen funcionar y no funcionan** (releer, el atracón, mirar la solución). Lo primero es averiguar qué sabe y qué no, poniéndose a prueba; con eso, las tareas salen solas.

**1. El borrador, punto por punto:**

| # | Qué falla | Cómo lo cambiaría |
|---|---|---|
| 1 | No es una tarea: no deja nada que se pueda enseñar ni se sabe cuándo termina ([07.02, error típico 3.1](02-organizar-tu-trabajo.md#31-tareas-demasiado-grandes)) | Dividirlo en tareas concretas, empezando por averiguar qué le falta |
| 2 | Releer da sensación de saber, pero fija poco ([07.01, error típico 3.2](01-como-estudiar.md#32-releer-hasta-que-suena)). Y son tres módulos enteros, lo sepa o no | Contestar sin mirar las preguntas de repaso, y volver solo a lo que falle |
| 3 | Un atracón: seis horas de golpe cunden menos que repartidas ([07.01, error típico 3.3](01-como-estudiar.md#33-un-atracón-el-fin-de-semana)). Y además no cabe en su semana | Repartir: tres sesiones cortas y una larga cada semana |
| 4 | Cuatro cosas distintas en una tarea, sin criterio de hecho | Una tarea por duda, o agrupadas por tema, cada una con su respuesta escrita en el diario |
| 5 | Con la solución al lado no se pone a prueba: solo lee ([07.01, error típico 3.1](01-como-estudiar.md#31-abrir-la-solución-a-los-dos-minutos)) | Los retos, con la solución plegada; las pistas, solo si se atasca |
| 6 | Va contra la norma 1: intentarlo primero, y la IA como profesor, no como solucionador ([07.04, error típico 3.1](04-programar-con-asistentes-de-ia.md#31-pegar-el-enunciado-del-ejercicio-y-copiar-la-solución)) | Hacer ella los ejercicios; si se atasca, pedir a la IA una pista o que le explique su error, no la solución |
| 7 | Organizar en lugar de trabajar ([07.02, error típico 3.6](02-organizar-tu-trabajo.md#36-organizar-en-lugar-de-trabajar)) | Tres columnas y un límite. En papel, en un fichero o en Projects, da igual |

**2. Las tareas:**

| # | Tarea | Está hecha cuando… |
|---|---|---|
| 1 | Contestar sin mirar las preguntas de repaso de 05.01, 05.02 y 05.03 | Las ha contestado todas por escrito, ha comparado con las respuestas y tiene en el diario la lista de las que ha fallado |
| 2 | Resolver la duda de las comillas en YAML | El diario tiene la respuesta con sus palabras y un ejemplo que ha comprobado en VS Code |
| 3 | Resolver las dudas de `fetch` y `pull` y de la plantilla en `main` | El diario tiene las dos respuestas con sus palabras, cada una con el enlace al apartado que la explica |
| 4 | Rehacer sin mirar los ejercicios de conflictos de 05.02 | En cada uno llega al mismo historial y a los mismos ficheros que la solución, sin abrirla hasta terminar |
| 5 | Hacer el reto 1 de la fase 5 | Llega al mismo historial que la solución, como mucho con las pistas |
| 6 | Hacer el reto 2 de la fase 5 | Igual |
| 7 | Hacer el reto 3 de la fase 5 | Igual |
| 8 | Volver a contestar las preguntas que falló en la tarea 1 | Las acierta todas sin mirar |

La duda de `CONFLICT` no tiene tarea propia: la resuelve la tarea 4, y se apunta en el diario al terminarla.

**3. El reparto y el límite:**

| Semana | Lunes, miércoles y jueves (30 min) | Sábado (1,5 h) |
|---|---|---|
| 1 (23 al 28 de noviembre) | Tarea 1: las preguntas de 05.01, de 05.02 y de 05.03, un módulo por sesión | Tareas 2 y 3 |
| 2 (30 de noviembre al 5 de diciembre) | Tarea 4 (dos sesiones); repaso | Tarea 5 |
| 3 (7 al 12 de diciembre) | Repasar lo que falló en la tarea 1 (prepara la tarea 8), un apartado por sesión | Tarea 6 |
| 4 (14 al 19 de diciembre) | Tarea 8; repaso | Tarea 7 |

- **La tarea 1 va la primera** porque dice qué hay que repasar; cabe en tres sesiones cortas, un módulo cada una.
- **Lo corto, entre semana; lo largo, el sábado.** Una duda o las preguntas de un módulo caben en 30 minutos; un reto de Git, no. Cada tarea cabe en una o dos sesiones ([07.02, apartado 1.2](02-organizar-tu-trabajo.md#12-dividir-un-problema-en-tareas)).
- **Cada sesión empieza con unos minutos de repaso** de la anterior y **termina con su entrada en el diario** y su commit ([07.01, apartados 1.9](01-como-estudiar.md#19-sesiones-cortas-con-descansos-y-repartidas) y [1.10](01-como-estudiar.md#110-el-diario-de-lo-aprendido)).
- **La tarea 8 va al final a propósito:** volver a lo que falló dos o tres semanas después es el repaso repartido que lo fija.
- **Límite de trabajo en curso: 2.** Una tarea en la que trabaja y, como mucho, otra que espera algo (una respuesta). Con sesiones de 30 minutos, tener tres cosas empezadas sería no terminar ninguna ([07.02, apartado 1.5](02-organizar-tu-trabajo.md#15-limitar-el-trabajo-en-curso)).
- **Cómo sabrá que ha terminado:** cuando la tarea 8 esté en «Hecho» y los tres retos le hayan salido sin abrir la solución. No antes, aunque se le acaben las semanas: si algo falla, el plan se ajusta, no se da por bueno.

**4. La segunda semana:**

- **El ejercicio que no sale.** Primero intenta encontrar el fallo ella sola: compara sus órdenes con las del enunciado **una a una** y repite el ejercicio desde cero en una carpeta nueva ([reproducir el error](../fase-03-herramientas/04-errores-y-depuracion.md#13-reproducir-el-error)). Si al final de la sesión sigue igual, no se queda atascada ni abre la solución: escribe una **buena pregunta** con lo que ha tecleado, lo que esperaba y lo que obtiene, lo que ha probado y su versión de Git ([07.03, apartado 1.8](03-buscar-ayuda.md#18-cómo-hacer-una-buena-pregunta)), y la manda a un foro, o se la hace a un asistente de IA como profesor: «explícame por qué mi gráfico es distinto; no me des la solución» ([07.04, apartado 1.9](04-programar-con-asistentes-de-ia.md#19-usar-la-ia-como-profesor)). La tarjeta se queda en «En curso», **esperando respuesta**.
- **La petición de la presidenta.** No la empieza: no está en el plan y no hay hueco. La apunta como tarea nueva **al final de «Por hacer»**, o mejor, en una lista para enero, porque mirar la web no la acerca a su objetivo de este mes. Le contesta cuándo podrá: en enero, como quedaron.
- **El sábado**, con la tarea 4 esperando y una sola en curso de verdad, empieza la tarea 5. Están en el límite: dos.

Así queda su tablero el sábado 5 de diciembre por la mañana:

```text
POR HACER                         EN CURSO (máx. 2)                 HECHO
--------------------------------  --------------------------------  --------------------------------
6. Hacer el reto 2 de la fase 5   4. Rehacer los ejercicios de      1. Contestar las preguntas
7. Hacer el reto 3 de la fase 5     conflictos (esperando              de repaso de la fase 5
8. Volver a contestar las           respuesta en el foro)           2. Resolver la duda de las
   que fallé                      5. Hacer el reto 1 de la fase 5      comillas en YAML
9. Mirar cómo está hecha la web                                     3. Resolver las dudas de
   de la asociación (enero)                                            fetch, pull y la plantilla
```

**Errores frecuentes al resolverlo:**

- **Tareas que son temas** («Git», «conflictos»): no se sabe cuándo están hechas. El verbo y el criterio de hecho lo arreglan.
- **Criterios que no se comprueban**: «entender los conflictos». ¿Cómo lo sabe? Rehaciendo un ejercicio sin mirar y llegando al mismo resultado.
- **Planear sin ponerse a prueba**, y dedicar el mismo tiempo a lo que sabe que a lo que no.
- **Abrir la solución del ejercicio que no sale** «para avanzar»: avanza el tablero, pero no ella. Y si la abre, lo honrado es dejar la tarea en «En curso» y repetir el ejercicio otro día sin mirar.
- **Empezar lo de la presidenta «porque es un momento»**: con tres cosas en curso y 30 minutos por sesión, no termina ninguna.

</details>

## Reto 2 · Antes de publicar los recordatorios del banco de tiempo

**Situación real:** en el Banco de Tiempo del Arrabal, los socios intercambian horas de ayuda: una clase de guitarra por el arreglo de una persiana. Ramón, uno de los socios, ha hecho un script que manda a cada socio, por SMS, el recordatorio de los intercambios que tiene al día siguiente. A Lidia, la coordinadora, le gusta tanto que quiere publicarlo en GitHub, en un repositorio **público**, para que lo usen otros bancos de tiempo. Ramón te ha mandado su carpeta por correo, en un ZIP, para que la revises antes.

Este script crea la carpeta `recordatorios` tal como te la manda Ramón. Ejecútalo con `bash preparar.sh` en la carpeta del reto. No hace falta que lo leas: el reto es averiguar lo que hay **con la terminal y con Git**, como si no supieras cómo se hizo.

```bash
#!/usr/bin/env bash
# Prepara el reto 2: la carpeta recordatorios, tal como te la pasa Ramón.
# Los commits llevan su nombre: git -c cambia la configuración solo para esa
# orden. Todos los datos son inventados, y la clave, de mentira.
mkdir recordatorios && cd recordatorios || exit 1
git init -q
printf '%s\n' '# Recordatorios del Banco de Tiempo del Arrabal' '' \
  'Manda a cada socio un SMS con los intercambios que tiene al día siguiente.' > README.md
printf '%s\n' '#!/usr/bin/env bash' \
  '# Manda a cada socio el recordatorio de sus intercambios de mañana.' \
  '# La clave del servicio de SMS está en el fichero .env.' \
  '. ./.env' > avisar.sh
printf '.env\n' > .gitignore.txt
git add README.md avisar.sh .gitignore.txt
git -c user.name="Ramón Ferrer" -c user.email=ramon@example.com commit -q -m "Primera versión de los recordatorios"
printf '%s\n' '#!/usr/bin/env bash' \
  '# Manda a cada socio el recordatorio de sus intercambios de mañana.' \
  '# Si no hay .env, usa la clave de siempre, para que funcione en cualquier ordenador.' \
  'CLAVE_SMS=clave-de-prueba-123' \
  '[ -f .env ] && . ./.env' > avisar.sh
git add avisar.sh
git -c user.name="Ramón Ferrer" -c user.email=ramon@example.com commit -q -m "Que funcione también sin .env"
# Lo que hay en la carpeta de Ramón y no está en Git
printf 'CLAVE_SMS=clave-de-prueba-123\n' > .env
printf '%s\n' 'nombre,telefono' 'Amparo Gil,600111222' 'Fabián Ortega,600333444' \
  'Nieves Prado,600555666' > socios.csv
printf '%s\n' '2026-11-15 20:00 SMS a 600111222: mañana, 10:00, clase de guitarra' \
  '2026-11-15 20:00 SMS a 600555666: mañana, 17:30, arreglo de una persiana' > envios.log
echo "Listo: la carpeta recordatorios es la que te pasa Ramón."
```

📁 **Código:** [`codigo/retos/reto-02-antes-de-publicar-los-recordatorios/`](codigo/retos/reto-02-antes-de-publicar-los-recordatorios/)

**Salida:**

```text
Listo: la carpeta recordatorios es la que te pasa Ramón.
```

(El script es la versión reducida del de Ramón: solo tiene las líneas que importan para el reto. El de verdad, después, lee `socios.csv` y llama al servicio de SMS.)

Tu trabajo:

1. **¿Qué entraría en el repositorio con un `git add .`?** Ramón dice que tiene un `.gitignore` para el `.env`. ¿Por qué no funciona?
2. **Busca el secreto:** ¿dónde está la clave del servicio de SMS, además del `.env`? ¿Desde qué commit, y quién la puso?
3. **Arregla el `.gitignore`** para que no entren en Git ni la clave ni los datos de los socios, **compruébalo antes del commit**, añade un `.env.example` y haz el commit. El script es de Ramón: no lo cambies tú.
4. **Escribe para Ramón y Lidia qué hay que cambiar**, en orden, antes de hacer público el repositorio.

<details>
<summary>Pista 1</summary>

`git status --short` te dice qué entraría; `git check-ignore -v .env`, si el `.env` está ignorado y por qué línea ([05.01, apartado 1.12](../fase-05-git-y-github/01-git-fundamentos.md#112-lo-que-no-va-en-git-gitignore)). Si no lo está, mira con `ls -a` cómo se llama de verdad el `.gitignore`: Ramón trabaja en Windows, y recuerda la [extensión escondida](../fase-02-tu-ordenador/02-archivos-carpetas-y-rutas.md#36-la-extensión-escondida).

</details>

<details>
<summary>Pista 2</summary>

`grep -i -n clave *` busca la palabra en todos los ficheros de la carpeta, sin distinguir mayúsculas, y dice en qué línea (el `*` no incluye los ocultos, como el `.env`, que ya sabes lo que tiene). Después, `git log --oneline -- avisar.sh` y `git show` con el identificador del commit que sospeches ([05.01, apartado 1.10](../fase-05-git-y-github/01-git-fundamentos.md#110-ver-los-cambios-diff-y-show)).

</details>

<details>
<summary>Pista 3</summary>

Renombrar un fichero que ya vigila Git es [`git mv`](../fase-05-git-y-github/01-git-fundamentos.md#114-renombrar-y-borrar-git-mv-y-git-rm). Para el punto 4, sigue el plan de [07.05, apartado 1.15](05-seguridad-basica.md#115-si-se-escapa-un-secreto): ¿por qué canal te ha llegado la clave? ¿Y quién la tendrá cuando el repositorio sea público?

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se mira, después se toca. `git status` dice qué entraría; `git check-ignore`, por qué no se ignora; `grep` y `git show`, dónde está el secreto y desde cuándo. El `.gitignore` se arregla y se comprueba **antes** del commit. Y lo que de verdad protege, cambiar la clave, no lo hace Git: lo hace Ramón en el servicio de SMS.

**Puntos 1 y 2: revisar.**

**En tu terminal** (`sesion-1.txt`):

```text
$ bash preparar.sh
Listo: la carpeta recordatorios es la que te pasa Ramón.
$ cd recordatorios
$ git status --short
?? .env
?? envios.log
?? socios.csv
$ ls -a
.  ..  avisar.sh  .env  envios.log  .git  .gitignore.txt  README.md  socios.csv
$ git check-ignore -v .env
$ echo $?
1
$ git ls-files
.gitignore.txt
README.md
avisar.sh
$ grep -i -n clave *
avisar.sh:3:# Si no hay .env, usa la clave de siempre, para que funcione en cualquier ordenador.
avisar.sh:4:CLAVE_SMS=clave-de-prueba-123
$ git log --oneline -- avisar.sh
8980ceb (HEAD -> main) Que funcione también sin .env
cbad7ac Primera versión de los recordatorios
$ git show 8980ceb
commit 8980ceb8b3a9938f019cee165673e02b10a97db1 (HEAD -> main)
Author: Ramón Ferrer <ramon@example.com>
Date:   Thu Jan 15 10:01:00 2026 +0100

    Que funcione también sin .env

diff --git a/avisar.sh b/avisar.sh
index 511d998..df0ca50 100644
--- a/avisar.sh
+++ b/avisar.sh
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
 # Manda a cada socio el recordatorio de sus intercambios de mañana.
-# La clave del servicio de SMS está en el fichero .env.
-. ./.env
+# Si no hay .env, usa la clave de siempre, para que funcione en cualquier ordenador.
+CLAVE_SMS=clave-de-prueba-123
+[ -f .env ] && . ./.env
```

📁 **Código:** [`codigo/retos/reto-02-antes-de-publicar-los-recordatorios/`](codigo/retos/reto-02-antes-de-publicar-los-recordatorios/)

- **`git status --short` da la alarma:** tres ficheros sin seguimiento (`??`), y un `git add .` los metería los tres en el siguiente commit: el `.env` con la clave, `socios.csv` con los teléfonos de los socios y `envios.log`, el registro de los SMS enviados, que también lleva teléfonos.
- **`ls -a` dice por qué:** no hay ningún `.gitignore`. Hay un **`.gitignore.txt`**: Ramón lo creó con un editor de Windows que añadió `.txt`, y el explorador de archivos le escondía la extensión. Git solo lee un fichero que se llame **exactamente** `.gitignore`, así que el de Ramón no sirve de nada.
- **`git check-ignore -v .env` no escribe nada**, y su código de salida es `1`: el `.env` **no** está ignorado. Es la forma rápida de comprobarlo sin fiarte de lo que te cuenten.
- **`git ls-files`** enseña lo que ya está en Git: `.gitignore.txt` entró en el primer commit, con su nombre equivocado.
- **`grep` encuentra la clave fuera del `.env`**, en la línea 4 de `avisar.sh`. La línea 4 le da a `CLAVE_SMS` la clave de siempre, y la 5 la cambia por la del `.env`, si lo hay: Ramón escribió la clave **dentro del script** para no tener que copiar el `.env` a otro ordenador. Y `avisar.sh` sí está en Git.
- **`git log` y `git show` dicen desde cuándo y quién:** el commit `8980ceb`, de Ramón, «Que funcione también sin .env». La línea con `+` es la clave. Aunque mañana se borre del script, **seguirá en ese commit**, y cualquiera que clone el repositorio podrá leerla con `git show 8980ceb`.

**Punto 3: arreglar el `.gitignore`.**

**En tu terminal** (`sesion-2.txt`):

```text
$ cd recordatorios
$ git mv .gitignore.txt .gitignore
$ printf '*.log\nsocios.csv\n' >> .gitignore
$ cat .gitignore
.env
*.log
socios.csv
$ git check-ignore -v .env envios.log socios.csv
.gitignore:1:.env       .env
.gitignore:2:*.log      envios.log
.gitignore:3:socios.csv socios.csv
$ printf 'CLAVE_SMS=escribe-aqui-la-clave\n' > .env.example
$ git status --short
RM .gitignore.txt -> .gitignore
?? .env.example
$ git add .
$ git commit -m "Arregla el .gitignore y añade el .env.example"
[main 2ce4e76] Arregla el .gitignore y añade el .env.example
 3 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 .env.example
 create mode 100644 .gitignore
 delete mode 100644 .gitignore.txt
$ git ls-files
.env.example
.gitignore
README.md
avisar.sh
```

📁 **Código:** [`codigo/retos/reto-02-antes-de-publicar-los-recordatorios/`](codigo/retos/reto-02-antes-de-publicar-los-recordatorios/)

- **`git mv`** cambia el nombre y deja el cambio preparado; después, `>>` añade dos líneas al final: `*.log` para cualquier registro y `socios.csv` por su nombre (no `*.csv`: mañana puede haber un CSV de ejemplo que sí deba entrar).
- **`git check-ignore -v` con los tres ficheros, antes del commit**, da una línea por fichero con la línea del `.gitignore` que lo ignora. Ahora sí.
- **`git status --short`** ya no enseña ni el `.env`, ni `socios.csv`, ni `envios.log`. `RM` quiere decir que el fichero está renombrado y preparado (`R`) y que después ha cambiado (`M`, las dos líneas nuevas); el `git add .` lo prepara todo. En el commit, Git lo cuenta como un fichero borrado y otro creado, porque el contenido ha cambiado demasiado para verlo como un cambio de nombre: el resultado es el mismo.
- **El `.env.example`** le dice a quien descargue el proyecto qué tiene que rellenar, con un valor que se ve falso ([04.04, apartado 1.14](../fase-04-formatos-y-diagramas/04-xml-csv-y-otros.md#114-el-fichero-env-y-los-secretos)).
- **Y `git ls-files` enseña lo que todavía falla:** `avisar.sh` sigue en Git, con la clave dentro. El `.gitignore` protege lo que **no** ha entrado; lo que ya está en un commit no lo arregla ([05.01, apartado 1.12](../fase-05-git-y-github/01-git-fundamentos.md#112-lo-que-no-va-en-git-gitignore)).

> **📌 Nota:** si quieres ir un paso más allá, cambia la línea `.env` por las dos de [07.05, ejercicio 6](05-seguridad-basica.md#ejercicio-6--un-gitignore-para-varios-ficheros-env), `.env*` y `!.env.example`: así tampoco entraría un `.env.pruebas` que alguien cree mañana.

**Punto 4: lo que hay que cambiar, en orden.** Es el plan de [07.05, apartado 1.15](05-seguridad-basica.md#115-si-se-escapa-un-secreto), aplicado a este caso:

| # | Quién | Qué | Por qué |
|---|---|---|---|
| 1 | Ramón | **Anular la clave en el servicio de SMS y crear una nueva**, hoy | La clave está en un commit y ha viajado por correo en un ZIP, que no es un [canal seguro](05-seguridad-basica.md#114-pasar-un-secreto-por-un-canal-seguro): está escapada. Es lo único que la deja sin valor |
| 2 | Ramón | Guardar la clave nueva **solo en su `.env`** (y en el ordenador donde funcione el script) | Nadie más la necesita: ni Lidia, ni tú, que has revisado todo sin usarla |
| 3 | Ramón | **Quitar la clave de `avisar.sh`**: si no hay `.env`, que el script se pare y diga que hay que copiar `.env.example` como `.env` | Una clave en el código acaba siempre en Git. Y un script que falla con un mensaje claro es mejor que uno que funciona con la clave de otro |
| 4 | Ramón y Lidia | Decidir qué hacer con el historial: con la clave anulada, la del commit `8980ceb` ya no abre nada. Como todavía no lo ha clonado nadie (solo está tu copia, que vas a borrar), lo más limpio es publicar uno nuevo, sin ese commit ([05.03, ejercicio 5](../fase-05-git-y-github/03-github.md#ejercicio-5--antes-de-hacer-público-el-repositorio-de-la-protectora)) | Lo que no vale es publicarlo **con la clave viva**: hay programas que recorren GitHub buscando claves |
| 5 | Ramón | Añadir un `socios.ejemplo.csv` con datos inventados y explicar en el README cómo se instala (copiar `.env.example`, poner su `socios.csv`) | Los otros bancos de tiempo necesitan saber qué forma tienen los ficheros, no los teléfonos del Arrabal |
| 6 | Tú | **Borrar el ZIP** y la carpeta en cuanto termines la revisión, y pedir a Ramón que la próxima vez mande solo lo que está en Git | En el ZIP venían la clave y los teléfonos de los socios, que son datos personales: cuantas menos copias, mejor |
| 7 | Lidia | Antes de hacerlo público, añadir una licencia ([05.03, apartado 1.14](../fase-05-git-y-github/03-github.md#114-el-escaparate-readme-licencia-y-perfil)) | Sin ella, los otros bancos de tiempo no pueden usarlo legalmente, que es justo lo que quiere |

**Errores frecuentes al resolverlo:**

- **Creer que el `.gitignore` funciona porque «está»**: hasta que `git check-ignore -v` no lo dice, no está comprobado.
- **Arreglar el `.gitignore` y dar el trabajo por terminado**: la clave sigue en `avisar.sh` y en el historial.
- **Borrar la línea de `avisar.sh` con un commit nuevo y publicar**: la clave seguiría en `8980ceb`, como el `config.ini` de [05.01, ejercicio 6](../fase-05-git-y-github/01-git-fundamentos.md#ejercicio-6--una-contraseña-dentro-del-repositorio). Primero se anula.
- **Añadir `avisar.sh` al `.gitignore`** «porque tiene la clave»: es el programa, lo que se quiere publicar. Y como ya está en Git, el `.gitignore` no le haría nada.
- **Pasar por alto `socios.csv` y `envios.log`** porque no son claves: son datos personales de otras personas, y en un repositorio público los leería cualquiera.
- **Pedirle a Ramón la clave nueva para comprobar que funciona**: no te hace falta, y sería otra copia.

</details>

## Reto 3 · El repositorio de la asociación astronómica

**Situación real:** Candela preside la Asociación Astronómica Perseidas, que organiza noches de observación para socios y vecinos. Aitor, un socio que acaba de terminar este curso, va a hacer la web de las noches, y en la asociación quieren que más socios colaboren. Habrá un script que, dos días antes de cada noche, consulta la previsión de nubes en un servicio del cielo (`api.cielo.example`), y ese servicio pide una **clave**.

Antes de escribir una línea de la web, Aitor quiere dejar el repositorio preparado para que la clave no pueda entrar nunca en Git y para que las propuestas de los socios lleguen bien escritas. El script dejará su registro en `cielo.log`, en la carpeta principal del proyecto. Aitor le ha pedido a un asistente de IA un `.gitignore` «que no suba los secretos ni los registros», y le ha dado este:

```text
.env*
!.env.example
logs/
```

Prepara tú el repositorio, en una carpeta nueva, `perseidas`, con todo esto **antes del primer commit**:

1. **Un `.env.example`** con las dos variables que necesita el script, `CIELO_API_URL` (`https://api.cielo.example/v1`) y `CIELO_CLAVE`, la segunda con un valor que se vea falso, y un comentario que diga qué hacer con él.
2. **El `.env` de Aitor**, con su clave (aquí, la de mentira, `clave-de-prueba-123`). No puede entrar en Git, ni él ni ningún otro `.env` con un nombre más largo que aparezca mañana (`.env.local`…). Los registros, tampoco. El `.env.example`, **sí**.
3. **El `.gitignore`**: el del asistente, **comprobado** antes de fiarte, y arreglado si hace falta.
4. **Una plantilla de *issue*** para proponer una noche: que se llame **Noche de observación**, con una frase que explique para qué es; que el título empiece por `Observación: ` y que ponga sola la *label* `enhancement`. Debe pedir qué se verá, la fecha, la hora y el lugar (con una fecha de reserva por si hay nubes), el material, y un criterio de hecho en casillas.
5. **Un `README.md`** que diga qué es el proyecto y cómo colaborar: cómo preparar el `.env`, qué no se hace nunca con las claves y cómo proponer una noche.
6. **La comprobación**, con `git check-ignore -v`, de que se ignora lo que debe y **no** se ignora lo que debe entrar. Después, el commit, y comprobar qué ha entrado.

<details>
<summary>Pista 1</summary>

Tienes casi todo en dos ejemplos: el proyecto con secretos de [07.05, ejemplo 2.4](05-seguridad-basica.md#24-un-proyecto-con-secretos-desde-el-primer-commit) y la plantilla de [07.02, ejemplo 2.3](02-organizar-tu-trabajo.md#23-una-plantilla-de-issue-para-las-tareas). Escribe los ficheros en VS Code, en la carpeta del reto, y cópialos después al repositorio, como en [07.02, ejercicio 5](02-organizar-tu-trabajo.md#ejercicio-5--una-plantilla-para-avisar-de-un-fallo).

</details>

<details>
<summary>Pista 2</summary>

Lo del asistente se comprueba como todo lo que da una IA ([07.04, apartado 1.7](04-programar-con-asistentes-de-ia.md#17-comprobar-siempre-con-tus-casos-de-prueba)): ¿hace lo que pediste, **y solo eso**? Pregúntale a Git por cada fichero que debe quedar fuera **y por cada uno que debe entrar**. `git check-ignore` admite también nombres de ficheros que todavía no existen, como `.env.local`.

</details>

<details>
<summary>Pista 3</summary>

En la cabecera de la plantilla, cuidado con los dos puntos: en YAML, `clave: valor` se rompe si el valor lleva a su vez dos puntos y un espacio (`about: Propón una noche: qué ver…`). Ese valor va entre comillas, como el `title` ([07.02, apartado 1.7](02-organizar-tu-trabajo.md#17-plantillas-de-issue)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** el orden lo es todo. Primero, el `.gitignore` y su **comprobación**, antes de que nada pueda entrar en un commit; después, el resto de ficheros; y el commit, solo cuando Git dice que ignora lo que debe y deja entrar lo que debe. Lo que da el asistente es un borrador más, que se prueba con tus casos: aquí, los nombres de los ficheros.

**Los ficheros.** El `.env.example`:

```text
# Copia este fichero como .env y escribe ahí tu clave del servicio del cielo.
# Cada persona pide la suya: la clave no se comparte ni se sube a Git.
CIELO_API_URL=https://api.cielo.example/v1
CIELO_CLAVE=escribe-aqui-tu-clave
```

📁 **Código:** [`codigo/retos/reto-03-el-repositorio-de-la-asociacion/`](codigo/retos/reto-03-el-repositorio-de-la-asociacion/)

La plantilla, `.github/ISSUE_TEMPLATE/observacion.md`:

```markdown
---
name: Noche de observación
about: "Propón una noche de observación: qué ver, cuándo y dónde"
title: "Observación: "
labels: enhancement
---

## Qué se verá

Por ejemplo: la lluvia de estrellas de las Gemínidas, Saturno, la Luna llena.

## Cuándo y dónde

- Fecha y hora:
- Lugar:
- Fecha de reserva, por si hay nubes:

## Material

Prismáticos, telescopio, linterna roja…

## Cuándo está hecha

- [ ] La noche está anunciada en la web, con fecha, hora y lugar
- [ ] Dos días antes, se ha mirado la previsión de nubes y se ha confirmado o pasado a la fecha de reserva
- [ ] Hay al menos una persona con telescopio apuntada
```

📁 **Código:** [`codigo/retos/reto-03-el-repositorio-de-la-asociacion/`](codigo/retos/reto-03-el-repositorio-de-la-asociacion/)

Y el `README.md`:

```markdown
# Web de la Asociación Astronómica Perseidas

La web de las noches de observación de la asociación: qué se verá, cuándo y dónde. Antes de cada noche, un script consulta la previsión de nubes a un servicio del cielo, que pide una clave.

## Cómo colaborar

1. Copia `.env.example` como `.env` y escribe en él **tu** clave del servicio del cielo. Cada persona pide la suya en la web del servicio: así, si una se escapa, se anula sin tocar las demás.
2. El `.env` no se sube nunca a Git (lo ignora el `.gitignore`). Las claves no se pegan en chats, *issues*, capturas ni asistentes de IA.
3. Para proponer una noche, abre una *issue* con la plantilla **Noche de observación**.

## Cómo está hecho

El `.gitignore` lo propuso un asistente de IA. Antes del primer commit se comprobó con `git check-ignore -v`, y había que arreglarlo: no ignoraba los registros.
```

📁 **Código:** [`codigo/retos/reto-03-el-repositorio-de-la-asociacion/`](codigo/retos/reto-03-el-repositorio-de-la-asociacion/)

- **El `.env.example`** lleva la dirección del servicio tal cual (no es un secreto) y, en la clave, un texto que dice lo que hay que hacer. Los comentarios con `#` explican el fichero a quien lo abra por primera vez.
- **La cabecera de la plantilla** tiene las dos claves obligatorias, `name` y `about`, y dos opcionales. El `about` va entre comillas porque lleva `: ` dentro; el `title`, porque termina en espacio.
- **El criterio de hecho** de cada noche son casillas que se comprueban con un sí o un no ([07.02, apartado 1.3](02-organizar-tu-trabajo.md#13-cuándo-está-hecha-una-tarea)). La fecha de reserva sale de lo que se sabe del cielo: si hay nubes, no se ve nada.
- **El README** dice cómo se prepara el `.env` sin dar ninguna clave, y deja escrita la norma de las claves. La sección «Cómo está hecho» cuenta, con sinceridad, que el `.gitignore` salió de un asistente y cómo se comprobó, como la sección «Cómo lo hice» de [07.04, norma 4](04-programar-con-asistentes-de-ia.md#110-las-cinco-normas-de-la-academia).

**Primero, el `.gitignore` del asistente, comprobado.** Desde la carpeta de la solución:

**En tu terminal** (`sesion-1.txt`):

```text
$ mkdir perseidas && cd perseidas && git init
Inicializado repositorio Git vacío en /home/alumno/perseidas/.git/
$ cp -r ../.github ../.env.example ../README.md .
$ printf '.env*\n!.env.example\nlogs/\n' > .gitignore
$ printf 'CIELO_API_URL=https://api.cielo.example/v1\nCIELO_CLAVE=clave-de-prueba-123\n' > .env
$ printf '2026-11-14 20:00 Previsión: despejado\n' > cielo.log
$ ls -a
.  ..  cielo.log  .env  .env.example  .git  .github  .gitignore  README.md
$ git check-ignore -v .env .env.example cielo.log
.gitignore:1:.env*      .env
.gitignore:2:!.env.example      .env.example
$ git status --short
?? .env.example
?? .github/
?? .gitignore
?? README.md
?? cielo.log
```

📁 **Código:** [`codigo/retos/reto-03-el-repositorio-de-la-asociacion/`](codigo/retos/reto-03-el-repositorio-de-la-asociacion/)

- **La primera línea** crea la carpeta del repositorio, entra y lo inicia; la segunda copia dentro los tres ficheros de la solución, con `-r` para la carpeta `.github`. Después, el `.gitignore` del asistente, tal cual y **antes que el `.env`** ([07.05, ejemplo 2.4](05-seguridad-basica.md#24-un-proyecto-con-secretos-desde-el-primer-commit)). El `.env` se escribe con `printf` para que la sesión quede entera; en tu equipo lo harías con `cp .env.example .env` y escribirías tu clave con el editor. Y por último, un `cielo.log` como el que dejará el script, para probar con él.
- **`ls -a`** enseña todo, también lo oculto: los dos `.env`, la carpeta `.github`, el `.gitignore` y el registro.
- **`git check-ignore -v` encuentra el fallo** antes de que haga daño. Para el `.env` y el `.env.example`, todo bien: el primero lo ignora la línea 1 y el segundo lo saca de los ignorados la línea 2, la del `!`. Pero de `cielo.log` **no dice nada**: no está ignorado. `logs/` solo ignora una **carpeta** llamada `logs` ([05.01, apartado 1.12](../fase-05-git-y-github/01-git-fundamentos.md#112-lo-que-no-va-en-git-gitignore)), y el script deja su registro fuera de ella. El asistente dio por hecho dónde iban los registros, sin preguntar.
- **`git status --short` lo confirma**: `cielo.log` aparece con `??`, y un `git add .` lo metería en el commit. Si Aitor no lo hubiera comprobado, cada noche de observación habría dejado un cambio en el repositorio.

**Después, el `.gitignore` arreglado, la comprobación completa y el primer commit:**

**En tu terminal** (`sesion-2.txt`):

```text
$ cd perseidas
$ printf '.env*\n!.env.example\n*.log\n' > .gitignore
$ cat .gitignore
.env*
!.env.example
*.log
$ git check-ignore -v .env .env.local .env.example cielo.log
.gitignore:1:.env*      .env
.gitignore:1:.env*      .env.local
.gitignore:2:!.env.example      .env.example
.gitignore:3:*.log      cielo.log
$ git check-ignore -v README.md .github/ISSUE_TEMPLATE/observacion.md
$ echo $?
1
$ git status --short
?? .env.example
?? .github/
?? .gitignore
?? README.md
$ git add .
$ git status --short
A  .env.example
A  .github/ISSUE_TEMPLATE/observacion.md
A  .gitignore
A  README.md
$ git commit -m "Empieza la web: .gitignore, .env.example, README y plantilla de issue"
[main (commit-raíz) 83fd9fb] Empieza la web: .gitignore, .env.example, README y plantilla de issue
 4 files changed, 46 insertions(+)
 create mode 100644 .env.example
 create mode 100644 .github/ISSUE_TEMPLATE/observacion.md
 create mode 100644 .gitignore
 create mode 100644 README.md
$ git ls-files
.env.example
.github/ISSUE_TEMPLATE/observacion.md
.gitignore
README.md
$ head -n 6 .github/ISSUE_TEMPLATE/observacion.md
---
name: Noche de observación
about: "Propón una noche de observación: qué ver, cuándo y dónde"
title: "Observación: "
labels: enhancement
---
```

📁 **Código:** [`codigo/retos/reto-03-el-repositorio-de-la-asociacion/`](codigo/retos/reto-03-el-repositorio-de-la-asociacion/)

- **`*.log`** en lugar de `logs/`: cualquier fichero que termine en `.log`, esté donde esté. Se reescribe el `.gitignore` entero con `>`, porque hay que cambiar una línea, no añadirla.
- **La primera comprobación** pregunta por lo que debe quedar fuera, también por un fichero que aún no existe (`.env.local`): `git check-ignore` mira los nombres, no si el fichero está. Cada uno sale con la línea que lo ignora; y `.env.example`, con la línea 2, que empieza por `!`: **no** se ignora.
- **La segunda comprobación** pregunta por lo que debe entrar: no escribe nada y su código de salida es `1`, «ninguno de estos está ignorado». Es la mitad de la prueba que más se olvida: un `.gitignore` también puede fallar por ignorar de más.
- **`git status --short`**, antes y después del `git add .`, enseña los cuatro ficheros que deben entrar, y ningún `.env` con la clave. La plantilla sale primero como `.github/`, una carpeta nueva, y después del `git add .`, con su ruta entera.
- **`git ls-files`** confirma lo que ha entrado en el commit, y **`head -n 6`**, que la plantilla empieza por su cabecera, en la ruta donde GitHub la busca ([07.02, error típico 3.4](02-organizar-tu-trabajo.md#34-la-plantilla-de-issue-no-aparece)). Cuando Aitor la suba a `main` en GitHub, aparecerá al pulsar **New issue**.

(Tu identificador de commit será otro.)

**Errores frecuentes al resolverlo:**

- **Fiarse del `.gitignore` del asistente sin comprobarlo**, o comprobar solo el `.env`. Comprobar es preguntar por **todos** los ficheros que importan, los que deben quedar fuera y los que deben entrar, como se prueba cualquier cosa que da una IA ([07.04, apartado 1.7](04-programar-con-asistentes-de-ia.md#17-comprobar-siempre-con-tus-casos-de-prueba)).
- **No ver que falta una línea**: `git check-ignore -v` solo escribe los ficheros ignorados. Si preguntas por cuatro y salen tres, el que falta no está ignorado.
- **Arreglarlo añadiendo `*.log` con `>>` y dejar `logs/`**: funciona, pero deja una línea que no sirve para nada y confunde a quien la lea.
- **Crear el `.env` antes que el `.gitignore` y hacer `git add .` «para ver qué pasa»**: la clave queda preparada para el commit. Si te pasa, `git rm --cached .env` la saca antes de que llegue a un commit ([05.01, apartado 1.12](../fase-05-git-y-github/01-git-fundamentos.md#112-lo-que-no-va-en-git-gitignore)).
- **Escribir `about: Propón una noche de observación: qué ver…` sin comillas**: los segundos dos puntos rompen el YAML, y la plantilla no funciona como esperas.
- **Guardar la plantilla en `.github/observacion.md`**, sin la carpeta `ISSUE_TEMPLATE`: Git la guarda, pero GitHub no la busca ahí.
- **Una clave de verdad en el `.env.example`** «de ejemplo»: ese fichero sí va a Git, y lo que lleva es público.

</details>

---
⬅️ [Anterior: Seguridad básica](05-seguridad-basica.md) · 📚 [Índice](../00-indice.md)
