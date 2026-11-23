---
title: PR403 - Configuración de un servidor DNS (Bind9) en AWS
description: Práctica 5.2. Instalación y configuración de un servidor DNS con Bind9 en una instancia Debian en AWS. Zonas directa e inversa, ACL y comprobaciones con nslookup y navegador.
---

# Práctica - PR403: Configuración de un servidor DNS (Bind9) en AWS

## Objetivos

Durante esta práctica aprenderás a instalar y configurar un **servidor DNS** con **Bind9** en una instancia **Debian** en AWS, definir zonas de resolución directa e inversa, y comprobar las consultas desde un cliente.

Al finalizar esta práctica serás capaz de:

- Crear una instancia EC2 con Debian en AWS para el servidor DNS.
- Instalar y configurar Bind9 (named) en la instancia.
- Configurar la zona directa (ej. `deaw.es`) y la zona inversa.
- Definir listas de acceso (ACL) para restringir o permitir consultas.
- Comprobar las resoluciones con `nslookup` y desde el navegador web.

## Requisitos previos

- **Cuenta AWS** (Learner Lab o cuenta personal).
- Instancia **Amazon Linux** o similar con aplicación web (ej. Juicy Shop) para la práctica 5.1, reutilizable.
- Cliente (Windows o Linux) para realizar las consultas DNS.
- Eliminar entradas manuales en `/etc/hosts` del cliente para que la resolución pase por el DNS configurado.

## Resumen de la práctica

1. **Crear instancia EC2 con Debian** y conectarse por SSH.
2. **Instalar Bind9:** `sudo apt update`, `sudo apt-get install bind9 bind9utils bind9-doc`.
3. **Configurar IPv4 solo** en `/etc/default/named`: `OPTIONS="-u bind -4"`.
4. **Configurar `named.conf.options`:**
   - Copia de seguridad: `sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.backup`
   - ACL de hosts confiables (red privada VPC, ej. `172.31.0.0/16`) o `any` para permitir desde cualquier IP.
   - En el bloque `options`: `allow-recursion`, `listen-on port 53`, directorio de caché `/var/cache/bind`.
5. **Configurar `named.conf.local`:** declarar zona directa (ej. `deaw.es`) y zona inversa (ej. `31.172.in-addr.arpa`), indicando la ruta de los archivos de zona.
6. **Crear archivo de zona directa** (ej. `/etc/bind/db.deaw.es`): registros SOA, NS y A (IP privada del DNS y del servidor web).
7. **Crear archivo de zona inversa** (ej. `/etc/bind/db.31.172`): registros para resolución inversa (orden de bytes: 4º y 3º de la IP en el nombre de la zona).
8. **Comprobar configuración:** `named-checkconf`, `named-checkzone` para cada zona, reiniciar: `sudo systemctl restart bind9`.
9. **Security Group:** permitir tráfico entrante en puerto **53 (UDP)** desde la red privada o `0.0.0.0/0` si se aceptan consultas desde el exterior.
10. **Cliente:** configurar el sistema para usar como DNS la IP (privada o pública) del servidor DNS.

## Tarea a realizar (informe)

- Configurar el servidor para que **acepte peticiones desde el exterior** (ej. tu PC) y **resuelva** `juicy.deaw.es` a la **IP pública** del servidor web.
- En `named.conf.options`: ACL `any` y en `options` `allow-recursion { any; };`, `listen-on port 53 { any; };`.
- En el archivo de zona directa: registro A de `juicy.deaw.es` con la **IP pública** de la instancia web.
- Security Group del DNS: regla de entrada **DNS (UDP) puerto 53**, origen `0.0.0.0/0`.
- En tu PC: usar como servidor DNS la **IP pública** de la instancia Debian (DNS).
- **Comprobaciones:** `nslookup juicy.deaw.es <IP_PUBLICA_DNS>` y acceso en navegador a `http://juicy.deaw.es` (y en el Security Group del servidor web permitir HTTP desde cualquier IP si es necesario).

## Entregables

- Documento con capturas de cada configuración (archivos Bind, zonas, Security Groups) y de las comprobaciones (nslookup, navegador, resolución inversa).
- Respuesta breve a las cuestiones finales sobre ACL, consultas recursivas, servidor autoritativo, $ORIGIN, zonas, servidores esclavos, raíz, consultas iterativas y resolución inversa.

## Criterios de evaluación

- Instancia Debian creada y Bind9 instalado correctamente.
- Archivos de configuración (`named.conf.options`, `named.conf.local`) y archivos de zona (directa e inversa) correctos.
- Servidor DNS acepta consultas desde la red configurada (privada o exterior).
- Resolución directa de `juicy.deaw.es` a la IP correspondiente y comprobación desde navegador.
- Resolución inversa verificada.
- Documentación completa con capturas y cuestiones respondidas.
