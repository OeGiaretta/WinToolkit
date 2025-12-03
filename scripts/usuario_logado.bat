@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

set /p input18="Enter IP or computer name: "
if "%input18%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

echo.
echo Checking logged user on computer %input18%...
echo.
wmic /node:%input18% computersystem get username
echo.
pause
