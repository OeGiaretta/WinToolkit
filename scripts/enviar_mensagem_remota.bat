@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

set /p input9="Enter IP or computer name: "
if "%input9%"=="" (
    echo Error: IP or name not provided!
    pause
    exit /b
)

set input10=%input9%

echo.
echo Getting logged user on computer %input10%...
for /f "usebackq delims=\ tokens=2" %%a in (`wmic /node:%input10% computersystem get username /value ^| findstr /r /v "^$" 2^>nul`) do (
  call :TrimUsername "%%a"
)

if "%username%"=="" (
    echo Error: Could not get logged user.
    pause
    exit /b
)

echo User found: %username%
echo.
set /p input17="Enter message to send: "
if "%input17%"=="" (
    echo Error: Message not provided!
    pause
    exit /b
)

echo.
echo Sending message to %username% on %input9%...
msg /W /V /SERVER:%input9% %username% %input17%
if %errorlevel% equ 0 (
    echo Message sent successfully!
) else (
    echo Error sending message.
)
echo.
pause
exit /b

:TrimUsername
set "fullusername=%~1"
set "username=%fullusername:*\=%"
exit /b
