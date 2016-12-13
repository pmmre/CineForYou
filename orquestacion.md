#Orquestación máquina virtual en AWS desde la máquina local

## Preparación de AWS
Para relizar esta parte lo primero es configurar lo necesario amazon.
- Obtener el pem que nos proporciona AWS y guardarlo en nuestra máquina.
- Obtener las ACCESS KEY ID y SECRET ACCESS KEY como se indica en la siguiente imagen:
![Imagen_AWS](http://i393.photobucket.com/albums/pp14/pmmre/CC/Proyecto/Seleccioacuten_071_zps3sor8sau.png)

- Crear un grupo de grupo de seguridad al que asignaremos en la creación abriendo puerto 22 para realizar ssh y el puerto 80 para poder recibir peticiones a sus aplicaciones web por ese puerto:
![Imagen_AWS_2](http://i393.photobucket.com/albums/pp14/pmmre/CC/Proyecto/Seleccioacuten_072_zpsletqcbg1.png)

Una vez obteniedo todo lo necesario configuraremos las siguientes variables de entorno correctamente:
```
export ACCESS_KEY_ID=<access id de aws>
export SECRET_ACCESS_KEY=<secrect access key de aws>
export PRIVATE_KEY_NAME=<Nombre asignado al pem de aws>
export SECURITY_GROUP=<Nombre del grupo de seguridad que desea usarse de aws>
export PRIVATE_KEY_PATH=<Dirección local dónde se encuentra el pem>
```

Y ya tenemos todo configurado en AWS para el buen funcionamiento de cualquier aplicación que provisionemos.

## Preparación de los script de provisionamiento
Para provisionar necesitamos preparar los siguientes tres scripts:

- ansible.cfg que lo necesitaremos para que ansible funciona con vagrant:
```
[ssh_connection]
control_path = %(directory)s/ssh-%%C
```

- Vagrantfile que es donde configuraremos las máquinas a desplegar y el fichero de ansible que usaremos para el provisionamiento, así como, la configuración necesaria para acceder a AWS:
```

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "dummy"
    config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    config.vm.network "public_network"
    config.vm.network "private_network",ip: "192.168.56.10", virtualbox__intnet: "vboxnet0"
    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.define "localhost" do |l|
        l.vm.hostname = "localhost"

	l.vm.provision "ansible" do |ansible|
       		ansible.sudo = true
       		ansible.playbook = "servicios.yml"
        	ansible.verbose = "v"
        	ansible.host_key_checking = false
	end
    end



    config.vm.provider :aws do |aws, override|
        aws.access_key_id = ENV['ACCESS_KEY_ID']
        aws.secret_access_key = ENV['SECRET_ACCESS_KEY']
        aws.keypair_name = ENV['PRIVATE_KEY_NAME']
        aws.ami = "ami-1c4a046f"
        aws.region = "eu-west-1"
        aws.security_groups = ENV['SECURITY_GROUP']
        aws.instance_type = "t2.micro"
        override.ssh.username = "ubuntu"
        override.ssh.private_key_path = ENV['PRIVATE_KEY_PATH']
    end
end
```

- servicios.yml que es un fichero de ansible donde tenemos todos lo que necesitamos provisionar:
```

- hosts: localhost
  become: yes
  remote_user: ubuntu
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

Ya tenemos todo listo para la creación y provisionamiento de cualquier máquina.

## Uso
Una vez introducido lo anterior puede instalarse la máquina virtual y provisionarse ejecutando con el siguiente comando: vagrant up --`provider=aws --provision`

También son importantes los siguientes comandos:

- `vagrant up --provider=aws` para crear una máquina virtual si no está ya creada o para iniciar una máquina.
- `vagrant halt` para apagar la máquina remotamente.
- `vagrant provision` para provisionar la máquina ya creada si tenemos modificaciones en alguna aplicación.
- `vagrant ssh` para realizar un ssh con la máquina inicializada.
- `vagrant destroy` para eliminar una máquina completamente.



