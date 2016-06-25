# Youtube-DL-Script:
#### Script para [Youtube-DL](https://github.com/rg3/youtube-dl/): Baixar Vídeos e Músicas em Diversos Formatos <br />

### Descrição:

###### Decidi criar este script para facilitar a minha vida na hora de digitar os comandos necessários na hora de usar o [Youtube-DL](https://github.com/rg3/youtube-dl/). Não mais será necessário digitar o link inteiro do youtube ou o comando inteiro do programa para conseguir o vídeo no formato que deseja. <br />

###### Este script não foi feito para ser distribuído, já que falta muitas outras opções disponíveis no Youtube-DL e que muito provavelmente não serão adicionados ao script. Mas precisei de um lugar para hospedá-los e compartilhá-los, se assim for necessário.

###### A quem estiver interessado em usar este script, poderá baixá-lo e modificá-lo, adicionando novas funções, portando para outras linguagens e modificando funções já existentes no script.

O script se encontra em 4 versões diferentes:

- **Python 2.7** <br />
- **Python 3.x** <br />
- **Bash (Unix Shell)** - 1.8.0 ou anterior<br />
- **Ruby** - 1.8.0 ou anterior<br />

###### Como é possível ver, o script foi criado pensando na plataforma Linux (e talvez OSX, mas não tenho como testá-lo para ter certeza de que funciona) e portanto poderá não funcionar na plataforma Windows. Como este é um script para ser executado pelo terminal, a plataforma Windows não estava nos meus planos.

#### Testado em / Versões testadas:
- Linux Mint 17.1 Cinnamon x86/x64 - Bash/Python 2.7/Python 3.x/Ruby<br />
- Debian Jessie 8.2 x86 - Bash/Python 2.7<br />
- Arch Linux x86/x64 - Bash/Python 2.7/Python 3.x/Ruby<br />

###### Estão disponíveis também as versões anteriores do script em suas respectivas linguagens na pasta 'old'. Não recomendo utilizá-los, já que uma nova versão mais atualizada se encontra na área principal do repositório.<br />

##### Versões Bash e Ruby NÃO SERÃO MAIS atualizadas! Últimas versões se encontram em suas respectivas pastas.<br />

#### [Confira aqui o changelog do script para maiores informações sobre diferentes versões.](https://raw.github.com/Wolfterro/Youtube-DL-Script/master/CHANGELOG.txt)<br />

### Requisitos:

##### Python 2.7:
- Youtube-DL<br />
- Python 2.7<br />
- ffmpeg / libav-tools<br />

##### Python 3.x:
- Youtube-DL<br />
- Python 3.x<br />
- ffmpeg / libav-tools<br />

##### Bash (Unix Shell):
- Youtube-DL<br />
- Bash<br />
- ffmpeg / libav-tools<br />

##### Ruby:
- Youtube-DL<br />
- Ruby<br />
- ffmpeg / libav-tools<br />

###### Este script não é um programa standalone (isto é, ele não faz as operações de download e de conversão, é apenas um frontend para um programa já existente), portanto **É NECESSÁRIO** que o [Youtube-DL](https://github.com/rg3/youtube-dl/) esteja instalado e que seja devidamente reconhecido como comando do shell. Caso não o tenha instalado, poderá utilizar a opção de instalação do Youtube-DL presente no script.<br />

###### É necessário também que o programa ffmpeg ou libav esteja instalado no sistema, ele será responsável pelas conversões de vídeo e áudio se assim forem necessárias. Certifique-se de possuir uma versão atualizada de um destes programas.<br />

###### Ao usar as versões escritas em Python, certifique-se de usar a versão correta com relação a versão instalada em seu computador, **o script em Python 3 não funcionará se você apenas tiver o Python 2 instalado em seu sistema e vice-versa!**<br />

### Download e Execução:

###### Usuários Linux (e talvez OSX) poderão baixar o script usando o comando 'wget' e dando as devidas permissões de execução com o comando 'chmod':

##### Python 2.7:

    wget https://raw.github.com/Wolfterro/Youtube-DL-Script/master/Youtube-DL-Script-Python2.py
    chmod +x Youtube-DL-Script-Python2.py
    ./Youtube-DL-Script-Python2.py

##### Python 3.x:

    wget https://raw.github.com/Wolfterro/Youtube-DL-Script/master/Youtube-DL-Script-Python3.py
    chmod +x Youtube-DL-Script-Python3.py
    ./Youtube-DL-Script-Python3.py

##### Bash (Unix Shell):

    wget https://raw.github.com/Wolfterro/Youtube-DL-Script/master/Bash/old/Youtube-DL-Script-1.8.0.bash
    chmod +x Youtube-DL-Script-1.8.0.bash
    ./Youtube-DL-Script-1.8.0.bash

##### Ruby:

    wget https://raw.github.com/Wolfterro/Youtube-DL-Script/master/Ruby/old/Youtube-DL-Script-Ruby-1.8.0.rb
    chmod +x Youtube-DL-Script-Ruby-1.8.0.rb
    ./Youtube-DL-Script-Ruby-1.8.0.rb

###### Os scripts localizados na área principal da branch são as versões mais atualizadas do script. Para utilizar as versões antigas, vá até a pasta 'old' da linguagem desejada e lá estarão as versões mais antigas do script.
