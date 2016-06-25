#!/bin/bash 


# Especifica el directorio de Dropbox (modificar por directorio que se quiera) 
Back=/home/marcelo/BackConfig/manjaro/

# Funcion para lanzar el menu nuevamente ante tarea completada u opcion incorrecta 
function menu { 
sh ~/Scripts/menu.sh 
} 


# Funcion para copiar todos los archivos de configuracion necesarios a la carpeta de Dropbox 
# Eliminar las lineas que sean de archivos que no se tengan o no se quiera resguardar
function copiar { 
cp ~/.conkyrc2 $Back/conkyrc2.backup 
#cp /etc/hosts $DROPBOX/hosts.backup 
cp /etc/pacman.conf $Back/pacman.conf.backup 
cp /etc/pacman.d/mirrorlist $Back/mirrorlist.backup 
cp /etc/rc.conf $Back/rc.conf.backup 
#cp /etc/resolv.conf $DROPBOX/resolv.conf.backup 
#cp /etc/resolv.conf.head $DROPBOX/resolv.conf.head.backup 
cp ~/.xinitrc $Back/xinitrc.backup 
cp /etc/X11/xorg.conf $Back/xorg.conf.backup 
cp /etc/yaourtrc $Back/yaourtrc.backup 
#cp ~/.gtkrc.mine $DROPBOX/gtkrc.mine.backup 
cp ~/.gtkrc-2.0 $Back/gtkrc-2.0.backup 
#cp ~/.Xdefaults $DROPBOX/Xdefaults.backup 
#cp ~/.stalonetrayrc $DROPBOX/stalonetrayrc.backup 
cp ~/.bashrc $Back/bashrc.backup 
cp /etc/ntp.conf $Back/ntp.conf.backup 
cp ~/.config/openbox/menu.xml $Back/openbox/menu.xml.backup 
cp ~/.config/openbox/rc.xml $Back/openbox/rc.xml.backup 
cp ~/.config/openbox/autostart $Back/openbox/autostart.backup 
cp /etc/fstab $Back/fstab.backup 
cp ~/menu.sh $Back/menu.sh.backup 
} 


# Funcion para realizar los pasos necesarios en mantenimiento completo 
function mantener { 
sudo pacman -Syu 
yaourt -Syu --aur 
#sudo pacman -Sc 
#sudo pacman -Scc 
sudo pacman -Rsn $(pacman -Qdtq) 
yaourt -Rsn $(yaourt -Qdtq) 
sudo pacman-optimize 
sudo prelink -amR 
# rankmirrors -n 7 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist 
copiar 
pacman -Qe > $Back/Paquetes 
} 

echo "" 
echo "" 
echo "Qué desea hacer?" 
echo "" 
echo "1) Mantenimiento del sistema" 
echo "2) Edición de archivos de configuración" 
echo "3) Salir" 
read opciona 
if test $opciona -eq 1 
    then     
    echo "" 
    echo "Seleccione una opción" 
    echo ""     
    echo "1) Mantenimiento completo" 
    echo "2) Sólo actualización del sistema" 
    echo "3) Limpieza de cache" 
    echo "4) Limpieza de huérfanos" 
    echo "5) Optimizar pacman" 
    echo "6) Hacer prelink" 
    echo "7) Copiar archivos de configuración" 
    echo "8) Generar lista de paquetes instalados" 
    echo "9) Volver al menú principal" 
    read opcionb 
        case $opcionb in     
            1) 
            mantener 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            2)         
            sudo pacman -Syu && yaourt -Syu --aur 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            3) 
            sudo pacman -Sc && sudo pacman -Scc 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            4) 
            sudo pacman -Rsn $(pacman -Qdtq) && yaourt -Rsn $(yaourt -Qdtq) 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            5) 
            sudo pacman-optimize 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            6) 
            sudo prelink -amR 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            7) 
            copiar 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            8) 
            pacman -Qe > $Back/Paquetes 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            9) 
            echo "" 
            menu 
            ;; 
            *) 
            echo "****************" 
            echo "Opción no válida" 
            echo "****************" 
            echo "" 
            menu 
            ;; 
        esac 
fi 
if test $opciona -eq 2 
    then     
    echo "" 
    echo "Seleccione un archivo a modificar" 
    echo ""         
    echo "1) Rc.conf" 
    echo "2) Fstab" 
    echo "3) Bashrc" 
    echo "4) Xinitrc" 
    echo "5) Xorg.conf" 
    echo "6) Conky" 
    echo "7) Menu Openbox" 
    echo "8) Configuración Openbox" 
    echo "9) Autostart Openbox" 
    echo "10) Pacman mirrorlist" 
    echo "11) Pacman.conf" 
    echo "12) Volver al menú principal" 
    read opcionc 
        case $opcionc in 
            1) 
            sudo geany /etc/rc.conf 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            2) 
            sudo geany /etc/fstab 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            3) 
            geany ~/.bashrc 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            4) 
            geany ~/.xinitrc 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            5) 
            sudo geany /etc/X11/xorg.conf 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            6) 
            geany ~/.conkyrc2 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            7) 
            geany ~/.config/openbox/menu.xml 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            8) 
            geany ~/.config/openbox/rc.xml 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            9) 
            geany ~/.config/openbox/autostart 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            10) 
            sudo geany /etc/pacman.d/mirrorlist 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            11) 
            sudo geany /etc/pacman.conf 
            echo "****************" 
            echo "Tarea finalizada" 
            echo "****************" 
            menu 
            ;; 
            12) 
            echo "" 
            menu 
            ;; 
            *) 
            echo "****************" 
            echo "Opción no válida" 
            echo "****************" 
            menu 
         esac         
fi 
    if test $opciona -eq 3
    then 
    exit 
    else 
    exit 
fi
