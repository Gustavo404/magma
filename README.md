# Magma

[![C C17](https://img.shields.io/badge/Python-3.11-yellow)](https://www.python.org/) [![ShellScript Bash](https://img.shields.io/badge/ShellScript-Bash-blue)](https://www.gnu.org/software/bash/) [![Licença](https://img.shields.io/badge/Licen%C3%A7a-GPL%202.0-yellow)](https://github.com/gustavo404/magma/blob/main/LICENSE) [![Youtube](https://img.shields.io/badge/Youtube-Gustavo404-red.svg)](https://youtube.com/gustavo404)

<img src="magma.jpg" alt="Magma Logo" width="520">
  
## Descrição

Magma é um conjunto de scripts que gerenciam a saída de dados txt do _UNM2000_, permitindo renomear em massa os nomes de usuários (alterar o "device name"). Ele lê a saída de texto do _UNM2000_ informada pelo usuário e realiza as seguintes mudanças:

- Remove as linhas com o texto "PPPoE".
- Identifica os "ETH" com base nas posições nas colunas, delimitadas por espaços.
- Remove as informações referentes aos "ETH".
- Remove os IDs e IPs da lista.
- Corrige os MACs (XXXX-XXXX-XXXX > XX:XX:XX:XX:XX:XX).
- Salva essa lista em um arquivo de texto.
- Converte esse arquivo de saída em uma tabela visualizável (.xlsx).

<br>

## Dependências

O Magma requer o git para ser baixado:

```bash
apt-get install git
```

Você tambem pode baixar o pacote compactado!

<br>

## Instalação

Primeiro, baixe o Magma usando o git:

```bash
git clone https://github.com/Gustavo404/magma/
```

Depois, acesse o diretório do magma:

```bash
cd magma/
```

Por fim, execute o instalador:
```bash
bash install.sh
```

<br>

## Uso

Você precisará informar um arquivo de texto referente à saída do _UNM2000_:
```bash
bash magma.sh dadosUnm.txt
```
Após isso, o _magma.sh_ escreverá as mudanças num novo arquivo de texto, e executará o _magma.py_, que fará a conversão de _txt_ para _xlsx_.
