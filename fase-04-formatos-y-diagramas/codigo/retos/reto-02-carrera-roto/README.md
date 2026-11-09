# San Silvestre de Tudela

Carrera popular del 31 de diciembre por el centro de Tudela. Este repositorio guarda los datos que usa la web de inscripciones.

- [Cómo inscribirse](#como-inscribirse)
- [Distancias y precios](#distancias-y-precios)
- [El recorrido](#el-recorrido)

## Cómo inscribirse

Rellena el formulario de la web antes del 28 de diciembre. Los datos de la carrera están en [carrera.yaml](carrera.yaml) y la lista de inscritos, en [inscritos.json](inscritos.json).

## Distancias y precios

| Carrera | Distancia | Precio |
| Infantil | 1 km | Gratis |
| Popular | 5 km | 8 € |
| Absoluta | 10 km | 12 € |

## El recorrido

```mermaid
flowchart LR
    salida([Salida (Plaza de los Fueros)]) --> puente[Puente sobre el Ebro]
    puente --> catedral[Catedral]
    catedral --> meta([Meta (Plaza de los Fueros)])
```

En texto: se sale de la Plaza de los Fueros, se cruza el puente sobre el Ebro, se pasa por la catedral y se vuelve a la plaza.
