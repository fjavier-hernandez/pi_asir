---
title: Integración, seguridad y validación
description: Guía del tema 5 con dos retos equivalentes: RG501 (Docker, Nginx, backups, Prometheus/Pandora) y RG502 (AWS, Bind9, MySQL en EC2, seguridad y CloudWatch).
---

# 5. Integración, seguridad y validación

> En esta unidad aprenderás a **integrar la solución** (todos los servicios) y a **validar** que funciona de extremo a extremo, con **seguridad** y **evidencias** según el tipo de proyecto del grupo.
>
> Hay **dos retos de igual alcance** (30p cada uno); cada grupo sigue **solo el que corresponda** a su despliegue:
>
> - **RG501 (Docker):** stack con Nginx/WordPress/Laravel/MySQL en Compose; hardening del proxy, control de `/admin`, backups probados, HTTPS o plan, regresión, y **monitorización con Prometheus y Pandora FMS** más logs del stack.
> - **RG502 (AWS):** varias EC2 (web WordPress, app propia, DNS y BBDD nueva); **Bind9**, **MySQL en EC2 sin RDS**, conexión desde instancias, integración con datos reales y **seguridad AWS** (SG, pruebas negativas, IAM/MFA, SSH, CloudWatch, backups y cifrado).

Esta unidad de trabajo corresponde principalmente al **Resultado de Aprendizaje RA3**.

---

## Resultado de aprendizaje

Al finalizar esta unidad, serás capaz de:

- **RA3:** Desarrollar y validar la solución (iteraciones, pruebas y criterios de aceptación), demostrando integración extremo a extremo, seguridad adicional y —según el reto— monitorización en contenedores **o** operación segura y observable en **AWS**.

---

## 1. Conceptos básicos para la integración, seguridad y validación

Para integrar correctamente una solución, debes abordar:

1. **Integración extremo a extremo:** comprobar que web, back end y base de datos se conectan con los parámetros y rutas previstas.
2. **Persistencia y reinicio:** confirmar que el dato no se pierde al recrear servicios (volúmenes, almacenamiento persistente o backups).
3. **Aislamiento y mínimo privilegio:** restringir puertos/redes para que solo los componentes autorizados puedan hablar entre sí.
4. **Hardening (mínimo una mejora):** en **Docker**, cabeceras y rate limiting en Nginx, control de paneles; en **AWS**, reglas de **Security Groups**, SSH endurecido, IAM/MFA y puertos solo donde hagan falta.
5. **Monitorización, logs y trazas:** en **RG501**, **Prometheus**, **Pandora FMS** y `docker compose logs` (paneles no públicos sin protección); en **RG502**, **CloudWatch** (métricas/alarmas), logs en instancias o contenedores y evidencia de un evento o alarma.
6. **Evidencia de validación:** capturas y comandos que demuestren lo anterior; en **AWS**, incluir **pruebas negativas** (por ejemplo acceso denegado a `3306` desde origen no autorizado) cuando pida la guía.

---

## 2. Retos de integración

Cada grupo sigue **un** reto (el de su línea de proyecto). Ambos tienen guía detallada y **30 puntos**; el profesorado valora el reto que os corresponda.

| Aspecto | RG501 — Docker | RG502 — AWS |
|--------|----------------|-------------|
| **Guía** | [RG501 - Integración y seguridad con Docker](RG501_Integracion_Seguridad_Docker.md) | [RG502 - Integración y seguridad en AWS](RG502_Integracion_Seguridad_AWS.md) |
| **Punto de partida** | Compose con Nginx, WordPress, Laravel y MySQL ya desplegado | Dos EC2 (WordPress + app), Docker en cada una, SG, Elastic IP ([estado publicado](https://alejandromarinyo.github.io/Proyecto-Intermodular/Desarrollo/)) |
| **Integración extra** | Regresión tras hardening y backups | DNS **Bind9**, nueva **EC2 MySQL** (sin RDS), apps apuntando a esa BBDD |
| **Seguridad** | Nginx (cabeceras, rate limit), `/admin`, HTTPS o plan | SG, prueba negativa a `3306`, IAM/MFA, SSH, backups EBS/`mysqldump`, cifrado |
| **Observabilidad** | **Prometheus** + **Pandora FMS** + logs Compose | **CloudWatch** (alarmas/métricas) + logs en instancia/contenedores |
| **Práctica base** | `PR402` | `PR403` (DNS) + continuidad del despliegue AWS |

### 2.1. Contenido resumido de RG501

- Guías 1–5: hardening Nginx, `/admin`, backups, regresión, HTTPS o plan.
- Guía 6: Prometheus, Pandora FMS y logs del stack.

### 2.2. Contenido resumido de RG502

- Guías 1–4: Bind9, EC2 MySQL, conexión desde web/app, validación y pruebas negativas.
- Guías 5–8: seguridad AWS (red, IAM/SSH, CloudWatch, backups y cifrado).

---

## 3. Continuación desde el punto en el que está el proyecto

Como continuación del tema 4 (RG401), en ambos casos se parte de un despliegue ya funcional (web y back end/panel). A partir de ahí:

**Si seguís RG501 (Docker)**

- Demostrar integración con **datos reales** tras los cambios de seguridad y backups.
- **Regresión** del stack Compose (reinicio y persistencia).
- **Monitorización** (Prometheus, Pandora) y revisión de **logs** sin exponer paneles.

**Si seguís RG502 (AWS)**

- Completar **DNS** (Bind9) y **BBDD en EC2 nueva** con acceso restringido por **Security Group**.
- Demostrar conexión **web/app → MySQL** y operaciones reales sobre datos.
- Aplicar y documentar **seguridad AWS** (red, IAM/MFA, SSH, alarmas o logs en CloudWatch, backup/restore y cifrado según la guía).

---

## 4. Estructura de la sección “Integración” en tu proyecto

La memoria debe tener una sección **Integración** coherente con **vuestro** reto. Lo común a ambos:

1. **Proceso de integración:** qué cambiasteis para que web, back end y base de datos funcionen juntos con datos reales (en **RG502**, incluid DNS y nuevo MySQL en EC2).
2. **Seguridad aplicada:** medidas concretas y por qué (Nginx/`/admin` en Docker; **SG**, IAM/MFA, SSH y pruebas negativas en AWS).
3. **Pruebas y validación:** lista de pruebas (conectividad, regresión, `nslookup`/DNS, `SELECT`/app, etc.) y resultado.
4. **Evidencias:** capturas y comandos que respalden cada bloque anterior.
5. **Estado final:** URLs/IPs/puertos y cómo verificarlo un tercero.

**Apartados adicionales según el reto**

- **RG501:** monitorización (**Prometheus** *targets*, **Pandora FMS**, ejemplo de `docker compose logs`) y, si aplica, HTTPS o plan.
- **RG502:** observabilidad en **AWS** (CloudWatch: alarma o métrica; logs en instancia o contenedores); evidencias de **DNS** (Bind9), **SG de MySQL**, backup/restore y cifrado/HTTPS si documentasteis.

---

## 5. Actividades y entregables

<a name="RG501"></a>

* :material-trophy: **RG501**. (RA3 // 30p). Integración de contenedores, seguridad (Nginx, `/admin`, backups, HTTPS o plan) y **monitorización con Prometheus y Pandora FMS** en Docker.
    * **[Guía: RG501 - Integración y seguridad con Docker](RG501_Integracion_Seguridad_Docker.md)**.

---

<a name="RG502"></a>

* :material-trophy: **RG502**. (RA3 // 30p). Integración en AWS: DNS (Bind9), MySQL en **EC2 nueva** (sin RDS), conexión desde web/app y **seguridad AWS** (red, IAM/SSH, CloudWatch, backups y cifrado).
    * **[Guía: RG502 - Integración y seguridad en AWS](RG502_Integracion_Seguridad_AWS.md)**.

---

## 6. Recursos y referencias

### Prácticas base

- [PR402 - Despliegue de aplicación PHP + MySQL con Docker Compose](PR402_Despliegue_PHP_MySQL_Docker_Compose.md)
- [PR403 - Configuración de un servidor DNS (Bind9) en AWS](PR403_Configuracion_Servidor_DNS.md)

### Diseño de referencia de los proyectos

- Proyecto Docker: [Proyecto Intermodular (Docker) - Diseño y Planificación](https://elimpermeable.github.io/Proyecto_Intermodular2ASIR_IJJ/02_Marco_tecnologico/)
- Proyecto AWS: [Proyecto Intermodular (AWS) - Diseño y Planificación](https://alejandromarinyo.github.io/Proyecto-Intermodular/Dise%C3%B1o_y_Planificacion/)
- Proyecto AWS (estado desplegado descrito en RG502): [Desarrollo - Proyecto Intermodular](https://alejandromarinyo.github.io/Proyecto-Intermodular/Desarrollo/)

---

## Glosario de términos y acrónimos

- **RA3:** Resultado de Aprendizaje 3 (Desarrollo)
- **SG / Security Group:** Reglas de firewall a nivel de instancia en AWS
- **DNS:** Domain Name System
- **Bind9:** Servidor DNS basado en BIND
- **Healthcheck:** prueba de “estado listo” de un servicio
- **Prometheus:** almacenamiento y consulta de métricas (time series)
- **Pandora FMS:** plataforma de monitorización con consola y agentes/módulos
- **IAM / MFA:** identidad y acceso en AWS; autenticación en dos factores
- **CloudWatch:** métricas y alarmas en AWS
- **EC2 / Elastic IP:** instancia virtual en AWS y dirección IPv4 pública fija asociada
- **RDS:** base de datos gestionada en AWS (en RG502 se **sustituye** por MySQL en EC2)

