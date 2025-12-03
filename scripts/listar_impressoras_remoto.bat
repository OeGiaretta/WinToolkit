@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

set /p input24="Enter IP or computer name: "
if "%input24%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Listing installed printers on computer %input24%...
echo.
wmic /node:%input24% printer get caption, Status, portname
echo.
pause
