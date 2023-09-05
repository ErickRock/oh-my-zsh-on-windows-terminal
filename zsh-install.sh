#!/bin/bash
# Script de instalação - ZSH shell
# Autor: ErickRock
# Descrição: Instalação do Oh-my-zsh shell padrão

cd ~ || exit

for comando in "apt-get update -q" "apt-get upgrade -yq"
do
    echo "Executando comando: $comando..."
...(17 lines omitted)...
        if sudo apt-get install -f
        then
            echo "Pacotes quebrados recuperados com sucesso."
        else
            echo "Falha ao recuperar pacotes quebrados."
        fi
    fi
done

echo "Instalação do Git e ZSH concluída com êxito!"