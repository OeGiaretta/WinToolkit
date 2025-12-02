@echo off

set /p input2="informe o ip ou nome: "
net use \\%input2% /USER:%DOMAIN%\%ADMIN_USER% %ADMIN_PASSWORD%
shutdown -r -f -m \\%input2% -t 35 -c "Seu computador sera reiniciado"
pause
