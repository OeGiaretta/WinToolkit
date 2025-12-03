@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set /p input1="Enter path to add as exception: "
if "%input1%"=="" (
    echo Error: Path not provided!
    pause
    exit /b
)

if not exist "%input1%" (
    echo Warning: The provided path does not exist: %input1%
    echo Do you want to continue anyway? (Y/n)
    set /p confirm=
    if /I not "%confirm%"=="y" (
        echo Operation canceled.
        pause
        exit /b
    )
)

echo.
echo Adding exception to Windows Defender...
powershell -Command "Add-MpPreference -ExclusionPath '%input1%'" 2>nul
if %errorlevel% equ 0 (
    echo.
    echo Exception added successfully!
) else (
    echo.
    echo Error adding exception. Verify that the path is correct.
)
echo.
echo Current exclusion list:
powershell -Command "(Get-MpPreference).ExclusionPath"
echo.
pause
