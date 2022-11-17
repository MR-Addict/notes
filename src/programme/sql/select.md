# SELECT用法

## 一、示例

```sql
USE sql_store;

SELECT
	first_name,
	last_name, 
	points, 
    (points + 10) * 10 AS "discount factor"
FROM customers
ORDER BY points
```

## 二、知识点

- SELECT可以有多个参数筛选列
- SELECT可以换行
- SELECT可以使用别名`AS`
- SELECT可以使用四则运算和括号产生新的列
