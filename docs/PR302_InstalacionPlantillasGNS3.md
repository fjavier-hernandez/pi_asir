---
title: PR302 - Instalación de plantillas en GNS3
description: Práctica para importar y ejecutar appliances en GNS3 (switch Cisco IOSvL2, Ubuntu Desktop, Firefox TinyCore y WebTerm) dentro de un escenario con NAT.
---

# PR302 - Instalación de plantillas en GNS3

## Objetivos de la práctica

- Preparar un escenario que combine dispositivos de red, máquinas virtuales y contenedores.
- Practicar la importación de plantillas desde discos locales y desde el Marketplace de GNS3.
- Verificar la conectividad y el funcionamiento conjunto de los distintos appliances.
- Documentar el proceso de importación, configuración y pruebas.

## Escenario propuesto

El proyecto final debe incluir los siguientes elementos conectados a través de un switch Cisco IOSvL2:

- Nodo **NAT** para proporcionar salida a Internet.
- **Switch Cisco IOSvL2** importado como appliance.
- Cliente **Ubuntu Desktop** procedente de OSBoxes.
- Appliance **Firefox (Tiny Linux)** ligera para navegación rápida.
- Contenedor **WebTerm** que ofrece un navegador Firefox y terminal dentro de Docker.

Todos los dispositivos deben obtener dirección IP mediante DHCP y deben poder comunicarse entre sí.

!!! Tip "Captura de referencia"
    Se recomienda tomar una captura del diagrama final del escenario una vez que todos los nodos estén en ejecución y conectados al switch.

## Requisitos previos

- GNS3 2.2 (o superior) instalado y configurado con servidor local.
- Acceso a Internet para descargar imágenes y appliances.
- Cuenta en Cisco (opcional) o imagen IOSvL2 disponible desde el entorno docente.
- Cliente de descompresión (7-Zip o similar) para los paquetes de OSBoxes.

## Guía paso a paso

### 1. Crear el proyecto base

1. Abrir GNS3 y crear un proyecto nuevo con un nombre descriptivo (`PR302_Plantillas`, por ejemplo).
2. Seleccionar el servidor local para la ejecución y confirmar que el nodo NAT está disponible.

### 2. Añadir el switch Cisco IOSvL2 desde el Marketplace

1. Ir a **File → Import appliance** o pulsar `Ctrl+Shift+P`.
2. Elegir la opción **Install an appliance from the GNS3 server (recommended)**.
3. Filtrar por la categoría **Switches** y seleccionar **Cisco IOSvL2**.
4. En la pantalla de versiones, comprobar el estado **Found locally** (si la imagen ya está descargada) o seguir el enlace facilitado por el profesorado.
5. Completar el asistente, confirmar la copia de la imagen al directorio de GNS3 y finalizar con **Finish**.

!!! Note "Licencias"
    El uso de imágenes IOS requiere licencia. Para fines docentes se facilita la imagen dentro del aula virtual. No la redistribuyas fuera del ámbito educativo.

### 3. Registrar el cliente Ubuntu Desktop de OSBoxes

1. Acceder a [https://www.osboxes.org/ubuntu/](https://www.osboxes.org/ubuntu/) y descargar la versión 24.04 en formato VDI o VMDK.
2. Descomprimir el archivo descargado con 7-Zip (u otra herramienta compatible).
3. En GNS3, ir a **Edit → Preferences → QEMU → New template**.
4. Introducir un nombre identificativo (por ejemplo, `Ubuntu-Desktop-OSBoxes`), seleccionar QEMU como emulador y asignar al menos 2048 MB de RAM.
5. Elegir la consola VNC y marcar **New image** para seleccionar el disco descargado.
6. Cuando lo solicite, copiar la imagen al directorio `~/GNS3/images/QEMU/` y finalizar el asistente.

### 4. Importar la appliance Firefox (Tiny Linux)

1. Iniciar de nuevo el asistente **Import appliance**.
2. Seleccionar la categoría **Guests** y buscar **Firefox (TinyCore Linux)**.
3. Seguir los pasos del asistente para instalar la plantilla a nivel local.
4. Una vez importada, comprobar que aparece en el panel de dispositivos y que solicita dirección IP por DHCP al iniciarse.

!!! Tip "Persistencia"
    Firefox TinyCore arranca con una configuración mínima. Tras cada reinicio será necesario volver a solicitar IP con `dhcp` en la consola integrada.

### 5. Añadir el contenedor WebTerm

1. Desde el asistente del Marketplace, localizar **WebTerm** en la categoría **Guests**.
2. Instalar la appliance en el servidor local (Docker). El primer despliegue puede tardar mientras se descarga la imagen.
3. Abrir el menú contextual **Edit config** y descomentar las líneas que habilitan DHCP para que el contenedor obtenga IP automáticamente.

### 6. Construir la topología

1. Arrastrar el nodo NAT al lienzo.
2. Añadir el switch Cisco IOSvL2 y conectar el puerto `Gi0/0` al NAT.
3. Incorporar los tres clientes (Ubuntu Desktop, Firefox TinyCore y WebTerm) y unirlos al switch con enlaces Ethernet.
4. Etiquetar los enlaces o añadir notas si se considera necesario para documentar la topología.

### 7. Ejecutar y verificar

1. Iniciar todos los nodos (`Ctrl+I`).
2. Abrir consola en cada dispositivo:

   - En Ubuntu Desktop, iniciar sesión con las credenciales proporcionadas por OSBoxes y verificar la conectividad (`ping 192.168.122.1`).
   - En Firefox TinyCore, solicitar IP con `dhcp` y realizar un `ping` al NAT.
   - En WebTerm, comprobar que el navegador web se abre y que se puede acceder a una página pública.

3. Si algún dispositivo no obtiene IP, revisar la configuración de las tarjetas de red o reiniciar el nodo.

!!! Warning "Recursos del sistema"
    Los nodos con interfaz gráfica consumen más CPU y RAM. Ajusta los recursos de cada plantilla (menú contextual → **Edit → Template**) si el host se queda sin memoria.

### 8. Proyecto en ejecución

1. Una vez confirmada la conectividad, realizar una captura de pantalla del proyecto completo mostrando todos los nodos encendidos.
2. Guardar la captura con un nombre identificativo (`PR302_Escenario.png`) para adjuntarla en la entrega.

## Entrega y evidencias

1. Incluir un cuadro de texto dentro del proyecto con el identificador de la práctica (`PR302`) y las iniciales del grupo.
2. Exportar la topología (`File → Export project`) para generar un paquete portable.
3. Entregar un informe breve que recoja:

   - Pasos realizados para importar cada plantilla.
   - Configuraciones adicionales aplicadas (memoria, CPU, consola, etc.).
   - Pruebas de conectividad ejecutadas (comandos utilizados y resultados).
   - Captura de pantalla del escenario en ejecución.

4. Subir al aula virtual:

   - Archivo exportado del proyecto (`.gns3project`).
   - Captura de la topología en ejecución.
   - Informe en PDF (o Markdown) con las evidencias solicitadas.

!!! note "Consejo final"
    Documentar los problemas encontrados y su resolución ayuda a justificar decisiones durante la evaluación y facilita futuras prácticas que reutilicen estas plantillas.

