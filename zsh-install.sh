#!/bin/bash
# Script de instalação - ZSH shell
# Autor: Erick Garcia 
# Descrição: Instalação do Oh-my-zsh shell padrão

cd ~ || exit

for comando in "add-apt-repository ppa:git-core/ppa" "apt-get update -q" "apt-get upgrade -yq" 
do

    echo -e "Iniciando comando $comando..."
    if sudo $comando
    then
        echo "\e[00;32mSUCESSO\e[00m"
    else
        echo "\e[00;31mFALHA ao executar comando\e[00m $comando "
        exit 1
    fi
done

for pacote in git zsh
do
    echo -ne "\e[00;32mIniciando instalação do pacote\e[00m $pacote: "
    if sudo apt-get install -yq $pacote
    then
        echo -e "\e[00;32mSUCESSO\e[00m"
    else
        echo -e "\e[00;31mFALHA. Tentando recuperar quebra de pacotes\e[00m"
        if sudo apt-get install -f
        then
            echo  -e "\e[00;32mSucesso ao recuperar pacotes quebrados\e[00m"
        else
            echo -e "\e[00;31mFalha ao recuperar pacotes quebrados\e[00m"
        fi
    fi
done

# Verifica se existe o zsh no sistema...
if command -v zsh
then
    # Se sim, altera a shell padrão do usuário para o ZSH
    sudo chsh -s "$(command -v zsh)" "$USER"
else
    # Senão, exibe mensagem de erro e sai
    echo -e "\e[00;31mNão foi encontrado o executável do ZSH no sistema, saindo com erro...\e[00m"
    exit 1
fi

echo -e "\e[00;32mInstalação do Git e ZSH concluída com Êxito!!\e[00m"
echo -e "\e[00;32mFeche o terminal e abra novamente!!\e[00m"
exit 0