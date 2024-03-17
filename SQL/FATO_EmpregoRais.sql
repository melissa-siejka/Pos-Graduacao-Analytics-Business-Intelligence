WITH EmpregoRais AS(

select CONVERT(DATE, '01/01/2018', 103) as ano, a.* from rais.dbo.VinculosRaisPR_2018 a 
union all
select CONVERT(DATE, '01/01/2019', 103) as ano, b.* from rais.dbo.VinculosRaisPR_2019 b
union all
select CONVERT(DATE, '01/01/2020', 103) as ano, c.*  from rais.dbo.VinculosRaisPR_2020 c
union all
select CONVERT(DATE, '01/01/2021', 103) as ano, d.* from rais.dbo.VinculosRaisPR_2021 d)


SELECT 
	a.ano,
	a.cd_municipio,
	a.nm_municipio,
	a.uf,
	a.cnae_subclasse_20,
	a.faixa_hr_contrat,
	a.faixa_remun_media_sm,
	a.escolaridade,
	a.natureza_juridica,
	a.tam_estabelecimento,
	a.cbo_ocupacao_2002,
	SUM(a.vinculo_ativo_31_12) as qt_empregos,
	ROUND(AVG(a.vl_remun_media_nm),2) as vl_remun_media,
	ROUND(SUM(a.vl_remun_media_nm),2) as sum_remun_media

FROM EmpregoRais A
GROUP BY a.ano, a.cd_municipio, a.nm_municipio, a.uf, a.cnae_subclasse_20, 
	a.faixa_hr_contrat, a.faixa_remun_media_sm, a.escolaridade, 
	a.natureza_juridica, a.tam_estabelecimento, a.cbo_ocupacao_2002