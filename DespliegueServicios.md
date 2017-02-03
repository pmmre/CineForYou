# Despliegue de los servicios paso a paso.

## Paso 1. Creación de los contenedores

Se han creado los siguientes contenedores.


### Contenedor principal

El contenedor principal que es el que se usará para realizar la aplicación principal que será a la que accede el cliente.
Será diseñado en Django y en el se creará una pequeña base de datos en squlite (integrado en Django) en la que se tendrá la información de la cartelera replicada (almacenada más información en el servidor de base de datos). Lo que conseguiremos es que aunque los otros dos servidores esten fuera de servicio al menos el cliente pueda ver algo de información útil. 

Esta aplicación inicial podrá realizar inicio de sesión conectandose al servidor de base de datos para corroborrar los datos o realizando mediante Oauth2.0 conexión con [facebook](https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow/) o con [Google](https://developers.google.com/api-client-library/javascript/features/authentication), guardando siempre la información del usuario para su posterior estudio.

Esta página se dotará de la herramienta [Google Analystics](https://developers.google.com/analytics/devguides/config/?csw=1) para realizar un seguimiento de los patrones de los usuarios dentro de nuestra web que será almacenado en el servidor de minería de datos.

Además, la aplicación que se desplegará en este contenedor estará almacenada en un github y se le pasarán los test de de travis antes de su despligue.

Para el desarrollo del contenctor se ha seleccionado ubuntu14.04 y se ha instalado todo lo encesario para el uso de Django. Podemos acceder
al dockerhub donde esta almacenado el servicio pulsando [aquí](https://hub.docker.com/r/pmmre/cineforyou-principal/).

### Contenedor de gestión de los datos.

En este contenedor almacenaremos la base de datos en la que tendremos almacenadas toda la gestión de peliculas, salas, usuarios y transacciones económicas. Recibirá peticiones del servidor principal y, en momentos del dia en los que haya poco tráfico, enviará la infomación nueva al servidor de base de datos.

Este contenedor ha sido desarrollado sobre ubuntu14.04 y se ha instalado una base de datos PostgresSQL. Podemos acceder al dockerhub donde esta almacenado el servicio pulsando [aquí](https://hub.docker.com/r/pmmre/cineforyou-gestion/).

### Contenedor dedicado a la mineria de datos.

Este servidor recibe información de los otros dos servidores y en él se realizan todas las funciones de minería de datos. Con esto datos podremos predecir lo gustos los usuarios, las peliculas que darán mas dinero, los mejores horarios para las sesiones o cualquier dato que proporcione una ganancia económica.

Este servidor se ha desarrollado un docker en el que se tiene preinstalado Rstudio  y en el se ha instalado mongodb. Podemos acceder al dockerhub donde esta almacenado el servicio pulsando [aquí](https://hub.docker.com/r/pmmre/cineforyou-mineria/). Y podemos acceder aquí para ver el docker con la presintalación de Rstudio utilizado [aquí](https://hub.docker.com/r/rocker/rstudio/).


## Paso 2. Configuración de los ficheros de ansible.

Para la realización de los ficheros de ansible se ha realizado la misma instalción en los tres ficheros. El cambio consiste en el contenedor que descarga para su utlización. Se ha realizo una actualización del sistema, la instalación de docker, la descarga del correspondiente contenedor y su ejecución.

Podemos acceder a los distintos archivo de configuración en [principalPlaybook](https://github.com/pmmre/CineForYou/blob/master/DespliegueServicios/principalPlaybook.yml), [gestiónPlaybook](https://github.com/pmmre/CineForYou/blob/master/DespliegueServicios/gestionPlaybook.yml) y [mineríaPlaybook](https://github.com/pmmre/CineForYou/blob/master/DespliegueServicios/mineriaPlaybook.yml).

### Paso 3. Creación de las tres máquinas con vagrant y provisonamiento con ansible.

En este apartado se ha condifurado Vagrantfile para crear tres máquinas virtuales diferentes en AWS y sobre cada una de ellas provisionar con los playbook anteriormente mencionados. Para su visualización podemos acceder [aquí](https://github.com/pmmre/CineForYou/blob/master/DespliegueServicios/Vagrantfile).


# Servicios externos.

## Copia de seguridad de la base de datos.

Se usará mLab para tener una base de datos mongo extra dónde almacenar la información perodicamente y en caso de catástrofe utilizarla como compia de seguridad.

![Imagen_mLab](http://i393.photobucket.com/albums/pp14/pmmre/CC/Proyecto/FINAL/Seleccioacuten_006_zpsx8u6rww7.png)

## Sistema de logs.

Para esta sistema se ha selecionado Amazon CloudWatch que ya tenemos asociado a nuestra cuenta de AWS y con él podemos monitorizar el 276 métricas de nuetros servidores.



![Imagen_Amazon_CloudWatch](http://i393.photobucket.com/albums/pp14/pmmre/CC/Proyecto/FINAL/Seleccioacuten_007_zpszdlik6md.png)
