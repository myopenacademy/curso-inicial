---
title: Rutas a pie
---

# Rutas a pie

{% for ruta in site.data.ruta %}
- {{ ruta.nombre }}: {{ ruta.km }} km. Sale de: {{ ruta.salida }}.
{% endfor %}
