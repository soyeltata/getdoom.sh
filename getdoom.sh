echo -e "\e[33mAsegúrate de tener instalados los siguientes paquetes antes de continuar:"
echo -e "  · gcc | make | libghc-opengl-dev | libghc-sdl-dev | doom-wad-shareware\e[0m"
echo ""
sleep 2

echo -e "¿Quiere instalar dichos paquetes ahora usando APT? [\e[32mS\e[0m/\e[31mn\e[0m]"

read choice
if [[ "$choice" != "n" ]] && [[ "$choice" != "N" ]]; then
	echo -e "\e[33mgetdoom\e[0m -- Instalando paquetes necesarios para la compilación"
	apt install gcc make libghc-opengl-dev libghc-sdl-dev doom-wad-shareware
fi

echo ""
echo -e "\e[33mgetdoom\e[0m -- Creando directorio $HOME/doom para la instalación"
sleep 1
mkdir $HOME/doom 

echo -e "\e[33mgetdoom\e[0m -- Obteniendo el código fuente de PrBoom+ v2.5.1.4"
sleep 1
curl -L https://sourceforge.net/projects/prboom-plus/files/prboom-plus/2.5.1.4/prboom-plus-2.5.1.4.tar.gz/download -o /tmp/prboom+.tar.gz
tar -zxvf /tmp/prboom+.tar.gz -C /tmp/

echo -e "\e[33mgetdoom\e[0m -- Compilando el código fuente de PrBoom+ v2.5.1.4"
sleep 1
(cd /tmp/prboom-plus-2.5.1.4/ && ./configure)
(cd /tmp/prboom-plus-2.5.1.4/ && make)

echo -e "\e[33mgetdoom\e[0m -- Dando los retoques finales..."
sleep 1
cp /tmp/prboom-plus-2.5.1.4/src/prboom-plus $HOME/doom/doom

echo -e "\e[32mgetdoom\e[0m -- ¡¡Instalación completada!!"
echo ""

echo -e "\e[33mPara agregar DOOM a la variable \$PATH de su sistema, ejecute el siguiente comando:"
echo -e "  · echo \"export PATH='\$PATH:\$HOME/doom/'\" >> \$HOME/.bashrc && source \$HOME/.bashrc"

sleep 2
