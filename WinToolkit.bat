@echo off
chcp 65001 >nul
set LANG=en_US.UTF-8

setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

:: ============================================
:: Load configuration
:: ============================================
if exist "%BASE_DIR%config.bat" (
    call "%BASE_DIR%config.bat"
) else (
    echo WARNING: config.bat file not found!
    echo Using default values...
    set "DOMAIN=DOMAIN"
    set "ADMIN_USER=administrator"
    set "ADMIN_PASSWORD=PASSWORD"
    set "TEST_IP=8.8.8.8"
    set "VNC_SERVICE_NAME=uvnc_service"
    set "SHUTDOWN_TIMEOUT=35"
)

:menu
cls
echo =====================
echo Menu Options:
echo =====================
echo   1 - View My IP
echo   2 - Test Internet Connection (ping 8.8.8.8)
echo   3 - Clear Print Queue
echo   4 - Check Open Connections
echo   5 - Restart Computer via Network
echo   6 - Shutdown Computer via Network
echo   7 - Cancel Shutdown via Network
echo   8 - Send Message via Network
echo   9 - Remote IPConfig
echo  10 - VNC Service - Status
echo  11 - VNC Service - Stop
echo  12 - VNC Service - Start
echo  13 - Remote System Information
echo  14 - Check Operating System of Computer via network
echo  15 - Check logged user on Desktop
echo  16 - Install Software via Network
echo  17 - Uninstall Software via Network
echo  18 - List Installed Software via Network
echo  19 - List installed printers via Network
echo  20 - Discover MAC address by IP
echo  21 - Check System Architecture via network 2.0
echo  22 - Install printer via Network
echo  23 - View Office Key
echo  24 - HDD or SSD via Network
echo  25 - Remote FlushDNS
echo  26 - Remote RegisterDNS
echo  27 - Close programs via Network
echo  28 - Create new JAVA project
echo  29 - Generate CPF
echo  30 - Validate CPF
echo  31 - Generate CNPJ
echo  32 - Validate CNPJ
echo  33 - Generate person data (For testing purposes)
echo  34 - Create an Exception in Antivirus (Windows Defender)

echo =====================
echo   X to exit
echo =====================
set /p opt="Enter option here: "

if "%opt%"=="1" call "%BASE_DIR%\scripts\ver_meu_ip.bat"
if "%opt%"=="2" call "%BASE_DIR%\scripts\testar_internet.bat"
if "%opt%"=="3" call "%BASE_DIR%\scripts\limpar_impressao.bat"
if "%opt%"=="4" call "%BASE_DIR%\scripts\verificar_conexoes.bat"
if "%opt%"=="5" call "%BASE_DIR%\scripts\reiniciar_computador_remoto.bat"
if "%opt%"=="6" call "%BASE_DIR%\scripts\desligar_computador_remoto.bat"
if "%opt%"=="7" call "%BASE_DIR%\scripts\anular_desligamento_remoto.bat"
if "%opt%"=="8" call "%BASE_DIR%\scripts\enviar_mensagem_remota.bat"
if "%opt%"=="9" call "%BASE_DIR%\scripts\ipconfig_remoto.bat"
if "%opt%"=="10" call "%BASE_DIR%\scripts\vnc_status.bat"
if "%opt%"=="11" call "%BASE_DIR%\scripts\vnc_parar.bat"
if "%opt%"=="12" call "%BASE_DIR%\scripts\vnc_iniciar.bat"
if "%opt%"=="13" call "%BASE_DIR%\scripts\sistema_info_remoto.bat"
if "%opt%"=="14" call "%BASE_DIR%\scripts\verificar_arquitetura.bat"
if "%opt%"=="15" call "%BASE_DIR%\scripts\usuario_logado.bat"
if "%opt%"=="16" call "%BASE_DIR%\scripts\instalar_software_remoto.bat"
if "%opt%"=="17" call "%BASE_DIR%\scripts\desinstalar_software_remoto.bat"
if "%opt%"=="18" call "%BASE_DIR%\scripts\listar_softwares_remoto.bat"
if "%opt%"=="19" call "%BASE_DIR%\scripts\listar_impressoras_remoto.bat"
if "%opt%"=="20" call "%BASE_DIR%\scripts\descobrir_mac.bat"
if "%opt%"=="21" call "%BASE_DIR%\scripts\verificar_arquitetura_remoto.bat"
if "%opt%"=="22" call "%BASE_DIR%\scripts\instalar_impressora_remoto.bat"
if "%opt%"=="23" call "%BASE_DIR%\scripts\visualizar_chave_office.bat"
if "%opt%"=="24" call "%BASE_DIR%\scripts\verificar_hdd_ssd.bat"
if "%opt%"=="25" call "%BASE_DIR%\scripts\flushdns_remoto.bat"
if "%opt%"=="26" call "%BASE_DIR%\scripts\registerdns_remoto.bat"
if "%opt%"=="27" call "%BASE_DIR%\scripts\fechar_programa_remoto.bat"
if "%opt%"=="28" call "%BASE_DIR%\scripts\criar_projeto_java.bat"
if "%opt%"=="29" call "%BASE_DIR%\scripts\gerar_cpf.bat"
if "%opt%"=="30" call "%BASE_DIR%\scripts\validar_cpf.bat"
if "%opt%"=="31" call "%BASE_DIR%\scripts\gerar_cnpj.bat"
if "%opt%"=="32" call "%BASE_DIR%\scripts\validar_cnpj.bat"
if "%opt%"=="33" call "%BASE_DIR%\scripts\gerar_dados_pessoa.bat"
if "%opt%"=="34" call "%BASE_DIR%\scripts\criar_excecao_defender.bat"

if "%opt%"=="x" goto:exit

::echo Invalid option!
::pause

goto:menu

:exit
exit
