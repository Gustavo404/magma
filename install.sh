#!/bin/bash

# Função para exibir uma mensagem colorida
print_color_message() {
  local message="$1"
  local color="$2"

  case "$color" in
    "red")
      echo -e "\e[91m$message\e[0m"
      ;;
    "green")
      echo -e "\e[92m$message\e[0m"
      ;;
    "yellow")
      echo -e "\e[93m$message\e[0m"
      ;;
    "blue")
      echo -e "\e[94m$message\e[0m"
      ;;
    *)
      echo "$message"
      ;;
  esac
}

# Verificar se o script está sendo executado como root
if [ "$EUID" -eq 0 ]; then
	echo
  	print_color_message "Devido às dependências PIP, este script não pode ser executado como superusuário (root)." "red"
	print_color_message "Reinicie a instalação com um usuário com SUID diferente de 0." "red"
	print_color_message "Se estiver tendo problemas com o sudo, instale as dependências manualmente." "yellow"
	exit 1
fi

# Instalar dependências do sistema com apt usando root
echo
print_color_message "Atualizando o sistema..." "blue"
sudo apt update
sudo apt install -y python3 python3-pip

# Verificar se o comando apt foi executado com sucesso
if [ $? -ne 0 ]; then
	print_color_message "Falha ao instalar as dependências do sistema usando apt." "red"
	exit 1
fi

# Instalar dependências do Python com pip como o usuário atual
echo
print_color_message "Instalando dependências do Python usando pip..." "blue"
pip install openpyxl pandas tqdm

# Verificar se o comando pip foi executado com sucesso
if [ $? -ne 0 ]; then
	print_color_message "Falha ao instalar as dependências do Python usando pip." "red"
	exit 1
fi

# Indicar que a instalação foi concluída com sucesso

print_color_message "Instalação concluída com sucesso." "green"
