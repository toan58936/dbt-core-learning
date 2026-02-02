{% macro location_transform(location_field) %}
    ({{ location_field }}::jsonb ->> 'city') as city,
    ({{ location_field }}::jsonb ->> 'country') as country,
    ({{ location_field }}::jsonb ->> 'latitude')::numeric as latitude,
    -- BỎ DẤU PHẨY Ở DÒNG CUỐI CÙNG NÀY:
    ({{ location_field }}::jsonb ->> 'longitude')::numeric as longitude
{% endmacro %}