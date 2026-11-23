---
title: Diseño de la solución y planificación
description: Guía para diseñar la solución técnica, planificar actividades, recursos, riesgos y cronograma del proyecto. Herramientas de planificación: Trello y Microsoft Planner.
---

# 3. Diseño de la solución y planificación

> En esta unidad aprenderás a **diseñar la solución técnica** del proyecto, **planificar actividades, recursos y riesgos**, y **crear un cronograma** detallado. Trabajarás con herramientas de planificación como **Trello** y **Microsoft Planner** para organizar el trabajo en equipo y gestionar las tareas del proyecto.

Esta unidad de trabajo corresponde principalmente al **Resultado de Aprendizaje RA2** y es fundamental para establecer la hoja de ruta del proyecto.

## Resultado de aprendizaje

Al finalizar esta unidad, serás capaz de:

- **RA2 (25%):** Planificar actividades, recursos, riesgos y cronograma del proyecto.

---

## 1. Conceptos básicos para el diseño y planificación

Para diseñar correctamente una solución y planificarla adecuadamente, debemos abordar los siguientes aspectos:

1. **Diseño de la arquitectura:** Definir la estructura técnica de la solución (infraestructura, servicios, componentes). Para documentarlo, puedes utilizar diagramas de infraestructura, arquitectura de red y arquitectura de aplicación.
  
    - *Herramientas:* [draw.io](https://app.diagrams.net/) (gratuito), [Lucidchart](https://www.lucidchart.com/) (freemium), [Miro](https://miro.com/) (freemium), [Excalidraw](https://excalidraw.com/) (gratuito), [PlantUML](https://plantuml.com/) (gratuito).

2. **Planificación de actividades:** Descomponer el proyecto en tareas concretas, identificando dependencias y secuencia. Para ello, puedes utilizar la **Estructura de Desglose del Trabajo (EDT, en español)** o **Work Breakdown Structure (WBS, en inglés)**, consiste en dividir el proyecto en partes más pequeñas y manejables (fases, entregables y tareas), lo que facilita la planificación, la asignación de responsabilidades y el seguimiento del avance.
  
    - *Herramientas:* [Trello](https://trello.com/) (gratuito), [Microsoft Planner](https://tasks.office.com/) (gratuito con cuenta educativa GVA), [Asana](https://asana.com/) (freemium), [Notion](https://www.notion.so/) (freemium), [Jira](https://www.atlassian.com/es/software/jira) (freemium).

3. **Gestión de recursos:** Identificar y asignar recursos necesarios (equipo, herramientas, infraestructura). Esto incluye la asignación de roles, herramientas específicas e infraestructura requerida.
  
    - *Herramientas:* [Microsoft Planner](https://tasks.office.com/) (gratuito con cuenta educativa GVA), [Trello](https://trello.com/) (gratuito), [Asana](https://asana.com/) (freemium), [Monday.com](https://monday.com/) (freemium), [Notion](https://www.notion.so/) (freemium).

4. **Análisis de riesgos:** Identificar posibles problemas, evaluar su probabilidad e impacto, y definir estrategias de mitigación. Debes realizar la identificación, evaluación y plan de mitigación de los riesgos identificados.
  
    - *Herramientas:* [Microsoft Excel](https://www.microsoft.com/es-es/microsoft-365/excel) / [Google Sheets](https://www.google.com/sheets/about/) (gratuitos), [Notion](https://www.notion.so/) (freemium), [Trello](https://trello.com/) (gratuito), plantillas de gestión de riesgos en Microsoft Planner.

5. **Cronograma:** Temporalizar actividades, definir hitos y entregables, establecer fechas clave. Puedes crear un cronograma con fases, hitos y entregables, y utilizar un **diagrama de Gantt** para visualizar la planificación temporal del proyecto. Puedes ampliar información sobre los diagramas de Gantt consultando el siguiente recurso: [Diagrama de Gantt en Wikipedia](https://es.wikipedia.org/wiki/Diagrama_de_Gantt)
  
    - *Herramientas:* [Microsoft Project](https://www.microsoft.com/es-es/microsoft-365/project/project-management-software) (de pago, disponible con MS365 educativo), [GanttProject](https://www.ganttproject.biz/) (gratuito, open source), [ProjectLibre](https://www.projectlibre.com/) (gratuito, open source), [Smartsheet](https://www.smartsheet.com/) (freemium), [Microsoft Excel](https://www.microsoft.com/es-es/microsoft-365/excel) / [Google Sheets](https://www.google.com/sheets/about/) con plantillas de Gantt (gratuitos), [Trello](https://trello.com/) con power-ups de Gantt (gratuito).

---

## 2. Herramientas de planificación

### 2.1. Trello

> **Trello** es una herramienta de gestión de proyectos basada en el método **Kanban**, perfecta para organizar y planificar el trabajo en equipo de forma visual.

Para una guía completa sobre cómo utilizar Trello en el proyecto, consulta:

**[Planificación del proyecto con Trello →](03_planificacion_trello.md)**

### 2.2. Microsoft Planner

> **Microsoft Planner** es una herramienta de planificación de proyectos integrada en **Microsoft 365** (MS365), disponible gratuitamente para el alumnado con cuenta educativa de la Generalitat Valenciana (GVA). Permite gestionar tareas, asignar responsables, establecer fechas y visualizar el progreso del proyecto.

!!! important "Disponibilidad de Microsoft Planner"
    El alumnado tiene acceso gratuito a **Microsoft Planner** a través de su cuenta educativa de Microsoft 365 (MS365) de la Generalitat Valenciana (GVA). Esta herramienta se integra perfectamente con Teams y otras aplicaciones de Microsoft 365.

**Características principales de Microsoft Planner:**

- **Planes:** Organización del proyecto en planes separados
- **Tareas:** Creación y asignación de tareas con responsables
- **Tableros:** Visualización tipo Kanban de las tareas
- **Calendario:** Vista de calendario con fechas de vencimiento
- **Gráficos:** Visualización del progreso del proyecto
- **Integración:** Integración con Microsoft Teams, Outlook y SharePoint

**Ventajas de Microsoft Planner:**

- Acceso gratuito con cuenta educativa GVA
- Integración nativa con Microsoft Teams
- Interfaz intuitiva y moderna
- Sincronización automática con calendario de Outlook
- Notificaciones y recordatorios automáticos
- Colaboración en tiempo real

Para una guía completa sobre cómo utilizar Microsoft Planner en el proyecto, consulta:

**[Planificación del proyecto con Trello y Microsoft Planner →](03_planificacion_trello.md)**

---

## 3. Diseño de la arquitectura

### 3.1. Arquitectura de infraestructura

El diseño de la arquitectura debe definir claramente:

- **Topología de red:** Estructura de la red, subredes, dispositivos de interconexión
- **Servidores y servicios:** Servidores necesarios, servicios a desplegar en cada uno
- **Base de datos:** Sistema gestor de base de datos, estructura de datos
- **Aplicación web:** Servidor web, CMS o aplicación personalizada
- **Seguridad:** Firewall, medidas de seguridad, acceso remoto
- **Respaldo:** Estrategia de backup y recuperación

### 3.2. Diagramas de arquitectura

Es fundamental crear diagramas que visualicen:

1. **Diagrama de topología de red:** Muestra la estructura física y lógica de la red
2. **Diagrama de arquitectura de aplicación:** Muestra los componentes de la aplicación y sus interacciones
3. **Diagrama de flujo de datos:** Muestra cómo fluyen los datos entre componentes
4. **Diagrama de despliegue:** Muestra dónde se despliegan los componentes (contenedores, instancias, servidores)

!!! tip "Herramientas para diagramas"
    Puedes utilizar:
    
    - **Draw.io / diagrams.net:** Herramienta online gratuita
    - **Lucidchart:** Herramienta profesional (versión gratuita disponible)
    - **Microsoft Visio:** Disponible en Microsoft 365 (si está incluido)
    - **PlantUML:** Para diagramas basados en texto
    - **Mermaid:** Integrado en MkDocs para diagramas en Markdown

---

## 4. Retos del proyecto

A continuación encontrarás los **puntos iniciales a planificar y diseñar** para cada uno de los retos elegidos por los grupos de trabajo.

### 4.1. Reto 1: Sitio web corporativo para taller mecánico (Docker)

#### Contexto del reto

**Proyecto:** Despliegue inicial de un sitio web corporativo para un taller mecánico ubicado en Crevillent.

**Situación actual:** El taller es de reciente apertura y se especializa en reparación y mantenimiento de vehículos, fabricación de piezas personalizadas y mantenimiento general. Actualmente **no cuenta con presencia digital**, lo que dificulta que los clientes potenciales encuentren información sobre servicios, ubicación y trabajos realizados.

#### Principales puntos iniciales a planificar y diseñar

**1. Arquitectura de infraestructura con Docker:**

- **Diseño de arquitectura de contenedores:**
  - Contenedor para servidor web (Apache/Nginx)
  - Contenedor para base de datos (MySQL/PostgreSQL)
  - Contenedor para aplicación web (WordPress o aplicación personalizada)
  - Red Docker personalizada para aislar servicios
  - Volúmenes persistentes para datos y configuraciones

- **Servicios de red:**
  - Configuración de red Docker para comunicación entre contenedores
  - Configuración de puertos y exposición de servicios
  - Configuración de DNS interno (opcional)

**2. Base de datos:**

- **Diseño del modelo de datos:**
  - Tabla de proyectos/trabajos realizados (vehículos reparados)
  - Tabla de servicios ofrecidos
  - Tabla de imágenes/galería de proyectos
  - Tabla de información de contacto
  - Tabla de usuarios/administradores (si aplica)

- **Configuración de base de datos:**
  - Instalación y configuración de MySQL/PostgreSQL en contenedor
  - Scripts de inicialización de base de datos
  - Configuración de seguridad y usuarios
  - Estrategia de backup

**3. Aplicación web:**

- **Funcionalidades principales:**
  - Página de inicio con información del taller
  - Sección de servicios ofrecidos
  - Galería de proyectos realizados (con imágenes de trabajos realizados)
  - Información de contacto y ubicación
  - Formulario de contacto (opcional)

- **Tecnologías:**
  - WordPress (CMS) o aplicación web personalizada
  - Integración con base de datos
  - Gestión de imágenes y recursos multimedia
  - Diseño responsive

**4. Docker Compose:**

- **Configuración de docker-compose.yml:**
  - Definición de servicios (web, base de datos)
  - Configuración de redes
  - Configuración de volúmenes
  - Variables de entorno
  - Dependencias entre servicios

- **Dockerfiles:**
  - Dockerfile para servidor web (si se personaliza)
  - Dockerfile para aplicación (si se desarrolla desde cero)

**5. Seguridad:**

- **Medidas de seguridad:**
  - Configuración de firewall en contenedores
  - Restricción de acceso a base de datos
  - Configuración de HTTPS/SSL (opcional, con certificado)
  - Gestión segura de credenciales (variables de entorno, secretos)

**6. Respaldo y mantenimiento:**

- **Estrategia de backup:**
  - Scripts de backup de base de datos
  - Backup de volúmenes Docker
  - Estrategia de recuperación

- **Automatización:**
  - Scripts para despliegue
  - Scripts para backup automático
  - Scripts de mantenimiento

**7. Documentación:**

- **Documentación técnica:**
  - Diagrama de arquitectura Docker
  - Documentación de docker-compose.yml
  - Documentación de Dockerfiles
  - Guía de despliegue
  - Guía de mantenimiento

#### Objetivos específicos del diseño

1. **Diseñar arquitectura de contenedores:** Definir estructura de contenedores, redes y volúmenes
2. **Diseñar modelo de datos:** Crear esquema de base de datos para gestión de proyectos y servicios
3. **Planificar despliegue:** Definir proceso de despliegue con Docker Compose
4. **Diseñar interfaz web:** Definir estructura y funcionalidades del sitio web corporativo
5. **Planificar seguridad:** Definir medidas de seguridad para contenedores y servicios
6. **Planificar respaldo:** Definir estrategia de backup y recuperación

---

### 4.2. Reto 2: Infraestructura completa de TI para CreviPlay (AWS)

#### Contexto del reto

**Proyecto:** Infraestructura completa de TI y plataforma web para CreviPlay.

**Situación actual:** CreviPlay es un nuevo estudio de desarrollo de videojuegos independiente que se está estableciendo en Crevillent. El estudio está formado por un pequeño equipo de desarrolladores locales que buscan crear videojuegos casuales e indie para múltiples plataformas. 

Al ser una empresa de nueva creación, **CreviPlay no cuenta con ninguna infraestructura de TI**. Necesitan crear desde cero toda su infraestructura tecnológica para poder operar profesionalmente. Esto incluye servidores, servicios de red, base de datos, aplicación web, y todos los sistemas de seguridad y respaldo necesarios.

#### Principales puntos iniciales a planificar y diseñar

**1. Arquitectura de infraestructura en AWS:**

- **Diseño de VPC (Virtual Private Cloud):**
  - Diseño de red con subredes públicas y privadas
  - Configuración de Internet Gateway
  - Configuración de NAT Gateway (para acceso a internet desde subredes privadas)
  - Configuración de Route Tables
  - Configuración de Security Groups

- **Servidores y servicios:**
  - Instancia EC2 para servidor web (Apache/Nginx)
  - Instancia RDS para base de datos (MySQL/PostgreSQL)
  - Bucket S3 para almacenamiento de recursos multimedia (imágenes, videos de videojuegos)
  - Configuración de Elastic IP (opcional, para IP estática)

**2. Base de datos:**

- **Diseño del modelo de datos:**
  - Tabla de proyectos/videojuegos (portafolio)
  - Tabla de desarrolladores del equipo
  - Tabla de contactos (publishers, partners)
  - Tabla de recursos multimedia (imágenes, videos)
  - Tabla de usuarios/administradores

- **Configuración de RDS:**
  - Selección de motor de base de datos (MySQL/PostgreSQL)
  - Configuración de instancia (tipo, almacenamiento)
  - Configuración de subred privada
  - Configuración de seguridad (Security Groups, encriptación)
  - Estrategia de backup automático

**3. Aplicación web:**

- **Funcionalidades principales:**
  - Portafolio de videojuegos (mostrar proyectos desarrollados o en desarrollo)
  - Información sobre el estudio (equipo, historia, misión)
  - Sección de contacto
  - Blog/Noticias (opcional, para actualizaciones del estudio)
  - Integración con S3 para recursos multimedia

- **Tecnologías:**
  - WordPress (CMS) o aplicación web personalizada
  - Integración con RDS para base de datos
  - Integración con S3 para almacenamiento de recursos
  - Diseño responsive

**4. Almacenamiento en S3:**

- **Configuración de buckets:**
  - Bucket para imágenes de videojuegos
  - Bucket para videos/trailers
  - Bucket para recursos del sitio web (opcional)
  - Configuración de políticas de acceso
  - Configuración de versionado (opcional)

**5. Seguridad:**

- **Medidas de seguridad en AWS:**
  - Configuración de Security Groups (firewall a nivel de instancia)
  - Configuración de Network ACLs (opcional, firewall a nivel de subred)
  - Configuración de HTTPS/SSL con certificado (AWS Certificate Manager)
  - Configuración de IAM (roles y políticas para acceso a servicios)
  - Encriptación de datos en reposo (RDS, S3)
  - Encriptación de datos en tránsito (HTTPS)

**6. Respaldo y alta disponibilidad:**

- **Estrategia de backup:**
  - Snapshots automáticos de RDS
  - Backup de instancias EC2 (AMI)
  - Versionado en S3
  - Estrategia de recuperación ante desastres

- **Alta disponibilidad (opcional, según alcance):**
  - Múltiples Availability Zones
  - Load Balancer (opcional)

**7. Monitorización y gestión:**

- **Servicios de AWS:**
  - CloudWatch para monitorización
  - Configuración de alertas
  - Logs de aplicación

**8. Documentación:**

- **Documentación técnica:**
  - Diagrama de arquitectura AWS
  - Documentación de VPC y subredes
  - Documentación de Security Groups
  - Guía de despliegue
  - Guía de mantenimiento
  - Documentación de costos estimados

#### Objetivos específicos del diseño

1. **Diseñar arquitectura AWS:** Definir VPC, subredes, instancias EC2, RDS y S3
2. **Diseñar modelo de datos:** Crear esquema de base de datos para gestión de proyectos, desarrolladores y contactos
3. **Planificar despliegue:** Definir proceso de despliegue en AWS
4. **Diseñar interfaz web:** Definir estructura y funcionalidades del sitio web del estudio
5. **Planificar seguridad:** Definir medidas de seguridad en AWS (Security Groups, IAM, encriptación)
6. **Planificar respaldo:** Definir estrategia de backup y recuperación en AWS
7. **Estimar costos:** Realizar estimación de costos mensuales de la infraestructura AWS

---

## 5. Planificación de actividades

### 5.1. Descomposición del trabajo (EDT/WBS)

El proyecto debe descomponerse en actividades más pequeñas y manejables. La **Estructura de Desglose del Trabajo (EDT)** o **Work Breakdown Structure (WBS)** organiza el trabajo en niveles jerárquicos:

**Ejemplo de estructura para el proyecto:**

```
Proyecto Intermodular
├── 1. Planteamiento y análisis
│   ├── 1.1. Caracterización del reto
│   ├── 1.2. Análisis del contexto
│   ├── 1.3. Definición de alcance
│   └── 1.4. Establecimiento de requisitos
├── 2. Diseño y planificación
│   ├── 2.1. Diseño de arquitectura
│   ├── 2.2. Diseño de base de datos
│   ├── 2.3. Diseño de aplicación web
│   ├── 2.4. Planificación de actividades
│   ├── 2.5. Análisis de riesgos
│   └── 2.6. Cronograma
├── 3. Desarrollo
│   ├── 3.1. Configuración de infraestructura
│   ├── 3.2. Configuración de base de datos
│   ├── 3.3. Desarrollo de aplicación web
│   └── 3.4. Configuración de seguridad
├── 4. Pruebas y validación
│   ├── 4.1. Pruebas de funcionalidad
│   ├── 4.2. Pruebas de seguridad
│   └── 4.3. Validación de requisitos
├── 5. Despliegue
│   ├── 5.1. Despliegue de infraestructura
│   ├── 5.2. Despliegue de aplicación
│   └── 5.3. Verificación de despliegue
└── 6. Documentación
    ├── 6.1. Documentación técnica
    ├── 6.2. Documentación de usuario
    └── 6.3. Memoria del proyecto
```

### 5.2. Identificación de dependencias

Es fundamental identificar las **dependencias** entre actividades:

- **Dependencia fin-inicio (FS):** La actividad B no puede comenzar hasta que termine la actividad A
- **Dependencia inicio-inicio (SS):** La actividad B puede comenzar cuando comience la actividad A
- **Dependencia fin-fin (FF):** La actividad B debe terminar cuando termine la actividad A

**Ejemplo de dependencias:**

- No se puede desarrollar la aplicación web hasta que esté configurada la base de datos
- No se puede desplegar la aplicación hasta que esté desarrollada y probada
- No se puede documentar hasta que esté implementada la solución

---

## 6. Gestión de recursos

### 6.1. Recursos humanos

**Roles del equipo:**

- **Líder de proyecto:** Coordinación general, comunicación con tutor
- **Administrador de sistemas:** Configuración de infraestructura (Docker/AWS)
- **Desarrollador web:** Desarrollo de aplicación web
- **Administrador de base de datos:** Diseño e implementación de base de datos
- **Especialista en seguridad:** Configuración de medidas de seguridad
- **Documentador:** Elaboración de documentación técnica

!!! tip "Distribución de roles"
    En equipos pequeños, cada miembro puede asumir múltiples roles. Lo importante es que todos los roles estén cubiertos y las responsabilidades estén claras.

### 6.2. Recursos técnicos

**Herramientas necesarias:**

- **Control de versiones:** Git, GitHub
- **Planificación:** Trello, Microsoft Planner
- **Documentación:** MkDocs, Markdown
- **Desarrollo:** Editor de código (VS Code, etc.)
- **Infraestructura:** Docker, AWS (según reto elegido)
- **Diagramas:** Draw.io, Lucidchart, PlantUML
- **Comunicación:** Microsoft Teams, correo electrónico

**Infraestructura:**

- **Acceso a internet:** Para trabajo remoto y acceso a servicios cloud
- **Equipos informáticos:** Ordenadores para desarrollo y documentación
- **Cuentas de servicios:** GitHub, AWS (cuenta educativa), Microsoft 365

---

## 7. Análisis de riesgos

### 7.1. Identificación de riesgos

Es fundamental identificar los **riesgos** que pueden afectar al proyecto:

**Categorías de riesgos:**

1. **Riesgos técnicos:**

   - Complejidad técnica mayor de la esperada
   - Problemas de compatibilidad entre tecnologías
   - Falta de conocimientos técnicos específicos
   - Problemas de rendimiento o escalabilidad

2. **Riesgos de recursos:**

   - Disponibilidad limitada de tiempo
   - Falta de acceso a herramientas o servicios
   - Problemas de conectividad o infraestructura

3. **Riesgos de planificación:**

   - Estimación incorrecta de tiempos
   - Cambios en los requisitos
   - Dependencias no identificadas

4. **Riesgos de equipo:**

   - Falta de comunicación
   - Conflictos en el equipo
   - Ausencias o falta de compromiso

### 7.2. Evaluación de riesgos

Para cada riesgo identificado, se debe evaluar:

- **Probabilidad:** Alta, Media, Baja
- **Impacto:** Alto, Medio, Bajo
- **Prioridad:** Calculada según probabilidad e impacto

**Matriz de riesgos:**

| Riesgo | Probabilidad | Impacto | Prioridad | Estrategia de mitigación |
|:-------|:------------:|:-------:|:---------:|:-------------------------|
| Falta de conocimientos en Docker/AWS | Media | Alto | Alta | Formación previa, documentación, consulta con tutor |
| Problemas de conectividad | Baja | Medio | Media | Trabajo offline cuando sea posible, backup de datos |
| Cambios en requisitos | Media | Medio | Media | Documentación clara de requisitos, comunicación constante |
| Falta de tiempo | Alta | Alto | Alta | Planificación realista, priorización de tareas |

### 7.3. Plan de mitigación

Para cada riesgo de alta prioridad, se debe definir una **estrategia de mitigación**:

- **Prevención:** Acciones para evitar que el riesgo ocurra
- **Contingencia:** Plan de acción si el riesgo se materializa
- **Responsable:** Persona encargada de gestionar el riesgo

---

## 8. Cronograma

### 8.1. Fases del proyecto

El proyecto se divide en **fases** principales:

1. **Fase 1: Planteamiento y análisis** (UT2)

   - Caracterización del reto
   - Análisis del contexto
   - Definición de alcance y requisitos

2. **Fase 2: Diseño y planificación** (UT3)

   - Diseño de arquitectura
   - Diseño de base de datos
   - Planificación de actividades
   - Cronograma detallado

3. **Fase 3: Desarrollo iterativo** (UT4)

   - Configuración de infraestructura
   - Desarrollo de aplicación
   - Implementación de funcionalidades

4. **Fase 4: Integración y validación** (UT5)

   - Integración de componentes
   - Pruebas y validación
   - Corrección de errores

5. **Fase 5: Despliegue** (UT6)

   - Despliegue de infraestructura
   - Despliegue de aplicación
   - Verificación de despliegue

6. **Fase 6: Documentación** (UT7)

   - Documentación técnica
   - Memoria del proyecto

7. **Fase 7: Presentación y defensa** (UT8)

   - Preparación de presentación
   - Defensa del proyecto

### 8.2. Hitos y entregables

**Hitos principales:**

- **Hito 1:** Caracterización del reto completada
- **Hito 2:** Diseño y planificación completados
- **Hito 3:** Infraestructura configurada y funcionando
- **Hito 4:** Aplicación web desarrollada y probada
- **Hito 5:** Proyecto desplegado y operativo
- **Hito 6:** Documentación completa
- **Hito 7:** Presentación y defensa realizada

**Entregables por fase:**

- **Fase 1:** Documento de caracterización, análisis y requisitos
- **Fase 2:** Documento de diseño, planificación y cronograma
- **Fase 3:** Infraestructura configurada, código de aplicación
- **Fase 4:** Solución integrada y validada
- **Fase 5:** Solución desplegada y accesible
- **Fase 6:** Documentación técnica completa
- **Fase 7:** Presentación y defensa del proyecto

---

## 9. Actividades y entregables

<a name="RG301"></a>

* :material-trophy: **RG301**. (RA2 // RA2.1, RA2.2, RA2.3, RA2.4, RA2.5, RA2.6, RA2.7 y RA2.8 // 30p). Trabajo en grupos de 2-3 personas para diseñar la solución técnica completa del proyecto, planificar todas las actividades, recursos y riesgos, y crear un cronograma detallado que permita ejecutar el proyecto de forma organizada.
    * **[RETO GRUPAL: Diseño de la solución y planificación](RG301_Diseno_Planificacion.md)**.

---

## 10. Recursos y referencias

### Documentación oficial

- [Microsoft Planner - Documentación oficial](https://support.microsoft.com/es-es/planner)
- [Trello - Guía oficial](https://trello.com/es/guide/trello-101)
- [AWS - Documentación oficial](https://docs.aws.amazon.com/)
- [Docker - Documentación oficial](https://docs.docker.com/)

### Herramientas

- **Trello:** [https://trello.com](https://trello.com)
- **Microsoft Planner:** Disponible en [Microsoft 365](https://www.microsoft.com/es-es/microsoft-365)
- **Draw.io / diagrams.net:** [https://app.diagrams.net/](https://app.diagrams.net/)
- **Lucidchart:** [https://www.lucidchart.com/](https://www.lucidchart.com/)
- **PlantUML:** [https://plantuml.com/](https://plantuml.com/)

### Lecturas recomendadas

- "The Art of Project Management" - Scott Berkun
- "Scrum: The Art of Doing Twice the Work in Half the Time" - Jeff Sutherland
- Documentación sobre gestión de proyectos y planificación

---

## Glosario de términos y acrónimos

- **EDT:** Estructura de Desglose del Trabajo
- **WBS:** Work Breakdown Structure
- **VPC:** Virtual Private Cloud (AWS)
- **EC2:** Elastic Compute Cloud (AWS)
- **RDS:** Relational Database Service (AWS)
- **S3:** Simple Storage Service (AWS)
- **IAM:** Identity and Access Management (AWS)
- **CMS:** Content Management System
- **RA2:** Resultado de Aprendizaje 2 (Planificación)
