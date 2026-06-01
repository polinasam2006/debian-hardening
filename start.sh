#!/bin/bash
echo "============================================"
echo " Harden Debian 12 - CIS Benchmark Level 1"
echo "============================================"
echo

echo "[1/2] Установка зависимостей Ansible..."
ansible-galaxy collection install -r requirements.yml
if [ $? -ne 0 ]; then
    echo "ОШИБКА: не удалось установить зависимости."
    echo "Убедитесь, что Ansible установлен: pip install ansible"
    exit 1
fi

echo
echo "[2/2] Запуск плейбука..."
ansible-playbook harden.yml
if [ $? -ne 0 ]; then
    echo "ОШИБКА: плейбук завершился с ошибкой."
    exit 1
fi

echo
echo "Готово! Харденинг выполнен успешно."
