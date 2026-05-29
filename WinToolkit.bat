@echo off
chcp 65001 >nul

setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"
call "%~dp0lib\ui\ui.bat"

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

echo.
echo %BYELLOW%Available Modules:%RESET%
echo.

:menu

call :header

for /l %%i in (1,1,!MENU_COUNT!) do (
    if defined MENU_VALUE_%%i (
        echo   %BCYAN%[%%i]%RESET% !MENU_VALUE_%%i!
    )
)

echo.
echo %BRED%[!MENU_EXIT_KEY!]%RESET% !MENU_EXIT_VALUE!

echo.
echo %CYAN%+--------------------------------------+%RESET%
echo.
set /p opt=%WHITE%!MENU_PROMPT! ^>%RESET% 

if /i "!opt!"=="!MENU_EXIT_KEY!" goto exit

set "valid=0"
for /l %%i in (1,1,!MENU_COUNT!) do (
    if "!opt!"=="%%i" (
        set "valid=1"
        if defined MENU_FILE_%%i (
            set "script=!MENU_FILE_%%i!"
            if exist "%BASE_DIR%scripts\!script!" (
                call "%BASE_DIR%scripts\!script!"
            ) else (
                call :error "Script file !script! not found!" 
                pause
            )
        )
    )
)

if !valid! equ 0 if not "!opt!"=="" (
    echo Invalid option!
    pause
)

goto menu

:error
echo.
echo %BRED%[ERROR]%RESET% %~1
echo.
exit /b

:success
echo.
echo %BGREEN%[SUCCESS]%RESET% %~1
echo.
exit /b

:info
echo.
echo %BCYAN%[INFO]%RESET% %~1
echo.
exit /b

:exit
exit

