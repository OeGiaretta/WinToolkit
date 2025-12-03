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

set /p input16="Enter IP or computer name: "
if "%input16%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Checking system architecture on computer %input16%...
echo.

net use J: \\%input16%\c$ /USER:%DOMAIN%\%ADMIN_USER% %ADMIN_PASSWORD% >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Could not connect to computer %input16%
    echo Verify that the IP/name is correct and credentials are valid.
    pause
    exit /b
)

J:
if exist "Program Files (x86)\" (
    echo Architecture: 64 bits
) else (
    echo Architecture: 32 bits
)
C:
net use J: /delete >nul 2>&1
echo.
pause
