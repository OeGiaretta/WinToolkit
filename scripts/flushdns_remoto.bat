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

set /p input31="Enter IP or computer name: "
if "%input31%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Clearing DNS cache on computer %input31%...
psexec \\%input31% -u %DOMAIN%\%ADMIN_USER% -p %ADMIN_PASSWORD% -d -i ipconfig /flushdns
if %errorlevel% equ 0 (
    echo.
    echo DNS cache cleared successfully!
) else (
    echo.
    echo Error clearing DNS cache.
)
echo.
pause
