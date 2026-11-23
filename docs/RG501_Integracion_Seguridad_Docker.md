---
title: RG501 - Integración y seguridad con Docker
description: Reto RG501 para integrar todos los contenedores del proyecto basado en Docker, añadir seguridad con evidencias y monitorización con Prometheus y Pandora FMS.
---

# RG501: Integración y seguridad con Docker

**Resultado de Aprendizaje:** RA3  
**Puntuación total:** 30 puntos  
**Trabajo en grupo:** 2-3 personas

---

## Contexto y continuidad

Este reto es la continuación del despliegue realizado en el tema 4. En el proyecto basado en Docker debéis partir de una arquitectura con:

- Un punto de entrada web (reverse proxy tipo Nginx).
- Un CMS / web pública (WordPress).
- Un back end o panel de administración (aplicación PHP).
- Una base de datos MySQL.

Diseño de referencia (proyecto Docker):

[Proyecto Intermodular (Docker) - Diseño y Planificación](https://elimpermeable.github.io/Proyecto_Intermodular2ASIR_IJJ/02_Marco_tecnologico/)

Además, este reto sigue la filosofía de despliegue y validación de `PR402` (Docker Compose + verificación de conectividad), adaptándolo a vuestro stack real.

Práctica base de referencia: `PR402`

[PR402 - Despliegue de aplicación PHP + MySQL con Docker Compose](PR402_Despliegue_PHP_MySQL_Docker_Compose.md)

---

## Punto de partida (según vuestro desarrollo)

Según el desarrollo publicado, el grupo ya tiene desplegado y verificado:

- `docker-compose.yml` con `nginx` (reverse proxy), `wordpress`, `laravel` y `db` (MySQL).
- Red interna Docker para la comunicación entre servicios.
- Volúmenes persistentes para datos.
- `.env` para credenciales (no versionado).
- MySQL **sin exposición externa** (puerto 3306 no publicado).
- Healthcheck y arranque ordenado (`condition: service_healthy`).
- Verificación de endpoints web y panel.

---

## Objetivo

Convertir el stack en un entorno “casi producción” añadiendo **seguridad** y **validación avanzada** (sin repetir el despliegue básico):

- Hardening del reverse proxy y accesos a paneles.
- Backups + restauración (prueba real de continuidad).
- HTTPS (si hay dominio) o plan de activación documentado.
- **Monitorización y logs** con contenedores **Prometheus** y **Pandora FMS** (misma red Docker que el stack).
- Validación extremo a extremo tras los cambios (regresión).

---

## Tareas (resumen)

| # | Tarea | Guía |
|---|--------|------|
| 1 | Hardening Nginx (cabeceras + rate limiting) | [Guía 1](#guia-1-hardening-del-reverse-proxy-nginx) |
| 2 | Control de acceso a `/admin` | [Guía 2](#guia-2-control-de-acceso-adicional-al-panel-admin) |
| 3 | Backups y restauración | [Guía 3](#guia-3-backups-y-restauracion) |
| 4 | Validación de regresión | [Guía 4](#guia-4-validacion-de-regresion-tras-los-cambios) |
| 5 | HTTPS o plan documentado | [Guía 5](#guia-5-https-o-preparacion-documentada) |
| 6 | Monitorización y logs (Prometheus + Pandora FMS) | [Guía 6](#guia-6-monitorizacion-y-logs-prometheus-y-pandora-fms) |

---

## Guía 1: Hardening del reverse proxy (Nginx)

**Objetivo:** añadir cabeceras HTTP de seguridad y limitar peticiones repetidas a rutas sensibles, sin romper WordPress ni el panel Laravel.

### 1.1. Localizar la configuración

- En el servidor, el proyecto suele estar bajo `/opt/taller/` (o la ruta que uséis).
- La configuración del proxy está en `nginx/conf.d/default.conf` (montada en el contenedor `nginx` como volumen).
- Tras cada cambio: `docker compose exec nginx nginx -t` y luego `docker compose exec nginx nginx -s reload` (o reiniciar el servicio `nginx`).

### 1.2. Cabeceras de seguridad (mínimo 3)

Añade en el bloque `server { ... }` (o en cada `location` si preferís granularidad) directivas `add_header`. Ejemplo que podéis adaptar:

```nginx
# Dentro de server { ... }, antes de los location
add_header X-Content-Type-Options "nosniff" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
add_header Permissions-Policy "geolocation=(), microphone=(), camera=()" always;
# Opcional: restringir quién puede embeber la web en iframes
add_header Content-Security-Policy "frame-ancestors 'self'" always;
```

!!! warning "CSP estricta"
    Una CSP muy restrictiva puede romper WordPress (plugins, estilos inline). Si algo deja de cargar, relajad la política o aplicad CSP solo a rutas concretas.

**Comprobar:**

```bash
curl -sI http://<IP_PUBLICA>/ | grep -iE 'x-content|referrer|permissions|content-security'
```

O en el navegador: F12 → pestaña **Red** → clic en la primera petición → **Cabeceras de respuesta**.

### 1.3. Rate limiting (zonas y límites)

Definí las zonas en el contexto **`http`** de Nginx. Si solo montáis `conf.d/*.conf`, podéis crear un fichero `nginx/conf.d/00-limits.conf` incluido primero, o añadir al inicio de `default.conf` un bloque que Nginx acepte (según cómo esté montada la imagen `nginx:alpine`, a veces hace falta un `nginx.conf` principal personalizado con `include`).

**Opción A – `default.conf` con `limit_req_zone` al principio del archivo** (si la imagen incluye ese archivo dentro de `http {}`; en Alpine suele ser `include /etc/nginx/conf.d/*.conf` dentro de `http`, así que **`limit_req_zone` no puede ir dentro de un `server` de conf.d**). En ese caso:

1. Montad un `nginx/nginx.conf` personalizado que copie el de la imagen y añada dentro de `http { }`:

```nginx
limit_req_zone $binary_remote_addr zone=wp_login:10m rate=5r/m;
limit_req_zone $binary_remote_addr zone=wp_admin:10m rate=30r/m;
limit_req_zone $binary_remote_addr zone=panel_admin:10m rate=10r/m;
```

2. En `docker-compose.yml`, montad `./nginx/nginx.conf:/etc/nginx/nginx.conf:ro` (y mantened `include /etc/nginx/conf.d/*.conf`).

**Opción B – Sin tocar `nginx.conf`:** usad `limit_conn` solo en `location` (limita conexiones concurrentes) o documentad la limitación con `limit_req` si conseguís inyectar zonas vía snippet soportado por vuestra plantilla.

**En los `location` sensibles** (ajustad rutas a vuestro `default.conf`):

```nginx
location ~ ^/wp-login\.php {
    limit_req zone=wp_login burst=5 nodelay;
    # ... proxy_pass al upstream WordPress
}

location ^~ /wp-admin/ {
    limit_req zone=wp_admin burst=20 nodelay;
    # ... proxy_pass
}

# Panel en puerto 8081: en el server que escucha 8081
location ^~ /admin {
    limit_req zone=panel_admin burst=10 nodelay;
    # ... proxy_pass a Laravel/php-fpm
}
```

**Validar rate limiting:** desde otra máquina o con un bucle:

```bash
for i in $(seq 1 30); do curl -s -o /dev/null -w "%{http_code}\n" http://<IP>/wp-login.php; done
```

Deberíais ver códigos `429` (Too Many Requests) o el comportamiento que hayáis configurado tras superar el umbral.

**Evidencia obligatoria:** captura de cabeceras (`curl -I` o DevTools) y captura o log de respuestas `429` (o equivalente).

---

## Guía 2: Control de acceso adicional al panel `/admin`

**Objetivo:** que no cualquiera llegue a la pantalla de login de Filament; Nginx pide primero otra capa (usuario/contraseña o IP permitida).

### 2.1. Opción A: Basic Auth (recomendada)

1. **Generar fichero de contraseñas** en el host (no subir a Git):

```bash
sudo apt install apache2-utils -y   # proporciona htpasswd
mkdir -p /opt/taller/nginx/secrets
sudo htpasswd -c /opt/taller/nginx/secrets/.htpasswd_admin admin_panel
# Introducid una contraseña fuerte; repetir con -c solo la primera vez
```

2. **Montar el secreto en el contenedor** en `docker-compose.yml` del servicio `nginx`:

```yaml
volumes:
  - ./nginx/secrets/.htpasswd_admin:/etc/nginx/.htpasswd_admin:ro
```

3. **En el `server` que escucha el puerto 8081** (panel), dentro de `location ^~ /admin`:

```nginx
location ^~ /admin {
    auth_basic "Panel restringido";
    auth_basic_user_file /etc/nginx/.htpasswd_admin;
    limit_req zone=panel_admin burst=10 nodelay;
    # proxy_pass, headers, etc. que ya tengáis
}
```

4. **Probar:** abrir `http://<IP>:8081/admin` → debe aparecer el cuadro de usuario/contraseña del navegador **antes** del login de Filament.

5. **Evidencia:** captura del diálogo Basic Auth y, tras credenciales correctas, acceso al login de Filament.

### 2.2. Opción B: Restricción por IP

Solo viable si accedéis al panel desde IPs fijas (aula, casa con IP estática, VPN).

```nginx
location ^~ /admin {
    allow 203.0.113.10;   # ejemplo: IP del centro
    allow 198.51.100.0/24;
    deny all;
    # proxy_pass ...
}
```

**Validación:** desde una IP no listada debe responder `403 Forbidden`. Capturad la evidencia.

---

## Guía 3: Backups y restauración

**Objetivo:** poder recuperar datos tras un error o borrado; la restauración debe estar **probada**, no solo documentada.

### 3.1. Backup de MySQL con `mysqldump`

1. **Variables:** usad las del `.env` (`MYSQL_ROOT_PASSWORD`, nombres de bases `wordpress`, `taller_motos`, etc.).

2. **Directorio de backups** en el host:

```bash
sudo mkdir -p /opt/taller/backups/mysql
cd /opt/taller
```

3. **Volcar bases** (nombre del servicio en Compose suele ser `db`):

```bash
# Todas las bases en un solo fichero (ajustad fecha)
docker compose exec -T db mysqldump -u root -p"${MYSQL_ROOT_PASSWORD}" \
  --single-transaction --routines --triggers \
  wordpress taller_motos > backups/mysql/all_$(date +%Y%m%d_%H%M).sql
```

Si el servicio se llama distinto, sustituid `db`. Si no tenéis las variables en shell, ejecutad `docker compose exec db sh -c 'mysqldump ...'` introduciendo la contraseña de forma segura (o usad un script que lea `.env`).

4. **Comprobar el fichero:** `head -n 20 backups/mysql/all_*.sql` debe mostrar cabeceras SQL.

5. **Evidencia:** captura del comando y del tamaño del `.sql` (`ls -lh backups/mysql/`).

### 3.2. Backup de ficheros persistentes (WordPress / volúmenes)

1. **Listar volúmenes:**

```bash
docker volume ls | grep -E 'taller|wordpress|mysql'
```

2. **Copia con contenedor temporal** (ejemplo para un volumen llamado `taller_mysql_data`):

```bash
docker run --rm \
  -v taller_mysql_data:/data:ro \
  -v /opt/taller/backups/volumes:/backup \
  alpine tar czf /backup/mysql_data_$(date +%Y%m%d).tar.gz -C /data .
```

Ajustad el nombre del volumen al que muestre `docker compose config` o `docker volume ls`.

3. **Documentad** en un `README` o `scripts/backup.sh` qué volúmenes incluís y cada cuánto ejecutáis el backup.

### 3.3. Prueba de restauración (obligatoria)

1. **Crear un dato de prueba** en el panel (por ejemplo un cliente “BACKUP_TEST”) o una entrada en WordPress con título único.

2. **Anotar** el estado (captura o ID).

3. **Simular pérdida:** borrar ese registro desde la app o con SQL:

```bash
docker compose exec db mysql -u root -p -e "USE taller_motos; DELETE FROM clientes WHERE nombre='BACKUP_TEST';"
```

(adaptad tabla y condición a vuestro esquema).

4. **Restaurar** desde el `.sql` más reciente:

```bash
docker compose exec -T db mysql -u root -p"${MYSQL_ROOT_PASSWORD}" < backups/mysql/all_YYYYMMDD_HHMM.sql
```

!!! warning "Sobrescritura"
    Restaurar un volcado completo puede sobrescribir **todas** las bases del volcado. En producción se usan restauraciones parciales o por tabla; para el reto, documentad qué hacéis y por qué.

5. **Verificar** que el dato “BACKUP_TEST” (o el marcador que uséis) ha vuelto.

6. **Evidencia:** antes (pantalla sin dato), comando de restore, después (dato recuperado).

---

## Guía 4: Validación de regresión tras los cambios

**Objetivo:** demostrar que nada esencial se ha roto tras las guías 1–3 (y 5 y 6 si aplica).

### 4.1. Checklist previo a reinicio

Ejecutad desde el host (IP y puertos según vuestro despliegue):

| Comprobación | Comando o acción | Resultado esperado |
|--------------|------------------|--------------------|
| Nginx sintaxis | `docker compose exec nginx nginx -t` | `syntax is ok` |
| Cabeceras | `curl -sI http://<IP>/` | Al menos 3 cabeceras de seguridad |
| Web pública | Navegador `http://<IP>/` | Carga WordPress |
| Login WP | `http://<IP>/wp-admin` | Formulario login |
| Panel | `http://<IP>:8081/admin` | Basic Auth (si aplica) + Filament |
| Listado datos | Navegador en una sección del panel | Listados sin error 500 |
| Prometheus | `curl -sI http://127.0.0.1:9090/` o UI en el puerto configurado | Respuesta HTTP y *targets* coherentes |
| Pandora FMS | Consola web en el puerto que documentéis | Login y vista con el chequeo/módulo activo |

### 4.2. Reinicio completo del stack

```bash
cd /opt/taller   # o vuestra ruta
docker compose down
docker compose up -d
docker compose ps
```

Esperad a que `db` pase a healthy antes de probar el panel (como en vuestro `depends_on`).

### 4.3. Checklist tras reinicio

- Misma tabla de comprobaciones que en 4.1.
- Confirmar que un dato creado **antes** del `down` sigue existiendo **después** del `up` (persistencia de volúmenes).

**Evidencia:** capturas de `docker compose ps` (healthy) y de una página clave antes/después del reinicio.

---

## Guía 5: HTTPS o preparación documentada

### 5.1. Si tenéis dominio apuntando a la Elastic IP

1. **DNS:** registro `A` (o `AAAA`) del dominio hacia la IP pública de la instancia EC2.

2. **Puerto 80** debe ser accesible para la validación de Let's Encrypt (HTTP-01).

3. **Opciones típicas:**

   - **Certbot en el host** con modo standalone o webroot (parar Nginx un momento si usáis standalone, o usar webroot montado en el volumen de Nginx).
   - **Contenedor** `certbot` + volúmenes compartidos con Nginx para `certbot certonly --webroot`.

4. **En Nginx:** dos `server`: uno en `:80` que redirija a `https://$host$request_uri`, y otro en `:443` con `ssl_certificate` y `ssl_certificate_key` apuntando a `/etc/letsencrypt/live/<dominio>/`.

5. **En `docker-compose.yml`:** exponer `443:443` en `nginx` y montar los certificados.

6. **Probar:** `https://<dominio>/` con candado válido; `http://` debe redirigir a `https://`.

**Evidencia:** captura del navegador con HTTPS y salida de `curl -I` mostrando `301` o `302` a HTTPS.

### 5.2. Si no tenéis dominio

Documentad en la memoria del proyecto (sección Integración):

- Dominio o subdominio que usaréis en el futuro.
- Pasos exactos que seguiréis (DNS → certbot → cambios en `nginx.conf` y `docker-compose.yml`).
- Fragmento de configuración **comentado** o en anexo (`nginx/snippets/ssl.example.conf`) listo para descomentar.

No es obligatorio certificar en local sin dominio; sí lo es el **plan** y la **plantilla** de configuración.

---

## Guía 6: Monitorización y logs (Prometheus y Pandora FMS)

**Objetivo:** incorporar **métricas** (Prometheus) y **monitorización gestionada** (Pandora FMS) en contenedores, y documentar cómo consultáis **logs** del stack, sin exponer paneles a Internet sin protección.

### 6.1. Principios

- Los servicios de monitorización deben estar en la **misma red Docker** que `nginx`, `wordpress`, `laravel` y `db` (o en una red adjunta con rutas explícitas), para poder scrapear o sondear por nombre de servicio.
- **No** publiquéis Prometheus ni la consola de Pandora en `0.0.0.0` sin medidas extra: preferid **solo red interna** o **Basic Auth / restricción por IP** en Nginx (como en la Guía 2).

### 6.2. Prometheus (métricas)

1. **Añadir servicio en `docker-compose.yml`** (ejemplo mínimo; ajustad nombres de red y rutas):

    ```yaml
    prometheus:
      image: prom/prometheus:latest
      container_name: prometheus
      restart: unless-stopped
      volumes:
        - ./monitoring/prometheus.yml:/etc/prometheus/prometheus.yml:ro
      ports:
        - "127.0.0.1:9090:9090"
      networks:
        - default   # o el nombre de vuestra red del proyecto
    ```

2. **Crear `monitoring/prometheus.yml`** con al menos un *job* que funcione en vuestro entorno. Opciones típicas en prácticas:

    - **cAdvisor** (métricas de contenedores): servicio extra `gcr.io/cadvisor/cadvisor` y scrape a `cadvisor:8080`.
    - **Métricas de Nginx**: activar `stub_status` en un `location` interno y scrapear con [nginx-prometheus-exporter](https://github.com/nginxinc/nginx-prometheus-exporter) (avanzado).

    Ejemplo mínimo que solo comprueba que Prometheus está vivo (útil para la primera subida):

    ```yaml
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: prometheus
        static_configs:
          - targets: ["localhost:9090"]
    ```

    Cuando añadáis cAdvisor u otro exporter, ampliad `scrape_configs` con el host **nombre del servicio** en Compose (ej. `cadvisor:8080`).

3. **Comprobar**

    - `docker compose up -d prometheus`
    - Navegador (en el servidor): `http://127.0.0.1:9090` → **Status → Targets** sin errores en los jobs que hayáis configurado.

### 6.3. Pandora FMS (monitorización)

Pandora FMS es una plataforma de monitorización con consola web y agentes. En Docker suele desplegarse como **varios servicios** (consola, servidor, base de datos). Para no improvisar una imagen inexistente:

1. Partid de la **documentación oficial** de despliegue en contenedores o del repositorio/compose recomendado por el proyecto (versiones cambian). Punto de entrada: [Manual de Pandora FMS](https://pandorafms.com/manual/).

2. **Integración con vuestro stack**

    - Añadid los servicios de Pandora al mismo `docker-compose.yml` o usad un `docker-compose.monitoring.yml` con `docker compose -f docker-compose.yml -f docker-compose.monitoring.yml up -d`.
    - Documentad **puertos**, **usuarios por defecto** cambiados en el primer acceso y **volúmenes** para no perder datos.

3. **Mínimo exigible en el reto**

    - Consola accesible (idealmente solo desde localhost o IP de administración, o detrás de Nginx con auth).
    - Al menos **un objetivo monitorizado** relacionado con vuestro proyecto: por ejemplo **comprobación TCP** al puerto de `nginx` o **ICMP** al contenedor/host, o agente sobre una instancia si lo usáis en la asignatura.

### 6.4. Logs (operación)

Documentad en la memoria de integración al menos:

- Cómo consultáis logs en tiempo casi real:

    ```bash
    docker compose logs -f --tail=100 nginx
    docker compose logs -f --tail=100 laravel
    ```

- (Opcional) Límites de tamaño de log en Compose para evitar llenar disco, por ejemplo en un servicio:

    ```yaml
    logging:
      driver: json-file
      options:
        max-size: "10m"
        max-file: "3"
    ```

### 6.5. Evidencias mínimas (Guía 6)

- Captura de **Prometheus** (página de *Targets* o consulta PromQL de ejemplo).
- Captura de la **consola de Pandora FMS** mostrando el módulo o agente configurado.
- Captura o copia de **salida de `docker compose logs`** filtrando un error o un arranque correcto tras reinicio.

---


## Evidencias y validación (qué debes demostrar)

- `docker compose ps` con todos los servicios en estado correcto.

- Evidencia de **hardening**:

  - cabeceras visibles (DevTools o `curl -I`),
  - rate limiting funcionando,
  - y control de acceso adicional a `/admin`.

- Evidencia de **backups y restauración**:

  - comandos/resultado del backup,
  - pérdida simulada,
  - restauración exitosa.

- Evidencia de **regresión**:

  - web y panel operativos tras cambios,
  - persistencia tras reinicio.

- Evidencia de **monitorización y logs**:

  - Prometheus en ejecución y *targets* coherentes con vuestra config,
  - Pandora FMS accesible y con al menos un chequeo/módulo del proyecto,
  - ejemplo de consulta de logs con `docker compose logs`.

---

## Entregables

1. **Repositorio actualizado** con:

   - configuración de Nginx (hardening + control de acceso),
   - procedimiento de backup y restauración (script o checklist),
   - `docker-compose` con servicios **Prometheus** y **Pandora FMS** (y ficheros bajo `monitoring/` si aplica),
   - cambios necesarios (si hay) en `docker-compose.yml`.

2. **Documentación de integración** en la sección “Integración” del documento del proyecto, con:

   - medidas de seguridad aplicadas y justificación,
   - procedimiento de backup/restore,
   - pruebas de validación (incluyendo regresión),
   - descripción de **monitorización** (qué scrapeáis o qué módulo usáis en Pandora) y **cómo revisáis logs**.

3. **Evidencias** (capturas y comandos):

   - `docker compose ps`,
   - cabeceras (`curl -I`) y rate limiting,
   - backup y restauración,
   - validación de endpoints,
   - Prometheus (targets o consulta), consola Pandora y ejemplo de `docker compose logs`.

---

## Criterios de evaluación (30p)

- Hardening (cabeceras + rate limiting + control de acceso) con evidencias (10p)

- Backups + restauración probada (8p)

- Validación extremo a extremo y regresión tras cambios (5p)

- Monitorización y logs (Prometheus + Pandora FMS + ejemplo de logs) con evidencias (3p)

- Calidad de documentación y evidencias (4p)

