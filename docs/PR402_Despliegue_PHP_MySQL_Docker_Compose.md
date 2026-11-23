---
title: PR402 - Despliegue de aplicación PHP + MySQL con Docker Compose
description: PR402. Despliegue de una aplicación PHP + MySQL con Docker Compose en una instancia EC2 Ubuntu Server (AWS). Instalación desde repositorio y docker compose up. Opción manual con Dockerfile.
---

# Práctica - PR402: Despliegue de aplicación PHP + MySQL con Docker Compose

## Objetivos

Durante esta práctica aprenderás a desplegar una **aplicación PHP con Apache** y **MySQL** usando **Docker Compose** en una **instancia EC2 con Ubuntu Server** en AWS. La opción recomendada consiste en clonar un repositorio con la aplicación y el `docker-compose.yml` definidos y ejecutar `docker compose up -d` en la instancia.

Al finalizar esta práctica serás capaz de:

- Crear una instancia EC2 con **Ubuntu Server** en AWS.
- Instalar Docker y Docker Compose en la instancia Ubuntu Server.
- **Desplegar la aplicación mediante repositorio:** clonar el repositorio del proyecto y ejecutar `docker compose up -d`.
- Contenerizar una aplicación PHP con Apache y un contenedor MySQL.
- Publicar la aplicación y comprobar su funcionamiento en el navegador.

## Requisitos previos

- **Cuenta AWS** (AWS Educate Learner Lab o cuenta personal) para crear la instancia EC2.
- **Par de claves** para SSH (se crea al lanzar la instancia).
- Docker y Docker Compose se instalan durante la práctica en la instancia Ubuntu Server.

!!! note "Primera práctica del reto"
    Esta práctica es la primera del reto de desarrollo y permite iniciar la implementación con poco esfuerzo. Opcionalmente se describe también la construcción manual (Dockerfile y docker-compose) para entender la arquitectura.

---

## Paso 0: Crear la infraestructura (AWS)

Crea una **instancia EC2 con Ubuntu Server** en AWS. Todo el despliegue (Docker, Docker Compose y aplicación) se realiza en esta instancia.

### 0.1 Lanzar una instancia EC2 (Ubuntu Server)

1. Ir a **AWS → EC2 → Launch Instance**.
2. Configuración:

   - **Nombre:** `docker-php-mysql` (o el de tu proyecto).
   - **AMI:** **Ubuntu Server 22.04 LTS** (seleccionar imagen Ubuntu Server, no Amazon Linux).
   - **Tipo:** t3.micro (free tier).
   - Crear un nuevo par de claves y descargarlo.

### 0.2 Configurar el Security Group

Abrir los siguientes puertos:

| Tipo | Puerto | Origen   |
|:-----|:------:|:---------|
| SSH  | 22     | Tu IP    |
| HTTP | 80     | 0.0.0.0/0 |

Lanzar la instancia.

### 0.3 Conectar por SSH

```bash
ssh -i tu-clave.pem ubuntu@<IP_PUBLICA_EC2>
```

!!! tip "Captura recomendada"
    Realiza una captura del comando de conexión SSH y de la sesión conectada a la instancia.

---

## Parte 1: Instalar Docker y Docker Compose

Conectado por SSH a la instancia EC2.

### 1.1 Actualizar el sistema

```bash
sudo apt update && sudo apt upgrade -y
```

### 1.2 Instalar Docker

```bash
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
```

Permitir usar Docker sin sudo (recomendado):

```bash
sudo usermod -aG docker ubuntu
```

!!! warning "Reconexión necesaria"
    Salir y volver a conectarse por SSH para que el grupo `docker` tenga efecto (`exit` y luego `ssh ...` de nuevo).

### 1.3 Instalar Docker Compose

**Opción A – Plugin (recomendado):**

```bash
sudo apt install docker-compose-plugin -y
```

**Opción B – Paquete clásico:**

```bash
sudo apt install docker-compose -y
```

### 1.4 Comprobar instalación

```bash
docker --version
docker compose version
```

(o `docker-compose --version` si usas el paquete clásico).

!!! tip "Captura recomendada"
    Captura la salida de `docker --version` y `docker compose version` (o `docker-compose --version`).

---

## Parte 2: Desplegar la aplicación desde el repositorio (opción recomendada)

Esta es la forma más rápida de iniciar el desarrollo: el repositorio ya incluye la aplicación, el Dockerfile y el `docker-compose.yml`.

### 2.1 Crear directorio y clonar el repositorio

El repositorio de ejemplo contiene una aplicación PHP con Apache y la configuración para MySQL:

```bash
mkdir -p Taller
cd Taller
git clone https://github.com/JavierMasDiaz/docker-php-mysql.git
cd docker-php-mysql
```

### 2.2 Revisar la estructura

Comprueba que tienes al menos:

- `Dockerfile` (imagen PHP + Apache).
- `docker-compose.yml` (servicios `web` y `db`).
- Código de la aplicación PHP.

```bash
ls -la
```

### 2.3 Levantar los servicios con Docker Compose

Desde la carpeta del repositorio clonado (donde está el `docker-compose.yml`):

```bash
docker compose up -d
```

Si el sistema usa la versión clásica del comando:

```bash
docker-compose up -d
```

!!! tip "Captura recomendada"
    Captura el comando `docker compose up -d` (o `docker-compose up -d`) y la salida de `docker ps` mostrando los contenedores en ejecución.

### 2.4 Comprobar contenedores

```bash
docker ps
```

Deberías ver los contenedores de la aplicación web y de MySQL en ejecución.

### 2.5 Acceso desde el navegador

- **Crear la base de datos** (si la aplicación lo requiere):  
  `http://<IP_PUBLICA_EC2>/crearBD.php`

- **Acceder a la aplicación:**  
  `http://<IP_PUBLICA_EC2>/`

!!! tip "Captura recomendada"
    Captura la pantalla del navegador mostrando la aplicación funcionando (crear BD y página principal).

---

## Parte 3: Opción manual – Crear Dockerfile y docker-compose.yml

Si prefieres construir la solución desde cero en lugar de clonar el repositorio, sigue estos pasos después de tener Docker y Docker Compose instalados.

### 3.1 Estructura y clonado (solo código de la aplicación)

```bash
mkdir -p Taller
cd Taller
git clone https://github.com/JavierMasDiaz/docker-php-mysql.git
cd docker-php-mysql
```

### 3.2 Crear Dockerfile para PHP

Crear el archivo `Dockerfile` en la carpeta de la aplicación (por ejemplo `docker-php-mysql/`):

```dockerfile
FROM php:8.2-apache
RUN docker-php-ext-install mysqli
COPY . /var/www/html/
```

### 3.3 Crear docker-compose.yml

Volver a la carpeta principal del proyecto y crear `docker-compose.yml`:

```bash
cd ..
nano docker-compose.yml
```

Contenido de ejemplo:

```yaml
version: '3.8'

services:
  web:
    build: ./docker-php-mysql
    ports:
      - "80:80"
    depends_on:
      - db

  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: TallerMecanico
      MYSQL_USER: usuario
      MYSQL_PASSWORD: password
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

Ajusta los nombres de carpeta (`build: ./docker-php-mysql`) si tu estructura es distinta.

### 3.4 Desplegar

Desde la carpeta donde está el `docker-compose.yml`:

```bash
docker compose up -d
```

Comprobar con `docker ps` y acceder a la aplicación por navegador como en la Parte 2.

---

## Verificación final

Resumen de comprobaciones:

1. **Docker y Docker Compose** instalados y en ejecución (`docker --version`, `docker compose version`).
2. **Repositorio clonado** y estructura visible (`ls -la` en la carpeta del proyecto).
3. **Contenedores en ejecución:** salida de `docker ps` con al menos los servicios `web` y `db`.
4. **Acceso web:** creación de base de datos (si aplica) y carga de la aplicación en el navegador.

---

## Limpieza

Para detener y eliminar los contenedores y volúmenes al finalizar:

```bash
# Desde la carpeta donde está docker-compose.yml
cd ~/Taller/docker-php-mysql   # o la ruta que hayas usado
docker compose down -v
```

(o `docker-compose down -v` si usas el paquete clásico).

!!! warning "Eliminación de datos"
    El flag `-v` elimina los volúmenes; se perderán los datos de MySQL. Omite `-v` si solo quieres detener los contenedores sin borrar datos.

---

## Entregables

1. **Documento** con capturas de:

   - Conexión SSH a la instancia EC2.
   - Salida de `docker --version` y `docker compose version` (o `docker-compose --version`).
   - Comando de clonado del repositorio y estructura de archivos (`ls -la`).
   - Comando `docker compose up -d` (o `docker-compose up -d`) y salida de `docker ps`.
   - Acceso a la aplicación desde el navegador (crear BD si aplica y página principal).

2. **Breve explicación** del flujo seguido (repositorio → `docker compose up`) y, si se ha usado la opción manual, del contenido del Dockerfile y del `docker-compose.yml`.

---

## Criterios de evaluación

- Instancia EC2 con Ubuntu Server creada correctamente y conexión SSH operativa.
- Docker y Docker Compose instalados y funcionando.
- Repositorio clonado y servicios levantados con `docker compose up -d` (o `docker-compose up -d`).
- Contenedores en ejecución verificados con `docker ps`.
- Aplicación accesible desde el navegador y base de datos creada (si aplica).
- Documentación completa con las capturas requeridas.

---

## Próximos pasos

A partir de aquí puedes extender la práctica:

- **Reto Docker (sitio web corporativo):** [PR103 - Infraestructura completa con Docker Compose](PR103_Solucion.md) – redes personalizadas, volúmenes adicionales y WordPress.
- **Reto AWS (infraestructura cloud):** [Infraestructura completa de TI con AWS](AWS_CreviPlay_Infraestructura_Completa.md) – VPC, EC2, RDS, S3, seguridad, respaldo.
