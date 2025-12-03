@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

if exist "%BASE_DIR%..\config.bat" (
    call "%BASE_DIR%..\config.bat"
) else (
    set "VNC_SERVICE_NAME=uvnc_service"
)

set /p input13="Enter IP or computer name: "
if "%input13%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Stopping VNC service on computer %input13%...
SC \\%input13% stop %VNC_SERVICE_NAME%
if %errorlevel% equ 0 (
    echo VNC service stopped successfully!
) else (
    echo Error stopping VNC service.
)
echo.
pause
