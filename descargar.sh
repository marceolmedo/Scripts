#!/bin/bash
#script para descargar vídeo o audio de youtube.com
echo ""
echo "**SCRIPT PARA DESCARGAR VIDEOS O AUDIO CON YOUTUBE-DL**"
echo ""
echo "**MENU DE OPCIONES**"
echo ""

while [ "$OPCION" != 3 ]
do
echo "[1] Descargar Video"
echo "[2] Descargar Audio"
echo "[3] Salir"
read -p "Ingrese:" OPCION

case $OPCION in
1)echo ""
echo "..:: Para Descargar tu Vídeo sigue los siguientes pasos ::.."
echo ""
echo "1.- Ingresar URL"
read URL
#echo "2.- Lista de Formatos Disponibles"
#youtube-dl -F $URL
#echo ""
#echo "3.- Elige el Numero del Formato a Descargar: "
#read num
#cd /home/marcelo/Videos
cd /home/marcelo/Videos
echo ""
echo "..::Descargando Video::.."
echo ""
youtube-dl $URL
break ;;

2)echo ""
echo "Nota: Por default descargara nuestro archivo de audio en formato .mp3 con una calidad de 128K en la carpeta Música"
echo ""
echo "1.- Ingresar URL"
read URL
cd /home/marcelo/Música
echo ""
echo "..::Descargando Audio::.."
youtube-dl –extract-audio –audio-format mp3 –audio-quality 128K $URL
break ;;

3);;
*) echo "Opción ingresada invalida, intente de nuevo";;

esac
done
exit 0
