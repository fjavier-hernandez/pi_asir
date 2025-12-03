---
title: MkDocs
description: Apuntes de MkDocs para el Proyecto Intermodular de ASIR por Francisco Javier Hernández Illán. Generación de sitios web estáticos con MkDocs y Material theme. Instalación, configuración y despliegue en GitHub Pages.
---

# MkDocs

> MkDocs es un **generador de sitios web estáticos** que toma como entrada texto escrito en Markdown y utiliza diseños predefinidos (temas) para crear un sitio web estático. Permite modificar el aspecto del sitio, los enlaces, los datos que se muestran en la página y muchas cosas más. En el contexto del **Proyecto Intermodular (PI)**, MkDocs facilita la creación de documentación profesional y sitios web para los proyectos, permitiendo centrarse en el contenido sin preocuparse por el diseño.

!!! tip "Página oficial"
    Accede a la página oficial de **Material for MkDocs** en: [https://squidfunk.github.io/mkdocs-material/](https://squidfunk.github.io/mkdocs-material/)

!!! tip
    Esta documentación está basada en los apuntes del curso [Markdown per a la creació de recursos](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/) del CEFIRE, adaptados y traducidos al castellano para el contexto del Proyecto Intermodular de ASIR.

---

## Propuesta didáctica

Esta herramienta se enmarca dentro del **módulo de Proyecto Intermodular** del CFGS ASIR, y contribuye a los siguientes **Resultados de Aprendizaje (RA)** definidos en la programación:

> **RA4.** *Documenta, versiona y despliega la solución y sus evidencias.*

### Criterios de evaluación (relacionados)

- **CE-RA4a**: Se ha documentado el procedimiento de instalación y despliegue.
- **CE-RA4b**: Se ha utilizado un sistema de control de versiones para gestionar la documentación.
- **CE-RA4c**: Se ha generado documentación web accesible y profesional.

### Contenidos

**Bloque 1 — Introducción a MkDocs**

- ¿Qué es MkDocs? Conceptos básicos.
- Instalación de MkDocs y Material theme.
- Creación del primer sitio web.

**Bloque 2 — Configuración básica**

- Estructura de directorios y archivos.
- Archivo `mkdocs.yml` de configuración.
- Navegación y organización del contenido.

**Bloque 3 — Despliegue**

- Despliegue en GitHub Pages.
- Integración con Git y GitHub.
- Personalización básica del tema Material.

---

## 1. Introducción

### 1.1. ¿Qué es MkDocs?

**MkDocs** es un generador de sitios web estáticos que permite crear documentación profesional a partir de archivos Markdown. El aspecto de la web viene determinado por plantillas o temas, que describen tanto la estructura de las diferentes páginas como el aspecto visual.

La filosofía de MkDocs es centrarse en el contenido (escrito en Markdown) y no tanto en el aspecto, que simplemente se configura una vez mediante un tema. El tema más popular y recomendado es **Material for MkDocs**, que ofrece un aspecto visual moderno, atractivo, y aporta una gran cantidad de funcionalidades adicionales.

!!! note "Referencia"
    Esta documentación está basada en los apuntes del curso [Markdown per a la creació de recursos](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/) del CEFIRE. Para ver las imágenes, capturas de pantalla y ejemplos visuales originales, consulta el sitio web del curso.
    
    **Sitio web de referencia:** [https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/)

#### Características principales

- **Generación estática:** Crea sitios web estáticos (HTML, CSS, JavaScript) que se pueden alojar en cualquier servidor web
- **Basado en Markdown:** El contenido se escribe en Markdown, un formato de texto plano fácil de aprender
- **Temas predefinidos:** Utiliza temas que definen el aspecto visual y la estructura
- **Navegación automática:** Genera automáticamente la navegación basándose en la estructura de archivos
- **Búsqueda integrada:** Muchos temas incluyen funcionalidad de búsqueda
- **Fácil despliegue:** Se puede desplegar fácilmente en GitHub Pages, Netlify, o cualquier servidor web

#### Ventajas para el Proyecto Intermodular

- **Documentación profesional:** Permite crear documentación web de aspecto profesional sin conocimientos avanzados de HTML/CSS
- **Versionado con Git:** Los archivos Markdown se pueden versionar con Git, facilitando el trabajo colaborativo
- **Despliegue en GitHub Pages:** Se integra perfectamente con GitHub, permitiendo alojar la documentación del proyecto de forma gratuita
- **Enfoque en contenido:** Permite centrarse en escribir el contenido sin preocuparse por el diseño
- **Actualización sencilla:** Actualizar la documentación es tan simple como editar un archivo Markdown y hacer commit

---

## 2. Instalación

### 2.1. Requisitos previos

Antes de instalar MkDocs, necesitas tener instalado:

- **Python 3.6 o superior**
- **pip** (gestor de paquetes de Python)

Para verificar si tienes Python instalado:

``` bash
python3 --version
```

O en algunos sistemas:

``` bash
python --version
```

### 2.2. Instalación de MkDocs

La forma más sencilla de instalar MkDocs es mediante pip:

``` bash
pip install mkdocs
```

O si necesitas usar pip3:

``` bash
pip3 install mkdocs
```

Para verificar que la instalación fue correcta:

``` bash
mkdocs --version
```

### 2.3. Instalación del tema Material

El tema Material for MkDocs es el más popular y recomendado. Se instala como un paquete adicional:

``` bash
pip install mkdocs-material
```

O con pip3:

``` bash
pip3 install mkdocs-material
```

### 2.4. Verificación de la instalación

Una vez instalado, puedes verificar que todo funciona correctamente creando un proyecto de prueba:

``` bash
mkdocs new mi-proyecto
cd mi-proyecto
mkdocs serve
```

Esto debería iniciar un servidor de desarrollo local en `http://127.0.0.1:8000` donde puedes ver tu sitio web.

---

## 3. Configuración

### 3.1. Crear un nuevo proyecto

Para crear un nuevo proyecto MkDocs:

``` bash
mkdocs new nombre-del-proyecto
```

Esto crea una estructura de directorios básica:

```
nombre-del-proyecto/
├── docs/
│   └── index.md
└── mkdocs.yml
```

### 3.2. Estructura de directorios

La estructura típica de un proyecto MkDocs es:

```
proyecto/
├── docs/              # Directorio con los archivos Markdown
│   ├── index.md       # Página principal
│   ├── guia.md        # Otras páginas
│   └── ...
├── mkdocs.yml         # Archivo de configuración
└── site/              # Directorio generado (no se versiona)
    └── ...            # HTML generado
```

- **`docs/`**: Contiene todos los archivos Markdown que forman el contenido del sitio
- **`mkdocs.yml`**: Archivo de configuración principal
- **`site/`**: Directorio donde se genera el sitio web estático (se crea al ejecutar `mkdocs build`)

!!! tip "Imágenes y recursos"
    Para ver ejemplos visuales de la estructura de directorios y capturas de pantalla del proceso de configuración, consulta la [sección de configuración del curso original](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/3_configuracion/).

### 3.3. Archivo de configuración `mkdocs.yml`

El archivo `mkdocs.yml` es el corazón de la configuración. Un ejemplo básico:

``` yaml
site_name: Mi Proyecto Intermodular
site_description: Documentación del proyecto PI de ASIR
site_author: Nombre del Alumno

theme:
  name: material
  palette:
    - scheme: default
      primary: blue
      accent: blue
      toggle:
        icon: material/brightness-7
        name: Cambiar a modo oscuro
    - scheme: slate
      primary: blue
      accent: blue
      toggle:
        icon: material/brightness-4
        name: Cambiar a modo claro

nav:
  - Inicio: index.md
  - Guía: guia.md
```

#### Elementos principales de la configuración

**Información del sitio:**

- `site_name`: Nombre del sitio web
- `site_description`: Descripción del sitio
- `site_author`: Autor del sitio

**Tema:**

- `theme.name`: Nombre del tema (material, readthedocs, etc.)
- `theme.palette`: Configuración de colores y modo claro/oscuro

**Navegación:**

- `nav`: Define la estructura de navegación del sitio
- Se puede organizar en secciones y subsecciones

### 3.4. Configuración avanzada del tema Material

El tema Material ofrece muchas opciones de personalización:

``` yaml
theme:
  name: material
  language: es
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.expand
    - navigation.top
    - search.suggest
    - search.highlight
  icon:
    repo: fontawesome/brands/github
  palette:
    - scheme: default
      primary: blue
      accent: blue
      toggle:
        icon: material/brightness-7
        name: Cambiar a modo oscuro
    - scheme: slate
      primary: blue
      accent: blue
      toggle:
        icon: material/brightness-4
        name: Cambiar a modo claro
```

#### Características del tema Material

- **Navegación por pestañas:** Organiza el contenido en pestañas
- **Navegación por secciones:** Navegación lateral con secciones expandibles
- **Búsqueda integrada:** Búsqueda en tiempo real del contenido
- **Modo oscuro/claro:** Alternancia entre temas claro y oscuro
- **Responsive:** Se adapta a diferentes tamaños de pantalla
- **Iconos:** Soporte para iconos Material Design y Font Awesome

---

## 4. Alojamiento del sitio web

Una vez construido el sitio web, necesitas alojarlo para que sea accesible públicamente. Existen varias opciones, siendo las más comunes GitHub Pages (recomendado para proyectos con Git) y Aules (plataforma educativa de la Conselleria).

### 4.1. Opciones de alojamiento

**GitHub Pages (Recomendado):**

- Gratuito y fácil de configurar
- Integración perfecta con Git y GitHub
- Actualización automática con cada commit
- URL personalizada: `usuario.github.io/nombre-repositorio`

**Aules (Plataforma educativa):**

- Disponible para profesores y alumnos de la Conselleria
- Integración con el entorno educativo
- Requiere acceso a la plataforma Aules

!!! note "Referencia visual"
    Para ver capturas de pantalla del proceso de despliegue, consulta las secciones del curso original:
    - [Alojamiento en Aules](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/4_allotgem-la-web-a-aules/)
    - [Alojamiento en GitHub](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/5_allotgem-la-web-a-github/)

---

## 5. Alojamiento en GitHub Pages

!!! note "Referencia visual"
    Para ver capturas de pantalla detalladas del proceso de despliegue en GitHub Pages, consulta la [sección de alojamiento en GitHub del curso original](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/5_allotgem-la-web-a-github/).

### 5.1. Preparar el repositorio

Para alojar tu sitio MkDocs en GitHub Pages:

1. **Crear un repositorio en GitHub** (público o privado)

2. **Inicializar Git en el proyecto:**

``` bash
cd nombre-del-proyecto
git init
git add .
git commit -m "Inicializar proyecto MkDocs"
```

3. **Conectar con el repositorio remoto:**

``` bash
git remote add origin https://github.com/usuario/nombre-repositorio.git
git branch -M main
git push -u origin main
```

### 5.2. Configurar GitHub Pages

Hay dos formas principales de desplegar MkDocs en GitHub Pages:

#### Opción 1: Usar la rama `gh-pages` (Recomendado)

1. **Instalar el plugin de GitHub:**

``` bash
pip install mkdocs-git-revision-date-localized-plugin
```

2. **Configurar `mkdocs.yml`:**

``` yaml
plugins:
  - git-revision-date-localized:
      enable_creation_date: true
```

3. **Construir y desplegar:**

``` bash
mkdocs gh-deploy
```

Este comando:

- Construye el sitio web
- Crea una rama `gh-pages` automáticamente
- Sube el contenido a GitHub
- Configura GitHub Pages para usar esa rama

#### Opción 2: Usar GitHub Actions (Avanzado)

Para un despliegue automático cada vez que se hace push, se puede configurar GitHub Actions. Esto requiere crear un archivo `.github/workflows/ci.yml`:

``` yaml
name: ci
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: 3.x
      - run: pip install mkdocs-material
      - run: mkdocs gh-deploy --force
```

### 5.3. Acceder al sitio

Una vez desplegado, el sitio estará disponible en:

```
https://usuario.github.io/nombre-repositorio/
```

O si has configurado un dominio personalizado:

```
https://tudominio.com
```

---

## 6. Trabajar con MkDocs

### 6.1. Servidor de desarrollo local

Para ver los cambios en tiempo real mientras trabajas:

``` bash
mkdocs serve
```

Esto inicia un servidor local en `http://127.0.0.1:8000` que se actualiza automáticamente cuando modificas los archivos.

El servidor de desarrollo es muy útil porque:

- **Actualización automática:** Los cambios en los archivos Markdown se reflejan inmediatamente en el navegador
- **Sin necesidad de reconstruir:** No necesitas ejecutar `mkdocs build` cada vez que haces un cambio
- **Depuración:** Permite ver errores y advertencias en tiempo real

### 6.2. Construir el sitio

Para generar los archivos HTML estáticos:

``` bash
mkdocs build
```

Esto crea el directorio `site/` con todos los archivos HTML, CSS y JavaScript necesarios.

### 6.3. Estructura de navegación

La navegación se define en el archivo `mkdocs.yml`:

``` yaml
nav:
  - Inicio: index.md
  - Guía de Usuario:
    - Introducción: guia/introduccion.md
    - Instalación: guia/instalacion.md
    - Configuración: guia/configuracion.md
  - API:
    - Referencia: api/referencia.md
  - Acerca de: acerca.md
```

### 6.4. Escribir contenido en Markdown

El contenido se escribe en archivos Markdown (`.md`) dentro del directorio `docs/`. MkDocs soporta la sintaxis estándar de Markdown y extensiones adicionales:

``` markdown
# Título principal

## Subtítulo

Texto normal con **negrita** e *cursiva*.

- Lista con viñetas
- Otro elemento

1. Lista numerada
2. Segundo elemento

[Enlace](https://ejemplo.com)

![Imagen](ruta/imagen.png)

```` markdown
Bloque de código
````
```

!!! tip "Referencia visual"
    Para ver ejemplos visuales de cómo se escribe contenido en Markdown y cómo se renderiza en MkDocs, consulta la [sección de contenido del curso original](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/).

---

## 7. Personalización avanzada

### 7.1. Extras del tema Material

El tema Material ofrece muchas funcionalidades adicionales:

#### Advertencias y notas

``` markdown
!!! note "Nota"
    Este es un texto de nota importante.

!!! warning "Advertencia"
    Ten cuidado con esto.

!!! tip "Consejo"
    Un consejo útil.

!!! danger "Peligro"
    Esto es peligroso.
```

#### Pestañas

``` markdown
=== "Opción 1"
    Contenido de la opción 1

=== "Opción 2"
    Contenido de la opción 2
```

#### Código con resaltado de sintaxis

El tema Material soporta resaltado de sintaxis para muchos lenguajes:

```` markdown
``` python
def funcion():
    return "Hola mundo"
```
````

### 7.2. Plugins adicionales

MkDocs soporta plugins que añaden funcionalidades:

- **mkdocs-mermaid2-plugin:** Para diagramas Mermaid
- **mkdocs-git-revision-date-localized-plugin:** Muestra fechas de última modificación
- **mkdocs-minify-plugin:** Minifica el HTML generado
- **mkdocs-redirects:** Permite redirecciones entre páginas

Para instalar un plugin:

``` bash
pip install nombre-del-plugin
```

Y añadirlo en `mkdocs.yml`:

``` yaml
plugins:
  - nombre-del-plugin
```

---

## 8. Buenas prácticas

### 8.1. Organización del contenido

- **Estructura clara:** Organiza el contenido en secciones lógicas
- **Nombres descriptivos:** Usa nombres de archivo descriptivos
- **Jerarquía:** Respeta la jerarquía de títulos (H1, H2, H3)
- **Índice:** Mantén un índice claro en la navegación

### 8.2. Versionado con Git

- **Commits descriptivos:** Haz commits con mensajes claros
- **Estructura de ramas:** Usa ramas para diferentes versiones si es necesario
- **`.gitignore`:** Añade `site/` al `.gitignore` (no se versiona)

### 8.3. Mantenimiento

- **Actualizar dependencias:** Mantén MkDocs y los plugins actualizados
- **Revisar enlaces:** Verifica que los enlaces funcionen correctamente
- **Probar localmente:** Siempre prueba localmente antes de desplegar

---

## 9. Recursos y referencias

### Documentación oficial

- **MkDocs:** [https://www.mkdocs.org/](https://www.mkdocs.org/)
- **Material for MkDocs:** [https://squidfunk.github.io/mkdocs-material/](https://squidfunk.github.io/mkdocs-material/)
- **Curso CEFIRE (referencia):** [https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/)

### Herramientas relacionadas

- **Markdown:** Formato de texto plano para escribir contenido
- **Git:** Sistema de control de versiones
- **GitHub Pages:** Alojamiento gratuito para sitios estáticos
- **Python:** Lenguaje de programación necesario para MkDocs

### Comandos útiles

``` bash
# Crear nuevo proyecto
mkdocs new nombre-proyecto

# Servidor de desarrollo
mkdocs serve

# Construir sitio
mkdocs build

# Desplegar en GitHub Pages
mkdocs gh-deploy

# Ver ayuda
mkdocs --help
```

---

*Documentación basada en los apuntes del curso [Markdown per a la creació de recursos](https://cursos-cefire.github.io/markdown-per-a-la-creacio-de-recursos/) del CEFIRE, adaptados y traducidos al castellano para el Proyecto Intermodular de ASIR.*

