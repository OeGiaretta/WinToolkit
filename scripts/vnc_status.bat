@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

if exist "%BASE_DIR%..\config.bat" (
    call "%BASE_DIR%..\config.bat"
) else (
    set "VNC_SERVICE_NAME=uvnc_service"
)

set /p input12="Enter IP or computer name: "
if "%input12%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Checking VNC service status on computer %input12%...
echo.
SC \\%input12% query %VNC_SERVICE_NAME%
echo.
pause
