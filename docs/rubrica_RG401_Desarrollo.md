---
title: Rúbrica RG401 - Desarrollo iterativo y pruebas
description: Resumen de puntos clave y rúbrica de corrección del reto RG401 (implementación de infraestructura y aplicación web).
---

# RG401 – Desarrollo iterativo y pruebas (Rúbrica de corrección)

**Resultado de Aprendizaje:** RA3  
**Puntuación total:** 30 puntos  
**Trabajo en grupo:** 2–3 personas

---

## 1. Qué se evalúa en el reto

- **Infraestructura y despliegue (RA3)**  
  - Servidor web, base de datos y aplicación desplegados y operativos.  
  - Configuración correcta de red (Docker o VPC/subredes según reto).  
  - Servicios accesibles y comunicados entre sí.

- **Pruebas y verificación**  
  - Evidencia de verificación de conectividad entre servicios.  
  - Comprobación de persistencia de datos (si aplica).  
  - Acceso web funcionando y comprobado.

- **Documentación de desarrollo**  
  - Sección Desarrollo del proyecto con proceso de implementación.  
  - Dificultades encontradas y soluciones aplicadas.  
  - Evidencias (capturas, comandos, diagramas actualizados).

- **Repositorio y código**  
  - Código de configuración en el repositorio (docker-compose.yml, scripts, etc.).  
  - Estructura del proyecto actualizada y coherente con lo documentado.

---

## 2. Entregables que se revisan

1. **Infraestructura funcionando**  
   - Servidor web, base de datos y aplicación desplegados y operativos.  
   - Formato: evidencia mediante capturas o enlace a recurso accesible.

2. **Pruebas realizadas**  
   - Evidencia de verificación de conectividad, persistencia y acceso web.  
   - Formato: capturas o descripción en la documentación del proyecto.

3. **Documentación actualizada**  
   - Sección Desarrollo del proyecto con proceso, dificultades y soluciones.  
   - Formato: Markdown o PDF en el repositorio (GitHub Pages o docs).

4. **Repositorio actualizado**  
   - Código de configuración (docker-compose.yml, scripts) en el repositorio.  
   - Formato: repositorio Git accesible con estructura coherente.

---

## 3. Rúbrica de evaluación (30 puntos)

### 3.1 Resumen por criterio

| Criterio                      | Máx. puntos |
| ----------------------------- | ----------- |
| Infraestructura y despliegue  | 10          |
| Pruebas y verificación       | 6           |
| Documentación de desarrollo   | 8           |
| Repositorio y código          | 6           |
| **Total**                     | **30**      |

### 3.2 Niveles de desempeño por criterio

#### C1. Infraestructura y despliegue (10 puntos)

- **Excelente (10 puntos)**  
  Servidor web, base de datos y aplicación desplegados y operativos; configuración de red (Docker o AWS) correcta y coherente con el diseño; servicios comunicados entre sí; evidencia clara de que todo funciona.
- **Notable (7.5 puntos)**  
  Infraestructura desplegada y operativa con pequeños fallos o mejoras pendientes; configuración de red adecuada; la mayoría de servicios funcionan correctamente.
- **Aprobado (5 puntos)**  
  Infraestructura desplegada pero con carencias (servicios incompletos, configuración incompleta o con errores menores); requiere ajustes para estar plenamente operativa.
- **Insuficiente (0 puntos)**  
  Infraestructura no desplegada, no operativa o con errores graves que impiden el funcionamiento de la aplicación; falta alguno de los componentes clave (servidor web, base de datos o aplicación).

#### C2. Pruebas y verificación (6 puntos)

- **Excelente (6 puntos)**  
  Evidencia completa de verificación de conectividad entre servicios; persistencia comprobada (si aplica); acceso web verificado; capturas o descripción clara de las pruebas realizadas.
- **Notable (4.5 puntos)**  
  Mayoría de pruebas realizadas y documentadas; pequeñas carencias en evidencia (por ejemplo falta comprobación de persistencia o de algún servicio).
- **Aprobado (2 puntos)**  
  Pruebas básicas realizadas (por ejemplo solo acceso web); falta evidencia de conectividad o persistencia; documentación de pruebas superficial.
- **Insuficiente (0 puntos)**  
  No hay evidencia de pruebas realizadas o las pruebas no demuestran que la solución funciona correctamente.

#### C3. Documentación de desarrollo (8 puntos)

- **Excelente (8 puntos)**  
  Sección Desarrollo completa con proceso de implementación bien descrito; dificultades encontradas y soluciones aplicadas claramente explicadas; evidencias (capturas, comandos, diagramas) que apoyan el relato; estructura clara y ordenada.
- **Notable (6 puntos)**  
  Documentación de desarrollo adecuada con proceso y dificultades/soluciones; algunas evidencias; pequeños aspectos mejorables en claridad o completitud.
- **Aprobado (4 puntos)**  
  Sección Desarrollo presente pero poco detallada; proceso descrito de forma genérica; pocas dificultades o soluciones documentadas; evidencias escasas.
- **Insuficiente (0 puntos)**  
  Documentación de desarrollo ausente, muy incompleta o que no permite seguir el proceso realizado; sin evidencias relevantes.

#### C4. Repositorio y código (6 puntos)

- **Excelente (6 puntos)**  
  Repositorio actualizado con código de configuración (docker-compose.yml, scripts, etc.); estructura coherente con la documentación; archivos necesarios presentes y organizados.
- **Notable (4.5 puntos)**  
  Repositorio con la mayor parte del código de configuración; estructura aceptable; pueden faltar algunos scripts o archivos secundarios.
- **Aprobado (2 puntos)**  
  Repositorio con código básico pero incompleto; estructura mejorable; faltan archivos relevantes (por ejemplo docker-compose.yml o equivalentes).
- **Insuficiente (0 puntos)**  
  Repositorio sin código de configuración relevante, desactualizado o con estructura que no se corresponde con lo documentado.

---

## 4. Uso rápido en corrección

1. Comprobar que los entregables están disponibles (infraestructura accesible o evidenciada, documentación en repo, código en repo).  
2. Corregir cada criterio usando los niveles anteriores.  
3. Asignar la puntuación correspondiente en cada criterio (máx. 10, 6, 8 y 6).  
4. Sumar la puntuación total sobre 30.
