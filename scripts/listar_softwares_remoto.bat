@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

if exist "%BASE_DIR%..\config.bat" (
    call "%BASE_DIR%..\config.bat"
) else (
    set "DOMAIN=DOMAIN"
    set "ADMIN_USER=administrator"
    set "ADMIN_PASSWORD=PASSWORD"
)

where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: winget not found!
    echo Please install Windows Package Manager.
    pause
    exit /b
)

set /p input23="Enter IP or computer name: "
if "%input23%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Connecting to computer %input23%...
net use W: \\%input23%\c$\Users /USER:%DOMAIN%\%ADMIN_USER% %ADMIN_PASSWORD% >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Could not connect to computer %input23%
    echo Verify that the IP/name is correct and credentials are valid.
    pause
    exit /b
)

W:
echo Listing installed software...
winget list
C:
net use W: /delete >nul 2>&1
echo.
pause
