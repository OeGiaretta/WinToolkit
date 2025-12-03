@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

where psexec >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: psexec not found!
    echo Please install Microsoft PsTools.
    pause
    exit /b
)

set /p input11="Enter IP or computer name: "
if "%input11%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Getting network configuration from computer %input11%...
echo.
psexec \\%input11% ipconfig /all
echo.
pause
