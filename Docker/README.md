# Despliegue de un contenedor de dockerhub

Instalamos Docker: `sudo apt-get install docker.io`

Ahora nos descargamos el contenedor de la aplicación: `docker pull pmmre/cineforyou`

Los siguiente es iniciar el servicio: `sudo service docker start`

Y por ultimo ejecutamos el contenedor: `sudo docker run -it pmmre/cineforyou bash`
