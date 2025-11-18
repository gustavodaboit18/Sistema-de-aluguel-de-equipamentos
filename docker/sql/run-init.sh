#!/bin/bash
/opt/mssql/bin/sqlservr &

echo "Aguardando SQL Server iniciar..."

# LOOP PARA ESPERAR FICAR ONLINE
until /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P StrongPassword123! -C -Q "SELECT 1" >/dev/null 2>&1
do
    echo "Aguardando..."
    sleep 2
done

echo "SQL Server online, executando scripts..."

# SEU SCRIPT PRINCIPAL
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P StrongPassword123! -C -i /usr/src/sql/init.sql

echo "Scripts executados."
wait
