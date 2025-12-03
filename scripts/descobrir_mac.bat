@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

set /p input25="Enter computer IP: "
if "%input25%"=="" (
    echo Error: IP not provided!
    pause
    exit /b
)

echo.
echo ========================================
echo    Computer Information: %input25%
echo ========================================
echo.
echo Logged user:
wmic /node:%input25% computersystem get username
echo.
echo Model and Name:
wmic /node:%input25% computersystem get model, name
echo.
echo MAC Address:
arp -a %input25%
echo.
pause
