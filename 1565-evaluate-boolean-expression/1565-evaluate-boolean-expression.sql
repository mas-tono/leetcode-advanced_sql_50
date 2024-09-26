/* Write your T-SQL query statement below */

with firstt as (
                select e.left_operand, 
                        e.operator, 
                        e.right_operand,
                        v1.value as v1_value,
                        v2.value as v2_value,
                        case
                            when operator = '>' then case
                                when v1.value > v2.value then 1 else 0 end
                            when operator = '<' then case
                                when v1.value < v2.value then 1 else 0 end
                            when operator = '=' then case 
                                when v1.value = v2.value then 1 else 0 end
                        end as valuee
                from Expressions e
                left join Variables v1
                on e.left_operand = v1.name
                left join Variables v2
                on e.right_operand = v2.name)
select left_operand, operator, right_operand,
        case
            when valuee = 1 then 'true' else 'false'
        end as value  
from firstt                      