# Motivación
Hoy día los cines necesitan tener páginas web para mostrarle lo que ofrecen a su público. Para disponer de estas web necesitan invertir gran cantidad de dinero en un diseño y desarrollo personalizados y algunas web pueden resultar algo pobres, quedar obsoletas o dejar cumplir correctamente su función.
Este problema puede suponer poca clientela para el cine y, por lo tanto, una pérdida económica enorme. Y dependiendo de la arquitectura que tenga debajo será más factible o menos modificar el diseño de la web.

# Descripción
Para solventar este problema se ofrece CineForYou, que es un proyecto que intenta solventar este problema diseñando microservicios que son adaptados a este ámbito. Cada cine podrá usar los microservicios que le convengan y adaptarlos a sus necesidades. Además permite modificar el funcionamiento de una web de una forma sencilla ya sea creando pequeños funcionalidades nuevas o modificando la interfaz que usan estos microservicios.
Se busca una reutilización de las funcionalidades y una completa adaptabilidad del producto final para cada cliente.

#Objetivo
Diseñar la web de gestión de cines orientada a servicios para su posterior reutilización.

#Cliente
Este proyecto va dirigido a un cliente imaginario que nos pedirá una aplicación web para la gestión de su cine. El desarrollo de la web se diseñará para solventar su problema de la mejor forma posible y para poder reutilizar cualquier cosa que se diseñe con futuros clientes con un problema similar.

#Dependencia del proyecto
Este es un proyecto independiente que no depende de ningún otro y que no será incorporado en ningún otro.

#Arquitectura
Se hará un diseño con una arquitectura de microservicios realizandolo los más diferenciados posibles. Se diseñará una API base que irá llamando a los servicios que el cliente desee incorporar en su web.
En este caso hemos supuesto que el cliente deseará:
* Iniciar sesión en el sistema a través de diversas aplicaciones como Google o Facebook.
* Mantener un sistema errores en la aplicación.
* Obtener una estadísticas de la información almacenada.
* Obtener patrones de los clientes.
* Gestión de peliculas.
* Gestión de salas.
* Gestión de reservas online
* Gestión de reservas en taquilla.

Entre otra ventajas al usar los micros servicios se dividirá el proyecto en tareas que podrán ir enseñándole al cliente y podrá integrarse y modificarse cada parte del proyecto.

#Metodología
Para el desarrollo de la aplicación se utilizará una metodología. Se irán desarrollando distintas versiones del software que se irán testeando, mostrando al cliente y desplegando.
La primera versión será una funcional de la aplicación que solamente mostrará al usuario lo más básico posible y poco a poco se le irán incorporando servicios para completarlo de funcionalidad.
Con esta metodología se harán un estudio general de las necesidades del cliente y para cada servicio se irán diseñando sus especificaciones conforme se vayan diseñando.

#Lenguajes
Cómo se combinará metodología ágil y un sistemas basado en servicios, usaremos diversos lenguaje según interese para cada servicio o componente. 
Para las partes que requieran una gran capacidad de cálculo se usará una base de datos NoSQL cómo podría ser MongoDB y un lenguaje apto para estas operaciones como pyhton o R.
Para otros elementos se usará el lenguaje que se considere más optimo para realizar dicha tarea.

#Organización de los hitos
Como se indicó anteriormente se irán desarrollando versiones del proyecto, que no todas tienen un orden secuencial y pueden ser entendidas como mejoras:
Versión inicial: Aplicación básica que mostrará la cartelera del cine y la ubicación del mismo.Para ello, deberán de diseñarse la gestión de películas y las salas que podrían ser componentes independientes que trabaje con la aplicación general y se usará el servicio de mapas para ubicar el cine.
* **Gestión de ventas online:** Para esta versión debería de poderse iniciar sesión con los sistemas de Google y Facebook y diseñar un componente para el alquiler de entradas.
* **Gestión de ventas por taquilla:** Para esta versión se necesario controlar los privilegios de los usuarios para distinguir empleados y crear un componente para gestionar la venta de entradas por taquilla.
* **Gestión de la estadística:** Diseñar un componente que obtenga información de los datos almacenados en las bases de datos.
* **Gestión de patrones de usuario:** A partir de la información de los usuarios, que realizan compras online, obtener un patrón de las preferencias de los mismos.
* **Gestión de errores:** Consiste en diseñar un componente que monitorice los errores que vayan ocurriendo en el sistema para poder solucionarlos lo antes posible.
 
Cómo se indico anteriormente, se utiliza una metodología ágil, por lo tanto, se pueden agregar nuevos componentes según el cliente los vaya requiriendo.


#Razones por los que se ha escogido este proyecto
Este proyecto se ha escogido porque tiene muchos elementos que pueden incorporarse como servicios individuales y al hacerlo podemos darle una gran calidad y flexibilidad al producto.


#Licencia
El software está sujeto a la licencia GNU GPL v3.

