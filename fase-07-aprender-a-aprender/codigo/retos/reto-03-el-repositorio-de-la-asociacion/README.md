# Web de la Asociación Astronómica Perseidas

La web de las noches de observación de la asociación: qué se verá, cuándo y dónde. Antes de cada noche, un script consulta la previsión de nubes a un servicio del cielo, que pide una clave.

## Cómo colaborar

1. Copia `.env.example` como `.env` y escribe en él **tu** clave del servicio del cielo. Cada persona pide la suya en la web del servicio: así, si una se escapa, se anula sin tocar las demás.
2. El `.env` no se sube nunca a Git (lo ignora el `.gitignore`). Las claves no se pegan en chats, *issues*, capturas ni asistentes de IA.
3. Para proponer una noche, abre una *issue* con la plantilla **Noche de observación**.

## Cómo está hecho

El `.gitignore` lo propuso un asistente de IA. Antes del primer commit se comprobó con `git check-ignore -v`, y había que arreglarlo: no ignoraba los registros.
