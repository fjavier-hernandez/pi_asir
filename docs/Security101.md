Security 101
Estado de Quest
En curso
0 Puntos
1st Lugar
Detalles
Una Quest que se centra en que los usuarios implementen soluciones de seguridad para prevenir ataques de piratería comunes.
Dificultad: 200 level
Tiempo medio de finalización: 210 minutos
Casos de uso:
Seguridad
Identidad
Cumplimiento de normas
Servicios utilizados:
Amazon VPC
Amazon S3
AWS WAF
Amazon RDS
Amazon EC2
Bienvenido, Nuevas contrataciones
 
Recientemente nuestro CEO salió a la televisión y declaró que aparte de los unicornios, todas las criaturas míticas son farsantes y nunca podrían representar una amenaza para Unicorn.Rentals. Los clientes no estaban encantados con su declaración, y muchos han salido en apoyo de sus otros favoritos como dragones y duendes. Algunos de estos simpatizantes probablemente incluso trabajan para nosotros...
Desde entonces, algunas cosas realmente raras han estado sucediendo en nuestra cuenta. Principalmente, estas tres cosas:
Nuestra base de datos ha estado recibiendo ráfagas repentinas de tráfico de forma errática, y de lugares que no son nuestros servidores web. Esto nunca había pasado antes. ¿Puedes detener estas conexiones?
Alguien sigue eliminando los .css y background image de nuestro cubo S3. ¿Puedes volver a poner estos para que nuestro sitio web se vea bien? Si desea ver el sitio web, vaya a revisar el registro DNS en el Balanceador de carga de aplicaciones (Application Load Balancer).
Estamos recibiendo algunas solicitudes realmente raras a nuestra aplicación (como lo que sea esto: /Users.php?uid=1%20or%201=1). Creemos que este es el resultado de por qué algunos usuarios están reportando cambios extraños en sus cuentas.
Hay un Balanceador de carga de aplicaciones (Application Load Balancer) en tu cuenta, ahí es donde puedes encontrar la página de inicio. También puede realizar consultas al punto final /Users.php?uid= para devolver nombres de diferentes unicornios de nuestra base de datos.
Intente solucionar los problemas que estamos recibiendo SIN QUITAR EL SITIO WEB, POR FAVOR. Tenga en cuenta que quitar la base de datos o impedir que el sitio web se conecte a la base de datos también romperá el sitio web. Por cierto, no necesitará realizar ningún cambio en el código en los servidores web para solucionar estos problemas.
Si puede solucionar nuestros problemas, se le pagará muy bien.
Con puntos que es.
RDS seguro
 
Nuestra base de datos ha estado recibiendo ráfagas repentinas de tráfico de manera errática, y de lugares que no son nuestros servidores web. Esto nunca había pasado antes. ¡Vea si puede rastrear la dirección IP que el hacker está usando para intentar acceder a su base de datos!
Estado del sitio web:
Parece que su sitio web está en servicio y conectado a la base de datos.
Escriba la dirección IP utilizada por el hacker que intenta conectarse a su base de datos
 
Valor actual: <none>
 
Enviar
Seguridad S3
 
Alguien sigue eliminando los archivos `w3.css` y `unicorn.jpg` (background image) del bucket S3 `ctfbucket`. Los objetivos de esta tarea son:

1. **Detener la eliminación de objetos**: Hay 2 formas de realizar esta tarea:
   - Crear una política de bucket que explícitamente deniegue la opción de borrar elementos
   - Eliminar el rol IAM "AccountGuardian" responsable de eliminar estos objetos

2. **Subir los objetos**: Una vez implementada la solución, subir los archivos `unicorn.jpg` y `w3.css` al bucket `ctfbucket`

**Puntos por completar este punto de control: 300 puntos**

Uso de WAFv2 para proteger ALB