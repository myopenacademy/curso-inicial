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
