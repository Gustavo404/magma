import pandas as pd
from tqdm import tqdm
import time

# Função loader
def tarefa_demorada():
    for _ in tqdm(range(4), desc="Processando"):
        time.sleep(0.04)

# Leia o arquivo de texto magma.txt usando espaços como delimitadores
df = pd.read_csv('magma.txt', delimiter=' ')

# Loader
tarefa_demorada()

# Converta magma.txt para magma.xlsx
df.to_excel('magma.xlsx', index=False)
 