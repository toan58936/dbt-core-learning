with networks as (
    select * from {{ ref('stg_networks') }}
),

countries as (
    select * from {{ ref('country_codes') }}  -- Gọi bảng Seed
),

final as (
    select
        c.name as country_name,
        n.country as country_code,
        count(n.network_id) as total_networks,
        count(n.ebikes) as total_ebikes
    from networks n
    left join countries c on n.country = c.code -- Nối bảng
    group by c.name, n.country
)

select * from final
order by total_networks desc