---
title: Desarrollo iterativo y pruebas
description: Guía para implementar la infraestructura y la aplicación web del proyecto. Primeros pasos con Docker Compose y AWS. Resumen de prácticas para sitio web corporativo e infraestructura cloud.
---

# 4. Desarrollo iterativo y pruebas

> En esta unidad aprenderás a **implementar la infraestructura** diseñada, **desplegar la aplicación web** y **realizar pruebas** de funcionalidad y persistencia. Trabajarás con **Docker Compose** (sitio web corporativo) o **AWS** (infraestructura cloud), siguiendo los primeros pasos de las prácticas guiadas de los dos retos del proyecto.

Esta unidad de trabajo corresponde principalmente al **Resultado de Aprendizaje RA3** y es fundamental para materializar el diseño en una solución funcional.

## Resultado de aprendizaje

Al finalizar esta unidad, serás capaz de:

- **RA3 (25%):** Implementar la infraestructura y la aplicación web según el diseño planificado, realizando pruebas de funcionalidad y documentando el proceso.

---

## 1. Conceptos básicos para el desarrollo

Para desarrollar correctamente la solución, debes abordar los siguientes aspectos:

1. **Configuración de infraestructura:** Crear y configurar los recursos necesarios (contenedores Docker, instancias EC2, VPC, bases de datos) según el diseño de arquitectura definido en la fase anterior.

2. **Despliegue de servicios:** Instalar y configurar el servidor web (Apache), el CMS (WordPress) y el sistema gestor de base de datos (MySQL/PostgreSQL), asegurando la comunicación entre componentes.

3. **Persistencia de datos:** Configurar volúmenes (Docker) o almacenamiento (S3, RDS) para que los datos no se pierdan al reiniciar o recrear recursos.

4. **Variables de entorno y secretos:** Utilizar variables de entorno para credenciales y configuración sensible, evitando hardcodear contraseñas en el código.

5. **Verificación y pruebas:** Comprobar que la aplicación funciona correctamente, que la persistencia se mantiene y que los servicios se comunican entre sí.

6. **Documentación del proceso:** Registrar los pasos realizados, problemas encontrados y soluciones aplicadas en la sección de Desarrollo del proyecto.

---

## 2. Retos de desarrollo

Los dos grupos del proyecto trabajan con retos diferentes. Cada reto tiene una guía práctica completa que puedes consultar para el desarrollo detallado.

### 2.1. Reto 1: Sitio web corporativo (Docker)

**Tecnología:** Docker Compose con WordPress y MySQL.

**Guía práctica completa:** [PR103 - Infraestructura completa con Docker Compose](PR103_Solucion.md)

### 2.2. Reto 2: Infraestructura completa de TI (AWS)

**Tecnología:** AWS (VPC, EC2, RDS, S3).

**Guía práctica completa:** [Infraestructura completa de TI con AWS](AWS_CreviPlay_Infraestructura_Completa.md)

---

## 3. Primeros pasos para iniciar el desarrollo

A continuación se resumen los **primeros pasos** de cada práctica para que puedas iniciar el desarrollo de forma sencilla. Para los pasos detallados, consulta la guía completa de tu reto.

### 3.1. Primeros pasos con Docker Compose (Reto 1 / PR103)

Si tu proyecto utiliza **Docker** (sitio web corporativo):

**Paso 1: Crear estructura del proyecto**

```bash
mkdir -p proyecto-wordpress-docker
cd proyecto-wordpress-docker
```

**Paso 2: Crear archivo de variables de entorno (`.env`)**

Crea un archivo `.env` con las credenciales (no subir a Git):

```env
MYSQL_ROOT_PASSWORD=root_password_segura_123
MYSQL_DATABASE=wordpress_db
MYSQL_USER=wordpress_user
MYSQL_PASSWORD=wordpress_password_segura_456

WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=wordpress_user
WORDPRESS_DB_PASSWORD=wordpress_password_segura_456
WORDPRESS_DB_NAME=wordpress_db
```

**Paso 3: Crear `docker-compose.yml`**

Define los servicios WordPress y MySQL con redes personalizadas (frontend y backend) y volúmenes persistentes. Consulta el archivo completo en [PR103_Solucion.md](PR103_Solucion.md#paso-2-crear-docker-composeyml).

**Paso 4: Desplegar**

```bash
docker compose up -d
```

**Paso 5: Acceder a WordPress**

Abre el navegador en `http://localhost:8080` y completa la instalación.

**Paso 6: Verificar persistencia**

Crea contenido en WordPress, ejecuta `docker compose down` y luego `docker compose up -d`. Comprueba que el contenido se mantiene.

---

### 3.2. Primeros pasos con AWS (Reto 2)

Si tu proyecto utiliza **AWS** (infraestructura cloud):

**Paso 1: Acceder a AWS**

- Usa **AWS Educate Learner Lab** (cuenta proporcionada por el centro) o cuenta AWS personal.
- Inicia el laboratorio y espera a que el entorno esté listo.

**Paso 2: Crear VPC y red**

1. **VPC** → **Create VPC** → Nombre: `proyecto-vpc`, CIDR: `10.0.0.0/16`
2. Crear subred pública: `10.0.1.0/24` (AZ: us-east-1a)
3. Crear subred privada: `10.0.2.0/24` (AZ: us-east-1b)
4. Crear Internet Gateway y asociarlo a la VPC
5. Configurar Route Tables (pública con ruta a IGW)

**Paso 3: Configurar Security Groups**

- **proyecto-web-sg:** SSH (22), HTTP (80), HTTPS (443)
- **proyecto-db-sg:** MySQL (3306) solo desde proyecto-web-sg

**Paso 4: Crear instancia EC2**

- AMI: Ubuntu Server 22.04 LTS
- Tipo: t2.micro (free tier)
- Subred: pública
- Security Group: proyecto-web-sg
- Crear o seleccionar key pair
- Usuario SSH: `ubuntu` (para conectar: `ssh -i clave.pem ubuntu@<IP_PUBLICA>`)

**Paso 5: Instalar Apache y WordPress en EC2**

Conectar por SSH (`ssh -i clave.pem ubuntu@<IP_PUBLICA>`) e instalar:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 php php-mysql php-gd php-xml php-mbstring libapache2-mod-php -y
sudo systemctl start apache2 && sudo systemctl enable apache2
cd /var/www/html && sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz && sudo mv wordpress/* . && sudo rm -rf wordpress latest.tar.gz
sudo chown -R www-data:www-data /var/www/html
```

**Paso 6: Configurar RDS (base de datos)**

- Crear instancia RDS MySQL en subred privada
- Configurar Security Group para permitir conexión desde EC2
- Obtener endpoint y configurar `wp-config.php` en WordPress

Para los pasos detallados, consulta [Infraestructura completa de TI con AWS](AWS_CreviPlay_Infraestructura_Completa.md).

---

## 4. Actividades de desarrollo (resumen de prácticas)

Las siguientes actividades son un resumen de las prácticas guiadas de ambos retos. Realiza las que correspondan a tu proyecto.

### 4.1. Actividades comunes (Docker y AWS)

| Actividad | Descripción | Reto Docker | Reto AWS |
|:----------|:------------|:-----------:|:--------:|
| Preparar entorno | Crear estructura de directorios / acceder a consola | ✓ | ✓ |
| Configurar red | Redes Docker o VPC y subredes | ✓ | ✓ |
| Configurar seguridad | Reglas de red, Security Groups | ✓ | ✓ |
| Desplegar base de datos | MySQL en contenedor o RDS | ✓ | ✓ |
| Desplegar servidor web | Apache + WordPress | ✓ | ✓ |
| Verificar conectividad | Comprobar comunicación entre servicios | ✓ | ✓ |
| Probar persistencia | Crear contenido y recrear recursos | ✓ | ✓ |
| Documentar arquitectura | Diagramas y guía de despliegue | ✓ | ✓ |

### 4.2. Actividades específicas Docker (PR103)

- Crear archivo `.env` y `.env.example`
- Definir redes frontend (172.25.0.0/16) y backend (172.26.0.0/16)
- Configurar volúmenes persistentes para WordPress y MySQL
- Verificar resolución DNS entre contenedores (`ping db`)
- Probar aislamiento de red (MySQL no accesible desde host)
- Gestionar servicios: `docker compose logs`, `docker compose restart`

### 4.3. Actividades específicas AWS

- Crear VPC con subredes públicas y privadas
- Configurar Internet Gateway y Route Tables
- Crear Security Groups para EC2 y RDS
- Configurar RDS en subred privada
- Crear buckets S3 para imágenes y videos
- Configurar rol IAM para acceso EC2 → S3
- (Opcional) Configurar HTTPS con Certificate Manager
- Configurar respaldo: snapshots RDS, AMI de EC2, versionado S3
- Monitorización con CloudWatch

---

## 5. Estructura de la sección Desarrollo en tu proyecto

La sección **Desarrollo** de tu documento del proyecto debe incluir:

1. **Proceso de implementación:** Descripción de las fases realizadas y el orden seguido.
2. **Configuración de infraestructura:** Pasos para crear VPC/contenedores, redes, Security Groups.
3. **Despliegue de servicios:** Instalación y configuración de Apache, WordPress, base de datos.
4. **Dificultades encontradas:** Problemas que surgieron y cómo se resolvieron.
5. **Evidencias:** Capturas de pantalla de la configuración, comandos utilizados, diagramas actualizados.
6. **Verificación:** Pruebas realizadas (acceso web, persistencia, conectividad).

---

## 6. Actividades y entregables

<a name="RG401"></a>

* :material-trophy: **RG401**. (RA3 // 30p). Trabajo en grupos de 2-3 personas para implementar la infraestructura y la aplicación web según el diseño planificado, realizando pruebas de funcionalidad y documentando el proceso en la sección de Desarrollo del proyecto. Consulta la **[rúbrica de corrección](rubrica_RG401_Desarrollo.md)** para conocer los criterios y niveles de desempeño.
    * **Primera práctica para comenzar el desarrollo:** [PR402 - Despliegue de aplicación PHP + MySQL con Docker Compose](PR402_Despliegue_PHP_MySQL_Docker_Compose.md) (instalación desde repositorio y `docker compose up`).
    * **Segunda práctica – Servicios de red:** [PR403 - Configuración de un servidor DNS (Bind9) en AWS](PR403_Configuracion_Servidor_DNS.md) (instancia Debian, zonas directa e inversa, resolución de nombres desde el exterior).

**Entregables:**

1. **Infraestructura funcionando:** Servidor web, base de datos y aplicación desplegados y operativos.
2. **Pruebas realizadas:** Evidencia de verificación de conectividad, persistencia y acceso web.
3. **Documentación actualizada:** Sección Desarrollo del proyecto con proceso, dificultades y soluciones.
4. **Repositorio actualizado:** Código de configuración (docker-compose.yml, scripts) en el repositorio.

---

## 7. Recursos y referencias

### Guías prácticas completas

- **[PR103 - Infraestructura completa con Docker Compose](PR103_Solucion.md)** – WordPress, MySQL, redes personalizadas, volúmenes.
- **[Infraestructura completa de TI con AWS](AWS_CreviPlay_Infraestructura_Completa.md)** – VPC, EC2, RDS, S3, seguridad, respaldo.

### Documentación oficial

- [Docker Compose - Documentación oficial](https://docs.docker.com/compose/)
- [Docker - Documentación oficial](https://docs.docker.com/)
- [AWS - Documentación oficial](https://docs.aws.amazon.com/)
- [WordPress - Documentación](https://wordpress.org/support/)

---

## Glosario de términos y acrónimos

- **VPC:** Virtual Private Cloud (red privada en AWS)
- **EC2:** Elastic Compute Cloud (servidor virtual en AWS)
- **RDS:** Relational Database Service (base de datos gestionada en AWS)
- **S3:** Simple Storage Service (almacenamiento de objetos en AWS)
- **Security Group:** Reglas de firewall a nivel de instancia en AWS
- **Docker Compose:** Herramienta para definir y ejecutar aplicaciones multi-contenedor
- **Volumen:** Almacenamiento persistente para contenedores Docker
- **RA3:** Resultado de Aprendizaje 3 (Desarrollo)
