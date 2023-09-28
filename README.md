# Magma

[![Python 3.11](https://img.shields.io/badge/Python-3.11-yellow)](https://www.python.org/) [![ShellScript Bash](https://img.shields.io/badge/ShellScript-Bash-blue)](https://www.gnu.org/software/bash/) [![Licença](https://img.shields.io/badge/Licen%C3%A7a-GPL%202.0-yellow)](https://github.com/gustavo404/magma/blob/main/LICENSE) [![Youtube](https://img.shields.io/badge/Youtube-Gustavo404-red.svg)](https://youtube.com/gustavo404)

<img src="magma.jpg" alt="Magma Logo" width="520">
  
## Descrição

Magma é um conjunto de scripts que gerenciam a saída de dados do terminal do _BRAS_, facilitando a renomeação em massa dos nomes de usuários (alterar o "device name"). Ele lê um arquivo de texto informada pelo usuário e realiza as seguintes mudanças:

1. Remove as linhas com o texto "PPPoE".
2. Identifica os "ETH" com base nas posições nas colunas, delimitadas por espaços.
3. Remove as informações referentes aos "ETH".
4. Remove os IDs e IPs da lista.
5. Corrige os MACs (XXXX-XXXX-XXXX > XX:XX:XX:XX:XX:XX).
6. Salva essa lista em um arquivo de texto.
7. Converte esse arquivo de saída em uma tabela visualizável (.xlsx).

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

Você precisará informar um arquivo de texto referente à saída do _BRAS_:

```bash
bash magma.sh dadosBras.txt
```

Após isso, o _magma.sh_ escreverá as mudanças num novo arquivo de texto, e executará o _magma.py_, que fará a conversão de _txt_ para _xlsx_.

<br>

## Documentação

### Código 1: `install.sh`

Este script, `install.sh`, é responsável por instalar as dependências necessárias para o projeto 'magma'. Ele realiza as seguintes tarefas:

1. Verifica se o script está sendo executado como root (superusuário) e fornece uma mensagem de erro se for o caso.

2. Atualiza o sistema e instala as dependências do sistema, como Python 3 e Python 3-pip, usando o gerenciador de pacotes `apt`.

3. Verifica se a instalação das dependências do sistema foi bem-sucedida.

4. Instala as dependências do Python, como openpyxl, pandas e tqdm, usando o gerenciador de pacotes `pip`.

5. Verifica se a instalação das dependências do Python foi bem-sucedida.

6. Exibe uma mensagem indicando que a instalação foi concluída com sucesso.

### Código 2: `magma.sh`

O script `magma.sh` é o núcleo do projeto 'magma'. Ele lê um arquivo de texto contendo uma saída do terminal _BRAS_ e realiza várias etapas de processamento. Aqui está uma visão geral das principais tarefas realizadas:

1. Define nomes de arquivos como variáveis para facilitar a referência posterior.

2. Exibe mensagens coloridas para fornecer informações visuais ao usuário.

3. Remove linhas contendo "PPPoE" do arquivo alvo.

4. Identifica o valor de "ETH" com base na posição das colunas e verifica com o usuário se a identificação está correta.

5. Remove informações relacionadas a "ETH" do arquivo.

6. Remove conteúdo das primeira e terceira colunas, que contêm IDs e IPs, delimitados por espaços.

7. Formata o formato do MAC de XXXX-XXXX-XXXX para XX:XX:XX:XX:XX:XX.

8. Salva a saída em um arquivo temporário.

9. Inicia o script Python `magma.py` para converter o arquivo temporário em um arquivo XLSX.

10. Verifica se o arquivo XLSX foi criado com sucesso. Se sim, anuncia o sucesso e limpa os arquivos temporários.

### Código 3: `magma.py`

O script `magma.py` é responsável por converter o arquivo de texto resultante do processamento realizado pelo `magma.sh` em um arquivo XLSX. Aqui estão as principais tarefas realizadas:

1. Importa as bibliotecas necessárias, incluindo `pandas` e `tqdm`.

2. Define uma função `tarefa_demorada()` para simular uma tarefa demorada com uma barra de progresso.

3. Lê o arquivo de texto `magma.txt` usando espaços como delimitadores e cria um DataFrame pandas.

4. Aplica uma barra de progresso para simular o processo de conversão.

5. Converte o DataFrame para um arquivo XLSX chamado `magma.xlsx`.

Este script é usado pelo `magma.sh` para realizar a etapa de conversão de formato. O uso do `tqdm` cria uma animação de progresso para melhorar a experiência do usuário durante a conversão.

Esta é uma visão geral da funcionalidade dos três scripts que compõem o projeto 'magma'. Eles trabalham em conjunto para processar, formatar e converter dados de saída do _BRAS_ em um formato XLSX mais legível.

<br>


## Feedback, Perguntas e Relatórios de Problemas

Se quiser contribuir para a melhoria do projeto 'magma', sugestões, perguntas ou encontrar algum problema, estou aqui para ajudar.

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

O código-fonte do projeto 'magma' é disponibilizado sob os termos da Licença Pública Geral GNU versão 2.0 (GPL 2.0). Isso significa que você é livre para usar, modificar e distribuir o código de acordo com os termos da GPL 2.0. Certifique-se de ler e entender os detalhes da licença antes de utilizar o projeto.
