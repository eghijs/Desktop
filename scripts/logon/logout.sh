#!/bin/bash
# Script de logout estações linux mint em rede.
L_USER=$(who |grep tty |awk '{print $1}')

# Localizar o usuario pela UID, depois deleta a pasta do usuario
#awk -F':' '$3 > 1001 {print $1}' /etc/passwd | xargs -n1 rm -rf !(.scripts) <-- este comando exclui tudo exeto o diretorio .scripts
#awk -F':' '$3 > 1001 {print $1}' /etc/passwd | xargs -n1 rm -rf !(.scripts)
rm -rf /home/$L_USER/*

# Copiar diretorio base para novo usuario
cp -R /etc/skel /home/$L_USER

# Recriar pasta do usario no diretorio home
mkhomedir_helper username

# Criando diretórios padrão
xdg-user-dirs-update
sudo -u john xdg-user-dirs-update

# Define permissao de usuario e grupo
chown -R L_USER:$L_USER /home/L_USER

exit 0

if [ "$(id -u)" = "1000" ]; then
     do stuff for user 1000
else
     do stuff for other users
fi
