![](/.github/fundo.gif)

**Índice**

- [Requisitos mínimos](#requisitos-m%c3%adnimos)
  - [Visual Studio Code + Remote WSL](#visual-studio-code--remote-wsl)
  - [Baixe e instale a fonte FiraCode Light TTF](#baixe-e-instale-a-fonte-firacode-light-ttf)
  - [Habilite o Hyper-V e o WSL via Powershell Admin](#habilite-o-hyper-v-e-o-wsl-via-powershell-admin)
  - [Instale uma Distro linux](#instale-uma-distro-linux)
  - [Instale o Windows Terminal](#instale-o-windows-terminal)
  - [Atualizando o Kernel Linux no Windows](#atualizando-o-kernel-linux-no-windows)
    - [Migrar a distro Existente para WSL 2 (Utilizará o Kernel nativo do Linux no Windows)](#migrar-a-distro-existente-para-wsl-2-utilizar%c3%a1-o-kernel-nativo-do-linux-no-windows)
- [Utilizando o Linux](#utilizando-o-linux)
  - [Execute o script de instalação do ZSH](#execute-o-script-de-instala%c3%a7%c3%a3o-do-zsh)
    - [Execute o script de instalação do ZSH Tools + Pluguins](#execute-o-script-de-instala%c3%a7%c3%a3o-do-zsh-tools--pluguins)
    - [Tema Spaceship](#tema-spaceship)
    - [Instalando](#instalando)
    - [Crie o link simbólico](#crie-o-link-simb%c3%b3lico)
    - [Ativando o tema](#ativando-o-tema)
    - [Pluguins inclusos](#pluguins-inclusos)
- [Dicas](#dicas)

# Requisitos mínimos
- Windows 10 Versão 2004
- - Hyper-V ativado
- - Subsistema do Windows para Linux ativado
- - Uma distribuição Linux instalada
- - Fonte Firacode instalado
- - Visual Studio Code
- Uma distribuição linux instalada

## Visual Studio Code + Remote WSL

Baixe e instale o <a href="https://code.visualstudio.com/Download">Visual Studio Code</a>. 
Após instalar o VS Code, instale também um pluguin chamado <a href="https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl">Remote - WSL </a>. Ele servirá para abrir e editar arquivos do Linux de forma visual, sem precisar utilizar nano, vim e afins. O atalho para salvar arquivos que fora editados é `Ctrl + S`

## Baixe e instale a fonte FiraCode Light TTF

Antes de tudo, [instale o pacote de fontes Fira Code](https://github.com/tonsky/FiraCode/releases/download/2/FiraCode_2.zip), ela trará alguns efeitos bem legais ao utilizar símbolos no código ou no terminal. Você pode ver mais detalhes do projeto no perfil deles no [GitHub - Fira Code](https://github.com/tonsky/FiraCode)

<a href="https://github.com/tonsky/FiraCode/releases/download/4/Fira_Code_v4.zip"><img src="https://raw.githubusercontent.com/tonsky/FiraCode/master/extras/download.png" width="520" height="130"></a>

## Habilite o Hyper-V e o WSL via Powershell Admin

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

![](/.github/pws1.png)

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

![](/.github/pws2.png)

**OBS: Algumas máquinas é necessário habilitar a virtualização na bios também**

## Instale uma Distro linux
<a href="https://www.microsoft.com/pt-br/p/ubuntu/9nblggh4msv6?SilentAuth=1&wa=wsignin1.0&activetab=pivot:overviewtab"><img src="https://store-images.s-microsoft.com/image/apps.63954.13510798887446365.018f40a9-2b3c-4ff8-bb22-6247f3e8bb82.2b3e22de-e0e8-4c6d-bac4-cf78a8b03158?mode=scale&q=90&h=270&w=270&background=%23E95420" width="200" height="200"></a>

## Instale o Windows Terminal

<a href="https://www.microsoft.com/pt-br/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab"><img src="https://store-images.s-microsoft.com/image/apps.22832.13926773940052066.96ea379b-9e7a-49f1-8cee-25ed75770e30.dcdc888f-85a5-4182-8126-245f0757ef3a?mode=scale&q=90&h=300&w=200" width="200" height="300"></a>

## Atualizando o Kernel Linux no Windows

Atualize o Kernel do Linux no Windows, <a href="https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi">Baixe o pacote de atualização do kernel do Linux para o WSL 2 para computadores x64</a>.

### Migrar a distro Existente para WSL 2 (Utilizará o Kernel nativo do Linux no Windows)

Com o update instalado, execute o Powershell como Admin e digite `wsl -l -v`, este comando listará suas distros Linux instaladas, e qual WSL está usando. 

![](/.github/wsl1.png)

Agora digite `wsl --set-version <distro name> 2` substitua distro name pelo nome da sua distro, sem os sinais <> ,a migração para WSL 2 iniciará, e ao fim disso poderá usar o Linux no Windows 10x mais rápido do que a versão WSL 1 que estava instalada antes.

![](/.github/wsl2.png)

# Utilizando o Linux

Com todo ambiente instalado e configurado, você já pode abrir o Windows Terminal, e iniciar a distro que instalou normalmente em novas abas.

## Execute o script de instalação do ZSH

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ErickRock/oh-my-zsh-on-windows-terminal/master/zsh-install.sh)"
```

![](/.github/zshinstall.png)

Ao fim do comando, feche o terminal e abra novamente.

Entre com a opção 2 e tecle enter. Feche o no fim do processo. Abra ele novamente para continuar os comandos seguintes.

![](/.github/default.png)

### Execute o script de instalação do ZSH Tools + Pluguins

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ErickRock/oh-my-zsh-on-windows-terminal/master/tools-zsh-install.sh)" -y
```

![](/.github/zshtools.png)

Nessa seguinte tela entre com `exit` e tecle enter para o sript continuar.

![](/.github/exit.png)

### Tema Spaceship

<h1 align="center">
  <a href="https://github.com/denysdovhan/spaceship-prompt">
    <img alt="spaceship →~ prompt" src="https://cloud.githubusercontent.com/assets/3459374/21679181/46e24706-d34b-11e6-82ee-5efb3d2ba70f.png" width="400">
  </a>
  <br>🚀⭐ Spaceship ZSH <br>
</h1>

<h4 align="center">
  <a href="http://zsh.org" target="_blank"><code>Zsh</code></a> prompt for Astronauts.
</h4>

<p align="center">
  <!-- NPM Version -->
    <a href="https://npmjs.org/package/spaceship-prompt">
    <img src="https://img.shields.io/npm/v/spaceship-prompt.svg?style=flat-square"
      alt="NPM Version" />
  </a>

  <a href="https://travis-ci.org/denysdovhan/spaceship-prompt">
    <img src="https://img.shields.io/travis/denysdovhan/spaceship-prompt.svg?style=flat-square"
      alt="CI Status" />
  </a>

  <a href="http://zsh.org/">
    <img src="https://img.shields.io/badge/zsh-%3E%3Dv5.2-777777.svg?style=flat-square"
      alt="Zsh Version" />
  </a>

  <a href="https://twitter.com/SpaceshipZSH">
    <img src="https://img.shields.io/badge/twitter-%40SpaceshipZSH-00ACEE.svg?style=flat-square"
      alt="Spaceship ZSH Twitter" />
  </a>

  <a href="https://patreon.com/denysdovhan">
    <img src="https://img.shields.io/badge/support-patreon-F96854.svg?style=flat-square"
      alt="Donate" />
  </a>
</p>

<div align="center">
  <h4>
    <a href="https://denysdovhan.com/spaceship-prompt/">Website</a> |
    <a href="#instalando">Instalando</a> |
    <a href="https://github.com/denysdovhan/spaceship-prompt/blob/master/README.md#features">Features</a> |
    <a href="https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md">Opções</a> |
    <a href="https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/API.md">API</a>
  </h4>
</div>

<div align="center">
  <sub>Built with ❤︎ by
  <a href="https://denysdovhan.com">Denys Dovhan</a> and
  <a href="https://github.com/denysdovhan/spaceship-prompt/graphs/contributors">contributors </a>
</div>

### Instalando

```bash
sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
```
![](/.github/space-download.png)

### Crie o link simbólico

```bash
sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
![](/.github/space-link.png)

### Ativando o tema

Digite code `code ~/.zshrc` e tecle enter que abrirá o VS Code para editar o arquivo, edite o campo `ZSH_THEME="fino"` para `ZSH_THEME="spaceship"` e salve. Pronto, você acabou de mudar o tema.

![](/.github/spaceship.gif)

### Pluguins inclusos

Esses são os plugins inclusos e abaixo explico como funciona cada um deles:

- `zdharma/fast-syntax-highlighting`: Adiciona syntax highlighting na hora da escrita de comandos que facilita principalmente em reconhecer comandos que foram digitados de forma incorreta.
- `zsh-users/zsh-autosuggestions`: Sugere comandos baseados no histórico de execução conforme você vai digitando.
- `zsh-users/zsh-completions`: Adiciona milhares de completitions para ferramentas comuns como Yarn, Homebrew, NVM, Node, etc, para você precisar apenas apertar TAB para completar comandos.

# Dicas

Você pode acessar toda a estrutura de arquivos da Distro instalada no caminho `\\wsl$` da mesma forma que acessa um servidor, pasta e etc. É possível deixar um mapeamento de rede deste caminho caso preferir.

Créditos e links de referência: 

- [@DevMozao](https://dev.to/devmozao/pt-br-rodando-oh-my-zsh-no-windows-86c#0-prologo)
- [Rocketseat](https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/)
