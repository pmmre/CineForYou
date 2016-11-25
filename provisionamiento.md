# Aprovisionamiento de Chef

Chef tiene la siguiente estructura de directorios para su provisionamiento

![ChefDirectorio](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_046_zps96aq6uib.png)

Dentro de cookbooks tenemos los distintas instalaciones que podemos hacer. Dentro de default.rb tenemos los paquetes que instalaremos al ejecutar ese cookbooks. En CineForYou tenemos todos los paquetes necesarios para la api de cines.

Dentro de los archivos default.rb tenemos los paquetes que instalaremos.

![ChefPaquetes](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_047_zpsfy1vhkcx.png)

En la siguiente imagen podemos ver las configuraciones de node.json que es dónde se indica las recetas que se ejecutarán y en solo.rb indican dónde se encuentran los archivos de configuración.
![Chef archivos de configuración](http://i393.photobucket.com/albums/pp14/pmmre/CC/Ejercicios%20Tema%202%20CC/Seleccioacuten_049_zps8faynnhv.png)



# Aprovisionamiento de Ansible
Se configurará un archivo para instalar automáticamente todos los paquetes con ansible-playbook. En este caso se usarán los archivos de consiguración de ansibles y un script para ejecutarlo todo automáticamente.
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

Los paquetes que vamos a instalar los tenemos en el archivo servicios.yml:
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
  - name: Instalar pip
    action: apt pkg=python-pip
  - name: Instalamos dependencias de python
    command: sudo apt-get install -y libpq-dev python-dev
  - name: Instalamos Django
    command: sudo pip install Django
  - name: Instalamos mongoDB server
apt: name=mongodb-server state=present
``` 

Y se usará el script ansible.sh para ejecutarlo todo:
```
#!/bin/bash
# ansible.sh

echo "La IP es: $1"
echo "Nombre de usuario: $2"
echo "Archivo .pem: $3"
cp ansible_hosts ansible_hosts2
cp servicios.yml servicios2.yml

sed -i 's/$1/'$1'/g' ansible_hosts2
sed -i 's/$1/'$1'/g' servicios2.yml

sed -i 's/$2/'$2'/g' ansible_hosts2
sed -i 's/$2/'$2'/g' servicios2.yml

sed -i 's?$3?'$3'?g' ansible_hosts2


export ANSIBLE_HOSTS=ansible_hosts2

ansible-playbook servicios2.yml

rm ansible_hosts2 servicios2.yml
```



