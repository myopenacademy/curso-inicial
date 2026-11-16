---
title: Mis rutas en bici
---

# Mis rutas en bici

Las rutas que hago en bici los fines de semana. Todas salen de un sitio público del pueblo.

## Las rutas

{% for ruta in site.data.rutas %}
- **{{ ruta.nombre }}**: {{ ruta.km }} km, dificultad {{ ruta.dificultad }}. Sale de: {{ ruta.salida }}.
{% endfor %}

## Cómo está hecha

La web se construye sola a partir de los datos de las rutas. El diagrama que lo explica está en el
[README del repositorio](https://github.com/TU-USUARIO/mis-rutas-en-bici#cómo-está-hecha), porque
GitHub Pages no dibuja los diagramas de Mermaid.
