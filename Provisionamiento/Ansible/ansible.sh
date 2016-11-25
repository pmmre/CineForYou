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
