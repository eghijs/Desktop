#!/bin/bash
USERS=$(who |grep tty |awk '{print $1}')

# Localizar o usuario pela UID, depois deleta a pasta do usuario
awk -F':' '$3 > 1001 {print $1}' /etc/passwd | xargs -n1 rm -rf !(.scripts)

# Copiar diretorio base para novo usuario
cp -R /etc/skel /home/$USERS

# Criando diretórios padrão
xdg-user-dirs-update

# Define permissao de usuario e grupo
chown -R $USERS:$USERS /home/$USERS

exit 0
