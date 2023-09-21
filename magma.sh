#!/bin/bash

# Função para mostrar mensagens coloridas
function color_message() {
  local color=$1
  local message=$2
  case $color in
    "red")
      echo -e "\e[91m$message\e[0m"
      ;;
    "green")
      echo -e "\e[92m$message\e[0m"
      ;;
    "blue")
      echo -e "\e[94m$message\e[0m"
      ;;
    "yellow")
      echo -e "\e[93m$message\e[0m"
      ;;
    *)
      echo "$message"
      ;;
  esac
}

# Diálogo de boas-vindas
clear
color_message "green" "Bem-vindo ao Obsidian"
echo -e "Este script irá filtrar as linhas com valores de dBm inferiores ao limite especificado."
echo -e "exemplos de valores:    maximo: -26    minimo: -39"
# Solicita o limite maximo de valor em dBm ao usuário
echo
color_message "yellow" "\n[...] Por favor, insira o limite maximo:"
read teto_dBm

# Solicita o limite minimo de valor em dBm ao usuário
echo
color_message "yellow" "\n[...] Por favor, insira o limite minimo inferior a $teto_dBm:"
read piso_dBm

# Solicita o nome do arquivo de entrada
echo
color_message "yellow" "[...] Agora, insira o nome do arquivo de entrada:"
read input

# Solicita o nome do arquivo de saída
echo
color_message "yellow" "[...] Insira o nome do arquivo de saída:"
read output

color_message "blue" "[ ! ] Efetuando alterações!"
# Aplicando o filtro com AWK usando o limite especificado
awk -v teto="$teto_dBm" -F'\t' '$2 >= teto' "$input" > .tmp
awk -v piso="$piso_dBm" -F'\t' '$2 <= piso' .tmp > "$output"

# Aplicando o filtro com SED para remover linhas vazias
sed -i '/^$/d' "$output"
sleep 0.5

# Verifica se o arquivo foi criado com sucesso
if [ -e "$output" ]; then
  color_message "green" "[!] O arquivo $output criado com sucesso!"
  rm .tmp
else
  color_message "red" "[!] Houve um erro ao criar o arquivo $output, verifique obsidian/.tmp"
fi

# Extrair clientes com sinal igual a -40 dBm
read -p "[?] Deseja extrair os clientes com sinal igual a -40 dBm? (Y/n)" response
if [ "$response" = "n" ] || [ "$response" = "N" ]; then
  color_message "yellow" "[ . ] Processo finalizado."
  sleep 1
  exit
else
  color_message "blue" "[...] Prosseguindo..."
  awk -F'\t' '$2 == -40' "$input" > 40dBm.txt
fi

# Mensagem de conclusão
color_message "green" "\nFiltro concluído com sucesso!"
echo -e "As linhas com valores de dBm superiores a $teto_dBm foram removidas."
echo -e "Os resultados foram salvos em \e[1m$output\e[0m."
