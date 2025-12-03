@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

set /p input29="Enter IP or computer name: "
if "%input29%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Getting Office key on computer %input29%...
echo.
wmic /node:%input29% path softwarelicensingservice get OA3xOriginalProductKey
echo.
pause
