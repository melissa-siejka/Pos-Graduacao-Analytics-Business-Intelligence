**Importação de Microdados RAIS (MTE)** 

- Processo de importação dos microdados da RAIS, disponibilizados pelo site do Ministério do Trabalho http://pdet.mte.gov.br/microdados-rais-e-caged.
Neste código, foi realizada através de bibliotecas do Python a importação e download dos arquivos do servidor FTP, apontamento em um diretório local, e descompactação para arquivo txt, que serão utilizado em um SGBD posteriormente.

**Cálculo do Quociente Locacional**

Este script cria a tabela fato essencial para o cálculo do Quociente Locacional (QL), uma métrica crucial na análise de Economia Regional. A tabela resultante agrega informações cruciais sobre empregos nos municípios do Paraná, oferecendo uma visão abrangente das atividades econômicas. As informações incluídas são:

Total de empregos por subclasse e município no Paraná (Sub).
Total de empregos gerais no município (Emp).
Total de empregos da subclasse em todo o Estado (Esp).
Total de empregos gerais no Paraná (Epr).
O cálculo do QL será realizado posteriormente utilizando a linguagem DAX no Power BI, aproveitando a tabela fato gerada. O Quociente Locacional é um indicador valioso para avaliar a especialidade produtiva em uma determinada região e é calculado pela razão:

(Sub/Emp) / (Esp)/(Epr)

Este código fornece uma base sólida para análises mais aprofundadas no Power BI, permitindo uma compreensão mais completa e detalhada da economia regional no Paraná.
