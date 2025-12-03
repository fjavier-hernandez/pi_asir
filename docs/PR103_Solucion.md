---
title: Guía Solución PR103 - Infraestructura completa con Docker Compose
description: Práctica guiada de implementación de infraestructura completa con WordPress, MySQL y redes Docker personalizadas por Francisco Javier Hernández Illán. Despliegue profesional con aislamiento de servicios, volúmenes persistentes y variables de entorno.
---

# PR103: Infraestructura completa con Docker Compose - WordPress, MySQL y redes personalizadas

Esta práctica guía la implementación de una infraestructura completa de TI mediante Docker, simulando un entorno de producción profesional. Se desplegará una aplicación WordPress con base de datos MySQL, utilizando redes Docker personalizadas para aislar servicios y garantizar la seguridad.

## Objetivos de la práctica

- Configurar redes Docker personalizadas (frontend y backend) para aislar servicios
- Desplegar WordPress con Apache en contenedor Docker
- Desplegar MySQL en contenedor Docker aislado en red backend
- Configurar volúmenes persistentes para datos de WordPress y MySQL
- Utilizar variables de entorno para configuración sensible
- Verificar la comunicación entre contenedores mediante resolución DNS
- Comprobar la persistencia de datos tras recrear contenedores
- Documentar la arquitectura completa

## Arquitectura de la solución

La arquitectura propuesta separa los servicios en dos redes:

- **Red frontend (172.25.0.0/16)**: Para servicios accesibles desde el exterior (WordPress)
- **Red backend (172.26.0.0/16)**: Para servicios internos (MySQL)

WordPress estará conectado a ambas redes, permitiéndole comunicarse con el exterior y con la base de datos. MySQL solo estará en la red backend, proporcionando mayor seguridad al no estar expuesta directamente.

```
┌─────────────────────────────────────────────────────────┐
│                    Host (Sistema)                        │
│                                                           │
│  ┌──────────────────────────────────────────────────┐   │
│  │         Red Frontend (172.25.0.0/16)             │   │
│  │  ┌────────────────────────────────────────────┐   │   │
│  │  │  WordPress (puerto 8080:80)               │   │   │
│  │  │  - Acceso desde navegador                 │   │   │
│  │  └────────────────────────────────────────────┘   │   │
│  └──────────────────────────────────────────────────┘   │
│                                                           │
│  ┌──────────────────────────────────────────────────┐   │
│  │         Red Backend (172.26.0.0/16)              │   │
│  │  ┌──────────────────┐  ┌──────────────────┐     │   │
│  │  │  WordPress       │  │  MySQL           │     │   │
│  │  │  (conectado)     │  │  (solo backend)  │     │   │
│  │  └──────────────────┘  └──────────────────┘     │   │
│  │         │                      │                 │   │
│  │         └────── DNS ───────────┘                 │   │
│  └──────────────────────────────────────────────────┘   │
│                                                           │
│  ┌──────────────────────────────────────────────────┐   │
│  │              Volúmenes Persistentes                │   │
│  │  - wordpress_data (contenido WP)                 │   │
│  │  - mysql_data (datos MySQL)                      │   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
```

## Paso 1: Preparación del entorno

### 1.1. Crear estructura de directorios

Primero, creamos el directorio del proyecto y la estructura necesaria:

``` bash
mkdir -p proyecto-wordpress-docker
cd proyecto-wordpress-docker
```

### 1.2. Crear archivo de variables de entorno

Creamos el archivo `.env` para almacenar las variables de entorno sensibles. Este archivo no debe subirse a control de versiones.

``` bash
nano .env
```

Contenido del archivo `.env`:

``` env
# Configuración MySQL
MYSQL_ROOT_PASSWORD=root_password_segura_123
MYSQL_DATABASE=wordpress_db
MYSQL_USER=wordpress_user
MYSQL_PASSWORD=wordpress_password_segura_456

# Configuración WordPress
WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=wordpress_user
WORDPRESS_DB_PASSWORD=wordpress_password_segura_456
WORDPRESS_DB_NAME=wordpress_db
```

Guardamos el archivo (Ctrl+O, Enter, Ctrl+X en nano).

### 1.3. Crear archivo .env.example

Creamos una plantilla sin valores sensibles para documentación:

``` bash
nano .env.example
```

Contenido del archivo `.env.example`:

``` env
# Configuración MySQL
MYSQL_ROOT_PASSWORD=tu_password_root_aqui
MYSQL_DATABASE=nombre_base_datos
MYSQL_USER=usuario_mysql
MYSQL_PASSWORD=password_mysql

# Configuración WordPress
WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=usuario_mysql
WORDPRESS_DB_PASSWORD=password_mysql
WORDPRESS_DB_NAME=nombre_base_datos
```

## Paso 2: Crear docker-compose.yml

Creamos el archivo principal de configuración de Docker Compose:

``` bash
nano docker-compose.yml
```

Contenido completo del archivo `docker-compose.yml`:

``` yaml
version: "3.9"

services:
  # Servicio de base de datos MySQL
  db:
    image: mysql:8.0
    container_name: wordpress_db
    restart: always
    networks:
      - backend
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - mysql_data:/var/lib/mysql
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      timeout: 5s
      retries: 5

  # Servicio WordPress
  wordpress:
    image: wordpress:latest
    container_name: wordpress_app
    restart: always
    depends_on:
      db:
        condition: service_healthy
    networks:
      - frontend
      - backend
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: ${WORDPRESS_DB_HOST}
      WORDPRESS_DB_USER: ${WORDPRESS_DB_USER}
      WORDPRESS_DB_PASSWORD: ${WORDPRESS_DB_PASSWORD}
      WORDPRESS_DB_NAME: ${WORDPRESS_DB_NAME}
    volumes:
      - wordpress_data:/var/www/html

# Definición de volúmenes persistentes
volumes:
  mysql_data:
    driver: local
  wordpress_data:
    driver: local

# Definición de redes personalizadas
networks:
  frontend:
    driver: bridge
    ipam:
      config:
        - subnet: 172.25.0.0/16
          gateway: 172.25.0.1
  backend:
    driver: bridge
    ipam:
      config:
        - subnet: 172.26.0.0/16
          gateway: 172.26.0.1
```

### Explicación de la configuración

**Servicio db (MySQL):**
- `networks: backend`: Solo conectado a la red backend para aislamiento
- `volumes: mysql_data`: Volumen persistente para los datos de MySQL
- `healthcheck`: Verifica que MySQL esté listo antes de que WordPress intente conectarse
- No expone puertos al host, solo comunicación interna

**Servicio wordpress:**
- `networks: frontend, backend`: Conectado a ambas redes
- `ports: 8080:80`: Expone el puerto 80 del contenedor en el 8080 del host
- `depends_on: db condition: service_healthy`: Espera a que MySQL esté listo
- `volumes: wordpress_data`: Volumen persistente para el contenido de WordPress

**Redes:**
- `frontend`: Subnet 172.25.0.0/16 para servicios públicos
- `backend`: Subnet 172.26.0.0/16 para servicios internos

## Paso 3: Desplegar la infraestructura

### 3.1. Verificar la configuración

Antes de desplegar, verificamos que los archivos estén correctos:

``` bash
# Verificar sintaxis del docker-compose.yml
docker compose config
```

Este comando valida la sintaxis sin levantar los contenedores.

### 3.2. Levantar los servicios

Ejecutamos Docker Compose en modo detached (segundo plano):

``` bash
docker compose up -d
```

Este comando:
- Crea las redes personalizadas si no existen
- Crea los volúmenes si no existen
- Descarga las imágenes necesarias (si no están en local)
- Crea y arranca los contenedores

### 3.3. Verificar el estado de los contenedores

Comprobamos que todos los servicios estén en ejecución:

``` bash
docker compose ps
```

Deberíamos ver algo similar a:

```
NAME              IMAGE               COMMAND                  SERVICE     CREATED         STATUS                    PORTS
wordpress_app     wordpress:latest     "docker-entrypoint.s…"   wordpress   2 minutes ago   Up 2 minutes             0.0.0.0:8080->80/tcp
wordpress_db      mysql:8.0           "docker-entrypoint.s…"   db          2 minutes ago   Up 2 minutes (healthy)   
```

## Paso 4: Verificación de redes

### 4.1. Listar redes creadas

Verificamos que las redes se hayan creado correctamente:

``` bash
docker network ls
```

Deberíamos ver las redes `proyecto-wordpress-docker_frontend` y `proyecto-wordpress-docker_backend` (Docker Compose añade el prefijo del directorio).

### 4.2. Inspeccionar la red frontend

``` bash
docker network inspect proyecto-wordpress-docker_frontend
```

Verificamos que WordPress esté conectado a esta red y tenga una IP en el rango 172.25.0.0/16.

### 4.3. Inspeccionar la red backend

``` bash
docker network inspect proyecto-wordpress-docker_backend
```

Verificamos que tanto WordPress como MySQL estén conectados a esta red, cada uno con una IP en el rango 172.26.0.0/16.

### 4.4. Verificar resolución DNS

Comprobamos que WordPress puede resolver el nombre `db` mediante DNS:

``` bash
docker compose exec wordpress ping -c 3 db
```

Deberíamos ver respuestas de ping exitosas, confirmando que la resolución DNS funciona correctamente.

## Paso 5: Acceso a WordPress

### 5.1. Acceder desde el navegador

Abrimos un navegador y accedemos a:

```
http://localhost:8080
```

O si estamos en una máquina virtual:

```
http://IP_MAQUINA_VIRTUAL:8080
```

### 5.2. Completar la instalación de WordPress

Seguimos el asistente de instalación de WordPress:

1. Seleccionar idioma (Español)
2. Rellenar información del sitio:
   - Título del sitio
   - Nombre de usuario administrador
   - Contraseña (generar una segura)
   - Correo electrónico
3. Hacer clic en "Instalar WordPress"

### 5.3. Verificar acceso al panel de administración

Una vez completada la instalación, accedemos al panel de administración y verificamos que todo funciona correctamente.

## Paso 6: Pruebas de persistencia

### 6.1. Crear contenido en WordPress

Creamos algún contenido para verificar la persistencia:

1. Crear una nueva entrada o página
2. Subir una imagen o archivo
3. Instalar un plugin (opcional)

### 6.2. Detener los contenedores

Detenemos y eliminamos los contenedores (sin eliminar volúmenes):

``` bash
docker compose down
```

Este comando detiene y elimina los contenedores, pero mantiene los volúmenes y las redes.

### 6.3. Verificar que los volúmenes persisten

Comprobamos que los volúmenes siguen existiendo:

``` bash
docker volume ls
```

Deberíamos ver los volúmenes `proyecto-wordpress-docker_mysql_data` y `proyecto-wordpress-docker_wordpress_data`.

### 6.4. Volver a levantar los servicios

``` bash
docker compose up -d
```

### 6.5. Verificar persistencia de datos

Accedemos nuevamente a WordPress en `http://localhost:8080` y verificamos que:

- El contenido creado anteriormente sigue existiendo
- Las imágenes subidas están disponibles
- Los plugins instalados siguen activos
- La configuración se mantiene

## Paso 7: Pruebas de aislamiento de red

### 7.1. Intentar conectar a MySQL desde el host

Desde el host, intentamos conectarnos directamente a MySQL (debe fallar):

``` bash
mysql -h localhost -P 3306 -u wordpress_user -p
```

O usando la IP del contenedor:

``` bash
# Primero obtenemos la IP del contenedor MySQL
docker inspect wordpress_db | grep IPAddress

# Intentamos conectar (debe fallar)
mysql -h 172.26.0.X -u wordpress_user -p
```

Esto debe fallar porque MySQL no está expuesto al host, solo está accesible desde la red backend.

### 7.2. Verificar comunicación interna

Desde el contenedor de WordPress, verificamos que puede comunicarse con MySQL:

``` bash
# Acceder al contenedor WordPress
docker compose exec wordpress bash

# Desde dentro del contenedor, instalar cliente MySQL (si no está)
apt-get update && apt-get install -y default-mysql-client

# Intentar conectar a la base de datos usando el nombre del servicio
mysql -h db -u wordpress_user -p
```

Esto debe funcionar correctamente, confirmando que la comunicación interna funciona mediante resolución DNS.

### 7.3. Verificar IPs asignadas

Comprobamos las IPs asignadas a cada contenedor:

``` bash
# IP de WordPress en red frontend
docker inspect wordpress_app | grep -A 10 "172.25"

# IP de WordPress en red backend
docker inspect wordpress_app | grep -A 10 "172.26"

# IP de MySQL en red backend
docker inspect wordpress_db | grep -A 10 "172.26"
```

## Paso 8: Gestión y mantenimiento

### 8.1. Ver logs de los servicios

Para ver los logs de todos los servicios:

``` bash
docker compose logs
```

Para ver logs de un servicio específico:

``` bash
docker compose logs wordpress
docker compose logs db
```

Para seguir los logs en tiempo real:

``` bash
docker compose logs -f
```

### 8.2. Reiniciar un servicio específico

Si necesitamos reiniciar solo WordPress:

``` bash
docker compose restart wordpress
```

### 8.3. Detener y eliminar todo (incluyendo volúmenes)

Si queremos eliminar todo, incluyendo los datos:

``` bash
docker compose down -v
```

!!! warning "Advertencia"
    El flag `-v` elimina los volúmenes, por lo que se perderán todos los datos. Usar con precaución.

### 8.4. Actualizar imágenes

Para actualizar las imágenes a la última versión:

``` bash
docker compose pull
docker compose up -d
```

## Paso 9: Documentación de la arquitectura

### 9.1. Estructura del proyecto

La estructura final del proyecto debería ser:

```
proyecto-wordpress-docker/
├── docker-compose.yml
├── .env
├── .env.example
└── README.md (opcional)
```

### 9.2. Capturas necesarias

Para la documentación, debemos incluir capturas de:

1. Estructura de directorios del proyecto
2. Salida de `docker compose ps`
3. Salida de `docker network inspect` para cada red
4. Acceso a WordPress funcionando (pantalla de instalación y panel de administración)
5. Verificación de persistencia (contenido antes y después de recrear contenedores)
6. Verificación de aislamiento de red (intento de conexión a MySQL desde host)

### 9.3. Diagrama de arquitectura

Incluir un diagrama que muestre:

- Las dos redes (frontend y backend)
- Los contenedores en cada red
- Las conexiones entre servicios
- Los volúmenes persistentes
- El flujo de datos

## Solución de problemas comunes

### Problema: Error al conectar WordPress a la base de datos

**Solución:**
- Verificar que MySQL esté en estado "healthy" con `docker compose ps`
- Comprobar las variables de entorno en el archivo `.env`
- Verificar que `WORDPRESS_DB_HOST` sea `db:3306` (no `localhost`)
- Revisar los logs: `docker compose logs db`

### Problema: Puerto 8080 ya en uso

**Solución:**
- Cambiar el puerto en `docker-compose.yml`: `"8081:80"` en lugar de `"8080:80"`
- O detener el servicio que está usando el puerto 8080

### Problema: Error al crear las redes (subnet en conflicto)

**Solución:**
- Cambiar los rangos de subred en `docker-compose.yml`
- Usar rangos diferentes, por ejemplo: `172.27.0.0/16` y `172.28.0.0/16`
- Verificar redes existentes: `docker network ls`

### Problema: Contenedores se detienen inmediatamente

**Solución:**
- Revisar los logs: `docker compose logs`
- Verificar que las variables de entorno estén correctamente definidas
- Comprobar que no haya conflictos de nombres de contenedores
- Verificar recursos del sistema (RAM, disco)

### Problema: WordPress no puede conectar a MySQL

**Solución:**
- Verificar que ambos contenedores estén en la red backend
- Comprobar resolución DNS: `docker compose exec wordpress ping db`
- Verificar que `depends_on` con `condition: service_healthy` esté configurado
- Revisar variables de entorno de conexión

## Comandos útiles de referencia

``` bash
# Gestión de servicios
docker compose up -d              # Levantar servicios
docker compose down               # Detener y eliminar contenedores
docker compose ps                 # Estado de servicios
docker compose restart <servicio> # Reiniciar un servicio

# Logs
docker compose logs               # Ver todos los logs
docker compose logs -f            # Seguir logs en tiempo real
docker compose logs <servicio>    # Logs de un servicio

# Redes
docker network ls                 # Listar redes
docker network inspect <red>      # Detalles de una red
docker network prune              # Eliminar redes no usadas

# Volúmenes
docker volume ls                  # Listar volúmenes
docker volume inspect <volumen>   # Detalles de un volumen
docker volume prune               # Eliminar volúmenes no usados

# Ejecutar comandos en contenedores
docker compose exec <servicio> <comando>  # Ejecutar comando en servicio
docker compose exec wordpress bash        # Acceder a shell de WordPress
docker compose exec db mysql -u root -p   # Acceder a MySQL
```

## Conclusión

Esta práctica demuestra cómo implementar una infraestructura completa y profesional usando Docker Compose, con:

- Aislamiento de servicios mediante redes personalizadas
- Persistencia de datos mediante volúmenes
- Configuración segura mediante variables de entorno
- Comunicación entre contenedores mediante resolución DNS
- Arquitectura escalable y mantenible

La solución implementada puede servir como base para proyectos más complejos, añadiendo servicios adicionales como reverse proxy (nginx), servicios de backup, o herramientas de monitorización.

