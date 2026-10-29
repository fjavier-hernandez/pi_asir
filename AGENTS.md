# AGENTS.md

Instrucciones para los agentes (Cursor y otros) que trabajen en este repositorio. Léelas antes de tocar nada y síguelas en cada tarea.

## Objetivo del repositorio

Este repositorio contiene la guía, la planificación y la evaluación del módulo profesional **Proyecto Intermodular** del ciclo formativo de grado superior de **Administración de Sistemas Informáticos en Red (ASIR)**. Se publica con MkDocs (tema Material) en GitHub Pages: <https://fjavier-hernandez.github.io/pi_asir/>.

El repositorio es **público**: todo lo que se suba, aunque no aparezca en la web, puede leerlo cualquiera. Además, cada push a `main` despliega la web automáticamente (`.github/workflows/`), así que fusionar una PR equivale a publicar.

## Estructura

| Ruta | Contenido | ¿Se publica en la web? |
| --- | --- | --- |
| `mkdocs.yml` | Configuración del sitio y navegación (`nav`). | Define la web |
| `docs/index.md`, `docs/index_proyecto_intermodular.md` | Portada y presentación del proyecto. | Sí |
| `docs/01herramientas.md`, `docs/02planteamiento_reto.md`, `docs/03_planificacion_trello.md` | Unidades de trabajo del proyecto (en la `nav` están la 1 y la 2). | Se construyen todas |
| `docs/git.md`, `docs/docker.md`, `docs/gns3.md`, `docs/mkdocs.md`, etc. | Documentación técnica de las herramientas. | Se construyen |
| `docs/PR*.md`, `docs/AWS_GameDay2025_*.md`, `docs/Security101*.md` | Prácticas y materiales de actividades (GNS3, AWS GameDay, seguridad). | Se construyen, aunque no estén en la `nav` |
| `docs/rubrica_defensa_caracterizacion.md` | Rúbrica de la defensa. | Se construye |
| `README.md`, `README_DEPLOY.md`, `requirements.txt`, `deploy.sh` | Presentación del repositorio, despliegue y dependencias. | No |

No hay `exclude_docs`: todo lo que esté en `docs/` acaba en la web aunque no esté en la `nav`.

## Compilar en local

Para comprobar el sitio en local:

```bash
pip install "mkdocs-material[imaging]" mkdocs-print-site-plugin
mkdocs build --strict
mkdocs serve
```

`mkdocs build --strict` no debe dar avisos de enlaces rotos. Ten en cuenta que MkDocs construye **todos** los ficheros de `docs/`, aunque no estén en la `nav`: lo que no deba verse tiene que ir en `exclude_docs` o fuera de `docs/`.

## Estilo de los apuntes

- Escribe en **castellano**, con frases completas y bien construidas.
- **Todo bien explicado, aunque el texto crezca.** Cada concepto se presenta, se explica y, cuando ayude, se acompaña de un ejemplo. Es preferible un párrafo más largo y claro que uno corto que obligue al alumnado a buscar fuera.
- **Nada de texto telegráfico**: no se encadenan fragmentos sin verbo, flechas o listas de palabras sueltas en lugar de explicaciones.
- **Nada de tono coloquial**: registro académico, cercano pero correcto, sin muletillas, sin bromas y sin expresiones de chat.
- **Siglas**: la primera vez que aparecen en cada tema se escriben completas, con la sigla entre paréntesis, por ejemplo «red de área local (LAN)». Después se puede usar solo la sigla.
- **No repetir lo ya visto**: si un concepto se explicó en otro tema, se enlaza a ese apartado (enlace relativo con ancla) con una frase de recordatorio, en lugar de volver a explicarlo.
- Usa los elementos de Material con mesura: admoniciones (`!!! note`, `!!! tip`, `!!! warning`) para los avisos y bloques de código con el lenguaje indicado.

## Imágenes y diagramas

- Las **capturas que se leen mal** (borrosas, pequeñas, con texto ilegible o con datos que no deben verse) se **rehacen como diagramas SVG** propios y se guardan junto al tema, en su carpeta `img/`.
- Las **fotos reales** de equipos o materiales llevan **crédito** (autor, fuente y licencia) en el pie de la figura.
- Toda imagen lleva un texto alternativo (`alt`) descriptivo.
- No se suben imágenes sin licencia de uso.

## Soluciones y autoevaluación

- Las **soluciones del Autocheck**, de las prácticas y de los retos **no se publican antes de la fecha de entrega**. Mientras tanto se guardan fuera de `docs/` o en una ruta excluida con `exclude_docs`.
- Las **claves y soluciones de exámenes y pruebas no se publican nunca**, ni en la web ni en el repositorio.
- Si no conoces la fecha de entrega, no publiques la solución y pregunta.

## Datos personales: nunca

El repositorio es público y todo lo que se suba puede leerlo cualquiera. **Nunca** se escriben ni se suben:

- horarios del profesorado o de los grupos;
- nombres, notas, listas o cualquier otro dato del **alumnado** o de sus familias;
- **DNI**, NIA, correos o teléfonos personales;
- **firmas** o documentos firmados;
- rutas locales del ordenador del profesor (OneDrive, Descargas, etc.), credenciales, tokens ni claves.

Si una tarea necesita esos datos, se trabaja fuera del repositorio. Si encuentras alguno ya subido, avísalo en la descripción de la PR en vez de dejarlo pasar.

## Evaluación

- La evaluación es **competencial** y tiene como referentes los **resultados de aprendizaje (RA)**. La nota se calcula por RA, con los pesos que fija la programación didáctica (PD).
- Los **criterios de evaluación (CE)** solo sirven para **verificar la cobertura**, es decir, para comprobar qué actividades o instrumentos evidencian cada CE. **No** llevan porcentajes ni pesos propios.
- No se usa la palabra «criterial» en ningún documento.
- Los RA y los CE se copian literalmente de la normativa del módulo; no se inventan ni se renombran.

## Forma de trabajar con Git

- Trabaja siempre en una **rama nueva** con un nombre descriptivo. Nunca hagas commit directamente en la rama por defecto.
- Cuando termines, abre una **pull request (PR)** con un resumen claro de lo que cambia y por qué.
- **No fusiones** la PR: la revisa y la acepta el profesor.
- No despliegues el sitio (`deploy.sh`, `mkdocs gh-deploy`) salvo que se pida expresamente.
- Antes de abrir la PR, ejecuta `mkdocs build --strict` y revisa que en el diff no haya datos personales ni soluciones que no deban publicarse.

## Word de la programación didáctica

Si existe `Planificación/build_docx.sh`, el Word de la PD se genera desde la raíz del repositorio con:

```bash
bash Planificación/build_docx.sh
```

Necesita `pandoc` y `python3` (con `python-docx`). El script usa `reference.docx` y los filtros de `Planificación/` para el formato, el índice con hipervínculos y las tablas. Edita siempre el Markdown de la PD y vuelve a generar el Word; no edites el `.docx` a mano. Si el script no existe en este repositorio, no lo crees sin que se pida.

## Específico de este repositorio

- **Módulo y ciclo**: Proyecto Intermodular de ASIR (grado superior). Se trabaja por retos y tiene carácter integrador: el proyecto reúne lo aprendido en los demás módulos del ciclo.
- **Unidades**: ocho unidades de trabajo, del planteamiento del reto a la presentación y defensa. Las que aún no están listas aparecen comentadas en la `nav` de `mkdocs.yml`.
- **Pesos de los RA**: los fija la PD del módulo.
- **Empresas**: las propuestas de proyecto se basan en empresas del entorno. No se publican datos de contacto de personas de esas empresas.
- **Dependencias**: `pip install -r requirements.txt`.
- **Pendiente de revisar**: en `docs/` están `PR103_Solucion.md`, `PR202_Solucion.md` y `C03.pdf`, que se publican aunque no estén en la `nav`. Comprueba con el profesor si sus fechas de entrega ya han pasado. En la raíz hay ficheros sueltos (`Hola`, `PR303_VirtualizacionServidorCliente.md`) que conviene ordenar.
