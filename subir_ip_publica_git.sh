#!/bin/bash

# Definir el archivo donde se guardará la IP
ARCHIVO="/home/roberto/Escritorio/ip_publica/ip_publica.txt"
CONTENIDO=$(cat $ARCHIVO)


# Obtener la IP pública
IP=$(curl -s https://ifconfig.me)

#Si No ha cambiado detiene el programa
if [ $CONTENIDO -eq $IP ]; then
    exit 0
fi

# Verificar si se obtuvo una IP válida
if [ -n "$IP" ]; then
    echo "$IP" > "$ARCHIVO"
    echo "IP pública guardada en $ARCHIVO"
else
    echo "Error: No se pudo obtener la IP pública."
    exit 1
fi

cd ~/Escritorio/ip_publica
git add .

git commit -m "ip-" #+ $(date '+%Y-%m-%d %H:%M:%S')

git push
