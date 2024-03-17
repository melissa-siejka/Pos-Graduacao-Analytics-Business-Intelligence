
with RaisAgregada as (
select CONVERT(DATE, '01/01/2018', 103) as ano, a.* from rais.dbo.VinculosRaisPR_2018 a 
union all
select CONVERT(DATE, '01/01/2019', 103) as ano, b.* from rais.dbo.VinculosRaisPR_2019 b
union all
select CONVERT(DATE, '01/01/2020', 103) as ano, c.*  from rais.dbo.VinculosRaisPR_2020 c
union all
select CONVERT(DATE, '01/01/2021', 103) as ano, d.* from rais.dbo.VinculosRaisPR_2021 d
),



-- Total Empregos por Município

EmpregoMunicipioTotal as (
select 
	a.ano,
	a.cd_municipio,
	sum(a.vinculo_ativo_31_12) as qt_EmpregoMuniTotal
	from RaisAgregada A
group by a.ano, a.cd_municipio

),


-- Total Empregos Subclasse Paraná
EmpregoSubclasseParana as (
select 
		a.ano,
		a.cnae_subclasse_20,
		a.uf,
		sum(a.vinculo_ativo_31_12) as qt_subclasseParana
from RaisAgregada a 
group by a.ano, a.cnae_subclasse_20,a.uf),


-- Total Empregos Paraná - Geral
EmpregoParanaTotal as (
select 
		a.ano,
		a.uf,
		sum(a.vinculo_ativo_31_12) as qt_EmpregoParanaTotal
from RaisAgregada a 
group by a.ano,a.uf)


-- Rais Final
select 
	a.ano,
	a.cd_municipio,
	a.nm_municipio,
	a.cnae_subclasse_20,
	sum(a.vinculo_ativo_31_12) as qt_totalempregos,
	sum(a.vl_remun_media_nm) /sum(a.vinculo_ativo_31_12) as vl_remun_media,
	b.qt_EmpregoMuniTotal,
	c.qt_subclasseParana,
	d.qt_EmpregoParanaTotal
from RaisAgregada A
left join EmpregoMunicipioTotal b	on a.ano = b.ano and a.cd_municipio = b.cd_municipio
left join EmpregoSubclasseParana c	on a.ano = c.ano and a.cnae_subclasse_20 = c.cnae_subclasse_20 and a.uf = c.uf
left join EmpregoParanaTotal	d	on a.ano = d.ano and a.uf = d.uf
group by a.ano, a.cd_municipio,	a.nm_municipio,a.cnae_subclasse_20,b.qt_EmpregoMuniTotal,c.qt_subclasseParana, d.qt_EmpregoParanaTotal
