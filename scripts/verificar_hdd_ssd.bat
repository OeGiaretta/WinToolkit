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

set /p input30="Enter IP or computer name: "
if "%input30%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Checking disks (HDD/SSD) on computer %input30%...
echo.
psexec -h -i \\%input30% -s powershell.exe -command "Get-PhysicalDisk"
echo.
pause
