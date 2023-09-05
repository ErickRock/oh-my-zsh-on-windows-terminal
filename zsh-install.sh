#!/bin/bash
# Script de instalação - ZSH shell
# Autor: ErickRock
# Descrição: Instalação do Oh-my-zsh shell padrão

cd ~ || exit

# Instalação do Git
echo "Iniciando instalação do Git..."
sudo apt-get install -y git

# Verifica se o Git já está instalado
if command -v git >/dev/null 2>&1
then
    echo "Git já está instalado"
else
    echo "Falha ao instalar o Git"
    exit 1
fi

# Verifica se o ZSH já está instalado
if command -v zsh >/dev/null 2>&1
then
    echo "ZSH já está instalado"
else
    # Instalação do ZSH
    echo "Iniciando instalação do ZSH..."
    sudo apt-get install -y zsh
fi

echo "Instalação do Git e ZSH concluída com sucesso!"

return
