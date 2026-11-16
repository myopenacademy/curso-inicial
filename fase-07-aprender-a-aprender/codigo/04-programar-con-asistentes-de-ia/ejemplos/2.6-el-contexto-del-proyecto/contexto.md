# Contexto del proyecto: notas de la Academia Brújula

Pégalo al principio de cada conversación nueva con un asistente de IA.

## Qué es

Un script de bash, `nota.sh`, que convierte una nota entera de 0 a 10 en su calificación
(Suspenso, Aprobado, Notable o Sobresaliente), y el fichero `notas.csv` con las notas.

## Con qué trabajo

- bash, en Git Bash (Windows) y en Linux. El script tiene que funcionar también en macOS (bash 3.2).
- Solo órdenes básicas: nada que haya que instalar.
- El proyecto está en Git; hago un commit antes de cada cambio grande.

## Normas

- Las calificaciones son las de España: Suspenso de 0 a 4, Aprobado de 5 a 6, Notable de 7 a 8
  y Sobresaliente de 9 a 10.
- Una nota fuera de 0 a 10 se rechaza con un mensaje por la salida de error.
- Mensajes y comentarios, en español.

## Cómo se comprueba

Con la tabla de casos de prueba de `casos.md`: 0, 4, 5, 6, 7, 8, 9, 10, -1 y 11.

## Lo que no debes hacer

- No cambies `notas.csv`: son las notas de verdad.
- No cambies los casos de prueba para que pasen.
- Si no estás seguro de algo, dilo y pregúntame.
