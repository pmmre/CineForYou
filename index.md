---
layout: index
---

# Motivación
Hoy día los cines necesitan tener páginas web para mostrarle lo que ofrecen a su público. Para disponer de estas web necesitan invertir gran cantidad de dinero en un diseño y desarrollo personalizados, lo que supone un gran esfuerzo para las empresas. Además estas webs pueden resultar algo pobres, quedar obsoletas o dejar de cumplir correctamente su función.
Este problema puede suponer poca clientela para el cine y, por lo tanto, una pérdida económica enorme. Y dependiendo de la arquitectura que tenga debajo será más factible o menos modificar el diseño de la web.

# Descripción
Para solventar este problema se ofrece CineForYou, que es un proyecto que intenta solventar este problema diseñando microservicios que son adaptados a este ámbito. Cada cine podrá usar los microservicios que le convengan y adaptarlos a sus necesidades. Además permite modificar el funcionamiento de una web de una forma sencilla ya sea creando pequeños funcionalidades nuevas o modificando la interfaz que usan estos microservicios.
Se busca una reutilización de las funcionalidades y una completa adaptabilidad del producto final para cada cliente.

#Razones por los que se ha escogido este proyecto
Este proyecto se ha escogido porque tiene muchos elementos que pueden incorporarse como servicios individuales y al hacerlo podemos darle una gran calidad y flexibilidad al producto.

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
* Gestión de venta online.
* Gestión de venta en taquilla.

Entre otra ventajas al usar los micros servicios se dividirá el proyecto en tareas que podrán ir enseñándole al cliente y podrá integrarse y modificarse cada parte del proyecto.

#Microservicios
Para realizar las acciones que desea realizar el cliente de una forma independiente y más robusto se realizarán los siguientes servicios:

##Iniciar sesión en el sistema a través de diversas aplicaciones como Google o Facebook
Este servicio se encargará de gestionar el inicio de sesión de los usuario y de la creación de nuevos usuarios dentro del sistema. Aquí se obtendrá información básica del usuario.
##Mantener un sistema errores en la aplicación
Este servicio se encargará de mantener un sistema de errores de todos los componentes del sistema. Para ello, almacenará la información del error junto con el servicio que lo provocó en un fichero en bruto.
##Obtener una estadísticas de la información almacenada
Este servicio mostrará diversas estadísticas de los usuarios. Para ello, almacenará determinada información obtenida del resto de base de datos que pueda ser mostrada en forma de gráficas.

##Obtener patrones de los clientes
Este microservicio se encargara de obtener un conocimiento sobre los clientes aplicando técnicas de minería de datos usando python y mongodb.

##Gestión de peliculas
Este servicio se encargará de tener las información de las películas del cine con su descripción, imagenes y trailer. Esta base de datos que usaremos será una base de datos relacional que toda la información que almacenemos tendra una misma estructura.
##Gestión de salas
Este servicio se encargará de una gestión de salas dónde se indicará el tamaño y el aforo de estas salas.
##Gestión de venta online
Este servicio se encargará de la venta de entradas online y sólo podrá ser accedido por el personal del cine. Una vez vendida la entrada accederá a la gestión de salas para indicar que la entrada ha sido vendida para un día determinado.

##Gestión de venta en taquilla
Este servicio se encargará de la venta de entradas por taquilla y sólo podrá ser accedido por el personal del cine. Una vez vendida la entrada accederá a la gestión de salas para indicar que la entrada ha sido vendida para un día determinado.



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
* **Versión inicial:** Aplicación básica que mostrará la cartelera del cine y la ubicación del mismo.Para ello, deberán de diseñarse la gestión de películas y las salas que podrían ser componentes independientes que trabaje con la aplicación general y se usará el servicio de mapas para ubicar el cine.
* **Gestión de ventas online:** Para esta versión debería de poderse iniciar sesión con los sistemas de Google y Facebook y diseñar un componente para el alquiler de entradas.
* **Gestión de ventas por taquilla:** Para esta versión se necesario controlar los privilegios de los usuarios para distinguir empleados y crear un componente para gestionar la venta de entradas por taquilla.
* **Gestión de la estadística:** Diseñar un componente que obtenga información de los datos almacenados en las bases de datos.
* **Gestión de patrones de usuario:** A partir de la información de los usuarios, que realizan compras online, obtener un patrón de las preferencias de los mismos.
* **Gestión de errores:** Consiste en diseñar un componente que monitorice los errores que vayan ocurriendo en el sistema para poder solucionarlos lo antes posible.
 
Cómo se indico anteriormente, se utiliza una metodología ágil, por lo tanto, se pueden agregar nuevos componentes según el cliente los vaya requiriendo.

# Provisionamiento
Para el provisionamiento se usará Chef y Ansible.

## Chef
Se ha elegido esta herramienta porque es muy utilizada en las empresa y debe de utilizarse en la máquina remota. En el siguiente enlace tenemos un tutorial sobre el uso de chef: [tutorial](https://github.com/pmmre/CineForYou/tree/master/Provisionamiento/Chef)

## Ansible
Esta herramienta es muy cómoda ya que se puede usar remotamente y se puede ejecutar con una orden para todas las máquinas que queramos. En el siguiente enlace tenemos un tutorial sobre el uso de chef: [tutorial](https://github.com/pmmre/CineForYou/tree/master/Provisionamiento/Ansible)

# Orquestación de las máquinas virtuales
Para la orquestación se ha utilizado vagrant para realizar la creación de máquinas virtuales y ansible dónde hemos configurado todos los paquetes necesarios para su utilización. En el siguiente enlace tenemos un tutorial sobre el uso de chef: [tutorial](https://github.com/pmmre/CineForYou/tree/master/Orquestacion)

# Dockerhub
Puede ejecutarse el proyecto utilizando un contenedor de Docker almacenado en Dockerhub. Podemos ver un tutorial para ejecutarlo en el siguiente enlace [Docker](https://github.com/pmmre/CineForYou/tree/master/Docker)

# Despliegue Final
Se ha realizado un despliegue de la aplicación en varios servicios independientes que se comunican entre si:
- Despligue de la aplicación principal que enlazará con el servicio de base de datos.
- Despliegue del servidor de base de datos que controlará la gestión de usuarios, de peliculas, salas, y ventas.
- Despliegue de un servidor dónde se almacenará todos los datos del servidor de base de datos, añadiendole datos obtenidos por seguimiento de patrones de usuario. Este servidor será dotado de herramientas aptas para la minería de datos.
- Inicio de sesión externo.
- Sistema de loggin.
- Base de datos mongo para replica de la información importante.

En el despligue de los servicios principales se ha utilizan contenedores docker previamente creado y se desplegaran con ansible desde vagrant.

Para acceder a un tutorial del despliegue acceda al siguiente enlace [DespliegueServicios](https://github.com/pmmre/CineForYou/tree/master/DespliegueServicios)

Para acceder a información extra acceda al siguiente enlace [DespliegueDeServiciosInfo](https://github.com/pmmre/CineForYou/tree/gh-pages/DespliegueServicios.md)

#Licencia
El software está sujeto a la licencia GNU GPL v3.

