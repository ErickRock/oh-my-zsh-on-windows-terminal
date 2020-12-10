#!/usr/bin/zsh
# Script de instalação - ZSH Tools + Autocomplete 
# Autor: @rickkgarciia e @ed_lsba - Twitter
# Descrição: Instalação do tema Spaceship padrão - em construção
#Instala ZSH Tools via curl
if cd
then
   echo "\033[0;32m Iniciando script\033[0m \033[1;33m$0\033[0m"
else
   echo "\033[0;31mFalha ao acessar diretório \033[1;33m${HOME}\033[0m, saindo com erro\033[0m"
   exit 1

fi

#Instalação do Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Download do tema spaceship
#git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

####------erro abaixo-------#
##Print do erro durante a instalação: https://i.imgur.com/go3xX2j.png
##Aprentemente da problema ao tentar criar o seguinte link simbólico
#Gerando link simbólico
#ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#Setando o tema para spaceship e iniciando o zsh
#Alterado para o fino pois o Spaceship está com o erro nos comentários acima
sed -i 's/robbyrussell/fino/' ~/.zshrc

#Adição de configuração do spaceship no arquivo ~/.zshrc
echo '#Configuração da interface do terminal
SPACESHIP_PROMPT_ORDER=(
   user          # Use,rname section
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
SPACESHIP_CHAR_SUFFIX=" "' >> ~/.zshrc

#Instalação do Zinit com plubuins e confirmação do fim do script
 < y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"


#Adição dos pluguins 
sudo echo "zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions" >> ~/.zshrc
