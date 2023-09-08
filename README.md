![fundo](.github/fundo.gif)

## Como usar o ZSH no Windows Terminal

Se você quer ter um terminal mais bonito e personalizado no seu Windows, este guia é para você. Neste guia, você vai aprender a: 
- Instalar o Windows Terminal, um aplicativo que permite usar vários terminais em uma única janela 
- Instalar o WSL (Windows Subsystem for Linux), um recurso que permite executar um ambiente Linux dentro do Windows 
- Instalar o Zsh, um shell interativo que oferece recursos avançados como autocompletar, corretor ortográfico e temas 
- Instalar o Oh My Zsh, um framework que facilita a configuração e o gerenciamento do Zsh Escolher e aplicar um tema Spaceship 

Com esses passos, você vai transformar o seu terminal em uma ferramenta poderosa e produtiva.

[![CI](https://github.com/ErickRock/oh-my-zsh-on-windows-terminal/actions/workflows/main.yml/badge.svg)](https://github.com/ErickRock/oh-my-zsh-on-windows-terminal/actions/workflows/main.yml)
[![Build Status](https://dev.azure.com/erickgarciadev/oh-my-zsh-on-windows-terminal/_apis/build/status/ErickRock.oh-my-zsh-on-windows-terminal?branchName=main)](https://dev.azure.com/erickgarciadev/oh-my-zsh-on-windows-terminal/_build/latest?definitionId=9&branchName=main)
[![GitHub forks](https://img.shields.io/github/forks/ErickRock/oh-my-zsh-on-windows-terminal)](https://github.com/ErickRock/oh-my-zsh-on-windows-terminal/network)
[![GitHub stars](https://img.shields.io/github/stars/ErickRock/oh-my-zsh-on-windows-terminal)](https://github.com/ErickRock/oh-my-zsh-on-windows-terminal/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/ErickRock/oh-my-zsh-on-windows-terminal)](https://github.com/ErickRock/oh-my-zsh-on-windows-terminal/issues)


**Índice**

- [Requisitos mínimos 🛠️](#requisitos-mínimos-️)
- [Visual Studio Code + Remote WSL 💻](#visual-studio-code--remote-wsl-)
- [Baixe e instale a fonte FiraCode Light TTF 🌟](#baixe-e-instale-a-fonte-firacode-light-ttf-)
- [Habilite o Hyper-V e o WSL via Powershell Admin ⚙️](#habilite-o-hyper-v-e-o-wsl-via-powershell-admin-️)
- [Instale uma Distro Linux 🐧](#instale-uma-distro-linux-)
- [Instale o Windows Terminal 🪟](#instale-o-windows-terminal-)
- [Atualizando o Kernel Linux no Windows 🔄](#atualizando-o-kernel-linux-no-windows-)
  - [Migrar a distro Existente para WSL 2 (Utilizará o Kernel nativo do Linux no Windows) 🚀](#migrar-a-distro-existente-para-wsl-2-utilizará-o-kernel-nativo-do-linux-no-windows-)
- [Utilizando o Linux 🐧](#utilizando-o-linux-)
  - [Execute o script de instalação do ZSH 🖥️](#execute-o-script-de-instalação-do-zsh-️)
  - [Execute o script de instalação do ZSH Tools + Pluguins 🛠️](#execute-o-script-de-instalação-do-zsh-tools--pluguins-️)
  - [Tema Spaceship 🌌](#tema-spaceship-)
    - [Instalando 🚀](#instalando-)
    - [Crie o link simbólico 🪝](#crie-o-link-simbólico-)
    - [Ativando o tema 🌈](#ativando-o-tema-)
    - [Pluguins inclusos 🧩](#pluguins-inclusos-)
- [Dicas 💡](#dicas-)
- [Changelog](#changelog)
  - [\[2.0.23\] - 2023-09-06](#2023---2023-09-06)
    - [🐛 Corrigido](#-corrigido)
    - [🚀 Melhorado](#-melhorado)
    - [➕ Adicionado](#-adicionado)


# Requisitos mínimos 🛠️

Para começar, você precisará baixar e instalar o [Visual Studio Code](https://code.visualstudio.com/Download), um editor de código-fonte popular e gratuito. Você pode fazer isso acessando o site oficial do VS Code e seguindo as instruções de instalação para o seu sistema operacional.

# Visual Studio Code + Remote WSL 💻

Após instalar o VS Code, instale também um pluguin chamado [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl). Ele servirá para abrir e editar arquivos do Linux de forma visual, sem precisar utilizar nano, vim e afins. O atalho para salvar arquivos que fora editados é `Ctrl + S` ✨

# Baixe e instale a fonte FiraCode Light TTF 🌟

Antes de tudo, [instale o pacote de fontes Fira Code](https://github.com/tonsky/FiraCode/releases/download/2/FiraCode_2.zip). Ela trará alguns efeitos bem legais ao utilizar símbolos no código ou no terminal. Você pode ver mais detalhes do projeto no perfil deles no [GitHub - Fira Code](https://github.com/tonsky/FiraCode).

# Habilite o Hyper-V e o WSL via Powershell Admin ⚙️

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

![Habilitando Hyper-V](/.github/pws1.png)

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

![Habilitando WSL](/.github/pws2.png)

**Observação:** Em algumas máquinas, pode ser necessário habilitar a virtualização na BIOS também.

# Instale uma Distro Linux 🐧

Você pode escolher e instalar uma distribuição Linux de sua preferência. [Clique aqui para baixar o Ubuntu](https://www.microsoft.com/pt-br/p/ubuntu/9nblggh4msv6?SilentAuth=1&wa=wsignin1.0&activetab=pivot:overviewtab).

# Instale o Windows Terminal 🪟

O [Windows Terminal](https://www.microsoft.com/pt-br/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab) é uma ferramenta poderosa para gerenciar terminais no Windows.

# Atualizando o Kernel Linux no Windows 🔄

Atualize o Kernel do Linux no Windows, [baixe o pacote de atualização do kernel do Linux para o WSL 2 para computadores x64](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).

## Migrar a distro Existente para WSL 2 (Utilizará o Kernel nativo do Linux no Windows) 🚀

Após instalar a atualização, execute o PowerShell como Administrador e digite o seguinte comando para listar suas distribuições Linux instaladas e verificar qual versão do WSL estão usando:

```powershell
wsl -l -v
```

![Listando Distribuições Linux](/.github/wsl1.png)

Agora, migre sua distribuição Linux existente para o WSL 2 executando o comando:

```powershell
wsl --set-version <distro name> 2
```

Substitua `<distro name>` pelo nome da sua distribuição, sem os sinais `<>`. A migração para o WSL 2 começará e, ao terminar, você poderá usar o Linux no Windows 10 vezes mais rápido do que com a versão WSL 1 anterior. 🚀

# Utilizando o Linux 🐧

Com todo o ambiente instalado e configurado, você já pode abrir o Windows Terminal e iniciar sua distribuição Linux preferida em novas abas.

## Execute o script de instalação do ZSH 🖥️

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ErickRock/oh-my-zsh-on-windows-terminal/main/zsh-install.sh)"
```

![Executando o Script ZSH Install](/.github/zshinstall.png)

Após a execução do comando, feche o terminal e abra-o novamente.

Ao reiniciar, escolha a opção 2 e pressione Enter. Feche o terminal novamente e abra-o para continuar com os comandos a seguir.

## Execute o script de instalação do ZSH Tools + Pluguins 🛠️

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ErickRock/oh-my-zsh-on-windows-terminal/main/tools-zsh-install.sh)" -y
```

![Executando o Script ZSH Tools](/.github/zshtools.png)

Na tela seguinte, digite `exit` e pressione Enter para permitir que o script continue.

## Tema Spaceship 🌌

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
    <a href="https://github.com/denys

dovhan/spaceship-prompt/blob/master/README.md#features">Features</a> |
<a href="https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md">Opções</a> |
<a href="https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/API.md">API</a>

  </h4>
</div>

<div align="center">
  <sub>Feito com ❤︎ por
  <a href="https://denysdovhan.com">Denys Dovhan</a> e
  <a href="https://github.com/denysdovhan/spaceship-prompt/graphs/contributors">colaboradores </a>
</div>

### Instalando 🚀

```bash
sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
```

![Clonando Spaceship](/.github/space-download.png)

### Crie o link simbólico 🪝

```bash
sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

![Criando Link Simbólico](/.github/space-link.png)

### Ativando o tema 🌈

Digite `code ~/.zshrc` e pressione Enter para abrir o VS Code e editar o arquivo. Altere o campo `ZSH_THEME="fino"` para `ZSH_THEME="spaceship"` e salve. Pronto, você acabou de mudar o tema. 🌟

![Editando o arquivo .zshrc](/.github/spaceship.gif)

### Pluguins inclusos 🧩

Esses são os plugins inclusos, e abaixo explico como cada um deles funciona:

- `zdharma/fast-syntax-highlighting`: Adiciona syntax highlighting na hora da escrita de comandos, facilitando principalmente o reconhecimento de comandos digitados incorretamente. 🎨
- `zsh-users/zsh-autosuggestions`: Sugere comandos baseados no histórico de execução enquanto você digita. 💡
- `zsh-users/zsh-completions`: Adiciona milhares de completions para ferramentas comuns como Yarn, Homebrew, NVM, Node, etc. Você só precisa apertar TAB para completar comandos. 🚀

# Dicas 💡

Você pode acessar toda a estrutura de arquivos da distribuição Linux instalada no caminho `\\wsl$`, da mesma forma que acessa um servidor, pasta, etc. É possível deixar um mapeamento de rede deste caminho, caso prefira.

# Changelog

## [2.0.23] - 2023-09-06

### 🐛 Corrigido

- [Corrigido o erro de ortografia na palavra "Pluguins"], que agora está escrita corretamente como "Plugins". Afinal, não queremos que o nosso ZSH fique plugado, né? 😂
- [Corrigido o erro de sintaxe no script de instalação do ZSH Tools + Plugins], que agora usa o operador `&&` em vez de `||` para garantir a execução sequencial dos comandos. Assim, evitamos que o script pare no meio do caminho ou faça coisas que não deveria. 🙈
- [Corrigido o bug que impedia o início do ZSH ao fim do script de instalação], que agora usa o comando `exec zsh` para substituir o shell atual pelo ZSH. Agora sim, podemos desfrutar do nosso ZSH sem precisar fechar e abrir o terminal novamente. 🎉

### 🚀 Melhorado

- [Melhorado o processo de integração contínua (CI) no GitHub e no Azure], que agora usa o apt-fast para acelerar a instalação de pacotes no Linux. Quem não gosta de uma instalação mais rápida e eficiente, não é mesmo? 😎
- [Melhorado o tema Spaceship para usar o novo projeto zdharma-continuum zinit], que é um fork do antigo projeto zdharma zinit que foi descontinuado. Assim, garantimos que o nosso tema continue funcionando e recebendo atualizações. Além disso, o nome zdharma-continuum é bem mais legal, parece até filme de ficção científica. 🚀

### ➕ Adicionado

- [Adicionado temas padrões do Oh My Zsh], que são temas simples e elegantes para o ZSH. Você pode escolher entre os temas robbyrussell, agnoster, bira, candy, etc. Tem para todos os gostos e estilos. Qual é o seu favorito? 😍


¹: [v.2.0.23 Fixed #8, #9](^1^)

²: [Sintaxe || corrigida para &&](^2^)

³: [Inicia o zsh ao fim do script](^3^)

⁴: [implementado apt-fast](^4^)

⁵: [Update to use new zdharma-continuum zinit project](^5^)

⁶: [🎨 Adicionado Temas Padrões](^6^)


Créditos e links de referência:

- [@DevMozao](https://dev.to/devmozao/pt-br-rodando-oh-my-zsh-no-windows-86c#0-prologo) 🌐
- [Rocketseat](https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/) 🚀
