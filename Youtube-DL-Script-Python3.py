#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from os.path import expanduser
import os
import sys
import urllib.request, urllib.error, urllib.parse
import subprocess

#-------------------------------------
# Criado por: Wolfterro
# Versão: 2.0.0 - Python 3.x
# Data: 22/06/2016
#-------------------------------------

version = "2.0.0"

def help():
	print("=============================================")
	print("Youtube-DL Script - Versão %s - Python 3.x" % (version))
	print("=============================================\n")

	print(" * Este script requer o youtube-dl instalado e reconhecido como comando do shell")
	print(" * O pacote 'libav' ou 'ffmpeg' deverá estar instalado para converter os vídeos baixados")
	print(" * Caso não tenha o youtube-dl instalado, utilize a opção 'Instalar/Atualizar youtube-dl'")
	print(" * É necessário privilégios de root para instalar e atualizar o youtube-dl")
	print(" * Utilize os formatos de Conversão caso o formato escolhido não esteja disponível\n")

	print("Uso: ./Youtube-DL-Script.py [Argumento]\n")

	print("Argumentos:")
	print("-----------")
	print(" -h || --help\t\tMostra este menu de ajuda\n")

def get_home_dir():
	get_home = os.path.expanduser("~")
	return get_home

def check_download_dir(get_home, video):
	if video == True:
		if os.path.exists(get_home + "/Vídeos"):
			os.chdir(get_home + "/Vídeos")
		else:
			print("Criando pasta 'Vídeos' em '" + get_home + "' ...")
			os.makedirs(get_home + "/Vídeos")
			os.chdir(get_home + "/Vídeos")
	else:
		if os.path.exists(get_home + "/Música"):
			os.chdir(get_home + "/Música")
		else:
			print("Criando pasta 'Música' em '" + get_home + "' ...")
			os.makedirs(get_home + "/Música")
			os.chdir(get_home + "/Música")

def install_youtube_dl(home_dir):
	print("Baixando youtube-dl ...")
	latest = "https://yt-dl.org/downloads/latest/youtube-dl"

	try:
		response = urllib.request.urlopen(latest)
		data = response.read()
	except Exception:
		print("Erro! Não foi possível baixar o youtube-dl! Saindo ...")
		sys.exit(1)
	
	try:
		file = open("youtube-dl", "wb")
		file.write(data)
		file.close()
	except Exception:
		print("Erro! Não foi possível criar o arquivo 'youtube-dl' em '" + home_dir + "'! Saindo ...")
		sys.exit(1)

	print("Aplicando permissões ...")
	os.chmod("youtube-dl", 0o755)

	print("Movendo para a pasta '/usr/local/bin' ...")
	subprocess.Popen("mv youtube-dl /usr/local/bin", shell=True)

	print("Finalizado! Execute o script novamente para utilizá-lo corretamente.")

def youtube_dl_options(home_dir):
	os.chdir(home_dir)

	print("\n(A) Atualizar youtube-dl")
	print("(I) Instalar youtube-dl\n")

	user_input = input("Escolha uma das opções acima: ")
	if user_input.upper() == "A":
		if os.geteuid() != 0:
			print("Erro! É necessário privilégios de root para atualizar! Saindo ...")
			sys.exit(1)
		else:
			subprocess.call("youtube-dl -U", shell=True)
	elif user_input.upper() == "I":
		if os.geteuid() != 0:
			print("Erro! É necessário privilégios de root para instalar! Saindo ...")
			sys.exit(1)
		else:
			install_youtube_dl(home_dir)
	else:
		print("Saindo ...")

def main_menu():
	print("=============================================")
	print("Youtube-DL Script - Versão %s - Python 3.x" % (version))
	print("=============================================\n")

	print("Escolha uma das opções abaixo (qualquer outra tecla para sair):")
	print("---------------------------------------------------------------")
	print("Áudio (Conversão):")
	print("------------------")
	print("(1) Formato MP3")
	print("(2) Formato WAV\n")
	
	print("Vídeo (Nativo):")
	print("---------------")
	print("(3) Formato MP4")
	print("(4) Formato WEBM")
	print("(5) Formato 3GP")
	print("(6) Formato MKV\n")
	
	print("Vídeo (Conversão):")
	print("------------------")
	print("(7) Formato MP4")
	print("(8) Formato WEBM")
	print("(9) Formato MKV\n")

	print("Opções:")
	print("-------")
	print("(0) Instalar/Atualizar youtube-dl\n")

	user_input = input("Escolha uma das opções acima: ")
	return user_input

def get_video_id():
	video_id = input("Insira APENAS a ID do Vídeo ou da Playlist: ")
	if len(video_id) > 11:
		is_playlist = True
	else:
		is_playlist = False
	
	return [video_id, is_playlist]

def prepare_command(video, conversion, video_format):
	if video == True:
		if conversion == True:
			command = "youtube-dl --recode-video " + video_format
		else:
			command = "youtube-dl --format " + video_format
	else:
		command = "youtube-dl --extract-audio --audio-format " + video_format

	return command

def check_video_id(video_id, is_playlist):
	if is_playlist == True:
		url = " https://www.youtube.com/playlist?list=" + video_id
	else:
		url = " https://www.youtube.com/watch?v=" + video_id

	return url

def download_video(command, url):
	print(" ")
	subprocess.call(command + url, shell=True)

def main():
	home_dir = get_home_dir()
	user_input = main_menu()
	
	if user_input == "1":
		video = False
		conversion = True
		video_format = "mp3"
	elif user_input == "2":
		video = False
		conversion = True
		video_format = "wav"
	elif user_input == "3":
		video = True
		conversion = False
		video_format = "mp4"
	elif user_input == "4":
		video = True
		conversion = False
		video_format = "webm"
	elif user_input == "5":
		video = True
		conversion = False
		video_format = "3gp"
	elif user_input == "6":
		video = True
		conversion = False
		video_format = "mkv"
	elif user_input == "7":
		video = True
		conversion = True
		video_format = "mp4"
	elif user_input == "8":
		video = True
		conversion = True
		video_format = "webm"
	elif user_input == "9":
		video = True
		conversion = True
		video_format = "mkv"
	elif user_input == "0":
		youtube_dl_options(home_dir)
		sys.exit(0)
	else:
		print("Saindo ...")
		sys.exit(0)

	video_id, is_playlist = get_video_id()

	check_download_dir(home_dir, video)
	command = prepare_command(video, conversion, video_format)
	url = check_video_id(video_id, is_playlist)
	download_video(command, url)

if __name__ == "__main__":
	argc = len(sys.argv)
	
	if argc > 1:
		if str(sys.argv[1]) == "-h" or str(sys.argv[1]) == "--help":
			help()
		else:
			print("Erro! Argumento desconhecido! Use '-h' ou '--help' para ajuda.")
			print("Uso: ./Youtube-DL-Script.py [Argumento]")
	else:
		main()
		while True:
			print(" ")
			one_more_time = input("Deseja executar o script mais uma vez? [s/N]: ")
			if one_more_time.upper() == "S":
				main()
			else:
				break
