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
