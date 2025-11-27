---
title: Security 101 - Guía del Alumno
description: Guía paso a paso para resolver el quest Security 101 del AWS GameDay
---

# Security 101 - Guía del Alumno

## Introducción

En este quest debes proteger la infraestructura de Unicorn.Rentals contra tres tipos de ataques:

1. **Ataques a la base de datos RDS**: Conexiones no autorizadas desde IPs desconocidas
2. **Eliminación de archivos en S3**: Alguien está borrando archivos CSS e imágenes
3. **Ataques SQL Injection**: Intentos de inyección SQL a través del ALB

> ⚠️ **IMPORTANTE**: No debes romper el sitio web. El sitio debe seguir funcionando después de aplicar las soluciones.

Durante el GameDay, tendrás acceso a un **Cloud IDE** y servidor Git (Gitea) para trabajar con repositorios. Consulta la guía de uso:

**[Cloud IDE Quest - Guía de Uso →](AWS_GameDay2025_CloudIDE.md)**

Esta guía incluye:

- Credenciales de acceso al Code Server IDE y Gitea
- Instrucciones para usar el IDE basado en web
- Comandos Git esenciales para trabajar en equipo
- Resolución de conflictos y troubleshooting
- Flujo de trabajo recomendado durante la competición


## Arquitectura de la Infraestructura

```mermaid
flowchart TB
    Internet[("🌐 Internet<br/>Usuarios Legítimos")]
    Attacker[("⚠️ Atacante<br/>IP Desconocida")]
    
    subgraph VPC["🔷 VPC: Unicorn.Rentals"]
        direction TB
        
        IGW[("🔌 Internet Gateway")]
        
        WAF["🛡️ AWS WAFv2<br/>(A CONFIGURAR)<br/>⚠️ Problema 3: SQL Injection"]
        
        subgraph AZ1["📍 Availability Zone 1"]
            direction LR
            
            subgraph Pub1["🌐 Subnet Pública 1"]
                ALB["⚖️ Application Load Balancer<br/>alb-unicorn-rentals"]
                EC2A["🖥️ EC2 Instance<br/>web-server-1"]
            end
            
            subgraph Priv1["🔒 Subnet Privada 1"]
                RDS["🗄️ Amazon RDS<br/>(MySQL/PostgreSQL)<br/>⚠️ Problema 1: Conexiones no autorizadas"]
            end
        end
        
        subgraph AZ2["📍 Availability Zone 2"]
            direction LR
            
            subgraph Pub2["🌐 Subnet Pública 2"]
                EC2B["🖥️ EC2 Instance<br/>web-server-2"]
            end
        end
    end
    
    S3["🪣 Amazon S3<br/>Bucket: unicorn-website<br/>⚠️ Problema 2: Archivos eliminados<br/>(CSS e imágenes)"]
    
    %% Flujo de tráfico legítimo
    Internet -->|"HTTP/HTTPS<br/>Puerto 80/443"| IGW
    IGW -->|"Tráfico entrante"| WAF
    WAF -->|"Tráfico filtrado"| ALB
    ALB -->|"HTTP<br/>Puerto 80"| EC2A
    ALB -->|"HTTP<br/>Puerto 80"| EC2B
    
    %% Flujo de atacante (intentos SQL injection)
    Attacker -.->|"SQL Injection<br/>/Users.php?uid=1 or 1=1<br/>❌ BLOQUEAR"| WAF
    Attacker -.->|"Intento conexión<br/>directa a RDS<br/>❌ BLOQUEAR"| RDS
    
    %% Flujo desde EC2 a base de datos
    EC2A -->|"MySQL/PostgreSQL<br/>Puerto 3306/5432<br/>✅ PERMITIR"| RDS
    EC2B -->|"MySQL/PostgreSQL<br/>Puerto 3306/5432<br/>✅ PERMITIR"| RDS
    
    %% Flujo desde EC2 a S3
    EC2A -->|"Lectura de archivos<br/>CSS e imágenes<br/>✅ PERMITIR"| S3
    EC2B -->|"Lectura de archivos<br/>CSS e imágenes<br/>✅ PERMITIR"| S3
    
    %% Atacante intentando eliminar archivos S3
    Attacker -.->|"Eliminación de archivos<br/>❌ BLOQUEAR"| S3
    
    %% Estilos
    classDef internet fill:#fff4e6,stroke:#f57c00,stroke-width:3px,color:#000
    classDef attacker fill:#ffebee,stroke:#d32f2f,stroke-width:3px,stroke-dasharray: 5 5,color:#000
    classDef vpc fill:#e8f5e9,stroke:#388e3c,stroke-width:2px,color:#000
    classDef public fill:#e3f2fd,stroke:#1976d2,stroke-width:2px,color:#000
    classDef private fill:#fce4ec,stroke:#c2185b,stroke-width:2px,color:#000
    classDef ec2 fill:#fff9c4,stroke:#f57f17,stroke-width:2px,color:#000
    classDef db fill:#e1bee7,stroke:#7b1fa2,stroke-width:2px,color:#000
    classDef networking fill:#b2dfdb,stroke:#00796b,stroke-width:2px,color:#000
    classDef waf fill:#fff3e0,stroke:#e65100,stroke-width:3px,color:#000
    classDef s3 fill:#e0f2f1,stroke:#00695c,stroke-width:2px,color:#000
    classDef problem fill:#ffebee,stroke:#c62828,stroke-width:2px,stroke-dasharray: 3 3,color:#000
    
    class Internet internet
    class Attacker attacker
    class VPC vpc
    class Pub1,Pub2 public
    class Priv1 private
    class EC2A,EC2B ec2
    class RDS,S3 problem
    class ALB,IGW networking
    class WAF waf
    class S3 s3
```

**Descripción de componentes y problemas de seguridad:**

| Componente | Descripción | Problema de Seguridad |
|:-----------|:------------|:---------------------|
| **Internet Gateway** | Puerta de enlace para comunicación con Internet | - |
| **AWS WAFv2** | Firewall de aplicación web (debe configurarse) | **Problema 3**: Bloquear ataques SQL injection como `/Users.php?uid=1%20or%201=1` |
| **Application Load Balancer** | Distribuye el tráfico HTTP/HTTPS entre servidores web | - |
| **EC2 Instances** | Servidores web que hospedan la aplicación PHP | - |
| **Amazon RDS** | Base de datos relacional (MySQL/PostgreSQL) | **Problema 1**: Recibe conexiones no autorizadas desde IPs desconocidas. Solo debe aceptar conexiones desde los servidores web |
| **Amazon S3** | Bucket con archivos estáticos (CSS, imágenes) | **Problema 2**: Alguien está eliminando archivos CSS e imágenes del bucket |

**Flujos de tráfico y problemas a resolver:**

1. **Tráfico legítimo entrante**: Internet → Internet Gateway → **WAF** (configurar) → ALB → EC2 → RDS
2. **Ataques SQL Injection**: Atacante → **WAF** (bloquear) → ALB ❌
3. **Conexiones no autorizadas a RDS**: Atacante → **RDS directamente** (bloquear mediante Security Groups) ❌
4. **Eliminación de archivos S3**: Atacante → **S3** (bloquear mediante Bucket Policies) ❌
5. **Acceso legítimo a S3**: EC2 → **S3** (lectura de CSS e imágenes) ✅

**Soluciones a implementar:**

1. **RDS**: Configurar Security Groups para permitir solo conexiones desde el Security Group de las instancias EC2
2. **S3**: Configurar Bucket Policies para prevenir eliminaciones no autorizadas y restaurar archivos eliminados
3. **WAF**: Crear Web ACL con reglas para bloquear SQL injection y asociarlo al ALB

---

## Parte 1: RDS Seguro - Bloquear Conexiones No Autorizadas

### Objetivo
Identificar la IP del atacante que intenta conectarse a la base de datos RDS y bloquear esas conexiones sin afectar el sitio web.

### Pasos a seguir

#### 1.1. Identificar la instancia RDS

1. Ve a la consola de AWS y navega a **Amazon RDS**
2. Identifica la instancia de base de datos en ejecución
3. Anota el **nombre de la instancia** y el **Security Group** asociado

#### 1.2. Revisar CloudWatch Logs para identificar la IP del atacante

Cuando el acceso a RDS se realiza a través de un Lambda, debes buscar la IP del atacante en diferentes lugares:

##### Opción A: Revisar logs de RDS directamente

Si RDS tiene logs habilitados, puedes ver las conexiones entrantes:

1. Ve a **CloudWatch** → **Log groups**
2. Busca logs relacionados con RDS (pueden llamarse `/aws/rds/instance/[nombre-instancia]/error` o similar)
3. Revisa los logs para encontrar intentos de conexión desde IPs que no pertenecen a tus servidores web
4. **Anota la dirección IP** del atacante (la que aparece múltiples veces en intentos fallidos)

##### Opción B: Revisar Security Groups para ver IPs con acceso (MÉTODO MÁS DIRECTO)

Si los logs del Lambda no muestran IPs, este es el método más directo y confiable:

1. Ve a **EC2** → **Security Groups**
2. Encuentra el Security Group asociado a tu instancia RDS:
   - Puedes identificarlo desde la página de RDS → Seleccionar tu instancia → Pestaña "Connectivity & security" → Security groups
3. Haz clic en el Security Group para abrir sus detalles
4. Ve a la pestaña **"Inbound rules"** (Reglas de entrada)
5. Revisa todas las reglas y busca:
   - ✅ Reglas que permitan acceso desde tus servidores web (estas son legítimas)
   - ❌ Reglas que permitan acceso desde `0.0.0.0/0` (permiten desde cualquier IP - **muy sospechoso**)
   - ❌ Reglas con IPs específicas que NO reconozcas (ej: `203.0.113.0/24` o similar)
   - ❌ Reglas con rangos IP que no sean de tu VPC (no empiecen con `10.`, `172.16-31.`, `192.168.`)
   
6. **La IP del atacante** aparecerá como:
   - Una IP única con `/32` al final (ej: `203.0.113.45/32`)
   - Un rango de IPs con `/24` o similar (ej: `203.0.113.0/24`)
   - La regla sospechosa generalmente permitirá acceso al puerto de la base de datos (3306 para MySQL, 5432 para PostgreSQL)
   
7. **Anota la IP o rango IP** de la regla sospechosa para el formulario del quest

!!! tip "Ejemplo de lo que buscar"
    En las Inbound Rules del Security Group de RDS, podrías ver algo como:
    ```
    Type: MySQL/Aurora
    Protocol: TCP
    Port: 3306
    Source: 203.0.113.45/32  ← Esta podría ser la IP del atacante
    ```
    Si ves una IP pública que no corresponde a tus servidores web, esa es la IP del atacante.

##### Opción C: Revisar VPC Flow Logs (si están habilitados)

1. Ve a **CloudWatch** → **Log groups**
2. Busca logs relacionados con VPC Flow Logs (pueden llamarse `/aws/vpc/flowlogs` o similar)
3. Usa CloudWatch Logs Insights para buscar conexiones a RDS:

```sql
fields @timestamp, srcaddr, dstaddr, dstport, action
| filter dstport = 3306 or dstport = 5432
| filter action = "ACCEPT"
| stats count() by srcaddr
| sort count desc
```

4. Identifica IPs que aparezcan con frecuencia y que no sean de tus servidores web o del Lambda legítimo

##### Opción D: Revisar logs del Lambda (MÉTODO RECOMENDADO)

El Lambda que interactúa con RDS puede registrar las IPs origen. Para encontrar la IP del atacante:

1. Ve a **CloudWatch** → **Log groups**
2. Busca logs relacionados con Lambda (el nombre puede empezar por `/aws/lambda/` o contener `gdQuests` o `CreateIdCInstanceFunction`)
3. Haz clic en el log group del Lambda (ejemplo: `/aws/lambda/gdQuests-...-CreateIdCInstanceFunction-...`)
4. Haz clic en **"View in Logs Insights"** (botón azul)
5. Ejecuta una consulta para buscar IPs en los logs:

**Consulta 1: Buscar todas las IPs en los logs (si no funciona, prueba las siguientes):**
```sql
fields @timestamp, @message
| parse @message /(?<ip>\d+\.\d+\.\d+\.\d+)/ 
| stats count() by ip
| sort count desc
```

**Consulta 2: Ver todos los mensajes primero para entender la estructura:**
```sql
fields @timestamp, @message
| sort @timestamp desc
| limit 50
```
*Esta consulta te mostrará los mensajes reales para ver qué información contienen.*

**Consulta 3: Buscar por términos relacionados con conexiones o RDS:**
```sql
fields @timestamp, @message
| filter @message like /rds/ or @message like /RDS/ or @message like /database/ or @message like /mysql/ or @message like /postgres/
| sort @timestamp desc
| limit 50
```

**Consulta 4: Buscar por patrones de error o conexión:**
```sql
fields @timestamp, @message
| filter @message like /error/ or @message like /Error/ or @message like /failed/ or @message like /Failed/ or @message like /timeout/
| sort @timestamp desc
| limit 50
```

**Consulta 5: Buscar cualquier número que parezca una IP (más amplio):**
```sql
fields @timestamp, @message
| parse @message /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/ as ip
| filter ip != null
| stats count() by ip
| sort count desc
```

!!! warning "Si ninguna consulta muestra IPs"
    Si ninguna de estas consultas muestra IPs en los logs del Lambda, la IP del atacante probablemente esté en los **Security Groups** de RDS. Ve a la Opción B (Revisar Security Groups) que está más abajo.

6. **Revisa los resultados cuidadosamente:**
   - Si las consultas no muestran IPs, primero ejecuta la **Consulta 2** para ver qué información realmente contienen los logs
   - Los logs pueden tener la IP en diferentes formatos o campos
   - La IP puede estar en el contexto del evento (no en el mensaje)

7. **Si no encuentras IPs en los logs del Lambda:**
   - Ve directamente a revisar los **Security Groups** de RDS (Opción B)
   - La IP del atacante probablemente esté configurada en las reglas de entrada del Security Group
   - O puede estar en los **VPC Flow Logs** si están habilitados

**Alternativa: Buscar directamente en el log group**

1. Haz clic en **"Search log group"** (botón amarillo)
2. Busca términos como: `connect`, `connection`, `IP`, o busca directamente una IP si sospechas de alguna
3. Revisa los eventos de log para encontrar intentos de conexión

**Pasos detallados en CloudWatch Logs Insights:**

1. En la página de detalles del log group del Lambda, haz clic en **"View in Logs Insights"**
2. Se abrirá la página de Logs Insights con el log group ya seleccionado
3. En el editor de consultas, escribe o pega una de estas consultas:

**Consulta básica para encontrar IPs:**
```sql
fields @timestamp, @message
| parse @message /(?<ip>\d+\.\d+\.\d+\.\d+)/ 
| stats count() by ip
| sort count desc
```

4. Haz clic en **"Run query"** (o presiona Ctrl+Enter)
5. Revisa los resultados en la tabla:
   - La columna `ip` mostrará todas las direcciones IP encontradas en los logs
   - La columna `count` mostrará cuántas veces aparece cada IP
   - Las IPs que aparecen con más frecuencia y son IPs públicas (externas) son sospechosas
6. Identifica la IP del atacante:
   - **NO será** una IP privada (10.x.x.x, 172.16-31.x.x, 192.168.x.x)
   - **SERÁ** una IP pública externa que aparece intentando conectarse
   - Generalmente aparecerá múltiples veces con intentos de conexión

**Si no encuentras IPs, primero ve qué hay en los logs:**

```sql
fields @timestamp, @message
| sort @timestamp desc
| limit 20
```

Esta consulta te mostrará los mensajes reales para entender qué información contienen. Luego puedes adaptar las consultas según lo que veas.

**Si los logs del Lambda no contienen IPs:**

Los logs del Lambda pueden no registrar las IPs de origen directamente. En ese caso, **ve directamente a revisar los Security Groups** (Opción B más abajo), que es el método más confiable para encontrar la IP del atacante.

**Alternativa: Usar CloudWatch Insights para buscar en todos los logs**

1. En CloudWatch, ve a **Logs Insights**
2. Selecciona múltiples log groups (RDS, Lambda, VPC Flow Logs si están disponibles)
3. Ejecuta una consulta como:

```sql
fields @timestamp, @message, @logStream
| filter @message like /connection/ or @message like /connect/ or @message like /IP/
| sort @timestamp desc
| limit 100
```

4. Busca IPs que aparezcan repetidamente y que no sean de tus servidores web

!!! tip "Consejo: Dónde encontrar la IP del atacante más rápido"
    **⚠️ Si los logs del Lambda no muestran IPs, usa este método:**
    
    **Método 1 - Security Groups (MÁS DIRECTO Y CONFIABLE):**
    1. EC2 → Security Groups
    2. Selecciona el Security Group de tu instancia RDS (puedes encontrarlo en RDS → Instancia → Pestaña "Connectivity & security")
    3. Pestaña **"Inbound rules"**
    4. Busca reglas sospechosas que permitan acceso desde:
       - IPs externas que NO sean de tus servidores web
       - `0.0.0.0/0` (permite desde cualquier IP)
       - Rangos IP públicos (no privados como `10.x.x.x`, `172.16-31.x.x`, `192.168.x.x`)
    5. La IP puede estar en formato CIDR (ej: `203.0.113.5/32`) - usa esa IP para el formulario
    6. **Esa es la IP del atacante**
    
    **Método 2 - Logs del Lambda (si contienen IPs):**
    1. CloudWatch → Log groups → Busca el Lambda
    2. Haz clic en **"View in Logs Insights"**
    3. Primero ejecuta: `fields @timestamp, @message | sort @timestamp desc | limit 20` para ver qué hay
    4. Si ves IPs, usa las consultas de extracción de IPs
    5. Si no ves IPs, vuelve al Método 1 (Security Groups)
    
!!! warning "Importante"
    - La IP del atacante será una IP pública externa (NO una IP privada como `10.x.x.x`, `172.16-31.x.x`, o `192.168.x.x`)
    - Si la IP está en formato CIDR con `/32`, usa esa IP completa para el formulario
    - Si está como rango (ej: `/24`), la IP base del rango suele ser la del atacante

### Troubleshooting: No encuentro la IP en los logs

Si las consultas en CloudWatch Logs Insights no muestran resultados o no encuentras IPs:

1. **Primero, verifica qué hay realmente en los logs:**
   ```sql
   fields @timestamp, @message
   | sort @timestamp desc
   | limit 20
   ```
   Esto te mostrará los mensajes reales para entender qué información contienen.

2. **Si los logs no contienen IPs**, es normal. Los logs del Lambda pueden no registrar las IPs de origen directamente.

3. **Solución: Ve directamente a Security Groups:**
   - Los Security Groups son el lugar más confiable para encontrar la IP del atacante
   - El atacante debe tener una regla en el Security Group de RDS que le permita acceder
   - Sigue la **Opción B: Revisar Security Groups** que está más abajo

4. **Alternativa: Revisa VPC Flow Logs:**
   - Si están habilitados, pueden contener información detallada sobre conexiones
   - Ve a la **Opción C: Revisar VPC Flow Logs** más abajo

#### 1.3. Revisar y modificar Security Groups

> 💡 **Nota**: Si ya revisaste los Security Groups en el paso anterior (Opción B), puedes proceder directamente a modificarlos.

1. Ve a **EC2** → **Security Groups**
2. Encuentra el Security Group asociado a tu instancia RDS
3. Revisa las **Inbound Rules** (Reglas de entrada)
4. Identifica qué IPs o rangos tienen acceso actualmente
   - Busca reglas que permitan acceso desde `0.0.0.0/0` (todo internet) ❌
   - Busca IPs específicas sospechosas que no sean de tus servidores web ❌
   - Anota la IP del atacante si la encuentras aquí

#### 1.4. Modificar el Security Group de RDS

> 🎯 **Estrategia**: Permitir conexiones SOLO desde los servidores web y recursos legítimos (como Lambda si aplica), bloqueando todas las demás.

1. Edita el Security Group de RDS
2. **Modifica o elimina** las reglas que permitan acceso desde:
   - `0.0.0.0/0` (todo internet) ❌
   - IPs específicas sospechosas que identificaste ❌
3. **Añade nuevas reglas** que permitan conexiones solo desde:
   - El Security Group de tus instancias EC2 (servidores web) ✅
   - El Security Group del Lambda (si hay un Lambda legítimo que accede a RDS) ✅
   - O las IPs específicas de tus servidores web ✅
   
   **Configuración sugerida para servidores web:**
   - **Type**: MySQL/Aurora (puerto 3306) o PostgreSQL (puerto 5432) según tu base de datos
   - **Source**: Selecciona el Security Group de tus instancias EC2
   - **Description**: "Allow access only from web servers"
   
   **Si hay un Lambda legítimo:**
   - **Type**: MySQL/Aurora (puerto 3306) o PostgreSQL (puerto 5432)
   - **Source**: Selecciona el Security Group del Lambda o usa VPC endpoints si está configurado
   - **Description**: "Allow access from Lambda function"

4. **Guarda los cambios**

!!! warning "Importante"
    Si identificaste la IP del atacante en el paso anterior, asegúrate de eliminarla o bloquearla explícitamente en las reglas del Security Group. NO añadas reglas que permitan acceso desde esa IP.

#### 1.5. Verificar que el sitio web sigue funcionando

1. Obtén la URL del ALB (Application Load Balancer)
   - Ve a **EC2** → **Load Balancers**
   - Copia el DNS name del ALB
2. Abre el DNS en un navegador
3. Verifica que el sitio carga correctamente
4. Prueba el endpoint `/Users.php?uid=1` para verificar que la conexión a la base de datos funciona

#### 1.6. Registrar la IP del atacante

1. En el formulario del quest "RDS seguro"
2. Ingresa la dirección IP que identificaste del atacante
3. Haz clic en **Enviar**

---

## Parte 2: Seguridad S3 - Proteger Archivos del Bucket

### Objetivo
Detener la eliminación de objetos en el bucket S3 y subir los archivos `unicorn.jpg` y `w3.css` al bucket `ctfbucket` sin que sean eliminados.

> 🎯 **Puntos por completar este punto de control: 300 puntos**

### Resumen de la tarea

El bucket S3 `ctfbucket` está perdiendo archivos importantes debido a un proceso automatizado. Debes:

1. ✅ **Detener las eliminaciones** usando una de las dos soluciones disponibles
2. ✅ **Subir los archivos** `unicorn.jpg` y `w3.css` al bucket
3. ✅ **Verificar** que el sitio web se ve correctamente

### Información del bucket

- **Nombre del bucket**: `ctfbucket` (bucket público)
- **Archivos a proteger/subir**:
  - `unicorn.jpg` (imagen de fondo)
  - `w3.css` (archivo de estilos CSS)

### Soluciones disponibles

Hay **2 formas** de resolver esta tarea. Puedes usar cualquiera de ellas:

- **Solución 1**: Crear una política de bucket que explícitamente deniegue la eliminación de objetos
- **Solución 2**: Eliminar el rol IAM "AccountGuardian" responsable de eliminar estos objetos

### Pasos a seguir

#### 2.1. Identificar el bucket S3

1. Ve a **Amazon S3** en la consola de AWS
2. Busca y selecciona el bucket **`ctfbucket`** (bucket público)

#### 2.2. Verificar archivos faltantes

1. Navega dentro del bucket `ctfbucket`
2. Busca los archivos:
   - `w3.css`
   - `unicorn.jpg`
3. Si faltan estos archivos, necesitarás subirlos después de implementar la solución de protección

---

### Solución 1: Crear política de bucket para denegar eliminaciones

Esta solución crea una política en el bucket que explícitamente deniega las acciones de eliminación de objetos.

#### Pasos para implementar la Solución 1:

1. En el bucket `ctfbucket`, ve a la pestaña **Permissions** (Permisos)
2. Desplázate hasta la sección **Bucket policy**
3. Haz clic en **Edit** (Editar)
4. Agrega la siguiente política JSON y guarda los cambios:

```json
{
    "Effect": "Deny",
    "Principal": "*",
    "Action": [
        "s3:DeleteObject",
        "s3:DeleteObjectVersion"
    ],
    "Resource": "arn:aws:s3:::ctfbucket/*"
}
```

> ⚠️ **Importante**: Esta política deniega TODAS las eliminaciones de objetos en el bucket, sin excepciones. Asegúrate de que esto es lo que necesitas.

5. Haz clic en **Save changes** (Guardar cambios)

---

### Solución 2: Eliminar el rol IAM "AccountGuardian"

Esta solución elimina el rol IAM que tiene permisos para eliminar objetos del bucket S3.

#### Pasos para implementar la Solución 2:

1. Navega a la consola de administración de **AWS IAM**
2. En el menú lateral, haz clic en **Roles** (Roles)
   - Esto mostrará todos los roles que se han creado en la cuenta
3. Busca el rol llamado **`AccountGuardian`**
   - Este rol tiene acceso completo a S3 y es responsable de eliminar los objetos
4. Para verificar que es el rol correcto:
   - Haz clic en el rol para ver sus detalles
   - Revisa las políticas asociadas (debería tener permisos de S3)
5. Para eliminar el rol:
   - Selecciona el rol `AccountGuardian`
   - Haz clic en el botón **Delete** (Eliminar)
   - Confirma la eliminación

> ⚠️ **Advertencia**: Asegúrate de que este rol no sea necesario para otras funcionalidades antes de eliminarlo.

---

### 2.3. Subir los archivos al bucket S3

Una vez que hayas implementado **cualquiera de las dos soluciones**, debes subir los archivos al bucket:

1. Ve a la pestaña **Objects** (Objetos) del bucket `ctfbucket`
2. Haz clic en **Upload** (Subir)
3. Haz clic en **Add files** (Añadir archivos) o **Add folder** (Añadir carpeta)
4. Selecciona y sube los siguientes archivos:
   - `unicorn.jpg` (imagen de fondo)
   - `w3.css` (archivo de estilos CSS)
5. Haz clic en **Upload** (Subir) para confirmar

> ✅ **Nota**: Después de implementar cualquiera de las soluciones, los objetos del bucket S3 ya no serán eliminados automáticamente.

---

### Política de bucket alternativa (Opcional - más granular)

Si prefieres una política más granular que permita excepciones para ciertos usuarios/roles específicos, puedes usar esta versión alternativa de la política de bucket:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyPublicDelete",
      "Effect": "Deny",
      "Principal": "*",
      "Action": [
        "s3:DeleteObject",
        "s3:DeleteObjectVersion"
      ],
      "Resource": "arn:aws:s3:::ctfbucket/*",
      "Condition": {
        "StringNotEquals": {
          "aws:PrincipalArn": "arn:aws:iam::CUENTA-ID:user/ADMIN-USER"
        }
      }
    }
  ]
}
```

> 💡 **Nota**: Reemplaza `CUENTA-ID` con el ID de tu cuenta AWS. Puedes obtenerlo en la parte superior derecha de la consola.

#### 2.4. Verificar que el sitio web se ve correctamente

1. Accede al sitio web a través del ALB
   - Ve a **EC2** → **Load Balancers**
   - Copia el DNS name del ALB
   - Abre la URL en un navegador
2. Verifica que:
   - Los estilos CSS (`w3.css`) se cargan correctamente
   - La imagen de fondo (`unicorn.jpg`) se muestra correctamente
   - El sitio web tiene el aspecto visual esperado
3. Si algo no funciona:
   - Verifica que los archivos están en el bucket `ctfbucket`
   - Revisa los permisos de lectura del bucket (el sitio web debe poder LEER los archivos)
   - Verifica que no hay errores en la consola del navegador (F12)

---

## Parte 3: WAFv2 - Proteger ALB contra SQL Injection

### Objetivo
Implementar AWS WAF para bloquear intentos de SQL injection como `/Users.php?uid=1%20or%201=1` sin afectar el tráfico legítimo.

### Pasos a seguir

#### 3.1. Identificar el Application Load Balancer (ALB)

1. Ve a **EC2** → **Load Balancers**
2. Identifica tu ALB (debería ser tipo "Application Load Balancer")
3. Anota el **ARN** del ALB (lo necesitarás para asociar el WAF)

#### 3.2. Crear un Web ACL en AWS WAFv2

1. Ve a **AWS WAF** en la consola
   - Busca "WAF" en la barra de búsqueda o navega desde **Security, Identity & Compliance**
2. Selecciona **Web ACLs** en el menú lateral
3. Haz clic en **Create web ACL**
4. Configura los siguientes pasos:

   **Step 1: Name and resources**
   - **Name**: `UnicornRentals-ALB-Protection`
   - **Resource type**: Selecciona **Regional resources** (para ALB)
   - **CloudWatch metric name**: Déjalo por defecto o usa `UnicornRentalsALBProtection`
   - Haz clic en **Next**

   **Step 2: Add rules and rule groups**
   - Haz clic en **Add rules** → **Add managed rule groups**
   - Selecciona **AWS Managed Rule Groups**
   - Busca y activa:
     - ✅ **Core rule set** (incluye protección contra SQL injection)
     - ✅ **Known bad inputs** (opcional pero recomendado)
   - Haz clic en **Add rules**
   
   **Crear regla personalizada para SQL Injection específico:**
   - Haz clic en **Add rules** → **Add my own rules and rule groups** → **Rule builder**
   - **Name**: `Block-SQL-Injection`
   - **Type**: **Rule builder**
   - **Statement**: 
     - **Inspect**: Request URI (o All query parameters)
     - **Match type**: **Contains string**
     - **String to match**: Ingresa patrones comunes de SQL injection como:
       - `' or '1'='1`
       - `' or 1=1`
       - `UNION SELECT`
       - `DROP TABLE`
       - `' or 'x'='x`
   - **Action**: **Block**
   - Haz clic en **Add rule**

   - **Default web ACL action**: Selecciona **Allow** (permitir el resto del tráfico)
   - Haz clic en **Next**

   **Step 3: Configure metrics**
   - Revisa las métricas (puedes dejarlas por defecto)
   - Haz clic en **Next**

   **Step 4: Review and create**
   - Revisa la configuración
   - Haz clic en **Create**

#### 3.3. Asociar el Web ACL al ALB

1. Después de crear el Web ACL, verás la página de detalles
2. Ve a la pestaña **Associated resources**
3. Haz clic en **Add AWS resources**
4. Selecciona tu **Application Load Balancer**
5. Haz clic en **Add**

**Alternativa: Desde la página del ALB**
1. Ve a **EC2** → **Load Balancers**
2. Selecciona tu ALB
3. En la pestaña **Integrated services**, haz clic en **Associate web ACL**
4. Selecciona el Web ACL que creaste
5. Haz clic en **Associate**

#### 3.4. Verificar que el WAF está bloqueando ataques

1. Espera 1-2 minutos para que los cambios se propaguen
2. Intenta acceder a una URL con SQL injection desde un navegador:
   ```
   http://[DNS-ALB]/Users.php?uid=1%20or%201=1
   ```
3. Deberías recibir un error 403 (Forbidden) o un mensaje de bloqueo
4. Verifica que el sitio web normal sigue funcionando:
   ```
   http://[DNS-ALB]/
   ```

#### 3.5. Monitorear el WAF en CloudWatch

1. Ve a **CloudWatch** → **Metrics**
2. Busca métricas bajo **AWS/WAFV2**
3. Revisa:
   - **AllowedRequests**: Solicitudes permitidas
   - **BlockedRequests**: Solicitudes bloqueadas
   - **CountedRequests**: Solicitudes contadas

#### 3.6. Ajustar reglas si es necesario

Si el sitio web legítimo está siendo bloqueado:
1. Ve al Web ACL en **AWS WAF**
2. Edita las reglas
3. Ajusta las condiciones o cambia acciones de "Block" a "Count" temporalmente para depurar

---

## Verificación Final

Después de completar las tres partes, verifica:

1. ✅ **RDS**: El sitio web funciona y solo acepta conexiones desde servidores web
2. ✅ **S3**: Los archivos CSS e imágenes están presentes y protegidos contra eliminación
3. ✅ **WAF**: Los ataques SQL injection son bloqueados pero el sitio web normal funciona

---

## Troubleshooting

### El sitio web deja de funcionar después de aplicar cambios

- **RDS**: Verifica que el Security Group de RDS permite conexiones desde el Security Group de EC2
- **S3**: Verifica que el bucket tiene permisos de lectura públicos o que el sitio web tiene credenciales para leer
- **WAF**: Revisa las reglas del WAF, puede que estés bloqueando tráfico legítimo

### No encuentro la IP del atacante en los logs

- Revisa CloudWatch Logs Insights con diferentes consultas
- Revisa VPC Flow Logs si están habilitados
- Revisa los Security Groups para ver qué IPs tienen acceso actualmente

### Los archivos S3 siguen siendo eliminados

- Verifica que la Bucket Policy está correctamente configurada
- Revisa IAM users/roles que puedan tener permisos amplios
- Considera usar MFA Delete para requerir autenticación adicional

### El WAF no bloquea los ataques

- Verifica que el Web ACL está asociado al ALB correcto
- Espera unos minutos para que los cambios se propaguen
- Revisa que las reglas están en modo "Block" y no "Count"
- Verifica los patrones de SQL injection en las reglas

---

## Recursos Adicionales

- [Documentación AWS RDS Security Groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.RDSSecurityGroups.html)
- [Documentación AWS S3 Bucket Policies](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-policies.html)
- [Documentación AWS WAFv2](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html)

---

**¡Buena suerte en el GameDay! 🎮🛡️**

