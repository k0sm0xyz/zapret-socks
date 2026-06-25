#!/bin/bash
# Скрипт автоматической настройки Zapret (SOCKS5 1080) от k0sm0xyz
echo "[*] Создаем системную директорию..."
sudo mkdir -p /opt/zapret/binaries/my/
echo "[*] Прописываем команду в автозапуск crontab..."
(crontab -l 2>/dev/null | grep -v "tpws"; echo "@reboot /opt/zapret/binaries/my/tpws --socks --bind-addr=127.0.0.1 --port=1080 --hostcase --hostdot --split-pos=1,midsld --disorder --oob --daemon") | crontab -
echo "[*] Запускаем обход DPI прямо сейчас..."
sudo killall tpws 2>/dev/null
/opt/zapret/binaries/my/tpws --socks --bind-addr=127.0.0.1 --port=1080 --hostcase --hostdot --split-pos=1,midsld --disorder --oob --daemon
echo "[+] Отлично! Все требования выполнены. Порт 1080 активен."
