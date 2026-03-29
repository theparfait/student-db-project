-- Tạo user đồng bộ dữ liệu
CREATE USER IF NOT EXISTS 'repl'@'%' IDENTIFIED BY 'slavepassword';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;