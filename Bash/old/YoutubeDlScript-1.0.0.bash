#!/bin/bash
#---------------------------------------------------
# Criado por: Wolfterro
# Versão: 1.0.0
# Data: 29/10/2015
#---------------------------------------------------
echo ""
echo "Script para Youtube-Dl: Baixar Vídeos em MP4 e Músicas em MP3"
echo "============================================================="
echo ""
echo "* Este script requer o Youtube-Dl instalado e configurado para ser reconhecido como comando do bash"
echo "* O pacote 'libav' deverá estar instalado para converter o arquivo de música baixado para o formato MP3"
echo "* Caso não tenha o Youtube-Dl ou o pacote libav instalado, feche este script usando o comando Ctrl + C"
echo "* Caso queira baixar a versão atual do Youtube-Dl, visite: https://github.com/rg3/youtube-dl"
echo "* Caso queira baixar o pacote 'libav', utilize o comando 'sudo apt-get install libav', sem aspas"
echo ""
echo "Por favor, digite APENAS a ID do vídeo desejado (Exemplo: https://www.youtube.com/watch?v=ID_DO_VÍDEO):"
#---------------------------------------------------
read ID
echo ""
#---------------------------------------------------
echo "Como deseja salvar o vídeo?"
echo "(1) Vídeo em MP4"
echo "(2) Música em MP3"
read ESCOLHA
echo ""
if [ $ESCOLHA = 1 ] ; then
	#---------------------------------------------------
	echo "Qual pasta deseja armazenar o arquivo MP4?"
	echo "(1) Pasta 'Vídeos' do usuário atual (se existir)"
	echo "(2) Pasta atual do script"
	read LOCATIONV
	#---------------------------------------------------
	if [ $LOCATIONV = 1 ] ; then
		cd ~/Vídeos
		echo ""
		echo "A pasta 'Vídeos' foi selecionada! Se ela não existir, o arquivo será armazenado na pasta atual do script!"
	else
		echo ""
		echo "A pasta atual do script foi selecionada!"
	fi
	#---------------------------------------------------
	youtube-dl --format mp4 https://www.youtube.com/watch?v=$ID
	#---------------------------------------------------
elif [ $ESCOLHA = 2 ] ; then
	#---------------------------------------------------
	echo "Qual pasta deseja armazenar o arquivo MP3?"
	echo "(1) Pasta 'Músicas' do usuário atual (se existir)"
	echo "(2) Pasta atual do script"
	read LOCATIONM
	#---------------------------------------------------
	if [ $LOCATIONM = 1 ] ; then
		cd ~/Músicas
		echo ""
		echo "A pasta 'Músicas' foi selecionada! Se ela não existir, o arquivo será armazenado na pasta atual do script!"
	else
		echo ""
		echo "A pasta local do script foi selecionada!"
	fi
	#----------------------------------------------------
	youtube-dl --extract-audio --prefer-avconv --audio-format mp3 https://www.youtube.com/watch?v=$ID
	#----------------------------------------------------
else
	echo "Esta não é uma opção válida, execute o script novamente caso desejar."
fi
