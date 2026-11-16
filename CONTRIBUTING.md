# Cómo contribuir a Fundamentos para programar

Gracias por querer mejorar el curso. Toda ayuda cuenta: una errata, una explicación más clara, un ejemplo mejor o un ejercicio nuevo.

## Antes de empezar

- El curso cumple el **[formato de los cursos de MyOpenAcademy](https://github.com/myopenacademy/kit-cursos/blob/main/FORMATO.md)**. Léelo antes de proponer cambios de estructura.
- Escribe en **español de España**, tuteando, para alguien que empieza desde cero en el tema.

## Cómo proponer un cambio

1. **Erratas y mejoras pequeñas:** abre directamente una *pull request*.
2. **Cambios grandes** (un módulo nuevo, dividir o mover módulos, cambiar el temario): abre antes una *issue* para hablarlo.
3. En la *pull request*, explica qué cambias y por qué.

## Lo que se comprueba

- **El formato:** desde la raíz del curso, con el kit en la carpeta hermana `../kit-cursos/`:

  ```bash
  python3 ../kit-cursos/herramientas/formato_academia.py
  ```

- **El código y las salidas:** desde la raíz del curso, con Docker (la terminal del kit: Ubuntu en español, usuario `alumno`, Git 2.56.0, bash 5.3 y 3.2, sin red):

  ```bash
  python3 ../kit-cursos/herramientas/nucleo/verificar_codigo.py fase-NN-nombre
  python3 ../kit-cursos/herramientas/nucleo/comprobar_mermaid.py
  ```

  Antes de dar por buena una fase, verifica también el último commit, como lo recibe el alumno: `verificar_codigo.py --commit fase-NN-nombre`.
- **Qué es el código:** este curso no enseña ningún lenguaje. Los ejemplos y ejercicios con herramientas (terminal, Git, formatos de datos) están en `codigo/`, son idénticos a los del módulo y se han ejecutado de verdad, con su salida real. Los fragmentos cortos en Python, Java, JavaScript o SQL que solo ilustran una idea se quedan en el texto, sin carpeta, pero también se ejecutan antes de incluirlos y su salida es la real. El pseudocódigo no se ejecuta: sus soluciones se comprueban con una tabla de prueba.
- **Las versiones** y los datos que caducan se comprueban en la documentación oficial y se fechan en el texto.

## Si usas macOS o Windows

Todo el código se verifica en Linux (la terminal del kit). El curso explica las diferencias que conoce con macOS (zsh, el bash 3.2, `sed -i`, `date`…) y con Git Bash en Windows, pero **no se ha probado en un Mac de verdad**. Si sigues el curso en macOS o en Windows y algo no sale como dice (una orden, un mensaje, un menú), abre una *issue* con tu sistema y su versión, la orden y lo que te ha salido. Es una de las ayudas más útiles.

## Reglas que no se pueden saltar

- **No cambies los identificadores de `curso.json`**: el progreso de los alumnos va unido a ellos. Cambiar un título se hace en su `titulo`, conservando el `id`.
- **Títulos en texto plano**, sin formato Markdown.
- Si renombras o mueves un fichero, actualiza su ruta en `curso.json` y los enlaces que apuntan a él (también los de otros cursos).

## Licencia de lo que aportes

Al contribuir aceptas que tu aportación se publique con las licencias del curso: CC BY-SA 4.0 para el texto y MIT para el código ([`LICENSE`](LICENSE)).
