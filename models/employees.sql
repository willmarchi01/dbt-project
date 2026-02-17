with calc_employees as (
    select
        employee_id,
        date_part(year, current_date) - date_part(year, birth_date) as age,
        date_part(year, birth_date) as ano_nascimento,
        birth_date,
        date_part(year, current_date) - date_part(year, hire_date) as lenghtofservice,
        date_part(year, hire_date) as hire_year,
        hire_date, 
        first_name, 
        last_name,
        first_name || ' ' || last_name as complete_name
    from {{source('sources', 'employees')}}
)
select * from calc_employees