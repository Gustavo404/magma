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

<br>

## Feedback, Perguntas e Relatórios de Problemas

Se quiser contribuir para a melhoria contínua do projeto 'magma', tiver sugestões, perguntas ou encontrar algum problema, estou aqui para ajudar.

### Sugestões e Melhorias

Se você tiver sugestões ou ideias para melhorar o projeto 'magma', sinta-se à vontade para compartilhá-las. Você pode fazer isso das seguintes maneiras:

- **Pull Request (PR)**: Se você deseja contribuir diretamente com código, abra um Pull Request com suas alterações propostas. Analisaremos suas contribuições e trabalharemos juntos para incorporá-las ao projeto.

- **Issues**: Use as Issues para sugerir melhorias ou novos recursos. Descreva detalhadamente sua ideia para que eu possa entender e discutir como implementá-la.

### Relatórios de Problemas (Bugs)

Encontrou um bug ou problema em 'magma'? Você pode relatar problemas das seguintes maneiras:

- **Issues**: Abra uma Issue descrevendo o problema. Inclua informações relevantes, como o ambiente em que o erro ocorreu, etapas para reproduzi-lo e qualquer mensagem de erro que tenha recebido.

- **Site**: Você também pode reportar bugs em [gustavo404.com/sobre](https://www.gustavo404.com/sobre). Use os meios de contato para enviar detalhes sobre o problema encontrado.

### Perguntas e Suporte

Se você tiver alguma pergunta sobre como usar 'magma' ou precisar de suporte, Você pode fazer o seguinte:

- **Issues Existentes**: Verifique se já existe uma Issue relacionada à sua pergunta. Talvez a resposta que você procura já esteja lá.

- **Novas Issues**: Se sua pergunta não estiver coberta nas Issues existentes, sinta-se à vontade para criar uma nova Issue com sua pergunta. Ficarei feliz em responder e ajudar.

- **Contato pelo Site**: Você também pode entrar em contato conosco através do site [gustavo404.com/sobre](https://www.gustavo404.com/sobre). Utilize os meios de contato para enviar suas perguntas ou dúvidas.

Agradeço por sua contribuição, feedback e envolvimento na comunidade do projeto 'magma'.


## Licença

O código-fonte do projeto 'magma' é disponibilizado sob os termos da Licença Pública Geral GNU versão 2.0 (GPL 2.0). Isso significa que você é livre para usar, modificar e distribuir o código de acordo com os termos da GPL 2.0. Certifique-se de ler e entender os detalhes da licença antes de utilizar o projeto.e
