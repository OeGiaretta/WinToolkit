@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

if exist "%BASE_DIR%..\config.bat" (
    call "%BASE_DIR%..\config.bat"
) else (
    set "TEST_IP=8.8.8.8"
)

echo ========================================
echo    Testing Internet Connection
echo ========================================
echo.
echo Testing connection with %TEST_IP%...
echo.
ping %TEST_IP% -n 6
echo.
pause
