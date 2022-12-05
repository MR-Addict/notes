# AND-OR-NOT运算符

## 一、示例

```sql
USE sql_store;

SELECT *
FROM customers
-- WHERE points > 3000 AND birth_date > '1990-01-01'
-- WHERE points > 3000 OR birth_date > '1990-01-01'
-- WHERE birth_date > '1990-01-01' OR (points > 1000 AND state = 'VA')
WHERE NOT (birth_date > '1990-01-01' OR points > 1000)
```

## 二、知识点

- 逻辑运算符AND优先级更高
- 逻辑运算符可以通过括号改变运算顺序
