#!/usr/bin/env ruby
# encoding: utf-8

#---------------------------------------------------
# Criado por: Wolfterro
# Versão: 1.8.0 - Ruby
# Data: 07/01/2016
#---------------------------------------------------

#---------------------------------------------------
# Localização do script
#---------------------------------------------------
$location_script = Dir.pwd

#---------------------------------------------------
# Função Principal: O script
#---------------------------------------------------
def youtube_dl_script()
	#---------------------------------------------------
	# Função de repetição do script
	#---------------------------------------------------
	def repeat_script()
		puts "" 
		puts "Deseja realizar outra operação com o script? [S/N]"
		print "Digite 'S' para sim ou 'N' para não: "
		repeat = gets.chomp
		repeat = repeat.upcase
		if repeat == "S"
			system "clear"
			youtube_dl_script()
		else
			puts ""
			puts "Saindo..."
			puts ""
			sleep = "sleep 5"
			%x( #{sleep} )
		end
	end
	#---------------------------------------------------

	#---------------------------------------------------
	# Função de caminho alternativo
	#---------------------------------------------------
	def alt_path()
		puts ""
		puts "Por favor, especifique o caminho desejado (Exemplo: /home/user/playlist):"
		puts "========================================================================="
		$alt_path_save
		print "Insira o caminho desejado: "
		$alt_path_save = gets.chomp
		puts ""
	end
	#---------------------------------------------------

	#---------------------------------------------------
	# Apresentação inicial do script
	#---------------------------------------------------
	puts ""
	puts "Script para Youtube-Dl: Baixar Vídeos e Músicas em Diversos Formatos (1.8.0 - Ruby)"
	puts "==================================================================================="
	puts ""
	puts "* Este script requer o Youtube-Dl instalado e configurado para ser reconhecido como comando do shell"
	puts "* O pacote 'libav' deverá estar instalado para converter os arquivos baixados se assim for necessário"
	puts "* Caso não tenha o Youtube-Dl ou o pacote libav instalado, feche este script usando o comando Ctrl + C"
	puts "* Caso queira baixar o Youtube-Dl, visite o seguinte endereço: https://github.com/rg3/youtube-dl"
	puts "* Caso queira baixar o pacote libav, utilize o comando 'sudo apt-get install libav-tools', sem aspas"
	puts "* Utilize os formatos de conversão de vídeo caso o formato nativo escolhido não estiver disponível"
	puts ""
	#---------------------------------------------------

	#---------------------------------------------------
	# Leitura da ID do vídeo desejado
	#---------------------------------------------------
	def main_function_get_id()
		puts "Por favor, digite APENAS a ID do vídeo desejado (Exemplo: https://www.youtube.com/watch?v=ID_DO_VÍDEO):"
		puts "======================================================================================================="
		print "Insira a ID do vídeo: "
		$id = gets.chomp
		puts ""
	end
	#---------------------------------------------------

	#---------------------------------------------------
	# Função comum para vídeos: caminho
	#---------------------------------------------------
	def video_function_path()
		puts "Qual pasta deseja armazenar o arquivo de vídeo?"
		puts "==============================================="
		puts ""
		puts "(1) Pasta 'home' do usuário atual (padrão)"
		puts "(2) Pasta 'Vídeos' do usuário atual"
		puts "(3) Pasta atual do script"
		puts "(4) Especificar o caminho desejado"
		puts ""
		print "Selecione uma das opções acima: "
		locationv = gets.chomp
		#---------------------------------------------------
		if locationv == "2"
			puts ""
			puts "Verificando a existência da pasta 'Vídeos'..."
			videoexist = Dir.exists?(File.expand_path("~/Vídeos" ))
			#------------------------------------------------
			if videoexist == true
				Dir.chdir (File.expand_path("~/Vídeos"))
				puts ""
				puts "A pasta 'Vídeos' foi selecionada!"
				puts ""
			else
				puts ""
				puts "A pasta 'Vídeos' não existe! Deseja criá-la? [S/N]"
				print "Digite 'S' para sim ou 'N' para não: "
				createv = gets.chomp
				createv = createv.upcase
				#---------------------------------------------
				if createv == "S"
					Dir.chdir (File.expand_path("~/"))
					%x( mkdir Vídeos )
					Dir.chdir (File.expand_path("~/Vídeos"))
					puts ""
					puts "A pasta 'Vídeos' foi criada e selecionada!"
					puts ""
				else
					Dir.chdir (File.expand_path($location_script))
					puts ""
					puts "Neste caso, a pasta atual do script será selecionada!"
					puts ""
				end
				#----------------------------------------------
			end
			#--------------------------------------------------
		elsif locationv == "3"
			Dir.chdir (File.expand_path($location_script))
			puts ""
			puts "A pasta atual do script foi selecionada!"
			puts ""
		elsif locationv == "4"
			alt_path()
			puts "Verificando a existência do caminho '" + $alt_path_save + "' ..."
			alt_path_exist = Dir.exists?(File.expand_path($alt_path_save))

			if alt_path_exist == false
				puts ""
				puts "O caminho especificado não existe! A pasta 'home' do usuário atual será selecionada!"
				Dir.chdir (File.expand_path("~/"))
				puts ""
			else
				Dir.chdir (File.expand_path($alt_path_save))
				puts ""
				puts "O caminho '" + $alt_path_save + "' foi selecionado!"
				puts ""
			end
		else
			Dir.chdir (File.expand_path("~/"))
			puts ""
			puts "A pasta 'home' do usuário atual foi selecionada!"
			puts ""
		end
	end
	#---------------------------------------------------

	#---------------------------------------------------
	# Função comum para músicas: caminho
	#---------------------------------------------------
	def audio_function_path()
		puts "Qual pasta deseja armazenar o arquivo de áudio?"
		puts "==============================================="
		puts ""
		puts "(1) Pasta 'home' do usuário atual (padrão)"
		puts "(2) Pasta 'Música' do usuário atual"
		puts "(3) Pasta atual do script"
		puts "(4) Especificar o caminho desejado"
		puts ""
		print "Selecione uma das opções acima: "
		locationm = gets.chomp
		#---------------------------------------------------
		if locationm == "2"
			puts ""
			puts "Verificando a existência da pasta 'Música'..."
			musicexist = Dir.exists?(File.expand_path("~/Música" ))
			#------------------------------------------------
			if musicexist == true
				Dir.chdir (File.expand_path("~/Música"))
				puts ""
				puts "A pasta 'Música' foi selecionada!"
				puts ""
			else
				puts ""
				puts "A pasta 'Música' não existe! Deseja criá-la? [S/N]"
				print "Digite 'S' para sim ou 'N' para não: "
				createm = gets.chomp
				createm = createm.upcase
				#---------------------------------------------
				if createm == "S"
					Dir.chdir (File.expand_path("~/"))
					%x( mkdir Música )
					Dir.chdir (File.expand_path("~/Música"))
					puts ""
					puts "A pasta 'Música' foi criada e selecionada!"
					puts ""
				else
					Dir.chdir (File.expand_path($location_script))
					puts ""
					puts "Neste caso, a pasta atual do script será selecionada!"
					puts ""
				end
				#----------------------------------------------
			end
			#--------------------------------------------------
		elsif locationm == "3"
			Dir.chdir (File.expand_path($location_script))
			puts ""
			puts "A pasta atual do script foi selecionada!"
			puts ""
		elsif locationm == "4"
			alt_path()
			puts "Verificando a existência do caminho '" + $alt_path_save + "' ..."
			alt_path_exist = Dir.exists?(File.expand_path($alt_path_save))

			if alt_path_exist == false
				puts ""
				puts "O caminho especificado não existe! A pasta 'home' do usuário atual será selecionada!"
				Dir.chdir (File.expand_path("~/"))
				puts ""
			else
				Dir.chdir (File.expand_path($alt_path_save))
				puts ""
				puts "O caminho '" + $alt_path_save + "' foi selecionado!"
				puts ""
			end
		else
			Dir.chdir (File.expand_path("~/"))
			puts ""
			puts "A pasta 'home' do usuário atual foi selecionada!"
			puts ""
		end
	end
	#---------------------------------------------------

	#---------------------------------------------------
	# Função principal para o download de vídeos (nativos)
	#---------------------------------------------------
	def video_function_default_mp4()
		#---------------------------------------------------
		cmd = "youtube-dl --format mp4 https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	def video_function_mkv()
		#---------------------------------------------------
		cmd = "youtube-dl --format mkv https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	def video_function_webm()
		#---------------------------------------------------
		cmd = "youtube-dl --format webm https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	def video_function_avi()
		#---------------------------------------------------
		cmd = "youtube-dl --format avi https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end
	#-----------------------------------------------------------

	#---------------------------------------------------
	# Função principal para o download de vídeos (conversão)
	#---------------------------------------------------
	def video_function_default_mp4_conversion()
		#---------------------------------------------------
		cmd = "youtube-dl --recode-video mp4 https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo e Realizando Conversão..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	def video_function_mkv_conversion()
		#---------------------------------------------------
		cmd = "youtube-dl --recode-video mkv https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo e Realizando Conversão..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	def video_function_webm_conversion()
		#---------------------------------------------------
		cmd = "youtube-dl --recode-video webm https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo e Realizando Conversão..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	def video_function_avi_conversion()
		#---------------------------------------------------
		cmd = "youtube-dl --recode-video avi https://www.youtube.com/watch?v=" + $id
		puts "Baixando Vídeo e Realizando Conversão..."
		puts ""
		puts %x( #{cmd} )
		#---------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end
	#-----------------------------------------------------------

	#-----------------------------------------------------------
	# Função principal para o download de músicas
	#-----------------------------------------------------------
	def audio_function_default_mp3()
		#----------------------------------------------------
		cmd = "youtube-dl --extract-audio --prefer-avconv --audio-format mp3 https://www.youtube.com/watch?v=" + $id
		puts "Baixando Áudio e Realizando Conversão..."
		puts ""
		puts %x( #{cmd} )
		#----------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	def audio_function_wav()
		#----------------------------------------------------
		cmd = "youtube-dl --extract-audio --prefer-avconv --audio-format wav https://www.youtube.com/watch?v=" + $id
		puts "Baixando Áudio e Realizando Conversão..."
		puts ""
		puts %x( #{cmd} )
		#----------------------------------------------------
		sleep = "sleep 5"
		%x( #{sleep} )
		#---------------------------------------------------
	end

	#------------------------------------------------------------

	#------------------------------------------------------------
	# Funções opcionais do script
	#------------------------------------------------------------
	def option_function_update()
		cmd = "youtube-dl --update"
		puts "Verificando atualizações..."
		puts ""
		puts %x( #{cmd} )
		sleep = "sleep 5"
		%x( #{sleep} )
	end
	#------------------------------------------------------------
	def option_function_install()
		Dir.chdir (File.expand_path("~/"))
		cmd_download = "wget -O youtube-dl 'https://yt-dl.org/downloads/latest/youtube-dl'"
		cmd_permission = "chmod a+rx youtube-dl"
		cmd_move = "mv youtube-dl /usr/bin"
		cmd_move_sudo = "sudo mv youtube-dl /usr/bin"
		cmd_remove = "rm youtube-dl"
		sleep = "sleep 5"

		puts "Baixando youtube-dl usando 'wget'..."
		puts ""
		%x( #{cmd_download} )
		puts "Aplicando permissões de execução..."
		puts ""
		%x( #{cmd_permission} )
		puts "Movendo para a pasta '/usr/bin'..."
		puts ""

		if Process.uid != 0
			puts "É necessário privilégios de root para mover o arquivo para a pasta selecionada!"
			puts "Deseja utilizar o comando 'sudo' para mover 'youtube-dl' para '/usr/bin'? [S/N]"
			print "Digite 'S' para sim ou 'N' para não: "
			movefile = gets.chomp
			movefile = movefile.upcase

			if movefile == "S"
				%x( #{cmd_move_sudo} )
				puts ""
				puts "Youtube-Dl está instalado!"
				%x( #{sleep} )
			else
				puts ""
				puts "O arquivo não pôde ser movido por falta de permissão! Saindo da Instalação..."
				%x( #{cmd_remove} )
				%x( #{sleep} )
			end
		else
			%x( #{cmd_move} )
			puts ""
			puts "Youtube-Dl está instalado!"
			%x( #{sleep} )
		end
	end
	#------------------------------------------------------------
	def option_conversion_formats()
		puts "Qual formato deseja que o vídeo seja convertido?"
		puts "================================================"
		puts ""
		puts "Formatos de vídeo (conversão):"
		puts "(1) Arquivo de vídeo em formato .MP4"
		puts "(2) Arquivo de vídeo em formato .MKV"
		puts "(3) Arquivo de vídeo em formato .WEBM"
		puts "(4) Arquivo de vídeo em formato .AVI"
		puts ""
		print "Escolha uma das opções acima: "
		escolha_coversao = gets.chomp
		puts ""
		if escolha_coversao == "1"
			main_function_get_id()
			video_function_path()
			video_function_default_mp4_conversion()
		elsif escolha_coversao == "2"
			main_function_get_id()
			video_function_path()
			video_function_mkv_conversion()
		elsif escolha_coversao == "3"
			main_function_get_id()
			video_function_path()
			video_function_webm_conversion()
		elsif escolha_coversao == "4"
			main_function_get_id()
			video_function_path()
			video_function_avi_conversion()
		else
			puts "Esta não é uma opção válida!"
			puts ""
			sleep = "sleep 5"
			%x( #{sleep} )
		end
	end
	#------------------------------------------------------------

	#------------------------------------------------------------
	# Opções para o salvamento do vídeo selecionado
	#------------------------------------------------------------
	puts "Como deseja salvar o vídeo?"
	puts "==========================="
	puts ""
	puts "Instalação:"
	puts "(0) Instalar Youtube-Dl"
	puts ""
	puts "Formatos de vídeo (nativos):"
	puts "(1) Arquivo de vídeo em formato .MP4"
	puts "(2) Arquivo de vídeo em formato .MKV"
	puts "(3) Arquivo de vídeo em formato .WEBM"
	puts "(4) Arquivo de vídeo em formato .AVI"
	puts ""
	puts "Formatos de áudio:"
	puts "(5) Arquivo de música em formato .MP3"
	puts "(6) Arquivo de música em formato .WAV"
	puts ""
	puts "Opções do script:"
	puts "(7) Formatos de Conversão de Vídeo"
	puts "(8) Atualizar Youtube-Dl"
	puts "(9) Sair do Youtube-Dl Script"
	puts ""
	print "Escolha uma das opções acima: "
	escolha = gets.chomp
	puts ""
	if escolha == "0"
		option_function_install()
		repeat_script()
	elsif escolha == "1"
		main_function_get_id()
		video_function_path()
		video_function_default_mp4()
		repeat_script()
	elsif escolha == "2"
		main_function_get_id()
		video_function_path()
		video_function_mkv()
		repeat_script()
	elsif escolha == "3"
		main_function_get_id()
		video_function_path()
		video_function_webm()
		repeat_script()
	elsif escolha == "4"
		main_function_get_id()
		video_function_path()
		video_function_avi()
		repeat_script()
	elsif escolha == "5"
		main_function_get_id()
		audio_function_path()
		audio_function_default_mp3()
		repeat_script()
	elsif escolha == "6"
		main_function_get_id()
		audio_function_path()
		audio_function_wav()
		repeat_script()
	elsif escolha == "7"
		option_conversion_formats()
		repeat_script()
	elsif escolha == "8"
		option_function_update()
		repeat_script()
	elsif escolha == "9"
		puts "Saindo..."
		puts ""
		sleep = "sleep 3"
		%x( #{sleep} )
	else
		puts "Esta não é uma opção válida!"
		puts ""
		sleep = "sleep 5"
		%x( #{sleep} )
		repeat_script()
	end
end
#------------------------------------------------------------
youtube_dl_script()