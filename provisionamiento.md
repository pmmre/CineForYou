# Aprovisionamiento de Chef

Para este ejercicio se va a instalar nginx y geany.

En la siguiente imagen vemos la estructura que deben de tener los ficheros de chef.

![ChefDirectorio](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_038_zps9n7ejpzw.png)

Dentro de cookbooks tenemos los distintas instalaciones que podemos hacer. Dentro de default.rb tenemos los paquetes que instalaremos al ejecutar ese cookbooks. En Geany instalamos geany, en nginx instalamos nginx y en CineForYou tenemos todos los paquetes encesarios para la api de cines.

Dentro de los archivos default.rb tenemos los paquetes que instalaremos.
![ChefPaquetes](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_039_zpskgdjopcg.png)

En la siguiente imagen podemos ver las configuraciones de node.json que es dónde se indica las recetas que se ejecutarán y en solo.rb indican dónde se encuentran los archivos de configuración.
![Chef archivos de configuración](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_040_zpsukaaxd3e.png)



# Aprovisionamiento de Ansible
En este ejericio se configurará un archivo para instalar automáticamente todos los paquetes con ansible-playbook. En este caso se usarán los archivos de consiguración de ansibles y un script para ejecutarlo todo automáticamente.
En todos los casos los parámetros indican:
 - $1 indica que obtendremos como parámetro 1 la ip 
 - $2 indica que obtendremos como parámetro 2 el nombre de usuario de la máquina remota 
 - $3 indica que obtendremos como parámetro 3 la llave ruta de la llave pública

Un ejemplo de ejecución sería la siguiente línea:
![Ansible.sh parámetros](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_045_zpsxf5ylgjj.png) 

En el archivo ansible_hosts tenemos lo siguiente:
```
[ubuntu]
$1 ansible_ssh_user=$2 ansible_ssh_private_key_file=$3

```

Los paquetes que vamos a instalar los tenemos en el archivo calificaciones.yml:
```
- hosts: $1
  become: yes
  remote_user: $2
  tasks:
  - name: Actualizar sistema base
    apt: update_cache=yes upgrade=yes
  - name: Instalar paquetes
    apt: name=python-setuptools state=present
  - name: Instalar paquetes2
    apt: name=build-essential state=present
  - name: Instalar paquetes3
    apt: name=python-dev state=present
  - name: Instalar paquetes4
    apt: name=git state=present
  - name: Instalar pip
    action: apt pkg=python-pip
  - name: Obtener aplicacion con git
    git: repo=https://github.com/pmmre/Empresas.git dest=Empresas clone=yes force=yes
  - name: Permisos de ejecucion
    command: chmod -R +x Empresas
  - name: Instalamos dependencias
    command: sudo apt-get install -y libpq-dev python-dev
  - name: Instalamos los requirements
    command: sudo pip install -r Empresas/requirements.txt
  - name: ejecutar
    command: nohup sudo python Empresas/manage.py runserver 0.0.0.0:80
``` 

Y se usará el script ansible.sh para ejecutarlo todo:
```
#!/bin/bash
# ansible.sh

echo "La IP es: $1"
echo "Nombre de usuario: $2"
echo "Archivo .pem: $3"
cp ansible_hosts ansible_hosts2
cp calificaciones.yml calificaciones2.yml

sed -i 's/$1/'$1'/g' ansible_hosts2
sed -i 's/$1/'$1'/g' calificaciones2.yml

sed -i 's/$2/'$2'/g' ansible_hosts2
sed -i 's/$2/'$2'/g' calificaciones2.yml

sed -i 's/$3/'$3'/g' ansible_hosts2


export ANSIBLE_HOSTS=~/ansible_hosts

ansible-playbook calificaciones2.yml

rm ansible_hosts2 calificaciones2.yml
```

Una vez finalizado ya tendremos nuesta api ejecutandose en el servidor:
![Viendo web públicamente](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_044_zpsstbdsdto.png)

