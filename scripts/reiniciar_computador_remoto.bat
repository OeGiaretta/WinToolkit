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

set /p input2="Enter IP or computer name: "
if "%input2%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Connecting to computer %input2%...
net use \\%input2% /USER:%DOMAIN%\%ADMIN_USER% %ADMIN_PASSWORD% >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Could not connect to computer %input2%
    echo Verify that the IP/name is correct and credentials are valid.
    pause
    exit /b
)

echo Restarting computer %input2% in %SHUTDOWN_TIMEOUT% seconds...
shutdown -r -f -m \\%input2% -t %SHUTDOWN_TIMEOUT% -c "Your computer will be restarted"
if %errorlevel% equ 0 (
    echo.
    echo Restart command sent successfully!
) else (
    echo.
    echo Error sending restart command.
)
echo.
pause
