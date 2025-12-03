@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

set /p input8="Enter IP or computer name: "
if "%input8%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Canceling shutdown/restart on computer %input8%...
shutdown -a -m \\%input8%
if %errorlevel% equ 0 (
    echo.
    echo Shutdown/restart canceled successfully!
) else (
    echo.
    echo No scheduled shutdown/restart found or error canceling.
)
echo.
pause
