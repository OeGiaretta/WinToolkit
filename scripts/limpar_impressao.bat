@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: This script requires administrator privileges!
    echo Please run as administrator.
    pause
    exit /b
)

echo ========================================
echo    Clearing Print Queue
echo ========================================
echo.

echo Stopping print spooler service...
net stop spooler >nul 2>&1
if %errorlevel% neq 0 (
    echo Warning: Could not stop spooler service.
    echo The service may already be stopped or not exist.
)

set "SPOOL_DIR=%systemroot%\system32\spool\PRINTERS"
if exist "%SPOOL_DIR%" (
    echo.
    echo Cleaning print queue files...
    cd /d "%SPOOL_DIR%"
    del /f /s /q *.SHD >nul 2>&1
    del /f /s /q *.SPL >nul 2>&1
    echo Print queue files removed.
) else (
    echo Warning: Spool directory not found: %SPOOL_DIR%
)

echo.
echo Starting print spooler service...
net start spooler >nul 2>&1
if %errorlevel% equ 0 (
    echo Spooler service restarted successfully!
) else (
    echo Error: Could not restart spooler service.
)

echo.
echo ========================================
echo    Cleanup Completed
echo ========================================
echo.
pause
