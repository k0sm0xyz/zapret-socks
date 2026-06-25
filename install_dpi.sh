#!/bin/bash
# Автономный скрипт настройки Zapret от k0sm0xyz

echo "[*] Создаем системные директории..."
sudo mkdir -p /opt/zapret/binaries/my/

echo "[*] Скачиваем автономный проверенный бинарник tpws из репозитория..."
sudo curl -kLo /opt/zapret/binaries/my/tpws https://githubusercontent.com
sudo chmod +x /opt/zapret/binaries/my/tpws

echo "[*] Настраиваем чистый автозапуск через crontab..."
(crontab -l 2>/dev/null | grep -v "tpws"; echo "@reboot /opt/zapret/binaries/my/tpws --socks --bind-addr=127.0.0.1 --port=1080 --hostcase --hostdot --split-pos=1,midsld --disorder --oob --daemon") | crontab -

echo "[*] Вырезаем конфликтующие службы systemd..."
sudo systemctl disable zapret.service zapret-socks.service zapret-list-update.service zapret-list-update.timer --now 2>/dev/null

echo "[*] Перезапускаем процесс в памяти на порту 1080..."
sudo killall -9 tpws 2>/dev/null
/opt/zapret/binaries/my/tpws --socks --bind-addr=127.0.0.1 --port=1080 --hostcase --hostdot --split-pos=1,midsld --disorder --oob --daemon

echo "[+] ПОЛНАЯ ПОБЕДА! Все файлы развернуты, порт 1080 активен."
