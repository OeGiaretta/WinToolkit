@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

set /p input27="Enter destination computer IP: "
if "%input27%"=="" (
    echo Error: Computer IP not provided!
    pause
    exit /b
)

set /p input28="Enter printer IP to install: "
if "%input28%"=="" (
    echo Error: Printer IP not provided!
    pause
    exit /b
)

echo.
echo Installing printer %input28% on computer %input27%...
rundll32 printui.dll, PrintUIEntry /o /c\\%input27% /ip %input28%
if %errorlevel% equ 0 (
    echo Printer installed successfully!
) else (
    echo Error installing printer.
)
echo.
pause
