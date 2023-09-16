# Magma

[![Python](https://img.shields.io/badge/Python-yellow)](https://pt.wikipedia.org/wiki/C_(linguagem_de_programa%C3%A7%C3%A3o)) [![Bash](https://img.shields.io/badge/Bash-blue)](url) [![Licença](https://img.shields.io/badge/Licen%C3%A7a-GPL%202.0-yellow)](https://github.com/gustavo404/wildlist/blob/main/LICENSE) [![Youtube](https://img.shields.io/badge/Youtube-Gustavo404-red.svg)](https://youtube.com/gustavo404)

## Descrição

Magma é um conjunto de scripts que gerenciam a saída de dados txt do _UNM2000_, permitindo renomear em massa os nomes de usuários (alterar o "device name"). Ele lê a saída de texto do _UNM2000_ informada pelo usuário e realiza as seguintes mudanças:

- Remove as linhas com o texto "PPPoE".
- Identifica os "ETH" com base nas posições nas colunas, delimitadas por espaços.
- Remove as informações referentes aos "ETH".
- Remove os IDs e IPs da lista.
- Corrige os MACs (XXXX-XXXX-XXXX > XX:XX:XX:XX:XX:XX).
- Salva essa lista em um arquivo de texto.
- Converte esse arquivo de saída em uma tabela visualizável (.xlsx).

## Dependências

O Magma requer apenas o git para ser baixado:

```bash
apt-get install git
```

Após isso, o arquivo [install](https://github.com/gustavo404/wildlist/blob/main/install) instalará o _awk_ e o _python_ via apt, junto com o módulo pandas do Python via pip. Para mais informações, clique [aqui](https://github.com/gustavo404/wildlist/blob/main/install).

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
## Uso

Você precisará informar um arquivo de texto referente à saída do _UNM2000_:
```bash
bash magma.sh dadosUnm.txt
```
Após isso, o _magma.sh_ executará o _magma.py_, que fará a conversão de _txt_ para _xlsx_.

## Links

Você também pode baixar o código no pacote compactado:

[![backup](https://img.shields.io/badge/backup-tar%20gz-blueviolet)](https://github.com/Gustavo404/wildlist/raw/main/wildlist)
