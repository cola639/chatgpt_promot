#!/bin/bash

echo "🧹 正在彻底清除 MySQL 残留配置..."

# 停止服务（如果还在运行）
sudo systemctl stop mysql || true

# 卸载 APT 源配置
sudo apt purge -y mysql-apt-config

# 清除残留包（状态为 rc）
sudo dpkg --purge mysql-server-8.0 || true

# 自动删除未使用的依赖包
sudo apt autoremove --purge -y
sudo apt autoclean

# 删除 MySQL 配置目录、数据库文件、日志
sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql /var/log/mysql* ~/.mysql

# 删除用户和组（如果存在）
sudo deluser --remove-home mysql || true
sudo delgroup mysql || true

echo "✅ MySQL 已彻底卸载并清理干净"

dpkg -l | grep mysql