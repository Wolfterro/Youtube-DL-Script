# Youtube-DL-Script:
#### Script para [Youtube-DL](https://github.com/rg3/youtube-dl/): Baixar Vídeos e Músicas em Diversos Formatos <br />

### Descrição:

###### Decidi criar este script para facilitar a minha vida na hora de digitar os comandos necessários na hora de usar o [Youtube-DL](https://github.com/rg3/youtube-dl/). Não mais será necessário digitar o link inteiro do youtube ou o comando inteiro do programa para conseguir o vídeo no formato que deseja. <br />

###### Este script não foi feito para ser distribuído, já que falta muitas outras opções disponíveis no Youtube-DL e que muito provavelmente não serão adicionados ao script. Mas precisei de um lugar para hospedá-los e compartilhá-los, se assim for necessário.

###### A quem estiver interessado em usar este script, poderá baixá-lo e modificá-lo, adicionando novas funções, portando para outras linguagens e modificando funções já existentes no script.

O script se encontra em 3 versões diferentes:

- **Bash (Unix Shell)** <br />
- **Python 2.7** <br />
- **Python 3.x** <br />

###### Como é possível ver, o script foi criado pensando na plataforma Linux (e talvez OSX, mas não tenho como testá-lo para ter certeza de que funciona) e portanto poderá não funcionar na plataforma Windows. Como este é um script para ser executado pelo terminal, a plataforma Windows não estava nos meus planos.

#### Testado em / Versões testadas:
- Linux Mint 17.1 Cinnamon x86/x64 - Bash/Python 2.7<br />
- Debian Jessie 8.2 x86 - Bash/Python 2.7<br />
- Arch Linux x86/x64 - Bash/Python 2.7/Python 3.x<br />

###### Estão disponíveis também as versões anteriores do script em sua versão para o Bash na pasta 'old'. Não recomendo utilizá-los, já que uma nova versão mais atualizada se encontra na pasta 'latest'.<br />

### Requisitos:

##### Bash (Unix Shell):
- Youtube-DL<br />
- ffmpeg / libav-tools<br />

##### Python 2.7:
- Youtube-DL<br />
- Python 2.7<br />
- ffmpeg / libav-tools<br />

##### Python 3.x:
- Youtube-DL<br />
- Python 3.x<br />
- ffmpeg / libav-tools<br />

###### Este script não é um programa standalone (isto é, ele não faz as operações de download e de conversão, é apenas um frontend para um programa já existente), portanto **É NECESSÁRIO** que o [Youtube-DL](https://github.com/rg3/youtube-dl/) esteja instalado e que seja devidamente reconhecido como comando do shell.<br />

###### É necessário também que o programa ffmpeg ou libav esteja instalado no sistema, ele será responsável pelas conversões de vídeo e áudio se assim forem necessárias. Certifique-se de possuir uma versão atualizada de um destes programas.<br />

###### Se preferir usar as versões escritas em Python, certifique-se de usar a versão correta com relação a versão instalada em seu computador, **o script em Python 3 não funcionará se você apenas tiver o Python 2 instalado em seu sistema e vice-versa!**
