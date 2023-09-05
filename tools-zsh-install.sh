#!/usr/bin/zsh
# Script de instalação - ZSH Tools + Autocomplete 
# Autor: @rickkgarciia e @ed_lsba - Twitter
# Descrição: Instalação do tema Spaceship padrão - em construção

# Verificação do diretório inicial
if cd; then
   echo "\033[0;32m Iniciando script\033[0m \033[1;33m$0\033[0m"
else
   echo "\033[0;31mFalha ao acessar diretório \033[1;33m${HOME}\033[0m, saindo com erro\033[0m"
   exit 1
fi

# Instalação do Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download do tema spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# Criação do link simbólico
if ln -s "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme"; then
   echo "Link simbólico criado com sucesso"
else
   echo "Falha ao criar link simbólico"
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
# Fim da configuração do spaceship-prompt' >> ~/.zshrc

# Instalação do Zinit com plugins
sh -c "$(curl -fsSL https://git.io/zinit-install)"

# Adição dos plugins 
echo "### Plugins for zdharma-continuum zinit
zinit for \
   light-mode zdharma-continuum/fast-syntax-highlighting \
   light-mode zdharma-continuum/history-search-multi-word \
   light-mode zsh-users/zsh-autosuggestions \
   light-mode zsh-users/zsh-completions \
   light-mode spaceship-prompt/spaceship-prompt
### End of Zinit's plugins" >> ~/.zshrc

# Configuração do lançamento do Zsh no arquivo ~/.bashrc
echo "# Launch Zsh
if [ -t 1 ]; then
exec zsh
fi" >> ~/.bashrc

exec zsh
