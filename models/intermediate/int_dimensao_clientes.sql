with
clientes as (
    select *
    from {{ ref('stg_erp__clientes') }}
)

, localidades as (
    select *
    from {{ ref('stg_erp__localidades') }}
)

--, agencias as (
--    select *
--    from {{ ref('stg_erp__agencias') }}
--)
--
--, colaboradores as (
--    select *
--    from {{ ref('stg_erp__colaboradores') }}
--)

, clientes_enriquecido as (
    select
        clientes.pk_cliente
        , clientes.nome_cliente
        , clientes.email_cliente
        , clientes.tipo_cliente
        , clientes.ts_inclusao
        , clientes.cpfcnpj_cliente
        , clientes.data_nascimento_cliente
        , clientes.endereco_cliente
        , clientes.cep_cliente
        , localidades.cidade as cidade_cliente
        , localidades.uf as uf_cliente
--        , agencias.nome_agencia
--        , agencias.tipo_agencia
--        , agencias.ts_abertura
--        , agencias.endereco_agencia
--        , colaboradores.nome_colaborador
--        , colaboradores.email_colaborador
--        , colaboradores.cpf_colaborador
--        , colaboradores.data_nascimento_colaborador
--        , colaboradores.endereco_colaborador
--        , colaboradores.cep_colaborador
    from clientes
    left join localidades on clientes.fk_localidade = localidades.pk_localidade
--    left join agencias on clientes.fk_agencia = agencias.pk_agencia
--    left join colaboradores on clientes.fk_colaborador = colaboradores.pk_colaborador
)

select *
from clientes_enriquecido