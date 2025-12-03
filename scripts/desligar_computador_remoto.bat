@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

if exist "%BASE_DIR%..\config.bat" (
    call "%BASE_DIR%..\config.bat"
) else (
    set "DOMAIN=DOMAIN"
    set "ADMIN_USER=administrator"
    set "ADMIN_PASSWORD=PASSWORD"
    set "SHUTDOWN_TIMEOUT=35"
)

set /p input5="Enter IP or computer name: "
if "%input5%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Connecting to computer %input5%...
net use \\%input5% /USER:%DOMAIN%\%ADMIN_USER% %ADMIN_PASSWORD% >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Could not connect to computer %input5%
    echo Verify that the IP/name is correct and credentials are valid.
    pause
    exit /b
)

echo Shutting down computer %input5% in %SHUTDOWN_TIMEOUT% seconds...
shutdown -s -f -m \\%input5% -t %SHUTDOWN_TIMEOUT% -c "Your Computer will be Shutdown"
if %errorlevel% equ 0 (
    echo.
    echo Shutdown command sent successfully!
) else (
    echo.
    echo Error sending shutdown command.
)
echo.
pause
