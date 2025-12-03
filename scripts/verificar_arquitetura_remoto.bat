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

set /p input26="Enter IP or computer name: "
if "%input26%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Checking system architecture on computer %input26%...
echo.
wmic /node:%input26% /user:%DOMAIN%\%ADMIN_USER% /password:%ADMIN_PASSWORD% os get osarchitecture
echo.
pause
