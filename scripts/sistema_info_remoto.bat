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

set /p input15="Enter IP or computer name: "
if "%input15%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Getting system information from computer %input15%...
echo.
psexec \\%input15% systeminfo
echo.
pause
