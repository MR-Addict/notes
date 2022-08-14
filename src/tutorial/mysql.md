# 使用MySQL

```admonish info
Digital Ocean参考文档：[MySQL](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)
```

## 一、使用MySQL

更新apt库：

```bash
sudo apt-get update
```

安装MySQL：

```bash
sudo apt-get install mysql-server -y
```

## 二、配置MySQL

首先先登录MySQL：

```bash
sudo mysql
```

然后更改root密码：

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_new_password';
```

然后退出运行安装脚本：

```bash
sudo mysql_secure_installation
```

## 三、创建新用户

进入mysql：

```bash
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

```bash
sudo mysql -u user_name -p
```

## 四、允许远程连接：

进入配置文件：

```bash
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

找到以下内容，注释掉IP绑定：

```
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
# bind-address          = 127.0.0.1
# mysqlx-bind-address   = 127.0.0.1
```

然后进入MySQL，创建可以允许远程连接的用户：

```sql
CREATE USER 'user_name'@'remote_login_server_ip' IDENTIFIED BY 'user_password';
```

你也可以更改当前的用户：

```sql
RENAME USER 'user_name'@'localhost' TO 'user_name'@'remote_login_server_ip';
```

## 五、更改密码协议

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

## 六、常用命令

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

创建Table：

```sql
CREATE TABLE books(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    lang VARCHAR(50) DEFAULT "English" NOT NULL,
    author VARCHAR(60) NOT NULL
);
```

显示Table框架：

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

删除数据库：

```sql
DROP DATABASE db_name;
```

查看所有用户：

```sql
SELECT User, Host FROM mysql.user;
```

删除用户：

```sql
DROP USER 'user_name'@'localhost';
```
