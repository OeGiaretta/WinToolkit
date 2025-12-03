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
echo Generating CNPJ...
curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "acao=gerar_cnpj&pontuacao=true" https://www.4devs.com.br/ferramentas_online.php > "%TEMP%\wintoolkit_cnpj.txt" 2>nul
if %errorlevel% neq 0 (
    echo Error: Could not connect to service.
    pause
    exit /b
)

set /p cnpj=<"%TEMP%\wintoolkit_cnpj.txt"
if "%cnpj%"=="" (
    echo Error: Could not generate CNPJ.
    del "%TEMP%\wintoolkit_cnpj.txt" >nul 2>&1
    pause
    exit /b
)

echo.
echo ========================================
echo    CNPJ Generated Successfully
echo ========================================
echo.
echo CNPJ: %cnpj%
echo.
del "%TEMP%\wintoolkit_cnpj.txt" >nul 2>&1
pause
