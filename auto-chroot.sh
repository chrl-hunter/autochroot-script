#!/bin/bash

echo "Este script automatiza el chroot para un sistema linux"
sleep 3
lsblk -o NAME,TYPE,FSTYPE,LABEL,SIZE,UUID,MOUNTPOINTS


# Funcion para seleccionar la particion
seleccionar_particion() {
    read -p "Input NAME (sdX, nvme0...): " NAMEPART_INPUT
}


# Valida y normaliza la entrada del usuario
# Si la entrada no existe, regresamos a la función de selección
validar_particion(){
     # Esta parte normaliza
    NAMEPART_CLEAN="${NAMEPART_INPUT#/dev/}"
    
     # Esta parte valida
     # Dice chatgpt que para dispositivos de bloque es mejor usar el doble [[ ]]
    if [[ -b "/dev/$NAMEPART_CLEAN" ]]; then
        RUTA_OBJETIVO="/dev/$NAMEPART_CLEAN"
        echo "Exitoso"
        return 0
    else 
        echo "No existe /dev/$NAMEPART_CLEAN"
        return 1
    fi
}


# Montar el dispositivo

montaje() {
    mount /dev/$
}

# Esto no se como hacerlo
flujo_principal() {
    seleccionar_particion()
    validar_particion()
     # Aquí va un bucle para que regrese a selecciona una partición si no la encuentra
     
}