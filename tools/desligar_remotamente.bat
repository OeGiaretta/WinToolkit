@echo off

set /p input5="informe o ip: "
net use \\%input5% /USER:%DOMAIN%\%ADMIN_USER% %ADMIN_PASSWORD%
shutdown -s -f -m \\%input5% -t 35 -c "Seu Computador sera Desligado"
pause
