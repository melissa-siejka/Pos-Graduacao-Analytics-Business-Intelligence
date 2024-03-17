# 1. Importação das bibliotecas necessárias

import ftplib
import os
import patoolib

# 2. Endereço do FTP
ftp = ftplib.FTP("ftp.mtps.gov.br")

# 3. Informações de login. Não há necessidade de informar neste caso
ftp.login()

# 4. Indica para qual pasta navegar.
ftp.cwd('/pdet/microdados/RAIS/2021')

diretorios_disponiveis = ftp.nlst()

# 5. Exibe os diretórios disponíveis para selecionar
print("Diretórios disponíveis:")
for diretorio in diretorios_disponiveis:
    print(diretorio)

# esses caminhos serão utilizados para salvar os arquivos baixados e extraidos.
caminho_pasta = 'C:/Python/RAIS/Estabelecimentos/2021_'
caminho_pasta_txt = 'C:/Python/RAIS/Estabelecimentos/Anual'


# 6. Limpa o caminho do diretório se for executado novamente

try:
    os.remove(caminho_pasta + 'RAIS_ESTAB_PUB.7z')
except:
    # e caso eles não existam, apenas passe para o próximo comando.
    pass

#7. Captura os dados pelo servidor e realiza o download

def getFile(ftp, filename):
    try:
        ftp.retrbinary("RETR " + filename, open(caminho_pasta + filename, 'wb').write)
    except:
        print("Error")

getFile(ftp, 'RAIS_ESTAB_PUB.7z')

# 8. Descompactar e converter para csv

try:
    patoolib.extract_archive(caminho_pasta + "RAIS_ESTAB_PUB.7z", outdir=caminho_pasta_txt, program="C/Program Files/7-Zip/7z.exe")
except patoolib.util.PatoolError as e:
    print(f"Erro ao extrair o arquivo: {e}")

# 9. Feche a conexão FTP quando não for mais necessária

ftp.quit()


