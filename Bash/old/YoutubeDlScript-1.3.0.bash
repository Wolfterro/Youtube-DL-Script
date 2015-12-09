#!/bin/bash

#---------------------------------------------------
# Criado por: Wolfterro
# Versão: 1.3.0
# Data: 10/11/2015
#---------------------------------------------------

#---------------------------------------------------
# Apresentação inicial do script
#---------------------------------------------------
echo ""
echo "Script para Youtube-Dl: Baixar Vídeos em MP4 e Músicas em MP3 (1.3.0)"
echo "====================================================================="
echo ""
echo "* Este script requer o Youtube-Dl instalado e configurado para ser reconhecido como comando do bash"
echo "* O pacote 'libav' deverá estar instalado para converter o arquivo de música baixado para o formato MP3"
echo "* Caso não tenha o Youtube-Dl ou o pacote libav instalado, feche este script usando o comando Ctrl + C"
echo "* Caso queira baixar a versão atual do Youtube-Dl, visite: https://github.com/rg3/youtube-dl"
echo "* Caso queira baixar o pacote 'libav', utilize o comando 'sudo apt-get install libav-tools', sem aspas"
echo ""
echo "Por favor, digite APENAS a ID do vídeo desejado (Exemplo: https://www.youtube.com/watch?v=ID_DO_VÍDEO):"
#---------------------------------------------------
# Leitura da ID do vídeo desejado
#---------------------------------------------------
read ID
echo ""
#---------------------------------------------------

#---------------------------------------------------
# Função principal para o download dos vídeos em formato MP4
#---------------------------------------------------
video_function(){
	echo "Qual pasta deseja armazenar o arquivo MP4?"
	echo "(1) Pasta 'Vídeos' do usuário atual"
	echo "(2) Pasta atual do script"
	read LOCATIONV
	#---------------------------------------------------
	if [[ $LOCATIONV -eq 1 ]] ; then
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
		else
			echo ""
			echo "A pasta 'Vídeos' não existe! Deseja criá-la? [S/N]"
			read CREATEV
			CREATEVM="${CREATEV^^}"
			#---------------------------------------------
			if [[ $CREATEVM -eq S ]] ; then
				mkdir ~/Vídeos
				cd ~/Vídeos
				echo ""
				echo "A pasta 'Vídeos' foi criada e selecionada!"
			else
				echo ""
				echo "Neste caso, a pasta atual do script será selecionada!"
			fi
			#----------------------------------------------
		#--------------------------------------------------
		fi
	else
		echo ""
		echo "A pasta atual do script foi selecionada!"
	fi
	#---------------------------------------------------
	youtube-dl --format mp4 https://www.youtube.com/watch?v=$ID
	#---------------------------------------------------
	sleep 5
}
#-----------------------------------------------------------

#-----------------------------------------------------------
# Função principal para o download de músicas em formato MP3
#-----------------------------------------------------------
audio_function(){
	echo "Qual pasta deseja armazenar o arquivo MP3?"
	echo "(1) Pasta 'Música' do usuário atual"
	echo "(2) Pasta atual do script"
	read LOCATIONM
	#---------------------------------------------------
	if [[ $LOCATIONM -eq 1 ]] ; then
		echo ""
		echo "Verificando a existência da pasta 'Música'..."
		#------------------------------------------------
		if [ -e ~/Música ] ; then
			EXISTM=1
		else
			EXISTM=0
		fi
		#------------------------------------------------
		if [[ $EXISTM -eq 1 ]] ; then
			cd ~/Música
			echo ""
			echo "A pasta 'Música' foi selecionada!"
		else
			echo ""
			echo "A pasta 'Música' não existe! Deseja criá-la? [S/N]"
			read CREATEM
			CREATEMM="${CREATEM^^}"
			#---------------------------------------------
			if [[ $CREATEMM -eq S ]] ; then
				mkdir ~/Música
				cd ~/Música
				echo ""
				echo "A pasta 'Música' foi criada e selecionada!"
			else
				echo ""
				echo "Neste caso, a pasta atual do script será selecionada!"
			fi
			#----------------------------------------------
		#--------------------------------------------------
		fi
	else
		echo ""
		echo "A pasta atual do script foi selecionada!"
	fi
	#----------------------------------------------------
	youtube-dl --extract-audio --prefer-avconv --audio-format mp3 https://www.youtube.com/watch?v=$ID
	#----------------------------------------------------
	sleep 5
}
#------------------------------------------------------------

#------------------------------------------------------------
# Opções para o salvamento do vídeo selecionado
#------------------------------------------------------------
echo "Como deseja salvar o vídeo?"
echo "(1) Arquivo de vídeo em formato .MP4"
echo "(2) Arquivo de música em formato .MP3"
read ESCOLHA
echo ""
if [[ $ESCOLHA -eq 1 ]] ; then
	video_function
elif [[ $ESCOLHA -eq 2 ]] ; then
	audio_function
else
	echo "Esta não é uma opção válida, execute o script novamente caso desejar."
fi
