---
layout: index
---

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
* Gestión de entradas.
Entre otra ventajas al usar los micros servicios se dividirá el proyecto en tareas que podrán ir enseñándole al cliente y podrá integrarse y modificarse cada parte del proyecto.
