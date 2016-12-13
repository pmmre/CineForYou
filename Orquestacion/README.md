# Orquestación de máquina virtual en AWS
Para realizar la Orquestación se deben introducir las siguientes variables de entorno:
```
export ACCESS_KEY_ID=<access id de aws>
export SECRET_ACCESS_KEY=<secrect access key de aws>
export PRIVATE_KEY_NAME=<Nombre asignado al pem de aws>
export SECURITY_GROUP=<Nombre del grupo de seguridad que desea usarse de aws>
export PRIVATE_KEY_PATH=<Dirección local dónde se encuentra el pem>
```

Una vez introducido lo anterior puede instalarse la máquina virtual y provisionarse ejecutando con el siguiente comando:
`
vagrant up --provider=aws --provision
`

También son importantes los siguientes comandos:
- `vagrant up --provider=aws` para crear una máquina virtual si no está ya creada o para iniciar una máquina.
- `vagrant halt` para apagar la máquina remotamente.
- `vagrant provision` para provisionar la máquina ya creada si tenemos modificaciones en alguna aplicación.
- `vagrant ssh` para realizar un ssh con la máquina inicializada.
- `vagrant destroy` para eliminar una máquina completamente.
