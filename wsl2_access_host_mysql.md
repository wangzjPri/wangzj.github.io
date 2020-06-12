# wangzj.github.io
(grant priv in host)https://dba.stackexchange.com/questions/210185/unsuccessfully-granting-privileges
cmd in windows mysql : CREATE USER 'root'@'172.0.0.0/255.0.0.0' IDENTIFIED BY '<password>'; grant all on *.* to 'root'@'172.0.0.0/255.0.0.0';



connect to host ip using : mysql --protocol=TCP -p -u root -h 172.25.128.1 --port=3306



###enable access from sqlalchemy : 
>ALTER USER 'username'@'ip_address' IDENTIFIED WITH mysql_native_password BY 'password';
