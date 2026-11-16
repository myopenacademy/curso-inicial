---
title: Los discos de Pablo
---

# Los discos de Pablo

Mi colección de vinilos, del más antiguo al más reciente.

{% for disco in site.data.discos %}
- **{{ disco.titulo }}**, de {{ disco.grupo }} ({{ disco.anio }}){% if disco.favorito %}. De mis favoritos{% endif %}
{% endfor %}
