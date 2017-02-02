# Uso del despliegue multiple

Para utlizar este despliegue debemos de descargar el contenido de esta carpeta e introducir nuestra clavs de AWS de la sigueinte manera:
```
export ACCESS_KEY_ID=<access id de aws>
export SECRET_ACCESS_KEY=<secrect access key de aws>
export PRIVATE_KEY_NAME=<Nombre asignado al pem de aws>
export SECURITY_GROUP=<Nombre del grupo de seguridad que desea usarse de aws>
export PRIVATE_KEY_PATH=<Dirección local dónde se encuentra el pem>
```

Una vez realizado, ejecutando simplemente ```vagrant up``` procedemos a desplegar los tres servicios en tres máquinas diferentes.
