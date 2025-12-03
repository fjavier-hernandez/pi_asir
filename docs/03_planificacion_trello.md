---
title: Planificación del proyecto con Trello
description: Guía completa para utilizar Trello en la planificación y gestión del Proyecto Intermodular. Herramienta de gestión de proyectos basada en Kanban.
---

# 3. Planificación del proyecto con Trello

[Trello](https://trello.com/es/guide/trello-101) es una herramienta de gestión de proyectos basada en el método **Kanban**, perfecta para organizar y planificar el trabajo en equipo.

## 3.1. Conceptos básicos de Trello

### Estructura de Trello

Trello organiza el trabajo en:

1. **Tableros (Boards):** Representan un proyecto completo
2. **Listas (Lists):** Columnas que representan estados o fases del trabajo
3. **Tarjetas (Cards):** Tareas individuales que se mueven entre listas
4. **Miembros (Members):** Personas del equipo

### Flujo básico

```
Tablero "Proyecto UNIFAM" o "Proyecto CreviPlay"
├── Lista "Por hacer" (To Do)
│   ├── Tarjeta "Definir requisitos"
│   └── Tarjeta "Diseñar base de datos"
├── Lista "En progreso" (In Progress)
│   └── Tarjeta "Crear modelo de datos"
└── Lista "Completado" (Done)
    └── Tarjeta "Revisión del contexto"
```

## 3.2. Crear y configurar un tablero

### Paso 1: Crear un tablero

1. Accede a [trello.com](https://trello.com) y crea una cuenta (gratuita)
2. Haz clic en **"Crear tablero"** o **"Create board"**
3. Asigna un nombre descriptivo, ej: "Proyecto UNIFAM - Infraestructura TI" o "Proyecto CreviPlay - Infraestructura TI"
4. Elige la visibilidad (Privado para el equipo, o Público)

### Paso 2: Crear listas iniciales

Crea las siguientes listas para el proyecto:

- **Backlog:** Tareas identificadas pero no priorizadas
- **Por hacer (To Do):** Tareas listas para empezar
- **En progreso (In Progress):** Tareas que se están trabajando actualmente
- **En revisión:** Tareas completadas esperando validación
- **Completado (Done):** Tareas finalizadas y validadas

!!! tip "Listas adicionales sugeridas"
    Puedes añadir:
    
    - **Bloqueado:** Tareas que no pueden avanzar por dependencias
    - **Ideas:** Ideas para futuras mejoras
    - **Documentación:** Tareas relacionadas con documentar

## 3.3. Crear y gestionar tarjetas

### Crear una tarjeta

1. Haz clic en **"Añadir una tarjeta"** en la lista correspondiente
2. Escribe un título descriptivo y claro
3. Presiona Enter para crear la tarjeta

### Detalles de una tarjeta

Haz clic en una tarjeta para abrir sus detalles. Puedes añadir:

- **Descripción:** Detalles de la tarea
- **Miembros:** Asignar personas del equipo
- **Etiquetas (Labels):** Colores para categorizar (Ej: Prioridad, Tipo, Módulo)
- **Checklist:** Subtareas dentro de la tarjeta
- **Fecha de vencimiento:** Fecha límite
- **Adjuntos:** Archivos, imágenes, enlaces
- **Comentarios:** Comunicación del equipo

### Ejemplo de tarjeta bien estructurada

**Título:** RA1.1 - Caracterizar el reto (UNIFAM o CreviPlay)

**Descripción:**

Definir y documentar el reto del proyecto:

- Identificar el problema principal
- Definir objetivos del proyecto
- Identificar interesados
- Documentar en markdown

**Checklist:**

- Leer documentación de la empresa/organización elegida (UNIFAM o CreviPlay)
- Entrevistar (simulada) a director/representante de la organización
- Redactar caracterización del reto
- Revisar con el equipo
- Obtener feedback del profesor

**Etiquetas:** RA1, Prioridad Alta, Documentación

**Miembros:** @Ana, @Carlos

**Fecha de vencimiento:** 15/02/2025

## 3.4. Organización del proyecto en Trello

### Estructura recomendada para el proyecto

**Opción 1: Por fases del proyecto**

```
Backlog
Fase 1: Planteamiento
   ├── RA1.1 - Caracterizar el reto
   ├── RA1.2 - Análisis del contexto
   ├── RA1.3 - Definir alcance
   └── RA1.4 - Establecer requisitos
Fase 2: Planificación
   ├── RA2.1 - Crear cronograma
   ├── RA2.2 - Identificar recursos
   └── RA2.3 - Análisis de riesgos
En revisión
Completado
```

**Opción 2: Por resultados de aprendizaje (PI)**

```
Backlog
RA1 - Caracterización
RA2 - Planificación
RA5 - Comunicación
En progreso
En revisión
Completado
```

**Opción 3: Híbrido (Recomendado)**

Usa etiquetas para categorizar por PI y listas para estados:

- **Listas:** Por hacer, En progreso, En revisión, Completado
- **Etiquetas:**

  - RA1 (Caracterización)
  - RA2 (Planificación)
  - RA5 (Comunicación)
  - Prioridad Alta
  - Prioridad Media
  - Prioridad Baja

## 3.5. Mejores prácticas con Trello

### 1. Títulos descriptivos

Mal: "Hacer cosas"
Bien: "RA1.2 - Analizar contexto tecnológico de UNIFAM"

### 2. Usar checklists para subtareas

En lugar de crear muchas tarjetas pequeñas, agrupa en una tarjeta con checklist:

**Tarjeta:** "RA1.2 - Análisis del contexto"

**Checklist:**

- Investigar historia de la empresa/organización elegida
- Analizar infraestructura tecnológica actual
- Identificar competencia
- Realizar análisis DAFO
- Documentar hallazgos

### 3. Asignar responsables

Siempre asigna al menos un miembro a cada tarjeta para saber quién es responsable.

### 4. Usar fechas de vencimiento

Establece fechas límite realistas para mantener el ritmo del proyecto.

### 5. Comunicar en comentarios

Usa los comentarios de las tarjetas para:

- Hacer preguntas
- Compartir actualizaciones
- Pedir ayuda
- Registrar decisiones importantes

### 6. Revisar regularmente

- **Daily standup (diario):** Revisar qué se completó ayer, qué se hará hoy, qué bloquea
- **Sprint review (semanal):** Revisar progreso, ajustar planificación

## 3.6. Plantilla de tablero para el proyecto

Aquí tienes una plantilla lista para usar:

### Listas iniciales

1. **Backlog**
2. **Por hacer (To Do)**
3. **En progreso**
4. **En revisión**
5. **Completado**

### Etiquetas sugeridas

- **RA1** - Caracterización
- **RA2** - Planificación
- **RA5** - Comunicación
- **Alta** - Prioridad alta
- **Media** - Prioridad media
- **Baja** - Prioridad baja
- **Doc** - Documentación
- **Bug** - Problema/Error
- **Idea** - Mejora futura

### Tarjetas iniciales sugeridas

**En "Por hacer":**

1. **RA1.1 - Caracterizar el reto** (UNIFAM o CreviPlay)
   - Descripción: Definir problema, objetivos, interesados
   - Etiquetas: RA1, Alta, Doc

2. **RA1.2 - Análisis del contexto** (UNIFAM o CreviPlay)
   - Descripción: Analizar contexto empresarial, tecnológico, mercado
   - Etiquetas: RA1, Alta, Doc

3. **RA1.3 - Definir alcance**
   - Descripción: Establecer qué incluye y excluye el proyecto
   - Etiquetas: RA1, Alta, Doc

4. **RA1.4 - Establecer requisitos**
   - Descripción: Definir requisitos funcionales, no funcionales y del negocio
   - Etiquetas: RA1, Alta, Doc

5. **RA2.1 - Crear cronograma**
   - Descripción: Temporalizar actividades y definir hitos
   - Etiquetas: RA2, Alta

6. **RA2.2 - Identificar recursos**
   - Descripción: Definir equipo, herramientas, infraestructura necesaria
   - Etiquetas: RA2, Media

7. **RA2.3 - Análisis de riesgos**
   - Descripción: Identificar riesgos, probabilidad, impacto y mitigación
   - Etiquetas: RA2, Media

## 3.7. Integración con otras herramientas

Trello se puede integrar con:

- **GitHub:** Enlazar commits y pull requests con tarjetas
- **Google Drive:** Adjuntar documentos
- **Slack/Teams:** Notificaciones de cambios
- **Calendar:** Sincronizar fechas de vencimiento

!!! tip "Power-Ups de Trello"
    Trello ofrece "Power-Ups" (extensiones) gratuitos y de pago:

    - **Calendar:** Vista de calendario de fechas de vencimiento
    - **Voting:** Sistema de votación para priorizar
    - **Custom Fields:** Campos personalizados (presupuesto, horas, etc.)

---

## Recursos y referencias

### Documentación oficial

- [Guía oficial de Trello](https://trello.com/es/guide/trello-101)
- [Metodologías ágiles - Scrum](https://www.scrum.org/)
- [Gestión de proyectos - PMI](https://www.pmi.org/)

### Herramientas

- **Trello:** [https://trello.com](https://trello.com)
- **GitHub:** Para repositorio y documentación
- **Markdown:** Para documentación técnica
- **MkDocs:** Para generar documentación web

### Lecturas recomendadas

- "The Lean Startup" - Eric Ries (metodología de validación)
- "Scrum: The Art of Doing Twice the Work in Half the Time" - Jeff Sutherland
- Documentación sobre gestión de requisitos en proyectos de software

