![](/fundo.png)
**Índice**   

- [Introdução](#introdu%c3%a7%c3%a3o)
- [Preparando o ambiente](#preparando-o-ambiente)
- [Personalizando o Windows Terminal](#personalizando-o-windows-terminal)
- [Atualizando a distro](#atualizando-a-distro)
- [Instalando o oh-my-zsh](#instalando-o-oh-my-zsh)
- [Configurando o Spaceship](#configurando-o-spaceship)
- [Plugins do ZSH](#plugins-do-zsh)

## Introdução

Eu gosto de utilizar o máximo de tecnologias nativas, por este motivo resolvi escrever este artigo, vamos utilizar o Windows Terminal (Preview) que permite abrir vários terminais em abas, além do subsistema do Linux para Windows 10, onde você vai instalar uma distro Linux disponível na Microsoft Store e a partir dessa distro nós vamos instalar o Oh my Zsh, deixando ele como bash padrão do Terminal Linux.

## Preparando o ambiente

Antes de tudo, [instale o pacote de fontes Fira Code](https://github.com/tonsky/FiraCode/releases/download/2/FiraCode_2.zip), ela trará alguns efeitos bem legais ao utilizar símbolos no código ou no terminal. Você pode ver mais detalhes do projeto no perfil deles no [GitHub - Fira Code](https://github.com/tonsky/FiraCode)

Vamos lá.

Você precisará verificar se tem os componentes opcionais do Subsistema do Windows para Linux e da Plataforma de Máquina Virtual instalados. Você pode fazer isso executando o seguinte comando no PowerShell como Administrador:

<kbd>dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart</kbd>

<kbd>dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart</kbd>

Agora, precisamos [instalar o Windows Terminal Preview do Windows 10](https://www.microsoft.com/pt-br/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab "Baixar Windows Terminal Preview") não há segredo, assim que abrir o link ele acima o navegador solicitará permissão para abrir a Microsoft Store do Windows 10, aceite e clique em instalar. O Windows Terminal é uma aplicação open source da Microsoft que permite a abertura de múltiplos terminais na mesma janela, além de possuir uma gama de customização visual bem ampla através de um arquivo JSON, que vou ensinar mais pra frente. 

Agora, precisamos de uma distro Linux, que também é disponibilizada na Microsoft Store. Eu estou usando o [Linux Ubuntu 18.04 LTS](https://www.microsoft.com/pt-br/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab "Baixar Linux Ubuntu 18.04 LTS"), o processo de instalação é o mesmo do Windows Terminal. Após instalado ele aparecerá na lista do menu iniciar como Ubuntu 18.04 LTS, mas ainda não possível utilizar, pois precisamos reiniciar a máquina para que as configurações que fizemos no início tenham efeito e ative corretamente a máquina virtual juntamente com o subsistema do Linux.

Após reiniciar abra o Ubuntu 18.04 no menu iniciar e aguarde uns minutos, ele fará download dos arquivos restantes do sistema, ao terminar você fará o processo de criar um nome de usuário e definir uma senha de usuário. Feito isso, já podemos utilizar ele dentro do Windows Terminal.

## Personalizando o Windows Terminal

Para que tenha um visual mais agradável, vamos fazer algumas alterações visuais no arquivo JSON do Windows Terminal. Para agilizar você pode baixar o arquivo JSON e o ícone que utilizo para a distro diretamente no [meu repositório](https://github.com/ErickRock/oh-my-zsh-on-windows-terminal "Repositório - Oh My Zsh on Windows Terminal"). 
<p> Com os arquivos baixados, pressione as teclas Windows + R e cole o seguinte diretório
<kbd>AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState</kbd> é dentro dele que você deve copiar o arquivo JSON baixado e substituir o original. Agora copie a pasta <kbd>SysIcon</kbd> para <kbd>C:</kbd> ficará assim <kbd>C:\SysIcon</kbd>.
Feito isso, seu Windows Terminal já deverá por padrão abrir o terminal Linux, e já estará com o esquema de cores do tema Drácula. 

Por padrão, quando inicamos o Linux direto pelo próprio Ubuntu 18.04, ele abre o diretório <kbd>/home/user</kbd> ou seja, direto dentro do subsistema. Quando iniciamos ele pelo Windows Terminal, ele abre o diretório <kbd>C:\Users\adm\<seuUsuário></kbd>. Isso vai de gosto e preferência, eu prefiro deixar neste padrão mesmo para navegar entre as pastas. 

## Atualizando a distro

Abra o Windows Terminal, digite <kbd>cd ~</kbd> para irmos ao diretório de usuário Linux. Entre com o comando <kbd>sudo apt-get update</kbd> para fazer o fetch do que precisa ser atualizado Leva um tempo.

Após finalizado o fetch, entre com o comando <kbd>sudo apt-get upgrade</kbd>. Ele irá pedir uma confirmação da ação. Confirme com <kbd>Y</kbd>. Vai demorar bastante. No meio da instalação, é capaz que ele pergunte para ter permissão para reiniciar alguns serviços. Basta confirmar com um <kbd>yes</kbd>.

Quando terminar, teremos nosso Ubuntu pronto. Ou quase. Falta atualizar o Git no Ubuntu.

Para atualizar o Git no Ubuntu, devemos adicionar um PPA:

<kbd>sudo add-apt-repository ppa:git-core/ppa</kbd> Ele vai pedir para confirmar pressionando o Enter.
Quando finalizar, entre com o comando de update: <kbd>sudo apt update; sudo apt install git</kbd>

## Instalando o oh-my-zsh

Com o Windows Terminal aberto no Ubuntu, execute o comando <kbd>sudo apt-get install zsh</kbd> digite sua senha caso seja necessário e confirme a instalação. Enquanto instala, abra o seu VSCode e instale a extensão do [**Remote - WSL**](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl "Remote - WSL Marktplace VsCode"). Depois de instalado, feche o VSCode.

Agora que instalamos o zsh, precisamos torná-lo como terminal padrão na execução do shell. É muito importante este passo. Se não configurado corretamente, o Windows Terminal vai abrir o bash padrão ao invés do zsh.

No Windows Terminal, digite o seguinte comando pra abrir o arquivo do bash no VSCode: <kbd>code ~/.bashrc</kbd> pode ser que ele instale alguns arquivos do VS Code no Ubuntu, apenas aguarde, em seguida ele abre automaticamente. Caso peça alguma liberação de firewall, permita o acesso.

Dentro do arquivo, adicione na primeira linha o script a seguir:
```
# if running in terminal...
if test -t 1; then
# ...start zsh
exec zsh
fi
```

**Obs**: Tem que ser na primeira linha, mesmo. Se fizer no final do arquivo, pode conflitar com outra condição.

Salve o arquivo, feche-o e feche também o VSCode.

No terminal do Ubuntu, execute o seguinte comando para instalar o oh-my-zsh: <kbd>sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"</kbd> Ele vai pedir para confirmar o Zsh como shell padrão. Confirme com um <kbd>Y</kbd> e sua senha.

Agora, vamos instalar o tema Spaceship, execute o comando <kbd>cd ~</kbd> e depois <kbd>git clone https://github.com/denysdovhan/spaceship-prompt.git "themes/spaceship-prompt"</kbd> ao final, digite <kbd>ls .oh-my-zsh/custom/themes</kbd> e dê enter, para verificar se ele criou a pasta <kbd>spaceship-prompt</kbd>. Se fez as etapas corretamente, a pastará estará lá, você também pode conferir visualmente, abra a estrutura de pastas do WSL Ubuntu. Para verificar isso pressione as teclas **Windows + R** e digite <kbd>\\\wsl$\Ubuntu-18.04\home\\`<userName>`\\.oh-my-zsh\\custom\themes\\</kbd> dê enter e você será levado direto para a pasta virtualizada do Linux instalado,confirme se a pasta foi criada. Se foi, vamos prosseguir.
- No Windows Terminal execute o comando <kbd>`ln -s "/home/<userName>/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "/home/<userName>/.oh-my-zsh/themes/spaceship.zsh-theme"`</kbd> (`Substitua <userName> pelo seu nome de usuário Linux`) ele vai linkar o tema ao oh-my-zsh. Feito isso execute <kbd>code ~/.zshrc</kbd> e no campo `ZSH_THEME="robbyrussell"` você insere o nome do tema que quer usar, no caso vamos deixar como <kbd>`ZSH_THEME="spaceship"`</kbd>. Outros temas que já vem instalado nativamente que gosto bastante e você pode experimentar é `sonicradish ` e o `godzilla`, é possível deixar esse campo com o valor `ZSH_THEME="random"` também, assim sempre que abrir o terminal ele aplicará um tema diferente, foi assim que descobri estes outros dois.

## Configurando o Spaceship
Por mais que seja muito interessante mostrar as versões do Node, Docker e outros itens no nosso terminal geralmente isso consome processamento e pode tornar mais lento o carregamento de pastas, por isso eu gosto de desabilitar a maioria dessas opções.

Execute <kbd>code ~/.zshrc</kbd> e adicione o seguinte conteúdo:
```
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
```
Salve o documento, e abra um novo terminal para você ver a diferença.
![Alt Text](https://dev-to-uploads.s3.amazonaws.com/i/eys5p19xzubci13r2hdg.png)



## Plugins do ZSH
Existem alguns plugins bem legais para o Oh My Zsh que facilitam muito na hora de executar comandos comuns, realizar autocompletes, etc...

Para instalar plugins precisamos configurar o ZInit, ferramenta que facilita a instalação e remoção de plugins no Zsh. Execute o comando <kbd>sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"</kbd> confirme a instalação até o fim.

Após essa instalação, vamos abrir o arquivo ~/.zshrc novamente executando <kbd>code ~/.zshrc</kbd> e abaixo da linha `### End of ZInit's installer chunk` que foi adicionada automaticamente no arquivo, adicionamos o seguinte código:
```
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
```

Esses são os plugins que utilizo e abaixo explico como funciona cada um deles:

- <kbd>zdharma/fast-syntax-highlighting</kbd>: Adiciona syntax highlighting na hora da escrita de comandos que facilita principalmente em reconhecer comandos que foram digitados de forma incorreta;
- <kbd>zsh-users/zsh-autosuggestions</kbd>: Sugere comandos baseados no histórico de execução conforme você vai digitando;
- <kbd>zsh-users/zsh-completions</kbd>: Adiciona milhares de completitions para ferramentas comuns como Yarn, Homebrew, NVM, Node, etc, para você precisar apenas apertar TAB para completar comandos.

Pronto, já temos um ambiente configurado com ferramentas nativas e com Zsh como shell padrão do Terminal Linux, tudo isso gerenciado dentro do Windows Terminal. Em breve trago algumas personalizações bacanas de adicionar, como deixar o Terminal com efeito acrílico, transparência, opacidade, e inclusive por background com gifs ou imagens estáticas, por enquanto é isso, espero que gostem.

Créditos e links de referência: 
- [@DevMozao](https://dev.to/devmozao/pt-br-rodando-oh-my-zsh-no-windows-86c#0-prologo)
- [Rocketseat](https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/)
