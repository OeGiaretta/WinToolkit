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

where psexec >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: psexec not found!
    echo Please install Microsoft PsTools.
    pause
    exit /b
)

set /p input33="Enter IP or computer name: "
if "%input33%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Listing running processes on computer %input33%...
echo.
psexec \\%input33% -s tasklist
echo.
set /p input34="Enter process name to close (ex: notepad.exe): "
if "%input34%"=="" (
    echo Error: Process name not provided!
    pause
    exit /b
)

echo.
echo Closing process %input34% on computer %input33%...
psexec \\%input33% -u %DOMAIN%\%ADMIN_USER% -p %ADMIN_PASSWORD% -d -i taskkill /F /IM %input34%
if %errorlevel% equ 0 (
    echo.
    echo Process terminated successfully!
) else (
    echo.
    echo Error terminating process or process not found.
)
echo.
pause
