#!/bin/bash

# 自动安装 MySQL 8.0 并设置 root 密码为 123456，允许所有 IP 连接

set -e

echo "👉 更新系统..."
sudo apt update -y
sudo apt upgrade -y

echo "👉 安装依赖..."
sudo apt install -y wget lsb-release gnupg

echo "👉 下载 MySQL APT 配置..."
wget https://dev.mysql.com/get/mysql-apt-config_0.8.29-1_all.deb -O mysql-apt-config.deb

echo "👉 配置 MySQL APT 仓库（默认选项，安装 8.0）..."
sudo DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config.deb

echo "👉 更新 APT 索引..."
sudo apt update -y

echo "👉 安装 MySQL Server 8.0..."
sudo DEBIAN_FRONTEND=noninteractive apt install -y mysql-server

echo "👉 启动 MySQL 服务..."
sudo systemctl enable mysql
sudo systemctl start mysql

echo "👉 设置 root 用户使用密码登录..."
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456'; FLUSH PRIVILEGES;"

echo "👉 配置 MySQL 允许所有 IP 连接..."
# 修改 my.cnf，允许远程连接
sudo sed -i "s/^bind-address\s*=.*$/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# 允许 root 用户从任何 IP 连接
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456'; FLUSH PRIVILEGES;"

echo "✅ MySQL 安装完成，root 密码已设置为：123456"
echo "✅ 允许所有 IP 连接 MySQL"

# 重启 MySQL 服务
echo "👉 重启 MySQL 服务..."
sudo systemctl restart mysql

# 测试登录
echo "✅ 测试登录：mysql -uroot -p123456"

echo "👉 正在检测 MySQL 服务状态..."
if systemctl is-active --quiet mysql; then
    echo "✅ MySQL 服务已成功启动并运行"
else
    echo "❌ MySQL 启动失败，请检查日志信息如下："
    journalctl -u mysql --no-pager -n 20
    echo "🛠 可手动查看完整日志：journalctl -u mysql -e"
    exit 1
fi
