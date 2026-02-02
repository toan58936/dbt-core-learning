-- Nếu câu này select ra dòng nào, nghĩa là test thất bại (có dữ liệu rác)
select *
from {{ ref('stg_networks') }}
where latitude < -90 OR latitude > 90