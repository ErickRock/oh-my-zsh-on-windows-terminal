**Índice**   
- [Introdução<a name="id1"></a>](#introdu%c3%a7%c3%a3o)
- [Preparando o ambiente<a name="id1"></a>](#preparando-o-ambiente)
- [Personalizando o Windows Terminal](#personalizando-o-windows-terminal)

## Introdução<a name="id1"></a>
Eu gosto de utilizar o máximo de tecnologias nativas, por este motivo resolvi escrever este artigo, vamos utilizar o Windows Terminal (Preview) que permite abrir vários terminais em abas, além do subsistema do Linux para Windows 10, onde você vai instalar uma distro Linux disponível na Microsoft Store e a partir dessa distro nós vamos instalar o Oh my Zsh, deixando ele como bash padrão do Terminal Linux.

## Preparando o ambiente<a name="id1"></a>

Você precisará verificar se tem os componentes opcionais do Subsistema do Windows para Linux e da Plataforma de Máquina Virtual instalados. Você pode fazer isso executando o seguinte comando no PowerShell como Administrador:

<kbd>dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart</kbd>

<kbd>dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart</kbd>

Agora, precisamos [instalar o Windows Terminal Preview do Windows 10](https://www.microsoft.com/pt-br/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab "Baixar Windows Terminal Preview") não há segredo, assim que abrir o link ele acima o navegador solicitará permissão para abrir a Microsoft Store do Windows 10, aceite e clique em instalar. O Windows Terminal é uma aplicação open source da Microsoft que permite a abertura de mútiplos terminais na mesma janela, alé de possuir uma gama de customização visual bem ampla através de um arquivo JSON, que vou ensinar mais pra frente. 

Agora, precisamos de uma distro Linux, que também é disponibilizada na Microsoft Store. Eu estou usando o [Linux Ubuntu 18.04 LTS](https://www.microsoft.com/pt-br/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab "Baixar Linux Ubuntu 18.04 LTS"), o processo de instalação é o mesmo do Windows Terminal. Após instalado ele aparecerá na lista do menu iniciar como Ubuntu 18.04 LTS, mas ainda não possível utiliar, pois precisamos reiniciar a máquina para que as configurações que fizemos no início tenham efeito e ative corretamente a máquina virtual juntamento com o subsistema do Linux.

Após reiniciar abra o Ubuntu 18.04 no menu iniciar e aguarde uns minutos, ele fará download dos arquivos restantes do sistema, ao terminar você fará o processo de criar um nome de usuário e definir uma senha de usuário. Feito isso, já podemos utilizar ele dentro do Windows Terminal.

## Personalizando o Windows Terminal

Para que tenha um visual mais agradável, vamos fazer algumas alterações visuais no arquivo JSON do Windows Terminal. Para agilizar você pode baixar o [meu arquivo JSON]() 