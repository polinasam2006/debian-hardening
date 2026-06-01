# Harden Debian 12 — CIS Benchmark Level 1

Ansible-плейбук для автоматического харденинга Debian 12 по стандарту **CIS Benchmark Level 1**.

## Что делает плейбук

| Раздел | Что настраивается |
|--------|------------------|
| Пакеты | Установка auditd, ufw, unattended-upgrades, libpam-pwquality |
| Сервисы | Удаление telnet, rsh, xinetd, nis, avahi-daemon, cups |
| Ядро | Параметры sysctl: ip_forward, redirects, syncookies, ASLR |
| SSH | Запрет root-логина, отключение парольной аутентификации, X11 |
| Пароли | Политика: минимум 12 символов, срок действия 90 дней |
| Файрвол | UFW: входящий трафик запрещён, SSH разрешён |
| Аудит | Правила auditd для /etc/passwd, /etc/shadow, /etc/sudoers |
| Права | Корректные права на критические системные файлы |

## 🛠 Требования

- **Ansible** 2.14 или новее
- **Целевая система:** Debian 12 (Bookworm)
- **Python** 3.x на целевом хосте
- Права **sudo** или **root** на целевом хосте

## 🚀 Как запустить

### 1. Клонируйте репозиторий

```bash
git clone https://github.com/ВАШ_ЛОГИН/debian-hardening.git
cd debian-hardening
```

### 2. Установите зависимости Ansible

```bash
ansible-galaxy collection install -r requirements.yml
```

### 3. Запустите плейбук

**Локально (на той же машине):**
```bash
ansible-playbook harden.yml
```

**На удалённом хосте:**
```bash
ansible-playbook -i "192.168.1.10," harden.yml -u your_user --ask-become-pass
```

## ⚠️ Важно перед запуском

- Плейбук **отключает парольную аутентификацию SSH** — убедитесь, что SSH-ключ уже настроен
- Тестируйте сначала на **виртуальной машине**
- Плейбук включает **UFW** — проверьте, что нужные порты открыты

## Переменные

В начале `harden.yml` можно изменить:

```yaml
vars:
  ssh_port: 22        # Порт SSH
  pass_max_days: 90   # Максимальный срок действия пароля
```
