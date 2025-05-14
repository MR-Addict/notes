# WHERE

## 一、示例

```sql
USE sql_store;

SELECT *
FROM customers
-- WHERE points > 3000
-- WHERE state = 'VA'
-- WHERE state != 'VA'
WHERE birth_date > '1990-01-01'
```

## 二、知识点

- WHERE 可以使用逻辑运算符
- SQL 的时间格式是`YYYY-MM-DD HH-MM-SS`
