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

set /p cnpj="Enter CNPJ to validate (numbers only): "
if "%cnpj%"=="" (
    echo Error: CNPJ not provided!
    pause
    exit /b
)

echo.
echo Validating CNPJ: %cnpj%
echo.
curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "acao=validar_cnpj&txt_cnpj=%cnpj%" https://www.4devs.com.br/ferramentas_online.php > "%TEMP%\wintoolkit_validacao.txt" 2>nul
if %errorlevel% neq 0 (
    echo Error: Could not connect to service.
    pause
    exit /b
)

type "%TEMP%\wintoolkit_validacao.txt"
del "%TEMP%\wintoolkit_validacao.txt" >nul 2>&1
echo.
pause
