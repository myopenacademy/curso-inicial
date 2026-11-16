---
title: Rutas a pie
---

# Rutas a pie

Las rutas de senderismo que hago por la sierra.

{% for ruta in site.data.rutas %}
- {{ ruta.nombre }}: {{ ruta.km }} km. Sale de: {{ ruta.salida }}.
{% endfor %}

El diagrama de cómo está hecha la web está en el
[README del repositorio](https://github.com/TU-USUARIO/rutas-a-pie#cómo-está-hecha).
