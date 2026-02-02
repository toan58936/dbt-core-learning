{% macro clean_json_company(company_field) %}
    case
        when {{ company_field }} is null then null
        when jsonb_typeof({{ company_field }}::jsonb) = 'array' then ({{ company_field }}::jsonb ->> 0)
        when jsonb_typeof({{ company_field }}::jsonb) = 'string' then trim(both '"' from {{ company_field }}::jsonb::text)
        else {{ company_field }}::text
    end
{% endmacro %}