# ESTE SCRIPT TE DA INFORMACION SOBRE UN "DISPOSITIVO DE BLOQUES"

blockdevs=()
for devName in $(ls -h /sys/block); do
        blockdevs+=($devName)
done

# COMPROBAR SI SE PASARON PARÁMETROS
if [ $# -eq 0 ]; then
        exit 0
fi

# COMPROBAR SI EL NOMBRE DEL DISPOSITIVO INGRESADO EXISTE
if [ $(echo ${blockdevs[*]} | grep $1 | wc -c) -eq 0 ]; then
        exit 0
fi

echo "/TAMAÑO DEL DISPOSITIVO: $(cat /sys/block/$1/size)"
echo "/NOMBRE DEL MODELO DEL DISPOSITIVO: $(cat /sys/block/$1/device/model)"


for ((i=0; i<5; i++)); do
        readspd=$(sudo hdparm -t /dev/$1 | cut -d"=" -f2 | cut -z -c 1-12 --complement)
        echo "/VEL. DE LECTURA DE DISCO: $readspd"
done
