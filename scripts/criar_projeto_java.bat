@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

where mvn >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Maven not found!
    echo Please install Apache Maven and add it to PATH.
    pause
    exit /b
)

set /p input35="Where would you like to generate the project? "
if "%input35%"=="" (
    echo Error: Path not provided!
    pause
    exit /b
)

if not exist "%input35%" (
    echo Error: Path does not exist: %input35%
    pause
    exit /b
)

cd /d "%input35%"
if %errorlevel% neq 0 (
    echo Error: Could not access path: %input35%
    pause
    exit /b
)

echo.
echo Selected path: %CD%
echo.
pause

set /p input36="Enter the name of the new project: "
if "%input36%"=="" (
    echo Error: Project name not provided!
    pause
    exit /b
)

echo.
echo Creating new Java project: %input36%
echo.
call mvn archetype:generate -DgroupId=com.main -DartifactId=%input36% -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
if %errorlevel% neq 0 (
    echo.
    echo Error creating project!
    pause
    exit /b
)

set /p input37="Would you like to open the new project? (Y/n): "
if /I "%input37%"=="y" (
    echo.
    echo Opening project in Visual Studio Code...
    cd "%input35%\%input36%"
    code .
    echo Project opened!
) else (
    echo.
    echo Project created successfully at: %input35%\%input36%
)
echo.
pause
