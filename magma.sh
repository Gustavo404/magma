#!/bin/bash

# Definindo nomes de arquivos como variáveis
arquivo_alvo="$1"
arquivo_temp_1="1.tmp.txt"
arquivo_temp_2="2.tmp.txt"

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
    *)
      echo "$message"
      ;;
  esac
}

# Limpar a tela (favor não questionar a necessidade desta linha)
clear

# ...

# Remova as linhas com "PPPoE"
cat "$arquivo_alvo"
echo
echo
color_message "blue" "[!] Removendo linhas com PPPoE - Pressione Enter para prosseguir"
read
awk '!/PPPoE/' "$arquivo_alvo" > "$arquivo_temp_1"

# Identifique ETH
cat "$arquivo_temp_1"
echo
eth="$(awk 'NR>300 {print $3; exit}' "$arquivo_temp_1")"
color_message "green" "[!] ETH = $eth"
read -p "[?] Isto está correto? (Y/n)" input
if [ "$input" = "n" ]; then
  color_message "red" "[!] Abortar!"
  sleep 1
  exit
else
  color_message "blue" "[...] Prosseguindo..."
fi
color_message "blue" "[!] Removendo ETH - Pressione Enter para prosseguir"
read

# Remova o "ETH"
awk -v eth="$eth" '{gsub(eth, "");}1' "$arquivo_temp_1" > "$arquivo_temp_2"

# Remova o conteúdo da primeira e terceira coluna, referentes aos IDs e IPs, delimitadas por espaços
cat "$arquivo_temp_2"
color_message "blue" "[!] Removendo IPs e IDs - Pressione Enter para prosseguir"
read
awk '{$1=""; $3=""; sub(/^ +/, "")}1' "$arquivo_temp_2" > "$arquivo_temp_1"

# Mude o formato do MAC de XXXX-XXXX-XXXX para XX:XX:XX:XX:XX:XX
cat "$arquivo_temp_1"
color_message "blue" "[!] Formatando MAC de XXXX-XXXX-XXXX para XX:XX:XX:XX:XX:XX - Pressione Enter para prosseguir"
read
awk '{gsub(/-/, "", $2); mac = $2; gsub(/../, "&:", mac); mac = substr(mac, 1, length(mac)-1); print $1, mac;}' "$arquivo_temp_1" | sed 's/:$//' > magma.txt

# Debug
# awk '{ mac = $2; gsub(/-/, "", mac); gsub(/../, "&:", mac); mac = substr(mac, 1, length(mac)-1); print $1, mac;}' "$arquivo_temp_1" | sed 's/:$//' > drax.txt

cat magma.txt
color_message "green" "[!] Etapa 1 finalizada!"
sleep 0.3
echo
color_message "blue" "[!] Preparando para converter arquivo para XLSX"
sleep 0.2
color_message "blue" "[...] iniciando magma.py..."

# Execução do script de conversão magma.py
python3 magma.py

# Verifique se o arquivo magma.xlsx foi criado
# Se sim, anuncie e limpe o diretorio
# se não, anuncie e mantenha os arquivos temp

arquivo="magma.xlsx"

if [ -e "$arquivo" ]; then
  color_message "green" "[!] O arquivo $arquivo foi criado com sucesso!"
  color_message "green" "[!] Processo finalizado."
  rm arquivo_temp_1
  rm arquivo_temp_2
else
  color_message "red" "[!] Houve um erro ao converter magma.txt em $arquivo."
  color_message "red" "[!] Verifique se as dependências foram instaladas corretamente."
fi