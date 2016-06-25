#!/bin/bash

#---------------------------------------------------
# Criado por: Wolfterro
# Versão: 1.8.0 - Bash
# Data: 07/01/2016
#---------------------------------------------------

#---------------------------------------------------
# Localização do script
#---------------------------------------------------
LOCATION_SCRIPT=$(pwd)

#---------------------------------------------------
# Função Principal: O script
#---------------------------------------------------
youtube_dl_script() {
	#---------------------------------------------------
	# Função de repetição do script
	#---------------------------------------------------
	repeat_script(){
		echo ""
		echo "Deseja realizar outra operação com o script? [S/N]"
		echo "=================================================="
		read REPEAT
		REPEATM="${REPEAT^^}"

		case "$REPEATM" in
			"S")
				clear
				youtube_dl_script
				;;
			"N")
				echo ""
				echo "Saindo..."
				echo ""
				sleep 3
				;;
			*)
				echo ""
				echo "Esta não é uma opção válida! Saindo..."
				echo ""
				sleep 3
		esac
	}
	#---------------------------------------------------

	#---------------------------------------------------
	# Função de caminho alternativo
	#---------------------------------------------------
	alt_path(){
		echo ""
		echo "Por favor, especifique o caminho desejado (Exemplo: /home/user/playlist):"
		echo "========================================================================="
		read ALT_PATH_SAVE
		echo ""
	}
	#---------------------------------------------------

	#---------------------------------------------------
	# Apresentação inicial do script
	#---------------------------------------------------
	echo ""
	echo "Script para Youtube-Dl: Baixar Vídeos e Músicas em Diversos Formatos (1.8.0 - Bash)"
	echo "==================================================================================="
	echo ""
	echo "* Este script requer o Youtube-Dl instalado e configurado para ser reconhecido como comando do shell"
	echo "* O pacote 'libav' deverá estar instalado para converter os arquivos baixados se assim for necessário"
	echo "* Caso não tenha o Youtube-Dl ou o pacote libav instalado, feche este script usando o comando Ctrl + C"
	echo "* Caso queira baixar o Youtube-Dl, visite o seguinte endereço: https://github.com/rg3/youtube-dl"
	echo "* Caso queira baixar o pacote libav, utilize o comando 'sudo apt-get install libav-tools', sem aspas"
	echo "* Utilize os formatos de conversão de vídeo caso o formato nativo escolhido não estiver disponível"
	echo ""
	#---------------------------------------------------

	#---------------------------------------------------
	# Leitura da ID do vídeo desejado
	#---------------------------------------------------
	main_function_get_id(){
		echo "Por favor, digite APENAS a ID do vídeo desejado (Exemplo: https://www.youtube.com/watch?v=ID_DO_VÍDEO):"
		echo "======================================================================================================="
		read ID
		echo ""
	}
	#---------------------------------------------------

	#---------------------------------------------------
	# Função comum para vídeos: caminho
	#---------------------------------------------------
	video_function_path(){
		echo "Qual pasta deseja armazenar o arquivo de vídeo?"
		echo "==============================================="
		echo ""
		echo "(1) Pasta 'home' do usuário atual (padrão)"
		echo "(2) Pasta 'Vídeos' do usuário atual"
		echo "(3) Pasta atual do script"
		echo "(4) Especificar o caminho desejado"
		echo ""
		read LOCATIONV
		#---------------------------------------------------
		if [[ $LOCATIONV -eq 2 ]] ; then
			echo ""
			echo "Verificando a existência da pasta 'Vídeos'..."
			#------------------------------------------------
			if [ -e ~/Vídeos ] ; then
				EXISTV=1
			else
				EXISTV=0
			fi
			#------------------------------------------------
			if [[ $EXISTV -eq 1 ]] ; then
				cd ~/Vídeos
				echo ""
				echo "A pasta 'Vídeos' foi selecionada!"
				echo ""
			else
				echo ""
				echo "A pasta 'Vídeos' não existe! Deseja criá-la? [S/N]"
				echo "=================================================="
				read CREATEV
				CREATEVM="${CREATEV^^}"
				#---------------------------------------------
				case "$CREATEVM" in
				"S")
					mkdir ~/Vídeos
					cd ~/Vídeos
					echo ""
					echo "A pasta 'Vídeos' foi criada e selecionada!"
					echo ""
					;;
				"N")
					cd $LOCATION_SCRIPT
					echo ""
					echo "Neste caso, a pasta atual do script será selecionada!"
					echo ""
					;;
				*)
					cd $LOCATION_SCRIPT
					echo ""
					echo "Neste caso, a pasta atual do script será selecionada!"
					echo ""
					;;
				esac
				#----------------------------------------------
			#--------------------------------------------------
			fi
		elif [[ $LOCATIONV -eq 3 ]] ; then
			cd $LOCATION_SCRIPT
			echo ""
			echo "A pasta atual do script foi selecionada!"
			echo ""
		elif [[ $LOCATIONV -eq 4 ]] ; then
			alt_path
			echo "Verificando a existência do caminho '"$ALT_PATH_SAVE"' ..."
			
			if [ -e $ALT_PATH_SAVE ] ; then
				cd $ALT_PATH_SAVE
				echo ""
				echo "O caminho '"$ALT_PATH_SAVE"' foi selecionado!"
				echo ""
			else
				echo ""
				echo "O caminho especificado não existe! A pasta 'home' do usuário atual será selecionada!"
				cd ~/
				echo ""
			fi
		else
			cd ~/
			echo ""
			echo "A pasta 'home' do usuário atual foi selecionada!"
			echo ""
		fi
	}
	#---------------------------------------------------

	#---------------------------------------------------
	# Função comum para músicas: caminho
	#---------------------------------------------------
	audio_function_path(){
		echo "Qual pasta deseja armazenar o arquivo de áudio?"
		echo "==============================================="
		echo ""
		echo "(1) Pasta 'home' do usuário atual (padrão)"
		echo "(2) Pasta 'Música' do usuário atual"
		echo "(3) Pasta atual do script"
		echo "(4) Especificar o caminho desejado"
		echo ""
		read LOCATIONM
		#---------------------------------------------------
		if [[ $LOCATIONM -eq 2 ]]; then
			echo ""
			echo "Verificando a existência da pasta 'Música'..."
			#------------------------------------------------
			if [ -e ~/Música ] ; then
				EXISTM=1
			else
				EXISTM=0
			fi
			#------------------------------------------------
			if [[ $EXISTM -eq 1 ]]; then
				cd ~/Música
				echo ""
				echo "A pasta 'Música' foi selecionada!"
				echo ""
			else
				echo ""
				echo "A pasta 'Música' não existe! Deseja criá-la? [S/N]"
				echo "=================================================="
				read CREATEM
				CREATEMM="${CREATEM^^}"
				#---------------------------------------------
				case "$CREATEMM" in
				"S")
					mkdir ~/Música
					cd ~/Música
					echo ""
					echo "A pasta 'Música' foi criada e selecionada!"
					echo ""
					;;
				"N")
					cd $LOCATION_SCRIPT
					echo ""
					echo "Neste caso, a pasta atual do script será selecionada!"
					echo ""
					;;
				*)
					cd $LOCATION_SCRIPT
					echo ""
					echo "Neste caso, a pasta atual do script será selecionada!"
					echo ""
					;;
				esac
				#----------------------------------------------
			#--------------------------------------------------
			fi
		elif [[ $LOCATIONM -eq 3 ]] ; then
			cd $LOCATION_SCRIPT
			echo ""
			echo "A pasta atual do script foi selecionada!"
			echo ""
		elif [[ $LOCATIONM -eq 4 ]] ; then
			alt_path
			echo "Verificando a existência do caminho '"$ALT_PATH_SAVE"' ..."
			
			if [ -e $ALT_PATH_SAVE ] ; then
				cd $ALT_PATH_SAVE
				echo ""
				echo "O caminho '"$ALT_PATH_SAVE"' foi selecionado!"
				echo ""
			else
				echo ""
				echo "O caminho especificado não existe! A pasta 'home' do usuário atual será selecionada!"
				cd ~/
				echo ""
			fi
		else
			cd ~/
			echo ""
			echo "A pasta 'home' do usuário atual foi selecionada!"
			echo ""
		fi
	}
	#---------------------------------------------------
		

	#---------------------------------------------------
	# Função principal para o download de vídeos (nativos)
	#---------------------------------------------------
	video_function_default_mp4(){
		#---------------------------------------------------
		youtube-dl --format mp4 https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	video_function_mkv(){
		#---------------------------------------------------
		youtube-dl --format mkv https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	video_function_webm(){
		#---------------------------------------------------
		youtube-dl --format webm https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	video_function_avi(){
		#---------------------------------------------------
		youtube-dl --format avi https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	#-----------------------------------------------------------

	#---------------------------------------------------
	# Função principal para o download de vídeos (conversão)
	#---------------------------------------------------
	video_function_default_mp4_conversion(){
		#---------------------------------------------------
		youtube-dl --recode-video mp4 https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	video_function_mkv_conversion(){
		#---------------------------------------------------
		youtube-dl --recode-video mkv https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	video_function_webm_conversion(){
		#---------------------------------------------------
		youtube-dl --recode-video webm https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	video_function_avi_conversion(){
		#---------------------------------------------------
		youtube-dl --recode-video avi https://www.youtube.com/watch?v=$ID
		#---------------------------------------------------
		sleep 5
	}
	#-----------------------------------------------------------

	#-----------------------------------------------------------
	# Função principal para o download de músicas
	#-----------------------------------------------------------
	audio_function_default_mp3(){
		#----------------------------------------------------
		youtube-dl --extract-audio --prefer-avconv --audio-format mp3 https://www.youtube.com/watch?v=$ID
		#----------------------------------------------------
		sleep 5
	}
	audio_function_wav(){
		#----------------------------------------------------
		youtube-dl --extract-audio --prefer-avconv --audio-format wav https://www.youtube.com/watch?v=$ID
		#----------------------------------------------------
		sleep 5
	}
	#------------------------------------------------------------

	#------------------------------------------------------------
	# Funções opcionais do script
	#------------------------------------------------------------
	option_function_update(){
		youtube-dl --update
		sleep 5
	}
	#------------------------------------------------------------
	option_function_install(){
		cd ~/

		echo "Baixando youtube-dl usando 'wget'..."
		echo ""
		wget -O youtube-dl 'https://yt-dl.org/downloads/latest/youtube-dl'
		echo "Aplicando permissões de execução..."
		echo ""
		chmod a+rx youtube-dl
		echo "Movendo para a pasta '/usr/bin'..."
		echo ""

		if [[ $EUID -ne 0 ]]; then
			echo "É necessário privilégios de root para mover o arquivo para a pasta selecionada!"
			echo "Deseja utilizar o comando 'sudo' para mover 'youtube-dl' para '/usr/bin'? [S/N]"
			read MOVEFILE
			MOVEFILEM="${MOVEFILE^^}"

			case "$MOVEFILEM" in
				"S")
					sudo mv youtube-dl /usr/bin
					echo ""
					echo "Youtube-Dl está instalado!"
					sleep 5
					;;
				*)
					echo ""
					echo "O arquivo não pôde ser movido por falta de permissão! Saindo da Instalação..."
					rm youtube-dl
					sleep 5
					;;
				esac
		else
			mv youtube-dl /usr/bin
			echo ""
			echo "Youtube-Dl está instalado!"
			sleep 5
		fi
	}
	#------------------------------------------------------------
	option_conversion_formats(){
		echo "Qual formato deseja que o vídeo seja convertido?"
		echo "================================================"
		echo ""
		echo "Formatos de vídeo (conversão):"
		echo "(1) Arquivo de vídeo em formato .MP4"
		echo "(2) Arquivo de vídeo em formato .MKV"
		echo "(3) Arquivo de vídeo em formato .WEBM"
		echo "(4) Arquivo de vídeo em formato .AVI"
		echo ""
		read ESCOLHACONVERSAO
		echo ""
		if [[ $ESCOLHACONVERSAO -eq 1 ]]; then
			main_function_get_id
			video_function_path
			video_function_default_mp4_conversion
		elif [[ $ESCOLHACONVERSAO -eq 2 ]]; then
			main_function_get_id
			video_function_path
			video_function_mkv_conversion
		elif [[ $ESCOLHACONVERSAO -eq 3 ]]; then
			main_function_get_id
			video_function_path
			video_function_webm_conversion
		elif [[ $ESCOLHACONVERSAO -eq 4 ]]; then
			main_function_get_id
			video_function_path
			video_function_avi_conversion
		else
			echo "Esta não é uma opção válida!"
			echo ""
			sleep 5
		fi
	}
	#------------------------------------------------------------

	#------------------------------------------------------------
	# Opções para o salvamento do vídeo selecionado
	#------------------------------------------------------------
	echo "Como deseja salvar o vídeo?"
	echo "==========================="
	echo ""
	echo "Instalação:"
	echo "(0) Instalar Youtube-Dl"
	echo ""
	echo "Formatos de vídeo (nativos):"
	echo "(1) Arquivo de vídeo em formato .MP4"
	echo "(2) Arquivo de vídeo em formato .MKV"
	echo "(3) Arquivo de vídeo em formato .WEBM"
	echo "(4) Arquivo de vídeo em formato .AVI"
	echo ""
	echo "Formatos de áudio:"
	echo "(5) Arquivo de música em formato .MP3"
	echo "(6) Arquivo de música em formato .WAV"
	echo ""
	echo "Opções do script:"
	echo "(7) Formatos de Conversão de Vídeo"
	echo "(8) Atualizar Youtube-Dl"
	echo "(9) Sair do Youtube-Dl Script"
	echo ""
	read ESCOLHA
	echo ""
	if [[ $ESCOLHA -eq 0 ]]; then
		option_function_install
		repeat_script
	elif [[ $ESCOLHA -eq 1 ]]; then
		main_function_get_id
		video_function_path
		video_function_default_mp4
		repeat_script
	elif [[ $ESCOLHA -eq 2 ]]; then
		main_function_get_id
		video_function_path
		video_function_mkv
		repeat_script
	elif [[ $ESCOLHA -eq 3 ]]; then
		main_function_get_id
		video_function_path
		video_function_webm
		repeat_script
	elif [[ $ESCOLHA -eq 4 ]]; then
		main_function_get_id
		video_function_path
		video_function_avi
		repeat_script
	elif [[ $ESCOLHA -eq 5 ]]; then
		main_function_get_id
		audio_function_path
		audio_function_default_mp3
		repeat_script
	elif [[ $ESCOLHA -eq 6 ]]; then
		main_function_get_id
		audio_function_path
		audio_function_wav
		repeat_script
	elif [[ $ESCOLHA -eq 7 ]]; then
		option_conversion_formats
		repeat_script
	elif [[ $ESCOLHA -eq 8 ]]; then
		option_function_update
		repeat_script
	elif [[ $ESCOLHA -eq 9 ]]; then
		echo "Saindo..."
		echo ""
		sleep 3
	else
		echo "Esta não é uma opção válida!"
		echo ""
		sleep 5
		repeat_script
	fi
}
#---------------------------------------------------
youtube_dl_script