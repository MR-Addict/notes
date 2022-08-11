# WHERE用法

## 一、知识点

- WHERE可以使用逻辑运算符
- SQL的时间格式是`YYYY-MM-DD HH-MM-SS`

## 二、示例

```sql
USE sql_store;

SELECT *
FROM customers
-- WHERE points > 3000
-- WHERE state = 'VA'
-- WHERE state != 'VA'
WHERE birth_date > '1990-01-01'
```
