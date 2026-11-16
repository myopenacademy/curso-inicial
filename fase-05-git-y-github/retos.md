# Retos de la fase 05 — Git y GitHub

> **Versiones:** Git 2.56; salidas de la 2.56.0; la más reciente, la 2.56.1 (a 16 de noviembre de 2026) · GitHub, según su documentación a 16 de noviembre de 2026
> **Conviene saber antes:** [05.01 Git: fundamentos](01-git-fundamentos.md) · [05.02 Ramas y conflictos](02-ramas-y-conflictos.md) · [05.03 GitHub](03-github.md)
> **Tiempo estimado:** 2,5 horas

Estos retos mezclan lo que has aprendido en los tres módulos de la fase: guardar y deshacer cambios con Git ([05.01](01-git-fundamentos.md)), trabajar con ramas y resolver conflictos ([05.02](02-ramas-y-conflictos.md)) y compartir un repositorio con otras personas a través de un remoto ([05.03](03-github.md)).

Van de menor a mayor dificultad, y el último es el más completo. Son **opcionales**: sirven para afianzar lo aprendido y no bloquean nada. Se hacen **en tu terminal**: descarga la carpeta de cada reto (su enlace «📁 Código»), abre la terminal en ella y trabaja ahí. Cada reto crea sus repositorios en carpetas nuevas dentro de esa carpeta, así que, si lo estropeas, borra lo que hayas creado (o vuelve a copiar la carpeta) y empieza otra vez. Abre las pistas solo si te atascas y, si tu solución es distinta de la propuesta, comprueba que deja el mismo historial y los mismos ficheros: puede estar igual de bien.

Recuerda que los identificadores de tus commits, sus fechas y su autor serán distintos de los del curso ([el aviso de 02.03](../fase-02-tu-ordenador/03-instalar-programas-y-path.md#22-un-aviso-sobre-las-salidas-de-la-terminal)), y que en las salidas de `git push`, `git pull` y `git fetch` cambiarán además los hilos y la velocidad y, según tu sistema y tu versión de Git, algún detalle más: en Windows las rutas salen como `C:/Users/tu-nombre/…`; con un Git más antiguo (el de Apple o el de tu distribución), alguna línea de `push` o `fetch` y algunas pistas `hint:` pueden ser distintas o faltar; el orden de `ls` también puede cambiar ([05.03, apartado 2](03-github.md#2-ejemplos-de-código)). En Git Bash verás además el aviso de los saltos de línea en casi todos los `git add`, `git diff` y `git stash`, uno por fichero: no sale en las salidas del curso; ignóralo ([05.01, apartado 1.16](01-git-fundamentos.md#116-un-recordatorio-los-saltos-de-línea)). Como en los módulos, todo se hace sin abrir el editor de Git: los commits llevan su `-m`, y las fusiones y las anulaciones, `--no-edit`.

## Reto 1 · El horario del gimnasio

**Situación real:** llevas el repositorio del horario y las tarifas del Gimnasio Olimpia, que compartes con Raúl, uno de los monitores. Esta mañana, Begoña, una socia, ha preguntado en recepción por qué ha desaparecido de la web la clase de **pilates de los martes**. La clase sigue: alguien la ha quitado por error. Además, las tarifas de 2027 llevan unos días preparadas en su rama, y la dirección ya les ha dado el visto bueno.

Este script crea la carpeta `gimnasio` con el repositorio tal como te lo encuentras. Ejecútalo con `bash preparar.sh` en la carpeta del reto. No hace falta que lo leas entero: el reto es averiguar lo que ha pasado **con Git**, como si no supieras cómo se hizo.

```bash
#!/usr/bin/env bash
# Prepara el reto 1: la carpeta gimnasio, con el historial que te encuentras.
# Los commits de Raúl llevan su nombre: git -c cambia la configuración
# solo para esa orden, como si Raúl los hubiera hecho en su ordenador.
mkdir gimnasio && cd gimnasio || exit 1
git init -q
printf '%s\n' 'Lunes: spinning, 19:00' 'Martes: pilates, 18:00' > horario.txt
printf '%s\n' 'Miércoles: zumba, 19:00' 'Jueves: pilates, 18:00' >> horario.txt
printf '%s\n' 'Cuota mensual: 35 €' 'Matrícula: 20 €' > tarifas.txt
git add horario.txt tarifas.txt
git commit -q -m "Horario y tarifas de la temporada 2026"
git tag -a v1.0.0 -m "Temporada 2026"
# Las tarifas de 2027, en su rama
git switch -q -c tarifas-2027
printf '%s\n' 'Cuota mensual: 38 €' 'Matrícula: 20 €' > tarifas.txt
git add tarifas.txt
git commit -q -m "Sube la cuota mensual a 38 €"
echo 'Bono de 10 sesiones: 60 €' >> tarifas.txt
git add tarifas.txt
git commit -q -m "Añade el bono de 10 sesiones"
# Mientras, en main, los cambios de Raúl y el tuyo
git switch -q main
printf '%s\n' 'Lunes: spinning, 19:30' 'Martes: pilates, 18:00' > horario.txt
printf '%s\n' 'Miércoles: zumba, 19:00' 'Jueves: pilates, 18:00' >> horario.txt
git add horario.txt
git -c user.name="Raúl Vega" -c user.email=raul@example.com commit -q -m "Actualiza el horario"
printf '%s\n' 'Lunes: spinning, 19:30' 'Miércoles: zumba, 19:00' > horario.txt
echo 'Jueves: pilates, 18:00' >> horario.txt
git add horario.txt
git -c user.name="Raúl Vega" -c user.email=raul@example.com commit -q -m "Actualiza el horario de la semana"
echo 'Viernes: yoga, 10:00' >> horario.txt
git add horario.txt
git commit -q -m "Añade el yoga de los viernes"
echo "Listo: la carpeta gimnasio tiene su historial."
```

📁 **Código:** [`codigo/retos/reto-01-el-horario-del-gimnasio/`](codigo/retos/reto-01-el-horario-del-gimnasio/)

**Salida:**

```text
Listo: la carpeta gimnasio tiene su historial.
```

(`-q` hace callar a `git init`, `git commit` y `git switch`, como en los ejercicios de [05.01](01-git-fundamentos.md#ejercicio-3--dos-cambios-dos-commits). Y `git -c user.name="Raúl Vega" … commit` hace ese commit con el nombre de Raúl sin cambiar tu configuración: solo sirve para que el script imite un repositorio en el que han trabajado dos personas.)

Tu trabajo:

1. **Mira el historial de todas las ramas.** ¿Cuántos commits tiene `main` desde la temporada 2026 (`v1.0.0`)? ¿Qué rama tiene trabajo sin fusionar y de qué commit sale?
2. **Encuentra el commit que quitó el pilates de los martes** y quién lo hizo, para avisarle. Dos commits tienen un mensaje casi igual: mira qué cambió cada uno.
3. **Recupera la clase sin reescribir el historial**: Raúl ya tiene esos commits, así que nada de `--amend` ni de `reset`. Y sin perder lo que vino después (el yoga de los viernes).
4. **Fusiona las tarifas de 2027 en `main`**, borra su rama y etiqueta el resultado como `v1.1.0`, «Temporada 2027».
5. **Comprueba** el historial final, que `tarifas.txt` tiene las tarifas nuevas y que no queda nada pendiente.

<details>
<summary>Pista 1</summary>

Para el paso 1, `git log --oneline --graph --all` ([05.02, apartado 1.5](02-ramas-y-conflictos.md#15-ver-todas-las-ramas-git-log---oneline---graph---all)). Para el 2, `git show` con el identificador de cada commit sospechoso: enseña su autor y su `diff` ([05.01, apartado 1.10](01-git-fundamentos.md#110-ver-los-cambios-diff-y-show)). Busca una línea que empiece por `-`.

</details>

<details>
<summary>Pista 2</summary>

Anular un commit que ya han visto otros, dejando constancia, es lo que hace `git revert` ([05.01, ejemplo 2.9](01-git-fundamentos.md#29-anular-un-commit-antiguo-revert)). Con `--no-edit`, sin abrir el editor.

</details>

<details>
<summary>Pista 3</summary>

Las tarifas solo tocan `tarifas.txt`, y en `main` nadie lo ha cambiado desde que salió la rama: la fusión será de tres vías, sin conflicto ([05.02, apartado 1.7](02-ramas-y-conflictos.md#17-fusión-de-tres-vías-y-el-commit-de-fusión)). Etiqueta **después** de fusionar, para que la etiqueta quede en el commit que tiene las dos cosas.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** primero se mira, después se toca. El gráfico enseña cómo está todo; `git show` dice qué hizo cada commit y quién. Como el commit malo ya lo tiene otra persona, se anula con un commit nuevo (`revert`), no se reescribe. Y la etiqueta va al final, sobre el commit que junta el horario arreglado y las tarifas nuevas.

**Pasos 1 y 2: mirar e investigar.**

**En tu terminal** (`sesion-1.txt`):

```text
$ bash preparar.sh
Listo: la carpeta gimnasio tiene su historial.
$ cd gimnasio
$ git log --oneline --graph --all
* c75a3a2 (HEAD -> main) Añade el yoga de los viernes
* 2ae4cc4 Actualiza el horario de la semana
* 84dd498 Actualiza el horario
| * b5991bd (tarifas-2027) Añade el bono de 10 sesiones
| * 4bde421 Sube la cuota mensual a 38 €
|/
* 1ee0582 (tag: v1.0.0) Horario y tarifas de la temporada 2026
$ git show 84dd498
commit 84dd49826fca7236bea23d6e6799a82cd702f3c3
Author: Raúl Vega <raul@example.com>
Date:   Thu Jan 15 10:04:00 2026 +0100

    Actualiza el horario

diff --git a/horario.txt b/horario.txt
index fc3d53f..eee5ed1 100644
--- a/horario.txt
+++ b/horario.txt
@@ -1,4 +1,4 @@
-Lunes: spinning, 19:00
+Lunes: spinning, 19:30
 Martes: pilates, 18:00
 Miércoles: zumba, 19:00
 Jueves: pilates, 18:00
$ git show 2ae4cc4
commit 2ae4cc4326d5d1af22afdde54a2776ec9020b646
Author: Raúl Vega <raul@example.com>
Date:   Thu Jan 15 10:05:00 2026 +0100

    Actualiza el horario de la semana

diff --git a/horario.txt b/horario.txt
index eee5ed1..c7558fb 100644
--- a/horario.txt
+++ b/horario.txt
@@ -1,4 +1,3 @@
 Lunes: spinning, 19:30
-Martes: pilates, 18:00
 Miércoles: zumba, 19:00
 Jueves: pilates, 18:00
```

📁 **Código:** [`codigo/retos/reto-01-el-horario-del-gimnasio/`](codigo/retos/reto-01-el-horario-del-gimnasio/)

- **El gráfico se lee de abajo arriba.** De la temporada 2026 (`1ee0582`, con la etiqueta `v1.0.0`) salen dos líneas: `main`, con **tres commits** más, y `tarifas-2027`, con dos commits que `main` todavía no tiene.
- **`84dd498` es inocente**: pasa el spinning del lunes de las 19:00 a las 19:30, un cambio que sí querían.
- **`2ae4cc4` es el culpable**: su `diff` tiene una sola línea con `-`, `Martes: pilates, 18:00`, y ninguna con `+`. Lo hizo Raúl, según la línea `Author`. Un mensaje como «Actualiza el horario de la semana» no dice qué cambia: es justo lo que [05.01, apartado 1.15](01-git-fundamentos.md#115-buenos-mensajes-de-commit) te aconseja evitar.

**Pasos 3, 4 y 5: arreglar, fusionar, etiquetar y comprobar.**

**En tu terminal** (`sesion-2.txt`):

```text
$ cd gimnasio
$ git revert --no-edit 2ae4cc4
Auto-fusionando horario.txt
[main 7985b07] Revert "Actualiza el horario de la semana"
 Date: Thu Jan 15 10:07:00 2026 +0100
 1 file changed, 1 insertion(+)
$ cat horario.txt
Lunes: spinning, 19:30
Martes: pilates, 18:00
Miércoles: zumba, 19:00
Jueves: pilates, 18:00
Viernes: yoga, 10:00
$ git merge --no-edit tarifas-2027
Merge made by the 'ort' strategy.
 tarifas.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
$ git branch -d tarifas-2027
Eliminada la rama tarifas-2027 (era b5991bd).
$ git tag -a v1.1.0 -m "Temporada 2027"
$ git log --oneline --graph --all
*   544b5ff (HEAD -> main, tag: v1.1.0) Merge branch 'tarifas-2027'
|\
| * b5991bd Añade el bono de 10 sesiones
| * 4bde421 Sube la cuota mensual a 38 €
* | 7985b07 Revert "Actualiza el horario de la semana"
* | c75a3a2 Añade el yoga de los viernes
* | 2ae4cc4 Actualiza el horario de la semana
* | 84dd498 Actualiza el horario
|/
* 1ee0582 (tag: v1.0.0) Horario y tarifas de la temporada 2026
$ cat tarifas.txt
Cuota mensual: 38 €
Matrícula: 20 €
Bono de 10 sesiones: 60 €
$ git status
En la rama main
nada para hacer commit, el árbol de trabajo está limpio
```

📁 **Código:** [`codigo/retos/reto-01-el-horario-del-gimnasio/`](codigo/retos/reto-01-el-horario-del-gimnasio/)

**En qué fijarte:**

- **`git revert --no-edit 2ae4cc4`** crea un commit nuevo que hace lo contrario: vuelve a poner la línea del pilates **en su sitio**, entre el lunes y el miércoles. `Auto-fusionando horario.txt` quiere decir que Git ha tenido que encajar el cambio con lo que vino después, el yoga del viernes, y lo ha hecho solo, porque son zonas distintas del fichero.
- **El yoga sigue ahí**, y el spinning, a las 19:30: `revert` solo anula **ese** commit.
- **La fusión de las tarifas** es de tres vías (`Merge made by the 'ort' strategy`): las dos ramas tenían commits propios.
- **La etiqueta `v1.1.0`** está en el commit de fusión, junto a `HEAD -> main`, y `v1.0.0` sigue en el primero: las dos temporadas quedan marcadas.
- **El historial cuenta lo que pasó**, también el error: el commit de Raúl y su anulación siguen ahí, uno encima del otro. Nadie del equipo tendrá problemas al traer los cambios.

**¿Por qué `v1.1.0`?** Si el horario y las tarifas fueran un programa, añadir el bono sin quitar nada sería un cambio compatible: sube la versión MENOR ([05.02, apartado 1.15](02-ramas-y-conflictos.md#115-etiquetas-y-versionado-semántico)).

**Errores frecuentes al resolverlo:**

- Mirar solo los mensajes de `git log --oneline` y anular el primer «Actualiza el horario»: el spinning volvería a las 19:00 y el pilates seguiría sin aparecer. Antes de deshacer, `git show`.
- Volver a escribir la línea del pilates a mano y hacer un commit: funciona, pero el historial no dice que se ha anulado el commit de Raúl. `revert` lo deja escrito en el mensaje.
- Usar `git commit --amend` o `git reset`: reescribirías commits que Raúl ya tiene ([05.01, error típico 3.9](01-git-fundamentos.md#39-cambiar-un-commit-que-ya-has-compartido)).
- Fusionar estando en `tarifas-2027` (`git merge main`): las tarifas seguirían sin llegar a `main` ([05.02, error típico 3.5](02-ramas-y-conflictos.md#35-fusionar-en-la-dirección-equivocada)).
- Etiquetar antes de fusionar: `v1.1.0` quedaría en el commit del `revert`, sin las tarifas nuevas.

</details>

## Reto 2 · El huerto compartido

**Situación real:** Tomás y Nuria llevan los turnos de riego del huerto urbano de su barrio en un repositorio compartido. Esta mañana, Tomás ha apuntado que Lola, una vecina nueva, se queda el turno de los lunes, y lo ha subido. Nuria no lo sabe: sin traerse nada, ha empezado a trabajar en su clon. Ha añadido su turno del sábado a `riego.txt` y ha empezado `semillas.txt`, un fichero nuevo con el reparto de las semillas, que aún no ha terminado.

La primera sesión prepara la situación con un remoto de prácticas en tu disco, como en [05.03](03-github.md#18-un-github-de-prácticas-en-tu-ordenador). Cópiala tal cual:

**En tu terminal** (`sesion-1.txt`):

```text
$ mkdir github
$ git init --bare github/huerto.git
Inicializado repositorio Git vacío en /home/alumno/github/huerto.git/
$ mkdir tomas && cd tomas && git init
Inicializado repositorio Git vacío en /home/alumno/tomas/.git/
$ git config user.name "Tomás Lezcano"
$ git config user.email tomas@example.com
$ printf 'Lunes: Tomás\nMartes: Nuria\nMiércoles: Tomás\n' > riego.txt
$ printf 'Jueves: Nuria\nViernes: Tomás\n' >> riego.txt
$ git add riego.txt
$ git commit -m "Turnos de riego"
[main (commit-raíz) 78443a2] Turnos de riego
 1 file changed, 5 insertions(+)
 create mode 100644 riego.txt
$ git remote add origin ../github/huerto.git
$ git push -u origin main
Enumerando objetos: 3, listo.
Contando objetos: 100% (3/3), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (2/2), listo.
Escribiendo objetos: 100% (3/3), 271 byte | 271.00 KiB/s, listo.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To ../github/huerto.git
 * [new branch]      main -> main
rama 'main' configurada para rastrear 'origin/main'.
$ cd ..
$ mkdir nuria && cd nuria && git clone ../github/huerto.git
Clonando en 'huerto'...
hecho.
$ cd huerto
$ git config user.name "Nuria Pardo"
$ git config user.email nuria@example.com
$ cd ../../tomas
$ printf 'Lunes: Lola\nMartes: Nuria\nMiércoles: Tomás\n' > riego.txt
$ printf 'Jueves: Nuria\nViernes: Tomás\n' >> riego.txt
$ git add riego.txt
$ git commit -m "Lola se queda el turno de los lunes"
[main 75ede30] Lola se queda el turno de los lunes
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git push
Enumerando objetos: 5, listo.
Contando objetos: 100% (5/5), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (2/2), listo.
Escribiendo objetos: 100% (3/3), 321 byte | 321.00 KiB/s, listo.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To ../github/huerto.git
   78443a2..75ede30  main -> main
$ cd ../nuria/huerto
$ echo "Sábado: Nuria" >> riego.txt
$ printf 'Tomates: Tomás\nLechugas: Nuria\n' > semillas.txt
```

📁 **Código:** [`codigo/retos/reto-02-el-huerto-compartido/`](codigo/retos/reto-02-el-huerto-compartido/)

Ahora eres Nuria, en la carpeta `nuria/huerto`. Quieres traerte lo de Tomás **antes** de seguir, pero tu trabajo está a medias y no quieres hacer un commit con un reparto de semillas sin terminar. Hazlo así:

1. Mira qué dice `git status` e intenta traerte lo nuevo con `git pull`. Lee lo que contesta Git.
2. Consigue traerte el cambio de Tomás **sin hacer ningún commit** y sin perder nada de lo tuyo, tampoco el fichero nuevo.
3. Recupera tu trabajo y comprueba que en `riego.txt` están **los dos cambios**: Lola el lunes y tú el sábado.
4. Termina el reparto añadiendo `Calabacines: Lola` a `semillas.txt`, guárdalo todo en un solo commit y súbelo.
5. Comprueba el historial y que no queda nada pendiente.

<details>
<summary>Pista 1</summary>

¿Por qué `git status` dice que estás al día, si Tomás ha subido algo? Repasa qué compara ([05.03, apartado 1.7](03-github.md#17-las-órdenes-de-los-remotos)).

</details>

<details>
<summary>Pista 2</summary>

Para dejar la carpeta limpia sin hacer un commit, aparta tu trabajo ([05.02, apartado 1.14](02-ramas-y-conflictos.md#114-apartar-trabajo-a-medias-git-stash)). Ojo: tienes un fichero que Git todavía no sigue.

</details>

<details>
<summary>Pista 3</summary>

El orden es: apartar, `git pull`, recuperar lo apartado. Después, el `add`, el `commit` y el `push` de siempre.

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** `git pull` no quiere tocar un fichero que tiene cambios sin guardar, para no estropearlos. Hay dos salidas: hacer un commit o apartar el trabajo. Como el trabajo está a medias, se aparta con `git stash push -u` (con `-u`, porque `semillas.txt` es nuevo), se trae lo de Tomás, que será un avance rápido porque Nuria no tiene commits nuevos, y se recupera lo apartado encima.

**En tu terminal** (`sesion-2.txt`):

```text
$ cd nuria/huerto
$ git status
En la rama main
Tu rama está actualizada con 'origin/main'.

Cambios no rastreados para el commit:
  (usa "git add <archivo>..." para actualizar lo que será confirmado)
  (usa "git restore <archivo>..." para descartar los cambios en el directorio de trabajo)
        modificados:     riego.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que será confirmado)
        semillas.txt

sin cambios agregados al commit (usa "git add" y/o "git commit -a")
$ git pull
remote: Enumerando objetos: 5, listo.
remote: Contando objetos: 100% (5/5), listo.
remote: Comprimiendo objetos: 100% (2/2), listo.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Desempaquetando objetos: 100% (3/3), 301 byte | 301.00 KiB/s, listo.
Desde /home/alumno/nuria/../github/huerto
   78443a2..75ede30  main       -> origin/main
Actualizando 78443a2..75ede30
error: Los cambios locales de los siguientes archivos serán sobrescritos al fusionar:
        riego.txt
Por favor, confirma tus cambios o aguárdalos antes de fusionar.
Abortando
$ git stash push -u -m "Sábado y semillas, a medias"
Directorio de trabajo y estado de índice On main: Sábado y semillas, a medias guardados
$ git status
En la rama main
Tu rama está detrás de 'origin/main' por 1 commit, y puede ser avanzada rápido.
  (usa "git pull" para actualizar tu rama local)

nada para hacer commit, el árbol de trabajo está limpio
$ git pull
Actualizando 78443a2..75ede30
Fast-forward
 riego.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git stash pop
Auto-fusionando riego.txt
En la rama main
Tu rama está actualizada con 'origin/main'.

Cambios no rastreados para el commit:
  (usa "git add <archivo>..." para actualizar lo que será confirmado)
  (usa "git restore <archivo>..." para descartar los cambios en el directorio de trabajo)
        modificados:     riego.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que será confirmado)
        semillas.txt

sin cambios agregados al commit (usa "git add" y/o "git commit -a")
Descartado refs/stash@{0} (164e6df5978c76c9e3e05e3f42c657086a0d0a25)
$ cat riego.txt
Lunes: Lola
Martes: Nuria
Miércoles: Tomás
Jueves: Nuria
Viernes: Tomás
Sábado: Nuria
$ echo "Calabacines: Lola" >> semillas.txt
$ git add riego.txt semillas.txt
$ git commit -m "Añade el turno del sábado y las semillas"
[main b9fcc1f] Añade el turno del sábado y las semillas
 2 files changed, 4 insertions(+)
 create mode 100644 semillas.txt
$ git push
Enumerando objetos: 6, listo.
Contando objetos: 100% (6/6), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (4/4), listo.
Escribiendo objetos: 100% (4/4), 404 byte | 404.00 KiB/s, listo.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
To /home/alumno/nuria/../github/huerto.git
   75ede30..b9fcc1f  main -> main
$ git log --oneline --graph --all
* b9fcc1f (HEAD -> main, origin/main, origin/HEAD) Añade el turno del sábado y las semillas
* 75ede30 Lola se queda el turno de los lunes
* 78443a2 Turnos de riego
$ git status
En la rama main
Tu rama está actualizada con 'origin/main'.

nada para hacer commit, el árbol de trabajo está limpio
```

📁 **Código:** [`codigo/retos/reto-02-el-huerto-compartido/`](codigo/retos/reto-02-el-huerto-compartido/)

**Explicación, paso a paso:**

1. **El primer `git status` dice «actualizada»**, pero no lo está: compara con la copia del remoto que tenía Nuria, que es de antes del `push` de Tomás ([05.03, error típico 3.5](03-github.md#35-creer-que-git-status-sabe-lo-último)).
2. **`git pull` hace la mitad**: trae el commit de Tomás (las líneas `remote:` y `78443a2..75ede30 main -> origin/main`), pero al ir a actualizar `riego.txt` se para: los cambios locales de ese fichero «serán sobrescritos al fusionar», así que **aborta** sin tocar nada. Te propone confirmar (hacer un commit) o guardar tus cambios. («aguárdalos» es una errata de la traducción de Git, [05.01, apartado 2](01-git-fundamentos.md#2-ejemplos-de-código): quiere decir «guárdalos».)
3. **`git stash push -u -m …`** aparta las dos cosas, el cambio de `riego.txt` y el fichero nuevo, con un nombre que dice qué es. La traducción mezcla español e inglés («On main»: [05.01, apartado 2](01-git-fundamentos.md#2-ejemplos-de-código)).
4. **Ahora `git status` sí sabe** que vas un commit por detrás, porque el `git pull` fallido ya había renovado la copia. Y la carpeta está limpia.
5. **El segundo `git pull`** es un avance rápido: llega el lunes de Lola.
6. **`git stash pop`** devuelve tu trabajo encima. `Auto-fusionando riego.txt`: Git ha juntado tu sábado con el lunes de Lola, que están en zonas distintas del fichero. `semillas.txt` vuelve como fichero sin seguimiento, y `Descartado refs/stash@{0}` dice que el almacén se ha vaciado.
7. **`cat riego.txt`** lo confirma: Lola el lunes y Nuria el sábado.
8. **Un commit con los dos ficheros y `git push`**, que se acepta a la primera: el remoto no tiene nada que Nuria no tenga.
9. **El historial es una línea recta**: sin commits a medias y sin commit de fusión.

**¿Y si Nuria hubiera hecho un commit en lugar de apartar?** También valía, si el trabajo hubiera estado terminado: el `git pull` habría encontrado las ramas divergidas y, con `git pull --no-rebase --no-edit`, habría hecho una fusión de tres vías, como en [05.03, ejemplo 2.4](03-github.md#24-cuando-alguien-ha-subido-antes-que-tú). Funciona igual de bien, pero deja un commit de fusión en el historial y obliga a hacer un commit con el reparto de semillas a medias. El hábito que evita todo esto: **`git pull` antes de empezar a trabajar**.

> **📌 Nota:** si tu cambio y el de Tomás hubieran tocado **la misma línea**, `git stash pop` habría dado un conflicto, con los mismos marcadores de [05.02](02-ramas-y-conflictos.md#110-los-marcadores-de-conflicto). Se resuelve igual (editas, `git add`), y en ese caso Git **no** borra lo apartado del almacén (lo dice: «La entrada de stash se guardó en caso de ser necesario nuevamente»): cuando todo esté bien, lo borras tú con `git stash drop`.

**Errores frecuentes al resolverlo:**

- `git stash` sin `-u`: `semillas.txt` no se aparta. Aquí el `pull` saldría bien igualmente, porque Tomás no ha tocado ese fichero, pero es fácil acabar metiéndolo donde no toca ([05.02, apartado 1.14](02-ramas-y-conflictos.md#114-apartar-trabajo-a-medias-git-stash)).
- Olvidar el `git stash pop`: tu trabajo se queda en el almacén, y el commit no tendría ni el sábado ni las semillas. `git stash list` te dice si queda algo.
- Descartar tus cambios con `git restore riego.txt` para que el `pull` funcione: perderías el turno del sábado.
- Hacer el `git add` solo de `riego.txt`: el reparto de semillas se quedaría fuera del commit, sin subir.

</details>

## Reto 3 · Una pull request con conflictos

**Situación real:** Elena y Hugo llevan la web del grupo de teatro La Tramoya, que estrena *Luces de bohemia* en marzo. Trabajan con GitHub Flow ([05.03, apartado 1.13](03-github.md#113-github-flow)): cada cambio, en una rama, con su *pull request*, y Elena revisa y fusiona.

Hugo abrió una *pull request* desde la rama `sabado`: añade una segunda función, el sábado, y el reparto. Mientras se revisaba, el instituto avisó de que su salón estará en obras, y Elena cambió la sala del estreno a la Casa de Cultura en otra *pull request*, `cambio-de-sala`, que ya está fusionada en `main`. Ahora GitHub no deja fusionar la de Hugo: la rama tiene conflictos con `main`, y hasta que se resuelvan el botón de fusionar está desactivado ([05.03, apartado 1.10](03-github.md#110-pull-requests-y-revisión)).

La primera sesión prepara la situación: el remoto, el repositorio de Elena y el clon de Hugo, con las dos ramas. Las fusiones de *pull requests* se imitan como en [05.03, ejemplo 2.6](03-github.md#26-después-de-fusionar-la-pull-request): una fusión con `--no-ff` en `main`, subida al remoto. Cópiala tal cual:

**En tu terminal** (`sesion-1.txt`):

```text
$ mkdir github
$ git init --bare github/tramoya.git
Inicializado repositorio Git vacío en /home/alumno/github/tramoya.git/
$ mkdir elena && cd elena && git init
Inicializado repositorio Git vacío en /home/alumno/elena/.git/
$ git config user.name "Elena Ríos"
$ git config user.email elena@example.com
$ printf '# Grupo de teatro La Tramoya\n\nObra: Luces de bohemia\n' > funciones.md
$ echo "Estreno: viernes 5 de marzo, 20:00, salón del instituto" >> funciones.md
$ echo "Entradas: 5 €, en taquilla" >> funciones.md
$ git add funciones.md
$ git commit -m "Primera función"
[main (commit-raíz) a701984] Primera función
 1 file changed, 5 insertions(+)
 create mode 100644 funciones.md
$ git remote add origin ../github/tramoya.git
$ git push -u origin main
Enumerando objetos: 3, listo.
Contando objetos: 100% (3/3), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (2/2), listo.
Escribiendo objetos: 100% (3/3), 350 byte | 350.00 KiB/s, listo.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To ../github/tramoya.git
 * [new branch]      main -> main
rama 'main' configurada para rastrear 'origin/main'.
$ cd ..
$ mkdir hugo && cd hugo && git clone ../github/tramoya.git
Clonando en 'tramoya'...
hecho.
$ cd tramoya
$ git config user.name "Hugo Martín"
$ git config user.email hugo@example.com
$ git switch -c sabado
Cambiado a nueva rama 'sabado'
$ printf '# Grupo de teatro La Tramoya\n\nObra: Luces de bohemia\n' > funciones.md
$ echo "Funciones: viernes 5 y sábado 6 de marzo, 20:00, salón del instituto" >> funciones.md
$ echo "Entradas: 5 €, en taquilla" >> funciones.md
$ git add funciones.md
$ git commit -m "Añade la función del sábado"
[sabado 425935d] Añade la función del sábado
 1 file changed, 1 insertion(+), 1 deletion(-)
$ printf 'Max Estrella: Hugo Martín\nDon Latino: Elena Ríos\n' > reparto.md
$ git add reparto.md
$ git commit -m "Añade el reparto"
[sabado 26811df] Añade el reparto
 1 file changed, 2 insertions(+)
 create mode 100644 reparto.md
$ git push -u origin sabado
Enumerando objetos: 8, listo.
Contando objetos: 100% (8/8), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (5/5), listo.
Escribiendo objetos: 100% (6/6), 713 byte | 713.00 KiB/s, listo.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /home/alumno/hugo/../github/tramoya.git
 * [new branch]      sabado -> sabado
rama 'sabado' configurada para rastrear 'origin/sabado'.
$ cd ../../elena
$ git switch -c cambio-de-sala
Cambiado a nueva rama 'cambio-de-sala'
$ printf '# Grupo de teatro La Tramoya\n\nObra: Luces de bohemia\n' > funciones.md
$ echo "Estreno: viernes 5 de marzo, 20:00, Casa de Cultura" >> funciones.md
$ echo "Entradas: 5 €, en taquilla" >> funciones.md
$ git add funciones.md
$ git commit -m "Lleva el estreno a la Casa de Cultura"
[cambio-de-sala 1fae6f2] Lleva el estreno a la Casa de Cultura
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git push -u origin cambio-de-sala
Enumerando objetos: 5, listo.
Contando objetos: 100% (5/5), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (2/2), listo.
Escribiendo objetos: 100% (3/3), 313 byte | 313.00 KiB/s, listo.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
To ../github/tramoya.git
 * [new branch]      cambio-de-sala -> cambio-de-sala
rama 'cambio-de-sala' configurada para rastrear 'origin/cambio-de-sala'.
$ git switch main
Cambiado a rama 'main'
Tu rama está actualizada con 'origin/main'.
$ git merge --no-ff --no-edit cambio-de-sala
Merge made by the 'ort' strategy.
 funciones.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git push
Enumerando objetos: 1, listo.
Contando objetos: 100% (1/1), listo.
Escribiendo objetos: 100% (1/1), 234 byte | 234.00 KiB/s, listo.
Total 1 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To ../github/tramoya.git
   a701984..ddcd965  main -> main
$ git branch -d cambio-de-sala
Eliminada la rama cambio-de-sala (era 1fae6f2).
$ git push origin --delete cambio-de-sala
To ../github/tramoya.git
 - [deleted]         cambio-de-sala
```

📁 **Código:** [`codigo/retos/reto-03-una-pull-request-con-conflictos/`](codigo/retos/reto-03-una-pull-request-con-conflictos/)

Hugo ha hablado con Elena: la Casa de Cultura está libre también el sábado, así que la línea buena es `Funciones: viernes 5 y sábado 6 de marzo, 20:00, Casa de Cultura`. Lleva la *pull request* hasta el final:

1. **Como Hugo**, en `hugo/tramoya`: pon tu rama `sabado` al día con lo último de `main`, resuelve el conflicto y sube la rama. Así se actualiza la *pull request*. Antes de fusionar, mira el gráfico de todas las ramas.
2. **Como Elena**, en `elena`: fusiona la *pull request* (como en el ejemplo 2.6 de 05.03) y súbelo.
3. **Como Hugo** otra vez: vuelve a `main`, tráete lo fusionado y borra la rama `sabado`, en tu repositorio y en el remoto.
4. **Comprueba el resultado** desde el repositorio de Hugo: el historial de todas las ramas, `funciones.md` y `git status`.

<details>
<summary>Pista 1</summary>

El conflicto no se resuelve en `main`, sino **en tu rama**: hay que traer `main` a `sabado`, como cuenta [05.03, apartado 1.10](03-github.md#110-pull-requests-y-revisión) («Si la *pull request* tiene conflictos»). Pero antes, tu `main` tiene que tener lo de Elena, y tu `main` es de cuando clonaste.

</details>

<details>
<summary>Pista 2</summary>

Orden para Hugo: `git switch main`, `git pull`, `git switch sabado`, `git merge main`. Después, lo de siempre con un conflicto ([05.02, apartado 1.11](02-ramas-y-conflictos.md#111-resolver-un-conflicto-paso-a-paso)): el fichero como debe quedar y sin marcadores, `git add`, `git commit --no-edit`. Y `git push`: la rama ya está vinculada con `origin/sabado`.

</details>

<details>
<summary>Pista 3</summary>

Elena no tiene la rama de Hugo en su repositorio, pero `git fetch` le trae la copia, `origin/sabado`. Para borrar una rama del remoto: `git push origin --delete` ([05.03, ejemplo 2.6](03-github.md#26-después-de-fusionar-la-pull-request)).

</details>

<details>
<summary>Ver solución</summary>

**Razonamiento:** una *pull request* se fusiona con un botón, pero los conflictos se resuelven **en la rama de la *pull request***, no en `main`: en `main` solo entra trabajo terminado. Hugo trae `main` a su rama, resuelve ahí y sube la rama. Así la *pull request* queda sin conflictos y Elena puede fusionarla sin sorpresas.

**Paso 1: poner la rama al día.**

**En tu terminal** (`sesion-2.txt`):

```text
$ cd hugo/tramoya
$ git switch main
Cambiado a rama 'main'
Tu rama está actualizada con 'origin/main'.
$ git pull
remote: Enumerando objetos: 6, listo.
remote: Contando objetos: 100% (6/6), listo.
remote: Comprimiendo objetos: 100% (3/3), listo.
remote: Total 4 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
Desempaquetando objetos: 100% (4/4), 397 byte | 397.00 KiB/s, listo.
Desde /home/alumno/hugo/../github/tramoya
   a701984..ddcd965  main       -> origin/main
Actualizando a701984..ddcd965
Fast-forward
 funciones.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git switch sabado
Cambiado a rama 'sabado'
Tu rama está actualizada con 'origin/sabado'.
$ git log --oneline --graph --all
*   ddcd965 (origin/main, origin/HEAD, main) Merge branch 'cambio-de-sala'
|\
| * 1fae6f2 Lleva el estreno a la Casa de Cultura
|/
| * 26811df (HEAD -> sabado, origin/sabado) Añade el reparto
| * 425935d Añade la función del sábado
|/
* a701984 Primera función
$ git merge main
Auto-fusionando funciones.md
CONFLICTO (contenido): Conflicto de fusión en funciones.md
Fusión automática falló; arregle los conflictos y luego realice un commit con el resultado.
$ cat funciones.md
# Grupo de teatro La Tramoya

Obra: Luces de bohemia
<<<<<<< HEAD
Funciones: viernes 5 y sábado 6 de marzo, 20:00, salón del instituto
=======
Estreno: viernes 5 de marzo, 20:00, Casa de Cultura
>>>>>>> main
Entradas: 5 €, en taquilla
```

📁 **Código:** [`codigo/retos/reto-03-una-pull-request-con-conflictos/`](codigo/retos/reto-03-una-pull-request-con-conflictos/)

- **`git switch main` dice «actualizada»**, y es la copia vieja otra vez: el `git pull` de después trae la fusión de Elena (`a701984..ddcd965`) con un avance rápido, porque Hugo nunca hizo commits en `main`.
- **El gráfico** enseña las dos *pull requests* saliendo de `Primera función`: la de Elena, ya fusionada en `main` (`ddcd965`), y la de Hugo, `sabado`, con sus dos commits.
- **`git merge main`, estando en `sabado`**, trae `main` a la rama. Las dos cambiaron la línea del estreno: conflicto. Arriba (`HEAD`), lo de Hugo, la segunda función; abajo (`main`), lo de Elena, la sala nueva. La línea de las entradas, que nadie tocó, queda fuera de los marcadores.

**Resolver y actualizar la *pull request*.**

**En tu terminal** (`sesion-3.txt`):

```text
$ cd hugo/tramoya
$ printf '# Grupo de teatro La Tramoya\n\nObra: Luces de bohemia\n' > funciones.md
$ echo "Funciones: viernes 5 y sábado 6 de marzo, 20:00, Casa de Cultura" >> funciones.md
$ echo "Entradas: 5 €, en taquilla" >> funciones.md
$ grep -c '<<<<<<<' funciones.md
0
$ git add funciones.md
$ git commit --no-edit
[sabado a9facba] Merge branch 'main' into sabado
$ git push
Enumerando objetos: 7, listo.
Contando objetos: 100% (7/7), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (3/3), listo.
Escribiendo objetos: 100% (3/3), 396 byte | 396.00 KiB/s, listo.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
To /home/alumno/hugo/../github/tramoya.git
   26811df..a9facba  sabado -> sabado
$ git log --oneline --graph --all
*   a9facba (HEAD -> sabado, origin/sabado) Merge branch 'main' into sabado
|\
| *   ddcd965 (origin/main, origin/HEAD, main) Merge branch 'cambio-de-sala'
| |\
| | * 1fae6f2 Lleva el estreno a la Casa de Cultura
| |/
* | 26811df Añade el reparto
* | 425935d Añade la función del sábado
|/
* a701984 Primera función
```

📁 **Código:** [`codigo/retos/reto-03-una-pull-request-con-conflictos/`](codigo/retos/reto-03-una-pull-request-con-conflictos/)

- **La línea resuelta junta las dos decisiones**: las dos funciones de Hugo y la sala de Elena. En tu ordenador lo harías en VS Code ([05.02, apartado 1.12](02-ramas-y-conflictos.md#112-conflictos-en-vs-code)); aquí, reescribiendo el fichero.
- **`grep -c` da 0**: ningún marcador olvidado.
- **El commit de fusión es de la rama**: `[sabado a9facba] Merge branch 'main' into sabado`.
- **`git push` se acepta sin pegas**: la rama del remoto (`origin/sabado`) solo avanza (`26811df..a9facba`). En GitHub, la *pull request* se actualizaría sola con este commit, y el botón de fusionar volvería a funcionar.
- **El gráfico**: `main` ha entrado en `sabado` por el lado derecho. La rama contiene ya todo lo de `main`.

**Pasos 2, 3 y 4: Elena fusiona y Hugo recoge.**

**En tu terminal** (`sesion-4.txt`):

```text
$ cd elena
$ git fetch
remote: Enumerando objetos: 13, listo.
remote: Contando objetos: 100% (13/13), listo.
remote: Comprimiendo objetos: 100% (8/8), listo.
remote: Total 9 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
Desempaquetando objetos: 100% (9/9), 1.01 KiB | 1.01 MiB/s, listo.
Desde ../github/tramoya
 * [nueva rama]      sabado     -> origin/sabado
$ git merge --no-ff --no-edit origin/sabado
Merge made by the 'ort' strategy.
 funciones.md | 2 +-
 reparto.md   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 reparto.md
$ git push
Enumerando objetos: 1, listo.
Contando objetos: 100% (1/1), listo.
Escribiendo objetos: 100% (1/1), 243 byte | 243.00 KiB/s, listo.
Total 1 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To ../github/tramoya.git
   ddcd965..3782fe6  main -> main
$ cd ../hugo/tramoya
$ git switch main
Cambiado a rama 'main'
Tu rama está actualizada con 'origin/main'.
$ git pull
remote: Enumerando objetos: 1, listo.
remote: Contando objetos: 100% (1/1), listo.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Desempaquetando objetos: 100% (1/1), 223 byte | 223.00 KiB/s, listo.
Desde /home/alumno/hugo/../github/tramoya
   ddcd965..3782fe6  main       -> origin/main
Actualizando ddcd965..3782fe6
Fast-forward
 funciones.md | 2 +-
 reparto.md   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 reparto.md
$ git branch -d sabado
Eliminada la rama sabado (era a9facba).
$ git push origin --delete sabado
To /home/alumno/hugo/../github/tramoya.git
 - [deleted]         sabado
$ git log --oneline --graph --all
*   3782fe6 (HEAD -> main, origin/main, origin/HEAD) Merge remote-tracking branch 'origin/sabado'
|\
| *   a9facba Merge branch 'main' into sabado
| |\
| |/
|/|
* |   ddcd965 Merge branch 'cambio-de-sala'
|\ \
| * | 1fae6f2 Lleva el estreno a la Casa de Cultura
|/ /
| * 26811df Añade el reparto
| * 425935d Añade la función del sábado
|/
* a701984 Primera función
$ cat funciones.md
# Grupo de teatro La Tramoya

Obra: Luces de bohemia
Funciones: viernes 5 y sábado 6 de marzo, 20:00, Casa de Cultura
Entradas: 5 €, en taquilla
$ git status
En la rama main
Tu rama está actualizada con 'origin/main'.

nada para hacer commit, el árbol de trabajo está limpio
```

📁 **Código:** [`codigo/retos/reto-03-una-pull-request-con-conflictos/`](codigo/retos/reto-03-una-pull-request-con-conflictos/)

**En qué fijarte:**

- **`git fetch` de Elena** trae la rama de Hugo como `origin/sabado` (`* [nueva rama]`), sin tocar sus ficheros.
- **La fusión de Elena no da conflicto**: Hugo ya lo resolvió en su rama, que contiene todo lo de `main`. Por eso sus cambios entran limpios: la línea de las funciones y el fichero nuevo `reparto.md`. Ese es el sentido de resolver en la rama.
- **En el repositorio de Hugo, `git switch main`** vuelve a decir «actualizada» con una copia vieja; el `git pull` trae la fusión de Elena con un avance rápido.
- **`git branch -d sabado`** deja borrar la rama, porque ya está fusionada, y **`git push origin --delete sabado`** la borra del remoto (`- [deleted]`).
- **El historial final** tiene tres commits de fusión, y se lee de abajo arriba:
  - `a701984`, la primera función, de la que salen las dos *pull requests*;
  - `ddcd965`, la fusión de la *pull request* de Elena en `main`;
  - `a9facba`, la puesta al día de la rama de Hugo, que trae `main` (`ddcd965`) a `sabado`: el tramo `| |/` y `|/|` que cruza es esa línea que va de `main` a la rama;
  - `3782fe6`, arriba, la fusión de la *pull request* de Hugo en `main`, con `HEAD -> main` y `origin/main` en el mismo commit: todo subido.
- **`funciones.md` final** tiene la línea acordada, y `git status`, nada pendiente.

**Con GitHub de verdad,** para un conflicto sencillo como este (una línea cambiada por los dos), Hugo podría usar también el botón **Resolve conflicts** de la *pull request*, que hace lo mismo que has hecho tú desde la web ([05.03, apartado 1.10](03-github.md#110-pull-requests-y-revisión)).

**Errores frecuentes al resolverlo:**

- **`git merge main` sin traerse antes lo último**: el `main` de Hugo es de cuando clonó, así que Git diría `Ya está actualizado.` y el conflicto seguiría en GitHub. Primero `git pull` en `main` (o, sin cambiar de rama, `git fetch` y `git merge origin/main`, que hace lo mismo y deja otro mensaje en el commit de fusión).
- **Resolver el conflicto en `main` y subir `main`**: te saltas la revisión de la *pull request*, que es justo lo que GitHub Flow quiere evitar.
- **Quedarse con una de las dos versiones**: con la de Hugo, el estreno volvería al salón en obras; con la de Elena, desaparecería la función del sábado.
- **Borrar la rama solo en tu ordenador**: en el remoto seguiría `sabado`, y quien clone verá una rama vieja.
- **`git branch -D`** en lugar de `-d`: aquí daría igual, pero `-d` te avisa si la rama tiene algo sin fusionar, y eso es justo lo que quieres saber antes de borrarla.

</details>

---
⬅️ [Anterior: GitHub](03-github.md) · 📚 [Índice](../00-indice.md)
