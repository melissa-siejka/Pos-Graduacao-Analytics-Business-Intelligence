-- Fato Quociente Locacional

-- Total Empregos por Município
with Rais_EmpregoMunicipioTotal as(
select 
		'2021' as ano,
		a.cd_municipio,
		a.nm_municipio,
		sum(a.vinculo_ativo_31_12) as qt_totalempregos
from rais.dbo.VinculosRaisPR_2021 a 
group by a.cd_municipio,	a.nm_municipio),


-- Total Empregos Subclasse Paraná
Rais_EmpregoSubclasseParana as (
select 
		'2021' as ano,
		a.cnae_subclasse_20,
		a.uf,
		sum(a.vinculo_ativo_31_12) as qt_totalempregos
from rais.dbo.VinculosRaisPR_2021 a 
group by a.cnae_subclasse_20,a.uf),


-- Total Empregos Paraná - Geral
Rais_EmpregoParanaTotal as (
select 
		'2021' as ano,
		a.uf,
		sum(a.vinculo_ativo_31_12) as qt_totalempregos
from rais.dbo.VinculosRaisPR_2021 a 
group by a.uf)

-- Tabela Agregada
select 
		'2021' as ano,
		Sub.cd_municipio,
		Sub.nm_municipio,
		Sub.cnae_subclasse_20,
		sum(Sub.vinculo_ativo_31_12) as Qt_EmpSubclasseMunicipio,
		Emp.qt_totalempregos as Qt_EmpregoMunicipioTotal,
		Esp.qt_totalempregos as Qt_EmpregoSubclasseParana,
		Epr.qt_totalempregos as Qt_EmpregoParanaTotal
from rais.dbo.VinculosRaisPR_2021 Sub
inner join Rais_EmpregoMunicipioTotal EMP  on Sub.cd_municipio = EMP.cd_municipio
inner join Rais_EmpregoSubclasseParana ESP on Sub.cnae_subclasse_20 = ESP.cnae_subclasse_20 and Sub.uf= ESP.uf
inner join Rais_EmpregoParanaTotal EPR	   on Sub.uf = EPR.uf
group by Sub.cd_municipio,	Sub.nm_municipio,Sub.cnae_subclasse_20,Emp.qt_totalempregos, Esp.qt_totalempregos, Epr.qt_totalempregos
