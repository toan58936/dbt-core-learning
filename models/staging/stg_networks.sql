with source as (
    select * from {{ source('neon_source', 'networks') }}
),

renamed as (
    select
        -- Lấy ID và đổi tên cho chuẩn
        id as network_id,
        
        -- Các thông tin cơ bản
        name,
        href,
        
        -- Tách tọa độ từ JSON (Postgres syntax)
        {{location_transform('location')}},

        -- Xử lý cột Company (đang rất lộn xộn: lúc là mảng, lúc là chuỗi)
        {{clean_json_company('company')}},

        -- Các chỉ số xe
        ebikes,
        scooters

    from source
)

select * from renamed