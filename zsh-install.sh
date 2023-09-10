#!/bin/bash
# Script de instalação - ZSH shell
# Autor: ErickRock
# Descrição: Instalação do Oh-my-zsh shell padrão

cd ~ || exit

# Instalação do Git
echo -e "\e[33mIniciando instalação do Git...\e[0m"
sudo apt-get install -y git

# Verifica se o Git já está instalado
if command -v git >/dev/null 2>&1; then
    echo -e "\e[32mGit já está instalado\e[0m"
else
    echo -e "\e[31mFalha ao instalar o Git\e[0m"
    exit 1
fi

# Verifica se o ZSH já está instalado
if command -v zsh >/dev/null 2>&1; then
    echo -e "\e[32mZSH já está instalado\e[0m"
else
    # Instalação do ZSH
    echo -e "\e[33mIniciando instalação do ZSH...\e[0m"
    sudo apt-get install -y zsh
fi

echo -e "\e[32mInstalação do Git e ZSH concluída com sucesso!\e[0m"
