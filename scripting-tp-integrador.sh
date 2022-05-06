#!/bin/bash

clear
echo '.: Menu :.'
echo '1. Ingrese un numero entero, se mostraran los elementos de la sucesion de Fibonacci.'
echo '2. Pedir un numero entero y mostrar por pantalla ese numero en forma invertida.'
echo '3. ingrese una cadena de caracteres para evaluar si es palindromo.'
echo '4. ingrese el path a un archivo de texto, se mostrara la cantidad de lineas que tiene.'
echo '5. ingrese de 5 números enteros, se mostrarán en forma ordenada.'
echo '6. Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene.'
echo '7. Salir.'

echo -e '\nIngrese una opción de menú'
read opcion

case $opcion in
    1)
    echo ".:: Fibonacci ::."
    secuencia=0
    uno=0
    dos=1
    echo -e "Ingrese la cantidad de valores de la succecion de fibonacci que desea conoceer\n"
    read cantidad
    for ((i=0; i<$cantidad; i++))
        do
        echo $uno
        secuencia=$((uno+dos))
        uno=$dos
        dos=$secuencia
    done
    ;;
    
    2)
    echo ".:: Inversión de número ::."
    echo "Ingrese un número"
    read numinv
    echo $numinv | rev 
    ;;
    
    3)
    echo -e '.:: Palindormas ::.'
    echo "Ingrese una cadena"
    read palabra
    i=0
    nopalindroma=0
    largo=${#palabra}
    mitad=$(($largo/2))
    while [ $i -lt $mitad ]
        do
        if [ "${palabra:$i:1}" != "${palabra: -$(($i+1)):1}" ]
            then
            nopalindroma=1
        fi
    i=$(($i+1))
    done
    if [ $nopalindroma -eq 1 ] 
        then
        echo "\"$palabra\" no es Palindroma"
    else
        echo "\"$palabra\" es Palindroma"
    fi
    ;;

    4)
    echo '.:: Lineas de un path ::.'
    echo "Ingrese el path de un archivo de texto"
    read archivotexto
    lineas=$(wc -l $archivotexto )
    IFS=' ' read -ra ADDR <<< "$lineas"
    echo "\"$archivotexto\" tiene \"$ADDR\" lineas."
    ;; 
    
    5)
    echo "ingrese 5 números"
    read n1
    numero[0]=$n1
    read n2
    numero[1]=$n2
    read n3
    numero[2]=$n3
    read n4
    numero[3]=$n4
    read n5
    numero[4]=$n5
    for (( i=0; i<4; i++ ))
        do
        for (( x=$i; x<=4; x++))
            do
            if [ ${numero[$i]} -gt ${numero[$x]} ]
            then
            aux=${numero[$i]}
            numero[$i]=${numero[$x]}
            numero[$x]=$aux
            fi
        done
    done
    echo ${numero[*]}
    ;;

    6)
    echo '.: Cantidad de archivos de un direcctorio ::.'
    echo "Ingrese path de un directorio"
    read pathdir
    cantidadd=$(find "$pathdir" -maxdepth 1 -type d | wc -l)
    echo "\"$pathdir\" tiene \"$cantidadd\" directorios."
    cantidadf=$(find "$pathdir" -maxdepth 1 -type f | wc -l)
    echo "\"$pathdir\" tiene \"$cantidadf\" archivos."
    cantidadl=$(find "$pathdir" -maxdepth 1 -type l | wc -l)
    echo "\"$pathdir\" tiene \"$cantidadl\" enlaces simbolicos."
    cantidadc=$(find "$pathdir" -maxdepth 1 -type c | wc -l)
    echo "\"$pathdir\" tiene \"$cantidadc\" dispositivos de caracteres."
    cantidadb=$(find "$pathdir" -maxdepth 1 -type b | wc -l)
    echo "\"$pathdir\" tiene \"$cantidadb\" dispositivos de bloques."
    ;; 
    
    7)
    echo "Hasta luego $USER";;
    
    *)
    echo 'opcion Incorrecta';; 
esac