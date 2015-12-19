#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
from os.path import isdir, expanduser

os.path.expanduser("~")

#---------------------------------------------------
# Criado por: Wolfterro
# Versão: 1.6.0 - Python 2.x
# Data: 14/12/2015
#---------------------------------------------------

#---------------------------------------------------
# Localização do script
#---------------------------------------------------
location_script = os.getcwd()

#---------------------------------------------------
# Função Principal: O script
#---------------------------------------------------
def youtube_dl_script():
	#---------------------------------------------------
	# Função de repetição do script
	#---------------------------------------------------
	def repeat_script():
		print ""
		print "Deseja realizar outra operação com o script? [S/N]"
		REPEAT = raw_input("Digite 'S' para sim ou 'N' para não: ")
		REPEAT = REPEAT.upper()
		if REPEAT == "S":
			os.system("clear")
			youtube_dl_script()
		else:
			print ""
			print "Saindo..."
			print ""
			os.system("sleep 3")
	#---------------------------------------------------

	#---------------------------------------------------
	# Apresentação inicial do script
	#---------------------------------------------------
	print ""
	print "Script para Youtube-Dl: Baixar Vídeos e Músicas em Diversos Formatos (1.6.0 - Python 2.x)"
	print "========================================================================================="
	print ""
	print "* Este script requer o Youtube-Dl instalado e configurado para ser reconhecido como comando do shell"
	print "* O pacote 'libav' deverá estar instalado para converter os arquivos baixados se assim for necessário"
	print "* Caso não tenha o Youtube-Dl ou o pacote libav instalado, feche este script usando o comando Ctrl + C"
	print "* Caso queira baixar o Youtube-Dl, visite o seguinte endereço: https://github.com/rg3/youtube-dl"
	print "* Caso queira baixar o pacote libav, utilize o comando 'sudo apt-get install libav-tools', sem aspas"
	print "* Utilize os formatos de conversão de vídeo caso o formato nativo escolhido não estiver disponível"
	print ""
	#---------------------------------------------------

	#---------------------------------------------------
	# Leitura da ID do vídeo desejado
	#---------------------------------------------------
	def main_function_get_id():
		print "Por favor, digite APENAS a ID do vídeo desejado (Exemplo: https://www.youtube.com/watch?v=ID_DO_VÍDEO):"
		print "======================================================================================================="
		global ID
		ID = raw_input("Insira a ID do vídeo: ")
		print ""
	#---------------------------------------------------

	#---------------------------------------------------
	# Função comum para vídeos: caminho
	#---------------------------------------------------
	def video_function_path():
		print "Qual pasta deseja armazenar o arquivo de vídeo?"
		print "==============================================="
		print ""
		print "(1) Pasta 'Vídeos' do usuário atual"
		print "(2) Pasta atual do script"
		print ""
		LOCATIONV = raw_input("Selecione uma das opções acima: ")
		#---------------------------------------------------
		if LOCATIONV == "1": 
			print ""
			print "Verificando a existência da pasta 'Vídeos'..."
			VIDEOEXIST = os.path.exists(expanduser("~/Vídeos"))
			#------------------------------------------------
			if VIDEOEXIST == True:
				EXISTV = True
			else:
				EXISTV = False
			#------------------------------------------------
			if EXISTV == True:
				os.chdir(expanduser("~/Vídeos"))
				print ""
				print "A pasta 'Vídeos' foi selecionada!"
				print ""
			else:
				print ""
				print "A pasta 'Vídeos' não existe! Deseja criá-la? [S/N]"
				CREATEV = raw_input("Digite 'S' para sim ou 'N' para não: ")
				CREATEV = CREATEV.upper()
				#---------------------------------------------
				if CREATEV == "S":
					os.chdir(expanduser("~/"))
					os.system(expanduser("mkdir Vídeos"))
					os.chdir(expanduser("~/Vídeos"))
					print ""
					print "A pasta 'Vídeos' foi criada e selecionada!"
					print ""
				else:
					os.chdir(expanduser(location_script))
					print ""
					print "Neste caso, a pasta atual do script será selecionada!"
					print ""
				#----------------------------------------------
			#--------------------------------------------------
		else:
			os.chdir(expanduser(location_script))
			print ""
			print "A pasta atual do script foi selecionada!"
			print ""
	#---------------------------------------------------

	#---------------------------------------------------
	# Função comum para músicas: caminho
	#---------------------------------------------------
	def audio_function_path():
		print "Qual pasta deseja armazenar o arquivo de áudio?"
		print "==============================================="
		print ""
		print "(1) Pasta 'Música' do usuário atual"
		print "(2) Pasta atual do script"
		print ""
		LOCATIONM = raw_input("Selecione uma das opções acima: ")
		#---------------------------------------------------
		if LOCATIONM == "1": 
			print ""
			print "Verificando a existência da pasta 'Música'..."
			MUSICEXIST = os.path.exists(expanduser("~/Música"))
			#------------------------------------------------
			if MUSICEXIST == True:
				EXISTM = True
			else:
				EXISTM = False
			#------------------------------------------------
			if EXISTM == True:
				os.chdir(expanduser("~/Música"))
				print ""
				print "A pasta 'Música' foi selecionada!"
				print ""
			else:
				print ""
				print "A pasta 'Música' não existe! Deseja criá-la? [S/N]"
				CREATEM = raw_input("Digite 'S' para sim ou 'N' para não: ")
				CREATEM = CREATEM.upper()
				#---------------------------------------------
				if CREATEM == "S":
					os.chdir(expanduser("~/"))
					os.system(expanduser("mkdir Música"))
					os.chdir(expanduser("~/Música"))
					print ""
					print "A pasta 'Música' foi criada e selecionada!"
					print ""
				else:
					os.chdir(expanduser(location_script))
					print ""
					print "Neste caso, a pasta atual do script será selecionada!"
					print ""
				#----------------------------------------------
			#--------------------------------------------------
		else:
			os.chdir(expanduser(location_script))
			print ""
			print "A pasta atual do script foi selecionada!"
			print ""
	#---------------------------------------------------

	#---------------------------------------------------
	# Função principal para o download de vídeos (nativos)
	#---------------------------------------------------
	def video_function_default_mp4():
		#---------------------------------------------------
		os.system("youtube-dl --format mp4 https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	def video_function_mkv():
		#---------------------------------------------------
		os.system("youtube-dl --format mkv https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	def video_function_webm():
		#---------------------------------------------------
		os.system("youtube-dl --format webm https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	def video_function_avi():
		#---------------------------------------------------
		os.system("youtube-dl --format avi https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	#-----------------------------------------------------------

	#---------------------------------------------------
	# Função principal para o download de vídeos (conversão)
	#---------------------------------------------------
	def video_function_default_mp4_conversion():
		#---------------------------------------------------
		os.system("youtube-dl --recode-video mp4 https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	def video_function_mkv_conversion():
		#---------------------------------------------------
		os.system("youtube-dl --recode-video mkv https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	def video_function_webm_conversion():
		#---------------------------------------------------
		os.system("youtube-dl --recode-video webm https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	def video_function_avi_conversion():
		#---------------------------------------------------
		os.system("youtube-dl --recode-video avi https://www.youtube.com/watch?v=" + ID)
		#---------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	#-----------------------------------------------------------

	#-----------------------------------------------------------
	# Função principal para o download de músicas
	#-----------------------------------------------------------
	def audio_function_default_mp3():
		#----------------------------------------------------
		os.system("youtube-dl --extract-audio --prefer-avconv --audio-format mp3 https://www.youtube.com/watch?v=" + ID)
		#----------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	def audio_function_wav():
		#----------------------------------------------------
		os.system("youtube-dl --extract-audio --prefer-avconv --audio-format wav https://www.youtube.com/watch?v=" + ID)
		#----------------------------------------------------
		os.system("sleep 5")
		#---------------------------------------------------
	#------------------------------------------------------------

	#------------------------------------------------------------
	# Funções opcionais do script
	#------------------------------------------------------------
	def option_function_update():
		os.system("youtube-dl --update")
		os.system("sleep 5")
	#------------------------------------------------------------
	def option_conversion_formats():
		print "Qual formato deseja que o vídeo seja convertido?"
		print "================================================"
		print ""
		print "Formatos de vídeo (conversão):"
		print "(1) Arquivo de vídeo em formato .MP4"
		print "(2) Arquivo de vídeo em formato .MKV"
		print "(3) Arquivo de vídeo em formato .WEBM"
		print "(4) Arquivo de vídeo em formato .AVI"
		print ""
		ESCOLHACONVERSAO = raw_input("Escolha uma das opções acima: ")
		print ""
		if ESCOLHACONVERSAO == "1":
			main_function_get_id()
			video_function_path()
			video_function_default_mp4_conversion()
		elif ESCOLHACONVERSAO == "2":
			main_function_get_id()
			video_function_path()
			video_function_mkv_conversion()
		elif ESCOLHACONVERSAO == "3":
			main_function_get_id()
			video_function_path()
			video_function_webm_conversion()
		elif ESCOLHACONVERSAO == "4":
			main_function_get_id()
			video_function_path()
			video_function_avi_conversion()
		else:
			print "Esta não é uma opção válida!"
			os.system("sleep 5")
	#------------------------------------------------------------

	#------------------------------------------------------------
	# Opções para o salvamento do vídeo selecionado
	#------------------------------------------------------------
	print "Como deseja salvar o vídeo?"
	print "==========================="
	print ""
	print "Formatos de vídeo (nativos):"
	print "(1) Arquivo de vídeo em formato .MP4"
	print "(2) Arquivo de vídeo em formato .MKV"
	print "(3) Arquivo de vídeo em formato .WEBM"
	print "(4) Arquivo de vídeo em formato .AVI"
	print ""
	print "Formatos de áudio:"
	print "(5) Arquivo de música em formato .MP3"
	print "(6) Arquivo de música em formato .WAV"
	print ""
	print "Opções do script:"
	print "(7) Formatos de Conversão de Vídeo"
	print "(8) Atualizar Youtube-Dl"
	print "(9) Sair do Youtube-Dl Script"
	print ""
	ESCOLHA = raw_input("Escolha uma das opções acima: ")
	print ""
	if ESCOLHA == "1":
		main_function_get_id()
		video_function_path()
		video_function_default_mp4()
		repeat_script()
	elif ESCOLHA == "2":
		main_function_get_id()
		video_function_path()
		video_function_mkv()
		repeat_script()
	elif ESCOLHA == "3":
		main_function_get_id()
		video_function_path()
		video_function_webm()
		repeat_script()
	elif ESCOLHA == "4":
		main_function_get_id()
		video_function_path()
		video_function_avi()
		repeat_script()
	elif ESCOLHA == "5":
		main_function_get_id()
		audio_function_path()
		audio_function_default_mp3()
		repeat_script()
	elif ESCOLHA == "6":
		main_function_get_id()
		audio_function_path()
		audio_function_wav()
		repeat_script()
	elif ESCOLHA == "7":
		option_conversion_formats()
		repeat_script()
	elif ESCOLHA == "8":
		option_function_update()
		repeat_script()
	elif ESCOLHA == "9":
		print "Saindo..."
		print ""
		os.system("sleep 3")
	else:
		print "Esta não é uma opção válida!"
		os.system("sleep 5")
		repeat_script()
#------------------------------------------------------------
youtube_dl_script()