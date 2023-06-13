# 使用 MySQL

```admonish info
Digital Ocean参考文档：[MySQL](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)
```

## 一、使用 MySQL

更新 apt 库：

```sh
sudo apt-get update
```

安装 MySQL：

```sh
sudo apt-get install mysql-server -y
```

## 二、配置 MySQL

首先先登录 MySQL：

```sh
sudo mysql
```

然后更改 root 密码：

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_new_password';
```

然后退出运行安装脚本：

```sh
sudo mysql_secure_installation
```

## 三、创建新用户

进入 mysql：

```sh
sudo mysql -u root -p
```

创建新用户：

```sql
CREATE USER 'user_name'@'localhost' IDENTIFIED WITH mysql_native_password BY 'user_password';
```

授予用户权限：

```sql
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'user_name'@'localhost' WITH GRANT OPTION;
```

清空权限缓存：

```sql
FLUSH PRIVILEGES;
```

退出然后登录新用户：

```sh
sudo mysql -u user_name -p
```

## 四、用户操作

查看所有用户：

```sql
SELECT User, Host FROM mysql.user;
```

删除用户：

```sql
DROP USER 'user_name'@'localhost';
```

更改用户密码：

```sql
ALTER USER 'user_name'@'localhost' IDENTIFIED BY 'new_password';
```

更改用户名和主机名：

```sql
RENAME USER 'user_name'@'host_ip' TO 'another_user_name'@'another_host_ip'
```

## 五、数据库操作

显示已有数据库：

```sql
SHOW DATABASES;
```

创建新的数据库：

```sql
CREATE DATABASE db_name;
```

使用某个数据库：

```sql
USE db_name;
```

删除数据库：

```sql
DROP DATABASE db_name;
```

重命名数据库：

```sql
RENAME TABLE old_db.table TO new_db.table;
```

## 六、Table 操作

创建 Table：

```sql
CREATE TABLE books(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    lang VARCHAR(50) DEFAULT "English" NOT NULL,
    author VARCHAR(60) NOT NULL
);
```

显示 Table 框架：

```sql
DESCRIBE books;
```

插入新的记录：

```sql
INSERT INTO books(title, price, lang, author) VALUE("Bible",50.00,"Hindi","Jone");
```

插入新列：

```sql
ALTER TABLE table_name;
ADD COLUMN column_name column_definition;
```

删除 Table：

```sql
DROP TABLE IF EXISTS db.table1, db.table2, db.table3;
```

重命名 Table：

```sql
RENAME TABLE db.table TO db.new_table;
```

## 七、允许远程连接：

进入配置文件：

```sh
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

找到以下内容，注释掉 IP 绑定：

```
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
# bind-address          = 127.0.0.1
# mysqlx-bind-address   = 127.0.0.1
```

然后进入 MySQL，创建可以允许远程连接的用户：

```sql
CREATE USER 'user_name'@'remote_login_server_ip' IDENTIFIED BY 'user_password';
```

你也可以更改当前的用户：

```sql
RENAME USER 'user_name'@'localhost' TO 'user_name'@'remote_login_server_ip';
```

## 八、更改密码协议

查看当前密码协议：

```sql
SHOW VARIABLES LIKE 'validate_password%';
```

更改当前密码协议：

```sql
SET GLOBAL validate_password.policy=LOW;
```

更改用户密码：

```sql
ALTER USER 'user_name'@'localhost' IDENTIFIED BY 'new_password';
```

## 九、禁用 ONLY_FULL_GROUP_BY

进入配置文件：

```sh
sudo vim /etc/mysql/my.cnf
```

添加或修改以下内容：

```
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/

[mysqld]
sql_mode = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
```
