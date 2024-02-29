# Використовуємо базовий образ
FROM ubuntu:latest

# Встановлюємо необхідні пакети та інструменти для управління конфігурацією
RUN apt-get update && apt-get install -y ansible

# Додамо ваші файли конфігурації та playbooks Ansible в контейнер
COPY config_files /config_files
COPY ansible_playbook.yml /ansible_playbook.yml

# Запускаємо Ansible playbook для налаштування контейнера
RUN ansible-playbook /ansible_playbook.yml

# Вказуємо команду для виконання при запуску контейнера
CMD ["/bin/bash"]
