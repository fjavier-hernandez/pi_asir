---
title: Planteamiento del reto y análisis del contexto
description: Guía para caracterizar el reto, analizar el contexto del sector, definir alcance y requisitos del proyecto. Propuestas de proyectos basadas en empresas locales de Crevillent.
---

# 2. Planteamiento del reto y análisis del contexto

> En esta unidad aprenderás a **caracterizar el reto**, **analizar el contexto del sector**, **definir el alcance** y **establecer los requisitos** de un proyecto TIC real. Trabajarás con propuestas basadas en empresas locales de Crevillent, permitiéndote conectar el aprendizaje con el tejido empresarial de tu entorno.

Esta unidad de trabajo corresponde a los **Resultados de Aprendizaje RA1 y RA2** y es fundamental para sentar las bases de un proyecto exitoso.

## Resultados de aprendizaje

Al finalizar esta unidad, serás capaz de:

- **RA1 (15%):** Caracterizar el reto y el contexto del sector, definiendo alcance y requisitos.
- **RA2 (25%):** Planificar actividades, recursos, riesgos y cronograma del proyecto.
- **RA5 (15%):** Comunicar y colaborar eficazmente (reuniones, pitch, retroalimentación).

---

## 1. Conceptos básicos para el planteamiento del reto

Para caracterizar correctamente un reto, debemos responder a cuatro preguntas clave:

1. **¿Qué problema se intenta resolver?** Descripción clara del problema, análisis de su impacto e identificación de los interesados/afectados.

2. **¿Por qué es importante resolverlo?** Beneficios esperados, coste de no resolverlo y oportunidades que se abren.

3. **¿Quién necesita la solución?** Identificación de interesados (clientes, usuarios, patrocinadores), sus necesidades y nivel de influencia.

4. **¿Qué se quiere lograr?** Objetivos del proyecto, resultados esperados y criterios de éxito.

**Estructura de la caracterización del reto:**

1. **Título del reto:** Nombre descriptivo y claro del proyecto
2. **Contexto:** Situación actual de la organización/empresa
3. **Problemática:** Descripción del problema o necesidad a resolver
4. **Objetivos:** Qué se quiere conseguir con el proyecto
5. **Interesados:** Personas o grupos involucrados o afectados
6. **Análisis del contexto:** Empresarial, tecnológico, mercado, social y geográfico
7. **Análisis DAFO:** Debilidades, Amenazas, Fortalezas, Oportunidades
8. **Alcance:** Funcional (qué se incluye/excluye), técnico (tecnologías), temporal (fases), recursos
9. **Requisitos:** Funcionales (qué debe hacer), no funcionales (cómo debe funcionar), del negocio

---

## 2. Propuestas de proyectos

A continuación encontrarás **2 propuestas de proyectos** basadas en empresas reales de Crevillent. Cada equipo deberá elegir una propuesta y desarrollar el planteamiento completo siguiendo la estructura del Proyecto Intermodular (PI) indicada en los requisitos.

!!! important "Importante"
    Los proyectos deben estar orientados a **ASIR**, especialmente a la **creación de entornos virtualizados**. Se puede elegir entre las plataformas **GNS3**, **AWS** o **Docker** estudiadas en el módulo de Herramientas.  
    
    
!!! tip "Orientación de requisitos"
    Los requisitos deben estar orientados a los módulos especificados en los requisitos del Proyecto Intermodular (PI): **ASGBD**, **ASO**, **IAW**, **Servicios de Red e Internet**, **Seguridad** y **Alta Disponibilidad**.

### Propuesta 1: Infraestructura completa de TI para la Asociación UNIFAM

#### Contexto

La **Asociación de Fabricantes de Alfombras de Crevillent (UNIFAM)** agrupa a más de 15 empresas del sector textil especializadas en la fabricación de alfombras, moquetas y productos relacionados. La asociación funciona principalmente como entidad de representación y promoción del sector, pero **no cuenta con infraestructura de TI propia** para gestionar su actividad de forma profesional.

**Situación actual:** UNIFAM actualmente gestiona su información de forma muy básica. Cada empresa asociada gestiona su propio catálogo de productos de forma individual, utilizando diferentes formatos (catálogos PDF, hojas de cálculo, páginas web individuales). La asociación no tiene servidores propios, servicios de red configurados, ni sistemas de gestión centralizados. **Necesitan crear desde cero toda su infraestructura tecnológica** para poder operar de forma profesional y ofrecer servicios digitales a sus empresas asociadas.

#### Problema identificado

Como asociación sin infraestructura de TI, UNIFAM necesita crear completamente su infraestructura desde cero:

- **Falta total de infraestructura:** No existe ningún servidor, base de datos, ni servicios de red configurados por parte de la asociación
- **No existe una plataforma centralizada:** No hay una plataforma que muestre todos los productos de las empresas asociadas de forma unificada
- **Los clientes deben consultar múltiples fuentes:** Para encontrar productos deben consultar múltiples webs o catálogos individuales
- **Falta de servicios de red:** La asociación no tiene servicios de red configurados (DHCP, DNS, SSH, FTP)
- **Falta de seguridad:** No existe ninguna medida de seguridad implementada a nivel de asociación
- **Sin sistema de respaldo:** No hay mecanismos de copia de seguridad para la información de la asociación
- **Dificultad para realizar promociones conjuntas:** Sin plataforma centralizada es difícil promocionar el sector de forma unificada
- **Falta de visibilidad online:** El sector "Alfombras de Crevillent" no tiene una presencia web profesional centralizada
- **Dificultad para identificar tendencias:** Sin sistema de gestión es difícil analizar qué productos son más demandados

#### Ejemplo de caracterización del reto

**1. Título del reto:** Infraestructura completa de TI y plataforma web centralizada para UNIFAM

**2. Contexto:** La Asociación de Fabricantes de Alfombras de Crevillent (UNIFAM) agrupa a más de 15 empresas del sector textil. Actualmente no cuenta con infraestructura de TI propia y cada empresa gestiona su catálogo de forma individual (PDF, hojas de cálculo, webs individuales).

**3. Problemática:** Falta total de infraestructura tecnológica (servidores, base de datos, servicios de red) y ausencia de plataforma centralizada que muestre todos los productos de las empresas asociadas, dificultando la búsqueda, comparación y promoción conjunta.

**4. Objetivos:**

- Crear infraestructura completa de TI desde cero (servidores, servicios de red, base de datos)
- Desplegar plataforma web centralizada con catálogo completo de todas las empresas asociadas
- Implementar servicios de red (DHCP, DNS, SSH, FTP, Apache)
- Configurar medidas de seguridad y sistema de respaldo

**5. Interesados:**

- **Primarios:** Director y junta directiva de UNIFAM, empresas asociadas, equipo de desarrollo
- **Secundarios:** Clientes potenciales, instituciones públicas, diseñadores de interiores

**6. Análisis del contexto:**

- **Empresarial:** Asociación sin ánimo de lucro, 15+ empresas asociadas, sector textil tradicional
- **Tecnológico:** Sin infraestructura previa, necesidad de crear todo desde cero
- **Mercado:** Sector de alfombras de Crevillent, competencia internacional, necesidad de digitalización
- **Geográfico:** Crevillent (Alicante), sector con tradición local

**7. Análisis DAFO:**

- **Fortalezas:** Tradición del sector, múltiples empresas asociadas, apoyo institucional
- **Debilidades:** Falta de infraestructura TI, recursos limitados, poca experiencia digital
- **Oportunidades:** Digitalización del sector, visibilidad online, promoción conjunta
- **Amenazas:** Competencia internacional, cambios tecnológicos, costes de mantenimiento

**8. Alcance:**

- **Funcional:** Plataforma web con catálogo, búsqueda, filtrado, paneles de administración (incluido). E-commerce, integración ERP (excluido)
- **Técnico:** GNS3, AWS o Docker, Linux, Apache, WordPress, MySQL/PostgreSQL, PHP
- **Temporal:** Proyecto anual del ciclo formativo
- **Recursos:** Equipo de alumnos, tutor, infraestructura del centro educativo

**9. Requisitos principales:**

- **Funcionales:** Visualización de catálogo, búsqueda y filtrado, gestión de productos por empresas, administración global
- **No funcionales:** Tiempo de carga < 2 segundos, diseño responsive, backup diario, seguridad (HTTPS, encriptación)
- **Del negocio:** Mejorar visibilidad online del sector, facilitar búsqueda de productos, modernizar imagen de la asociación

#### Objetivos del proyecto

1. **Crear infraestructura completa desde cero:** Diseñar e implementar toda la infraestructura de TI necesaria para la asociación
2. **Implementar servicios de red:** Configurar todos los servicios de red necesarios (DHCP, DNS, SSH, FTP, Apache)
3. **Desplegar base de datos:** Instalar y configurar un sistema gestor de bases de datos para gestionar información de productos, empresas asociadas y usuarios
4. **Crear plataforma web centralizada:** Desarrollar una plataforma web profesional con el catálogo completo de todas las empresas asociadas
5. **Facilitar búsqueda y filtrado:** Implementar sistema de búsqueda y filtrado de productos por categoría, empresa, precio, material, etc.
6. **Mejorar visibilidad online:** Crear presencia web profesional para el sector "Alfombras de Crevillent"
7. **Proporcionar herramientas de administración:** Desarrollar paneles de administración para que cada empresa gestione sus productos y para administración global
8. **Implementar seguridad:** Configurar todas las medidas de seguridad necesarias (firewall, encriptación, acceso remoto seguro)
9. **Establecer sistema de respaldo:** Implementar mecanismos de copia de seguridad y recuperación
10. **Automatizar tareas:** Crear scripts para automatizar tareas administrativas y de mantenimiento

#### Alcance del proyecto

**Incluido (Infraestructura completa desde cero):**

**Infraestructura base:**

- Instalación y configuración de sistema operativo en entorno virtualizado (GNS3, AWS o Docker)
- Configuración de topología de red completa
- Implementación de servicios de red (DHCP, DNS, SSH, FTP)
- Configuración de firewall y medidas de seguridad básicas

**Base de datos:**

- Instalación y configuración de sistema gestor de bases de datos (MySQL/PostgreSQL)
- Creación de estructura de base de datos completa (productos, empresas asociadas, usuarios, categorías, materiales)
- Configuración de seguridad y control de acceso a la base de datos
- Implementación de mecanismos de integridad y consistencia

**Aplicación web:**

- Instalación y configuración del servidor web Apache
- Instalación, configuración y personalización de WordPress para el catálogo de productos
- Portal web público con visualización de catálogo centralizado
- Sistema de búsqueda y filtrado avanzado (por empresa, categoría, material, precio)
- Panel de administración por empresa (gestión de productos - CRUD completo)
- Panel de administración global (gestión de empresas asociadas y usuarios)
- Sistema de autenticación y autorización (roles: administrador global, administrador empresa, visitante)
- Gestión de imágenes de productos (subida múltiple, redimensionado automático)
- Responsive design (adaptable a móviles y tablets)
- Integración básica con redes sociales (compartir productos)
- Exportación de catálogo a PDF/Excel

**Seguridad y mantenimiento:**

- Análisis de amenazas y medidas de protección
- Configuración de acceso remoto seguro (SSH con claves)
- Implementación de cortafuegos
- Configuración de HTTPS/SSL
- Sistema de backup automático y recuperación
- Scripts de automatización para tareas administrativas
- Monitorización del sistema

**Excluido (fase inicial):**

- Sistema de pedidos online
- Pasarela de pago
- Gestión de inventario en tiempo real
- Carrito de compra
- Sistema de reseñas y valoraciones
- Integración con sistemas ERP de las empresas
- Múltiples servidores o alta disponibilidad avanzada

#### Requisitos principales por módulos

**ASGBD (Administración de Sistemas Gestores de Bases de Datos):**

- Instalación y configuración de un sistema gestor de base de datos (MySQL/PostgreSQL)
- Creación de la estructura de base de datos (tablas principales: productos, empresas, usuarios)
- Configuración de seguridad básica (usuarios, permisos)
- Script de backup automático de la base de datos

**ASO (Administración de Sistemas Operativos):**

- Instalación y configuración de sistema operativo Linux en entorno virtualizado (GNS3, AWS o Docker)
- Gestión de usuarios, permisos y políticas de seguridad básicas
- Configuración de servicios del sistema (Apache, MySQL)
- Script de automatización para backups o tareas administrativas básicas

**IAW (Implantación de Aplicaciones Web):**

- Instalación y configuración del servidor Apache
- Instalación y configuración de WordPress
- Administración de usuarios en WordPress
- Acceso a base de datos desde PHP (conexión y consultas básicas)
- Personalización básica de WordPress (tema o plugin simple)

**Servicios de Red e Internet:**

- Configuración de SSH para acceso remoto seguro
- Configuración de DNS básico (o uso de DNS externo)
- Configuración de Apache como servidor web

**Seguridad y Alta Disponibilidad:**

- Configuración de firewall básico (iptables/ufw, AWS Security Groups o reglas de red Docker)
- Configuración de HTTPS/SSL
- Análisis básico de amenazas y medidas de protección implementadas
- Si se usa AWS: configuración de VPC con subredes públicas y privadas
- Si se usa Docker: configuración de redes Docker personalizadas para aislar servicios

#### Interesados identificados

- **Primarios:** 
  - Director y junta directiva de UNIFAM
  - Empresas asociadas a UNIFAM
  - Equipo de desarrollo del proyecto (alumnos)
- **Secundarios:** 
  - Clientes potenciales (compradores de alfombras)
  - Instituciones públicas de promoción (ayuntamiento, consellería)
  - Diseñadores de interiores y arquitectos
  - Distribuidores y mayoristas

#### Entorno de virtualización

**Importante:** Al ser una asociación sin infraestructura previa, el proyecto debe crear completamente la infraestructura desde cero en un entorno virtualizado. El equipo puede elegir entre:

- **Opción A - GNS3:** 
  - Crear topología de red completa desde cero con:
    - Router/Switch para interconexión
    - Servidor Linux virtualizado (Ubuntu Server/Debian)
    - Cliente de prueba (opcional)
  - Configuración completa de servicios de red (DHCP, DNS, SSH, FTP)
  - Instalación y configuración de Apache y base de datos en el servidor
  - Despliegue de la aplicación web WordPress
  - Configuración de firewall (iptables/ufw) y servicios de seguridad
  - Documentación completa de la topología de red

- **Opción B - AWS:**
  - Crear VPC desde cero con diseño de red:
    - Subred pública para servidor web (EC2)
    - Subred privada para base de datos (RDS)
  - Configuración de Internet Gateway y NAT Gateway
  - Despliegue de instancia EC2 para servidor web (instalación de Apache, WordPress)
  - Configuración de RDS para base de datos
  - Configuración de S3 para almacenamiento de imágenes de productos
  - Configuración de Security Groups para seguridad de red
  - Configuración de Route Tables
  - Documentación completa de la arquitectura AWS

- **Opción C - Docker:**
  - Crear arquitectura de contenedores con Docker Compose
  - Configuración de red Docker personalizada para aislar servicios
  - Contenedor para servidor web (Apache con WordPress)
  - Contenedor para base de datos (MySQL/PostgreSQL)
  - Contenedor para servicios de red (opcional: DNS, DHCP mediante scripts)
  - Configuración de volúmenes persistentes para datos y configuraciones
  - Configuración de variables de entorno y secretos
  - Documentación completa de la arquitectura Docker (docker-compose.yml, Dockerfiles)

#### Tecnologías sugeridas

- **Virtualización:** GNS3, AWS (VPC, EC2, RDS, S3) o Docker (contenedores, Docker Compose, redes)
- **Sistema Operativo:** Linux (Ubuntu Server, Debian) o Windows Server
- **Servidor Web:** Apache
- **CMS:** WordPress
- **Base de datos:** MySQL o PostgreSQL
- **Lenguaje:** PHP
- **Scripting:** Bash, Python (para automatización)
- **Control de versiones:** Git, GitHub

#### Recursos de referencia

- **Web UNIFAM:** [https://unifam.es/asociados/](https://unifam.es/asociados/)
- **Empresas asociadas:** Consultar el listado en la web de UNIFAM
- **Marcas de calidad:** Investigar "Alfombras de Crevillente" y marca "WOOLAN"
- **Documentación GNS3:** Consultar guías del módulo de Herramientas
- **Documentación AWS:** [https://docs.aws.amazon.com/](https://docs.aws.amazon.com/)
- **Documentación Docker:** Consultar guías del módulo de Herramientas

---

### Propuesta 2: Infraestructura completa de TI para estudio de videojuegos CreviPlay

#### Contexto

**CreviPlay** es un nuevo estudio de desarrollo de videojuegos independiente que se está estableciendo en Crevillent. El estudio está formado por un pequeño equipo de desarrolladores locales que buscan crear videojuegos casuales e indie para múltiples plataformas. 

**Situación actual:** Al ser una empresa de nueva creación, **CreviPlay no cuenta con ninguna infraestructura de TI**. Necesitan crear desde cero toda su infraestructura tecnológica para poder operar profesionalmente. Esto incluye servidores, servicios de red, base de datos, aplicación web, y todos los sistemas de seguridad y respaldo necesarios.

#### Problema identificado

Como empresa nueva, CreviPlay necesita crear completamente su infraestructura de TI desde cero:

- **Falta total de infraestructura:** No existe ningún servidor, base de datos, ni servicios de red configurados
- **Necesidad de plataforma web profesional:** Requieren un sitio web para mostrar su portafolio de videojuegos (actualmente en desarrollo)
- **Falta de sistema de gestión:** Necesitan gestionar información sobre proyectos, desarrolladores, contactos con publishers y partners
- **Ausencia de servicios de red:** No tienen servicios de red configurados (DHCP, DNS, SSH, FTP)
- **Falta de seguridad:** No existe ninguna medida de seguridad implementada
- **Sin sistema de respaldo:** No hay mecanismos de copia de seguridad
- **Falta de visibilidad online:** No tienen presencia web profesional

#### Ejemplo de caracterización del reto

**1. Título del reto:** Infraestructura completa de TI y plataforma web para CreviPlay

**2. Contexto:** CreviPlay es un nuevo estudio de desarrollo de videojuegos independiente en Crevillent. Formado por un pequeño equipo de desarrolladores locales que buscan crear videojuegos casuales e indie. Al ser una empresa de nueva creación, no cuenta con ninguna infraestructura de TI.

**3. Problemática:** Falta total de infraestructura tecnológica (servidores, base de datos, servicios de red) y ausencia de plataforma web profesional para mostrar el portafolio de videojuegos y gestionar información del estudio (proyectos, desarrolladores, contactos).

**4. Objetivos:**

- Crear infraestructura completa de TI desde cero (servidores, servicios de red, base de datos)
- Desplegar plataforma web profesional para mostrar portafolio de videojuegos
- Implementar servicios de red (DHCP, DNS, SSH, FTP, Apache)
- Configurar medidas de seguridad y sistema de respaldo

**5. Interesados:**

- **Primarios:** Fundadores y equipo de CreviPlay (desarrolladores, diseñadores, directores), equipo de desarrollo del proyecto
- **Secundarios:** Clientes potenciales, publishers, partners, instituciones públicas

**6. Análisis del contexto:**

- **Empresarial:** Estudio nuevo, pequeño equipo, enfoque en videojuegos indie y casual
- **Tecnológico:** Sin infraestructura previa, necesidad de crear todo desde cero
- **Mercado:** Industria de videojuegos independientes, competencia global, necesidad de visibilidad online
- **Geográfico:** Crevillent (Alicante), estudio local con proyección internacional

**7. Análisis DAFO:**

- **Fortalezas:** Equipo joven y motivado, conocimiento técnico, flexibilidad
- **Debilidades:** Falta de infraestructura TI, recursos limitados, poca experiencia empresarial
- **Oportunidades:** Mercado en crecimiento, tecnologías accesibles, apoyo de instituciones
- **Amenazas:** Competencia de estudios grandes, cambios tecnológicos, dependencia de plataformas

**8. Alcance:**

- **Funcional:** Plataforma web con portafolio, gestión de proyectos, información del estudio (incluido). E-commerce, descargas directas, integración con Steam/Epic (excluido)
- **Técnico:** GNS3, AWS o Docker, Linux, Apache, WordPress, MySQL/PostgreSQL, PHP
- **Temporal:** Proyecto anual del ciclo formativo
- **Recursos:** Equipo de alumnos, tutor, infraestructura del centro educativo

**9. Requisitos principales:**

- **Funcionales:** Visualización de portafolio, gestión de proyectos, información del estudio, panel de administración
- **No funcionales:** Tiempo de carga < 2 segundos, diseño responsive, backup diario, seguridad (HTTPS, encriptación)
- **Del negocio:** Crear presencia web profesional, mostrar portafolio de videojuegos, facilitar contacto con publishers y partners

#### Objetivos del proyecto

1. **Crear infraestructura completa desde cero:** Diseñar e implementar toda la infraestructura de TI necesaria para el estudio
2. **Implementar servicios de red:** Configurar todos los servicios de red necesarios (DHCP, DNS, SSH, FTP, Apache)
3. **Desplegar base de datos:** Instalar y configurar un sistema gestor de bases de datos para gestionar toda la información del estudio
4. **Crear plataforma web:** Desarrollar una plataforma web profesional para mostrar el portafolio de videojuegos
5. **Implementar seguridad:** Configurar todas las medidas de seguridad necesarias (firewall, encriptación, acceso remoto seguro)
6. **Establecer sistema de respaldo:** Implementar mecanismos de copia de seguridad y recuperación
7. **Automatizar tareas:** Crear scripts para automatizar tareas administrativas y de mantenimiento

#### Alcance del proyecto

**Incluido (Infraestructura completa desde cero):**

**Infraestructura base:**

- Instalación y configuración de sistema operativo en entorno virtualizado (GNS3, AWS o Docker)
- Configuración de topología de red completa
- Implementación de servicios de red (DHCP, DNS, SSH, FTP)
- Configuración de firewall y medidas de seguridad básicas

**Base de datos:**

- Instalación y configuración de sistema gestor de bases de datos (MySQL/PostgreSQL)
- Creación de estructura de base de datos completa (proyectos, desarrolladores, contactos, recursos, usuarios)
- Configuración de seguridad y control de acceso a la base de datos
- Implementación de mecanismos de integridad y consistencia

**Aplicación web:**

- Instalación y configuración del servidor web Apache
- Instalación, configuración y personalización de WordPress para el portafolio
- Portal web público con portafolio de videojuegos
- Sistema de gestión de proyectos (información, imágenes, videos)
- Panel de administración para gestionar contenido (CRUD completo)
- Sistema de autenticación y autorización para administradores
- Gestión de imágenes y recursos multimedia
- Responsive design (adaptable a móviles y tablets)
- Secciones: Portafolio, Sobre el estudio, Contacto, Blog/Noticias (opcional)

**Seguridad y mantenimiento:**

- Análisis de amenazas y medidas de protección
- Configuración de acceso remoto seguro (SSH con claves)
- Implementación de cortafuegos
- Configuración de HTTPS/SSL
- Sistema de backup automático y recuperación
- Scripts de automatización para tareas administrativas
- Monitorización del sistema

**Excluido (fase inicial):**

- Sistema de e-commerce o venta de juegos
- Sistema de descargas directas de juegos
- Integración con plataformas de distribución (Steam, Epic Games, etc.)
- Sistema de comentarios o foros
- Integración con redes sociales avanzada (más allá de enlaces)
- Sistema de newsletter o suscripciones
- Múltiples servidores o alta disponibilidad avanzada

#### Requisitos principales por módulos

**ASGBD (Administración de Sistemas Gestores de Bases de Datos):**

- Instalación y configuración de un sistema gestor de base de datos (MySQL/PostgreSQL)
- Creación de la estructura de base de datos (tablas principales: proyectos, desarrolladores, contactos, usuarios)
- Configuración de seguridad básica (usuarios, permisos)
- Script de backup automático de la base de datos

**ASO (Administración de Sistemas Operativos):**

- Instalación y configuración de sistema operativo Linux en entorno virtualizado (GNS3, AWS o Docker)
- Gestión de usuarios, permisos y políticas de seguridad básicas
- Configuración de servicios del sistema (Apache, MySQL)
- Script de automatización para backups o tareas administrativas básicas

**IAW (Implantación de Aplicaciones Web):**

- Instalación y configuración del servidor Apache
- Instalación y configuración de WordPress
- Administración de usuarios en WordPress
- Acceso a base de datos desde PHP (conexión y consultas básicas)
- Personalización básica de WordPress (tema o plugin simple para portafolio)

**Servicios de Red e Internet:**

- Configuración de SSH para acceso remoto seguro
- Configuración de DNS básico (o uso de DNS externo)
- Configuración de Apache como servidor web

**Seguridad y Alta Disponibilidad:**

- Configuración de firewall básico (iptables/ufw, AWS Security Groups o reglas de red Docker)
- Configuración de HTTPS/SSL
- Análisis básico de amenazas y medidas de protección implementadas
- Si se usa AWS: configuración de VPC con subredes públicas y privadas
- Si se usa Docker: configuración de redes Docker personalizadas para aislar servicios

#### Entorno de virtualización

**Importante:** Al ser una empresa nueva sin infraestructura previa, el proyecto debe crear completamente la infraestructura desde cero en un entorno virtualizado. El equipo puede elegir entre:

- **Opción A - GNS3:** 
  - Crear topología de red completa desde cero con:
    - Router/Switch para interconexión
    - Servidor Linux virtualizado (Ubuntu Server/Debian)
    - Cliente de prueba (opcional)
  - Configuración completa de servicios de red (DHCP, DNS, SSH, FTP)
  - Instalación y configuración de Apache y base de datos en el servidor
  - Despliegue de la aplicación web WordPress
  - Configuración de firewall (iptables/ufw) y servicios de seguridad
  - Documentación completa de la topología de red

- **Opción B - AWS:**
  - Crear VPC desde cero con diseño de red:
    - Subred pública para servidor web (EC2)
    - Subred privada para base de datos (RDS)
  - Configuración de Internet Gateway y NAT Gateway
  - Despliegue de instancia EC2 para servidor web (instalación de Apache, WordPress)
  - Configuración de RDS para base de datos
  - Configuración de S3 para almacenamiento de recursos multimedia
  - Configuración de Security Groups para seguridad de red
  - Configuración de Route Tables
  - Documentación completa de la arquitectura AWS

- **Opción C - Docker:**
  - Crear arquitectura de contenedores con Docker Compose
  - Configuración de red Docker personalizada para aislar servicios
  - Contenedor para servidor web (Apache con WordPress)
  - Contenedor para base de datos (MySQL/PostgreSQL)
  - Contenedor para servicios de red (opcional: DNS, DHCP mediante scripts)
  - Configuración de volúmenes persistentes para datos y configuraciones
  - Configuración de variables de entorno y secretos
  - Documentación completa de la arquitectura Docker (docker-compose.yml, Dockerfiles)

#### Tecnologías sugeridas

- **Virtualización:** GNS3, AWS (VPC, EC2, RDS, S3) o Docker (contenedores, Docker Compose, redes)
- **Sistema Operativo:** Linux (Ubuntu Server, Debian)
- **Servidor Web:** Apache
- **CMS:** WordPress
- **Base de datos:** MySQL o PostgreSQL
- **Lenguaje:** PHP
- **Scripting:** Bash, Python (para automatización y backups)
- **Control de versiones:** Git, GitHub

#### Interesados identificados

- **Primarios:** 
  - Fundadores y equipo de CreviPlay (desarrolladores, diseñadores, directores)
  - Equipo de desarrollo del proyecto (alumnos)
- **Secundarios:** 
  - Clientes potenciales y jugadores
  - Publishers y distribuidores de videojuegos
  - Partners del sector de videojuegos
  - Comunidad de desarrolladores indie
  - Inversores potenciales

#### Recursos de referencia

- **Estudios de videojuegos indie:** Investigar sobre estudios independientes similares para entender necesidades
- **Documentación GNS3:** Consultar guías del módulo de Herramientas
- **Documentación AWS:** [https://docs.aws.amazon.com/](https://docs.aws.amazon.com/)
- **Documentación Docker:** Consultar guías del módulo de Herramientas
- **WordPress para portafolios:** Investigar temas y plugins para portafolios creativos
- **Baviux (referencia de estilo):** [https://www.devuego.es/bd/festudio/baviux](https://www.devuego.es/bd/festudio/baviux) - Estudio de videojuegos de Elche que puede servir como referencia de estilo, aunque CreviPlay es una empresa independiente en Crevillent

---

!!! warning "Nota importante para el desarrollo del proyecto"
    Para que el proyecto desarrollado cumpla con las competencias profesionales de **ASIR** y demuestre adecuadamente los conocimientos adquiridos en el ciclo, el alumnado debe asegurarse de que su implementación cumpla con los siguientes requisitos:

    1. **Infraestructura desde cero:** El proyecto debe crear completamente la infraestructura de TI desde el principio, sin asumir infraestructura previa. Esto permite demostrar conocimientos completos de todos los módulos del ciclo.

    2. **Aplicación práctica real:** Aunque el proyecto se adapta para fines educativos, debe simular una situación real donde una organización necesita establecer su infraestructura de TI, demostrando capacidad para resolver problemas reales del sector.

    3. **Cobertura completa de módulos:** El proyecto debe demostrar competencias de todos los módulos del ciclo (**ASGBD**, **ASO**, **IAW**, **Servicios de Red e Internet**, **Seguridad** y **Alta Disponibilidad**) de forma integrada, no como elementos aislados.

    4. **Flexibilidad en la implementación:** El proyecto debe permitir elegir entre diferentes plataformas de virtualización (**GNS3** para simulación local, **AWS** para cloud real o **Docker** para contenedores), adaptándose a diferentes contextos y recursos disponibles, demostrando capacidad de adaptación técnica.

---

## 3. Actividades y entregables

### 3.1. Actividad principal: Defensa de la caracterización del reto

**Objetivo:** Desarrollar y defender la caracterización completa del reto elegido, demostrando que cumple con los requisitos de todos los módulos del ciclo y estableciendo la estructura base del proyecto.

**Tareas:**

1. **Análisis y elección de propuesta:**

   - Leer y analizar las 2 propuestas de proyectos
   - Investigar sobre las empresas (webs, información pública)
   - Discutir en equipo las ventajas y desventajas de cada propuesta
   - Elegir una propuesta y justificar la elección

2. **RA1.1 - Caracterización del reto:**

   - Definir título del reto
   - Describir contexto de la empresa/organización
   - Identificar y describir la problemática
   - Establecer objetivos del proyecto
   - Identificar y clasificar interesados
   - Crear mapa de interesados (tabla o diagrama)

3. **RA1.2 - Análisis del contexto:**

   - Contexto empresarial (historia, tamaño, modelo de negocio)
   - Contexto tecnológico (infraestructura actual, nivel de digitalización)
   - Contexto del mercado (sector, competencia, tendencias)
   - Contexto social y geográfico (Crevillent, relación con entorno)
   - Realizar análisis DAFO (Fortalezas, Debilidades, Oportunidades, Amenazas)

4. **RA1.3 - Definir alcance:**

   - Alcance funcional (qué se incluye/excluye)
   - Alcance técnico (tecnologías, plataformas - GNS3, AWS o Docker)
   - Alcance temporal (fases, entregables, hitos)
   - Alcance de recursos (equipo, presupuesto)
   - Elección y justificación de plataforma de virtualización (GNS3, AWS o Docker)

5. **RA1.4 - Establecer requisitos:**

   - Lista de requisitos funcionales (RF) con formato estándar
   - Lista de requisitos no funcionales (RNF)
   - Requisitos del negocio (RN)
  - **Requisitos por módulos:** Demostrar que el proyecto cumple con requisitos de:

    - ASGBD (Administración de Sistemas Gestores de Bases de Datos)
     - ASO (Administración de Sistemas Operativos)
     - IAW (Implantación de Aplicaciones Web)
     - Servicios de Red e Internet
     - Seguridad y Alta Disponibilidad
     - Matriz de trazabilidad de requisitos

   **Ejemplo de matriz de trazabilidad de requisitos:**

   La matriz de trazabilidad relaciona cada requisito con los módulos del ciclo que lo cubren, permitiendo verificar que todos los requisitos están cubiertos y justificando el cumplimiento de competencias de ASIR.

   | ID Requisito | Descripción | Tipo | ASGBD | ASO | IAW | Serv. Red | Seguridad | Estado |
   |:------------:|:------------|:-----|:-----:|:---:|:---:|:---------:|:---------:|:------:|
   | RF-001 | Sistema de gestión de productos/catálogo | Funcional | ✓ | - | ✓ | - | - | Planificado |
   | RF-002 | Búsqueda y filtrado de productos | Funcional | ✓ | - | ✓ | - | - | Planificado |
   | RF-003 | Panel de administración por empresa | Funcional | ✓ | ✓ | ✓ | - | ✓ | Planificado |
   | RNF-001 | Tiempo de carga < 2 segundos | No funcional | - | ✓ | ✓ | ✓ | - | Planificado |
   | RNF-002 | Diseño responsive | No funcional | - | - | ✓ | - | - | Planificado |
   | RNF-003 | Backup diario automático | No funcional | ✓ | ✓ | - | - | ✓ | Planificado |
   | RN-001 | Mejorar visibilidad online del sector | Negocio | - | - | ✓ | ✓ | - | Planificado |
   | RN-002 | Cumplimiento RGPD/LOPD | Negocio | ✓ | ✓ | - | - | ✓ | Planificado |

   **Leyenda:**

   - ✓ = El módulo contribuye a cumplir este requisito
   - - = El módulo no está directamente relacionado con este requisito
   - **Estado:** Planificado, En desarrollo, Implementado, Verificado

   Esta matriz permite:
   
   - Verificar que todos los requisitos están cubiertos por al menos un módulo
   - Identificar qué módulos contribuyen a cada requisito
   - Demostrar el cumplimiento de competencias de ASIR
   - Hacer seguimiento del estado de implementación de cada requisito

6. **Estructura del proyecto:**

   - Definir la estructura del proyecto según los requisitos del Proyecto Intermodular (PI):
     - Portada
     - Índice
     - Resumen / Abstract
     - Introducción
     - Marco teórico / tecnológico
     - Desarrollo
     - Resultados
     - Conclusiones y mejoras futuras
     - Bibliografía
     - Anexos
   - Crear repositorio Git/GitHub con estructura inicial
   - Generar README.md adecuado con descripción del proyecto, estructura, y enlaces

7. **Generación de página del proyecto:**

   - Configurar GitHub Pages para el repositorio
   - Crear página web del proyecto accesible públicamente
   - Incluir información básica del proyecto, estructura y enlaces relevantes

8. **Preparación de la defensa:**

   - Crear presentación PowerPoint que incluya:
     - Definición de la estructura del proyecto (mostrar repositorio GitHub y README)
     - Enlace a la página del proyecto en GitHub Pages
     - Demostración de que la caracterización del reto cumple con los requisitos definidos de todos los módulos:
       - ASGBD: Requisitos de base de datos identificados
       - ASO: Requisitos de sistema operativo y virtualización identificados
       - IAW: Requisitos de aplicación web identificados
       - Servicios de Red: Requisitos de servicios de red identificados
       - Seguridad: Requisitos de seguridad identificados
     - Caracterización del reto (resumen)
     - Análisis del contexto (resumen)
     - Alcance y requisitos principales
     - Planificación inicial

**Entregables:**

1. **Repositorio GitHub:**

   - Estructura del proyecto definida según requisitos del Proyecto Intermodular (PI)
   - README.md completo con descripción, estructura, y enlaces
   - Documentos markdown de caracterización, análisis, alcance y requisitos
   - Enlace al repositorio compartido con el profesor

2. **Página del proyecto:**
   - GitHub Pages configurado y accesible
   - Enlace público a la página del proyecto

3. **Presentación PowerPoint:**

   - Presentación de 10-15 minutos
   - Incluye todos los elementos solicitados
   - Demuestra cumplimiento de requisitos de todos los módulos

**Evaluación:** Práctica (PR) - Sobre 54 puntos

La evaluación se realizará mediante:

- Revisión del repositorio GitHub y documentación
- Revisión de la página del proyecto en GitHub Pages
- Defensa oral con presentación PowerPoint
- Rúbrica de evaluación

---

### 3.2. Estructura del documento del proyecto

El proyecto debe seguir la estructura indicada en los requisitos del Proyecto Intermodular (PI). El repositorio GitHub debe contener:

#### Estructura recomendada del repositorio

```
proyecto-pi/
├── README.md                    # Descripción del proyecto, estructura, enlaces
├── docs/                        # Documentación del proyecto
│   ├── 01_caracterizacion_reto.md
│   ├── 02_analisis_contexto.md
│   ├── 03_alcance_requisitos.md
│   └── ...
├── src/                         # Código fuente (si aplica)
├── scripts/                     # Scripts de automatización
├── backups/                     # Scripts y documentación de backups
└── anexos/                      # Diagramas, capturas, esquemas
```

#### Estructura del documento principal

El documento principal debe seguir esta estructura según los requisitos del Proyecto Intermodular (PI):

1. **Portada:** Título, nombre del alumno, ciclo, tutor y fecha
2. **Índice:** Con paginación y enlaces
3. **Resumen / Abstract:** Breve sinopsis del proyecto (máx. 300 palabras)
4. **Introducción:** Justificación del proyecto, objetivos y alcance
5. **Marco teórico / tecnológico:** Tecnologías empleadas, fundamentos y justificación de elección
6. **Desarrollo:** Explicación del proceso, fases, metodología, dificultades y soluciones
7. **Resultados:** Lo que se ha conseguido
8. **Conclusiones y mejoras futuras:** Reflexión crítica
9. **Bibliografía:** Formato APA o IEEE
10. **Anexos:** Código relevante, capturas, esquemas, diagramas, etc.

**Formato:** Markdown en repositorio GitHub del proyecto, con GitHub Pages configurado

**Evaluación:** La defensa de la caracterización del reto se evalúa según la [rúbrica de evaluación de defensa de la caracterización del reto](rubrica_defensa_caracterizacion.md)

<!-- ---

## 5. Criterios de evaluación

### RA1: Caracteriza el reto y el contexto del sector

**Criterios de evaluación:**

- Identifica y describe correctamente el problema o necesidad
- Define objetivos claros, medibles y realistas
- Identifica y clasifica interesados adecuadamente
- Realiza un análisis completo del contexto (empresarial, tecnológico, mercado)
- Utiliza herramientas de análisis apropiadas (DAFO, mapa de interesados)
- Define un alcance claro y completo (funcional, técnico, temporal, recursos)
- Establece requisitos bien estructurados (funcionales, no funcionales, negocio)
- Crea matriz de trazabilidad de requisitos
- Documenta todo de forma clara y profesional

**Evidencias:**

- Documentos de caracterización, análisis, alcance y requisitos
- Tablero de Trello configurado y actualizado
- Presentación del planteamiento

---

### RA2: Planifica actividades, recursos, riesgos y cronograma

**Criterios de evaluación (fase inicial):**

- Utiliza Trello correctamente para organizar el trabajo
- Crea estructura de planificación apropiada
- Identifica actividades principales del proyecto
- Asigna responsables a las tareas
- Establece fechas de vencimiento realistas
- Identifica recursos necesarios (preliminar)

**Evidencias:**

- Tablero de Trello con estructura y tarjetas iniciales
- Documento de planificación inicial

---

### RA5: Comunica y colabora eficazmente

**Criterios de evaluación:**

- Participa activamente en reuniones de equipo
- Utiliza Trello para comunicación y coordinación
- Presenta el planteamiento de forma clara y estructurada
- Responde adecuadamente a preguntas y feedback
- Colabora eficazmente con el equipo

**Evidencias:**

- Participación en reuniones (actas o evidencias)
- Comentarios y comunicación en Trello
- Calidad de la presentación oral -->

---

## 4. Recursos y referencias

### Documentación oficial

- [Guía oficial de Trello](https://trello.com/es/guide/trello-101)
- [Metodologías ágiles - Scrum](https://www.scrum.org/)
- [Gestión de proyectos - PMI](https://www.pmi.org/)

### Empresas de referencia

- **UNIFAM:** [https://unifam.es/asociados/](https://unifam.es/asociados/) - Asociación de Fabricantes de Alfombras de Crevillent
- **CreviPlay:** Estudio de desarrollo de videojuegos independiente en Crevillent (empresa ficticia para el proyecto)
- **Baviux (referencia de estilo):** [https://www.devuego.es/bd/festudio/baviux](https://www.devuego.es/bd/festudio/baviux) - Estudio de videojuegos de Elche que sirve como referencia de estilo

### Herramientas

- **GitHub:** Para repositorio y documentación
- **Markdown:** Para documentación técnica
- **MkDocs:** Para generar documentación web

### Lecturas recomendadas

- "The Lean Startup" - Eric Ries (metodología de validación)
- "Scrum: The Art of Doing Twice the Work in Half the Time" - Jeff Sutherland
- Documentación sobre gestión de requisitos en proyectos de software

<!-- ---

## 7. Calendario y fechas importantes

| Actividad | Fecha límite | Evaluación |
|:----------|:------------:|:----------:|
| Análisis de propuestas | [Fecha] | AC (3 puntos) |
| Caracterización del reto | [Fecha] | PR (sobre 10) |
| Análisis del contexto | [Fecha] | PR (sobre 10) |
| Alcance y requisitos | [Fecha] | PR (sobre 10) |
| Planificación con Trello | [Fecha] | AC (3 puntos) |
| Presentación del planteamiento | [Fecha] | AC (3 puntos) |
| **Documento completo de planteamiento** | **[Fecha]** | **PY (sobre 30)** |

!!! important "Importante"
    Todas las fechas se actualizarán en Aules. Consulta el calendario oficial del módulo. -->

---

*[UT]: Unidad de trabajo  
*[PI]: Proyecto intermodular  
*[RF]: Requisito funcional  
*[RNF]: Requisito no funcional  
*[RN]: Requisito del negocio  
*[DAFO]: Debilidades, Amenazas, Fortalezas, Oportunidades  
*[SLA]: Service Level Agreement  
*[RGPD]: Reglamento General de Protección de Datos

