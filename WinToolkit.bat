@echo off
chcp 1252 >nul

setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

:: ============================================
:: Load configuration
:: ============================================
if exist "%BASE_DIR%config.bat" (
    call "%BASE_DIR%config.bat"
) else (
    echo WARNING: config.bat file not found!
    echo Using default values...
    set "DOMAIN=DOMAIN"
    set "ADMIN_USER=administrator"
    set "ADMIN_PASSWORD=PASSWORD"
    set "TEST_IP=8.8.8.8"
    set "VNC_SERVICE_NAME=uvnc_service"
    set "SHUTDOWN_TIMEOUT=35"
    set "LANGUAGE=en-US"
)

:: ============================================
:: Load translations
:: ============================================
if not defined LANGUAGE set "LANGUAGE=en-US"

set "YML_FILE=%BASE_DIR%i18n\%LANGUAGE%.yml"
if not exist "%YML_FILE%" (
    echo WARNING: %LANGUAGE%.yml file not found!
    echo Using default language: en-US
    set "LANGUAGE=en-US"
    set "YML_FILE=%BASE_DIR%i18n\en-US.yml"
)

if not exist "%YML_FILE%" (
    echo ERROR: %LANGUAGE%.yml file not found!
    echo Exiting...
    exit /b 1
)

:: ============================================
:: Parse YAML using PowerShell
:: ============================================
set "LOADER=%TEMP%\wintoolkit_%RANDOM%.bat"

powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%BASE_DIR%lib\parse_yaml.ps1' '%YML_FILE%' '%LOADER%'"

if exist "%LOADER%" (
    call "%LOADER%"
    del "%LOADER%" 2>nul
) else (
    echo ERROR: Failed to parse YAML file!
    pause
    exit /b 1
)

:: ============================================
:: Validate critical variables
:: ============================================
if not defined MENU_COUNT (
    echo ERROR: MENU_COUNT not defined. YAML parsing failed.
    pause
    exit /b 1
)

if not defined MENU_TITLE (
    echo ERROR: MENU_TITLE not defined. YAML parsing failed.
    pause
    exit /b 1
)

if not defined MENU_PROMPT (
    echo ERROR: MENU_PROMPT not defined. YAML parsing failed.
    pause
    exit /b 1
)

if not defined MENU_EXIT_KEY (
    echo ERROR: MENU_EXIT_KEY not defined. YAML parsing failed.
    pause
    exit /b 1
)

:: ============================================
:: Main Menu Loop
:: ============================================

:menu
cls
echo =====================
echo !MENU_TITLE!
echo =====================

for /l %%i in (1,1,!MENU_COUNT!) do (
    if defined MENU_VALUE_%%i echo   %%i - !MENU_VALUE_%%i!
)

echo   !MENU_EXIT_KEY! - !MENU_EXIT_VALUE!

echo =====================
set /p opt="!MENU_PROMPT!"

if /i "!opt!"=="!MENU_EXIT_KEY!" goto:exit

set "valid=0"
for /l %%i in (1,1,!MENU_COUNT!) do (
    if "!opt!"=="%%i" (
        set "valid=1"
        if defined MENU_FILE_%%i (
            set "script=!MENU_FILE_%%i!"
            if exist "%BASE_DIR%scripts\!script!" (
                call "%BASE_DIR%scripts\!script!"
            ) else (
                echo ERROR: Script '!script!' not found!
                pause
            )
        )
    )
)

if !valid! equ 0 if not "!opt!"=="" (
    echo Invalid option!
    pause
)

goto:menu

:exit
exit

