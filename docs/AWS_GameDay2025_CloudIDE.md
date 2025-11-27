---
title: Cloud IDE Quest - Guía de Uso
description: Guía para usar el Cloud IDE y el servidor Git durante el AWS GameDay 2025
---

# Cloud IDE Quest - Guía de Uso

## Estado del Quest

- **Estado**: En curso
- **Puntos**: 0
- **Lugar**: 1º

## Detalles

El **Cloud IDE Quest** proporciona un IDE basado en web y un servidor Git. Su uso puede ser requerido si se indica en otros Quests. Alternativamente, puedes usarlo si ves la necesidad. Este Quest en sí mismo no requiere ninguna acción específica, no otorga puntos y nunca se marcará como completado.

## Información de Acceso

| Aplicación | Nombre de usuario | Contraseña |
|:-----------|:-----------------|:-----------|
| **Code Server (IDE)** | - | `JYqkDnrYXMmBPjl7dOXeOmv51Aht4ybS` |
| **Gitea** | `unicorn` | `8UMnG2Q2` |

## Dónde están las cosas

Los Quests pueden poner repositorios Git a disposición a través del servidor Git (Gitea). Estos repositorios Git se pueden acceder de tres formas diferentes:

### 1. Code Server IDE

Cada repositorio Git se clona automáticamente en un directorio dentro de `/home/ubuntu/environment/GameDay`

### 2. Gitea

Los archivos individuales se pueden modificar uno a la vez a través de la interfaz de usuario de Gitea

### 3. Clonar repositorios Git en otro lugar (Avanzado)

Si prefieres no usar las dos opciones anteriores, los repositorios Git se pueden clonar en otro lugar (por ejemplo, CloudShell)

## Cosas a tener en cuenta

!!! warning "Coordinación del Equipo"
    El Cloud IDE es compartido con todos los participantes del equipo, y cada uno usará la misma carpeta home. Asegúrate de coordinar con los miembros de tu equipo al hacer cambios.

!!! warning "Sincronización de Cambios"
    Si editas archivos en la interfaz de usuario de Gitea, asegúrate de hacer pull de cualquier cambio (`git pull`) en el Code Server IDE si también estás haciendo cambios allí.

## Consejos y trucos

### Primer inicio de sesión en Code Server IDE

Cuando inicies sesión por primera vez en el Code Server IDE, necesitarás abrir el directorio GameDay:

1. Haz clic en el icono de carpeta en la barra lateral izquierda
2. Haz clic en **"Open Folder"** (Abrir Carpeta)
3. Navega a `/home/ubuntu/environment`
4. Finalmente haz clic en **OK**

### Explorar repositorios en Gitea

Puedes explorar todos los repositorios en el servidor Gitea haciendo clic en la pestaña **"Explore"** (Explorar) en la parte superior de la página de Gitea.

### Editar archivos directamente en Gitea

Puedes hacer cambios directamente en Gitea:

1. Navega al repositorio
2. Abre el archivo que deseas editar
3. Haz clic en el icono del lápiz (pencil icon)
4. Cuando termines de editar, desplázate hasta la parte inferior de la página
5. Haz clic en **"Commit Changes"** (Confirmar Cambios)

!!! info "Inicio de Sesión en Gitea"
    Deberás asegurarte de iniciar sesión primero en Gitea usando las credenciales mostradas arriba antes de intentar editar un archivo en la interfaz de usuario.

## Comandos Git Útiles

### Verificar en qué rama está tu repositorio

La rama por defecto es `main`.

```bash
cd /home/ubuntu/environment/GameDay/<directorio_repositorio>
git branch
```

### Enviar cambios a Gitea (Push)

```bash
cd /home/ubuntu/environment/GameDay/<directorio_repositorio>
git status
git add (archivos_individuales | .)
git commit -m "Mensaje descriptivo"
git push origin <rama>
```

**Ejemplo:**
```bash
cd /home/ubuntu/environment/GameDay/mi-repositorio
git status
git add .
git commit -m "Añadida configuración de seguridad"
git push origin main
```

### Obtener cambios desde Gitea (Pull)

```bash
cd /home/ubuntu/environment/GameDay/<directorio_repositorio>
git status
git pull origin <rama>
```

**Ejemplo:**
```bash
cd /home/ubuntu/environment/GameDay/mi-repositorio
git pull origin main
```

### Clonar una versión nueva de un repositorio

Si necesitas empezar desde cero o descargar una versión actualizada:

```bash
cd /home/ubuntu/environment/GameDay
rm -rf <directorio_repositorio>
git clone https://<url_gitea>/unicorn/<directorio_repositorio>
```

**Ejemplo:**
```bash
cd /home/ubuntu/environment/GameDay
rm -rf mi-repositorio
git clone https://gitea.example.com/unicorn/mi-repositorio
```

## Flujo de Trabajo Recomendado

### Trabajando con el equipo en el mismo repositorio

1. **Antes de empezar a trabajar:**
   ```bash
   cd /home/ubuntu/environment/GameDay/<repositorio>
   git pull origin main
   ```

2. **Haz tus cambios** en el Code Server IDE o en Gitea

3. **Antes de hacer commit:**
   ```bash
   git pull origin main  # Asegúrate de tener los últimos cambios
   ```

4. **Haz commit y push de tus cambios:**
   ```bash
   git add .
   git commit -m "Descripción clara de los cambios"
   git push origin main
   ```

5. **Notifica a tu equipo** que has hecho cambios importantes

### Resolver conflictos

Si hay conflictos al hacer `git pull`:

1. Git te indicará qué archivos tienen conflictos
2. Abre esos archivos en el editor
3. Busca las marcas de conflicto: `<<<<<<<`, `=======`, `>>>>>>>`
4. Edita el archivo para resolver el conflicto
5. Elimina las marcas de conflicto
6. Guarda el archivo
7. Haz commit:
   ```bash
   git add <archivo_resuelto>
   git commit -m "Resuelto conflicto en <archivo>"
   git push origin main
   ```

## Resolución de Problemas

### No puedo ver el directorio GameDay

- Verifica que has abierto la carpeta `/home/ubuntu/environment` en el Code Server IDE
- Reinicia el Code Server IDE si es necesario

### Los cambios no aparecen después de editar en Gitea

```bash
cd /home/ubuntu/environment/GameDay/<repositorio>
git pull origin main
```

### Error al hacer push: "permission denied"

- Verifica que has iniciado sesión correctamente en Gitea
- Comprueba que tienes permisos de escritura en el repositorio
- Contacta con el administrador si el problema persiste

### Quiero empezar de cero con un repositorio

```bash
cd /home/ubuntu/environment/GameDay
rm -rf <directorio_repositorio>
git clone https://<url_gitea>/unicorn/<directorio_repositorio>
```

## Referencias Rápidas

| Acción | Comando |
|:-------|:--------|
| Ver estado | `git status` |
| Ver ramas | `git branch` |
| Ver commits | `git log --oneline` |
| Obtener cambios | `git pull origin main` |
| Añadir cambios | `git add .` |
| Confirmar cambios | `git commit -m "mensaje"` |
| Enviar cambios | `git push origin main` |
| Deshacer cambios locales | `git checkout -- <archivo>` |
| Ver diferencias | `git diff` |

---

!!! tip "Consejo Final"
    Durante el GameDay, coordina bien con tu equipo para evitar conflictos. Es mejor hacer commits pequeños y frecuentes que grandes cambios que puedan causar problemas.



