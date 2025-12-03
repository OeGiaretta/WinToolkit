@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

where curl >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: curl not found!
    echo Please install curl or use Windows 10/11 which already includes it.
    pause
    exit /b
)

echo.
echo Generating CPF...
curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "acao=gerar_cpf&pontuacao=true" https://www.4devs.com.br/ferramentas_online.php > "%TEMP%\wintoolkit_cpf.txt" 2>nul
if %errorlevel% neq 0 (
    echo Error: Could not connect to service.
    pause
    exit /b
)

set /p cpf=<"%TEMP%\wintoolkit_cpf.txt"
if "%cpf%"=="" (
    echo Error: Could not generate CPF.
    del "%TEMP%\wintoolkit_cpf.txt" >nul 2>&1
    pause
    exit /b
)

echo.
echo ========================================
echo    CPF Generated Successfully
echo ========================================
echo.
echo CPF: %cpf%
echo.
del "%TEMP%\wintoolkit_cpf.txt" >nul 2>&1
pause
