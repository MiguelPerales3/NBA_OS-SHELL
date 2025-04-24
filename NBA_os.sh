#!/bin/bash
WHITE='\e[97m'
BLUE='\e[34m'
BALL_EMOJI='\U1F3C0'

HISTFILE="$HOME/.myshell_history"
touch "$HISTFILE"

clear
mostrar_ascii() {
echo "                    ...::---==---::...                    "
echo "                ..-==++++++#@#++++++++=-..                "
echo "            ..:-=++++++++++#@#++++++++++++=:..            "
echo "           .-++++++++++++++#@#+++++++++++++*+-............"
echo "        ..=##*+++++++++++++#@#+++++++++++***#%#-.........."
echo "       .:++*#@%*+++++++++++*%#++++++++++**#@%*+*+-........"
echo "     ..-+++++*%@#++++++++++*##+++++++++*#%%*++***+=......."
echo "     .=++++++++#@#+++++++++*##++++++++*##*++*******+:....."
echo "    .=++++++++++#@#++++++++*@#+++++++*##*++*********+....."
echo "   .-++++++++++++#@*+++++++#@#++++++*#%%*+***********-...."
echo "  .:+++++++++++++*%*++++++*#@#++++++*#@%++***********+:..."
echo "  .-++++++++++++++##+++++**#@#++*****#@#+*************=..."
echo " ..++++**********+#%****+++*@%***+++*#@#*############*+:.."
echo " .:%%@@@@@@@@@@@@%##%@@@@@@@@@##%@@@@@@@@@@@@@@@@@@@@%#:.."
echo " .:++++++++++++++*##+++++++#@#++++++*#@#++++++******++*:. "
echo " .:+++++*+++++++*###*+*+***#@#********@%*******#####***:. "
echo " ..++++++++++++**%%*++**+**#@%+******#%@#********#****+:.."
echo "  .=++++***+++**#@%*+***+**#@%********#@%****#######**=..."
echo "  .:++*********#@@*+****+**#@%*********%@%*##########*:..."
echo "   .-++*******#%@#+********#@%*********#%@%##########=...."
echo "    .=+*****##@@#+********##@%******#####%@%########+:...."
echo "     .=+***#%@%***********##@%**#**#######%@@%#####+:....."
echo "     ..=**#@%*+***********#%@%**###########%@@%###+......."
echo "     ...-*%#+*************#%@%*##############%@%#-........"
echo "         .-+**************#%@%*#########%%%%%##=.........."
echo "           .-+********##*##%@%########%%%%%%#=............"
echo "            ..:=+****###*##%@%#######%%%%#+:.............."
echo "            .....:-+**#####%@%#######*+=:.. .............."
echo "                    ...:-========-::...     .............."
echo "                         ....... ....       .............."
}

custom_prompt() {
	echo -ne "${BLUE}$(whoami)@nba_os${BALL_EMOJI}$ ${RESET}"
}	
  
    if [[ "$1" == "install" ]]; then
     # Abrir el archivo HTML con el navegador predeterminado
     echo "Ingrese el nombre del directorio que quiere crear:"
     read dir_name
     mkdir -p "$dir_name" && echo "Directorio '$dir_name' creado con éxito."
  
  fi

  if [[ "$1" == "uninstall" ]]; then
    # Abrir el archivo HTML con el navegador predeterminado
    echo "Ingrese el nombre del directorio que quiere borrar:"
    read dir_name
    rmdir -p "$dir_name" && echo "Directorio '$dir_name' borrado con éxito."
   
  fi


interactive_shell() {
    echo -e "${WHITE}Bienvenido a NBA_OS${RESET}"

    while true; do
        # Mostrar prompt bonito con usuario y directorio actual
        echo -ne "${WHITE}$(whoami)@NBA_OS:${WHITE}$(pwd) ${BLUE}\$ ${RESET}"
        read -r command

        case $command in
            install) install ;;
            uninstall) uninstall ;;
            
	    exit) echo -e "${WHITE}Saliendo...${RESET}"; break ;;
            *) echo -e "${WHITE}Comando no reconocido.${RESET}" ;;
        esac
    done
}

mostrar_ascii
# Mostrar banner
figlet "NBA_OS" | lolcat
# Función para mostrar fecha y hora


# Manejo de salida
exit_shell() {
    echo "Saliendo de NBA_OS..."
    exit 0
}


# Bucle principal de la shell
while true; do
    custom_prompt
    read -r command


# Guardar comando en historial
    echo "$command" >> "$HISTFILE"
 # Comprobamos comandos internos
   case "$command" in
        "exit")
            exit_shell
            ;;
        "history")
            cat "$HISTFILE"
            ;;
        "clear")	
            clear
            ;;
        "install")
            echo "Ingrese el nombre del directorio a crear:"
            read dir_name
            mkdir -p "$dir_name" && echo "Directorio '$dir_name' creado con éxito."
            ;;
    	"uninstall")
                echo "Ingrese el nombre del directorio a borrar:"
                read dir_name
                rmdir -p "$dir_name" && echo "Directorio '$dir_name' eliminado con éxito."
                ;;
        "juego")
		echo "Iniciando juego"
		if command -v bastet >/dev/null 2>&1; then
                	bastet
            	else
                	echo "bastet no está instalado. Instalándolo ahora..."
                	sudo apt install bastet -y && bastet
            	fi
            ;;
	"")
            continue
            ;;

	"ayuda")
		echo "Esta es una shell dedidacada a los amantes y pasionados del baloncesto. Escribe 'exit' para salir."
	    ;;
	*)
		echo "Utilizar comando 'ayuda' para informacion"
	    ;;
   esac
done
