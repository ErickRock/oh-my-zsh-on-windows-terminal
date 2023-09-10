#!/usr/bin/zsh
# Script de instalação - ZSH Tools + Autocomplete
# Autor: @garciaeriickk e @ed_lsba - Twitter
# Descrição: Instalação do tema Spaceship padrão - em construção

# Verificação do diretório inicial
if cd; then
   echo -e "\e[33mIniciando script\e[0m"
else
   echo -e "\e[31mFalha ao iniciar o script: Não foi possível acessar o diretório inicial\e[0m"
   exit 1
fi

# Instalação do Oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
   echo -e "\e[33mIniciando instalação do Oh-my-zsh...\e[0m"
   yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
   echo -e "\e[32mOh-my-zsh já está instalado\e[0m"
fi

# Download do tema spaceship
if [ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
   echo -e "\e[33mIniciando download do tema spaceship...\e[0m"
   git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
else
   echo -e "\e[32mTema spaceship já está baixado\e[0m"
fi

# Criação do link simbólico
if [ ! -L "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme" ]; then
   if ln -s "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme"; then
      echo -e "\e[32mLink simbólico criado com sucesso\e[0m"
   else
      echo -e "\e[31mFalha ao criar link simbólico\e[0m"
   fi
else
   echo -e "\e[32mLink simbólico já existe\e[0m"
fi

# Configuração do tema Spaceship no arquivo ~/.zshrc
echo '# Configuração da interface do terminal com spaceship-prompt
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
SPACESHIP_CHAR_SYMBOL="->"
SPACESHIP_CHAR_SUFFIX=" "
# Fim da configuração do spaceship-prompt' >>~/.zshrc

# Instalação do Zinit com plugins
if [ ! -d "$HOME/.zinit" ]; then
   echo -e "\e[33mIniciando instalação do Zinit com plugins...\e[0m"
   sh -c "$(curl -fsSL https://git.io/zinit-install)"
else
   echo -e "\e[32mZinit já está instalado\e[0m"
fi

# Adição dos plugins ao arquivo ~/.zshrc se eles ainda não estiverem presentes.
if ! grep -q "Plugins for zdharma-continuum zinit" ~/.zshrc; then
   echo "### Plugins for zdharma-continuum zinit 
    zinit for \
    light-mode zdharma-continuum/fast-syntax-highlighting \
    light-mode zdharma-continuum/history-search-multi-word \
    light-mode zsh-users/zsh-autosuggestions \
    light-mode zsh-users/zsh-completions \
    light-mode spaceship-prompt/spaceship-prompt 
    ### End of Zinit's plugins" >>~/.zshrc
else
   echo -e "\e[32mPlugins já adicionados ao arquivo ~/.zshrc\e[0m"
fi

# Configuração do lançamento do Zsh no arquivo ~/.bashrc se ainda não estiver configurado.
if ! grep -q "Launch Zsh" ~/.bashrc; then
   echo "# Launch Zsh 
    if [ -t 1 ]; then 
        exec zsh 
    fi" >>~/.bashrc
else
   echo -e "\e[32mLançamento do Zsh já configurado no arquivo ~/.bashrc\e[0m"
fi

exec zsh
