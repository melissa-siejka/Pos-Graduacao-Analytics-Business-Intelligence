-- Registro de homologação
-- Tabela FATO_	QuocienteLocacional

SELECT 
2021 AS ANO,
SUM(a.vinculo_ativo_31_12) as qt_empregos,
SUM(a.vl_remun_media_nm) as qt_remuneracao,
SUM(a.vl_remun_media_nm)/SUM(a.vinculo_ativo_31_12)  as remun_media

FROM rais.dbo.VinculosRaisPR_2021 A 
WHERE a.nm_municipio = 'Campo Mourão'
AND a.cnae_subclasse_20 = '2660400'

UNION ALL 

SELECT 
2020 AS ANO,
SUM(a.vinculo_ativo_31_12) as qt_empregos,
SUM(a.vl_remun_media_nm) as qt_remuneracao,
SUM(a.vl_remun_media_nm)/SUM(a.vinculo_ativo_31_12)  as remun_media

FROM rais.dbo.VinculosRaisPR_2020 A 
WHERE a.nm_municipio = 'Campo Mourão'
AND a.cnae_subclasse_20 = '2660400';
