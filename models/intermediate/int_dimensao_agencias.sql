with
agencias as (
    select *
    from {{ ref('stg_erp__agencias') }}
)
, localidades as (
    select *
    from {{ ref('stg_erp__localidades') }}
)
, agencias_enriquecido as (
    select
        agencias.pk_agencia
        , agencias.nome_agencia
        , agencias.tipo_agencia
        , agencias.ts_abertura
        , agencias.endereco_agencia
        , localidades.cidade as cidade_cliente
        , localidades.uf as uf_cliente
    from agencias
    left join localidades on agencias.fk_localidade = localidades.pk_localidade
)

select *
from agencias_enriquecido