@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

if exist "%BASE_DIR%..\config.bat" (
    call "%BASE_DIR%..\config.bat"
) else (
    set "DOMAIN=DOMAIN"
    set "ADMIN_USER=administrator"
    set "ADMIN_PASSWORD=PASSWORD"
)

where psexec >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: psexec not found!
    echo Please install Microsoft PsTools.
    pause
    exit /b
)

set /p input32="Enter IP or computer name: "
if "%input32%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Registering DNS on computer %input32%...
psexec \\%input32% -u %DOMAIN%\%ADMIN_USER% -p %ADMIN_PASSWORD% -d -i ipconfig /register
if %errorlevel% equ 0 (
    echo.
    echo DNS registered successfully!
) else (
    echo.
    echo Error registering DNS.
)
echo.
pause
