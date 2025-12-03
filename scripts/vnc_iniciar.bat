@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

if exist "%BASE_DIR%..\config.bat" (
    call "%BASE_DIR%..\config.bat"
) else (
    set "VNC_SERVICE_NAME=uvnc_service"
)

set /p input14="Enter IP or computer name: "
if "%input14%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Starting VNC service on computer %input14%...
SC \\%input14% start %VNC_SERVICE_NAME%
if %errorlevel% equ 0 (
    echo VNC service started successfully!
) else (
    echo Error starting VNC service.
)
echo.
pause
