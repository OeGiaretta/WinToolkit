@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

where curl >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: curl not found!
    echo Please install curl or use Windows 10/11 which already includes it.
    pause
    exit /b
)

echo.
echo Generating person data, please wait...

set "TEMP_FILE=%TEMP%\wintoolkit_pessoa.json"
curl -s -X POST ^
  -H "Content-Type: application/x-www-form-urlencoded" ^
  -d "acao=gerar_pessoa&sexo=I&pontuacao=S&idade=0&txt_qtde=1" ^
  https://www.4devs.com.br/ferramentas_online.php > "%TEMP_FILE%" 2>nul

if %errorlevel% neq 0 (
    echo Error: Could not connect to service.
    pause
    exit /b
)

if not exist "%TEMP_FILE%" (
    echo Error: Could not generate data.
    pause
    exit /b
)

REM Read JSON data using PowerShell
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).nome" 2^>nul') do set nome=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).idade" 2^>nul') do set idade=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).cpf" 2^>nul') do set cpf=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).rg" 2^>nul') do set rg=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).data_nasc" 2^>nul') do set data_nasc=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).sexo" 2^>nul') do set sexo=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).signo" 2^>nul') do set signo=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).mae" 2^>nul') do set mae=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).pai" 2^>nul') do set pai=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).email" 2^>nul') do set email=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).senha" 2^>nul') do set senha=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).cep" 2^>nul') do set cep=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).endereco" 2^>nul') do set endereco=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).numero" 2^>nul') do set numero=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).bairro" 2^>nul') do set bairro=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).cidade" 2^>nul') do set cidade=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).estado" 2^>nul') do set estado=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).telefone_fixo" 2^>nul') do set telefone_fixo=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).celular" 2^>nul') do set celular=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).altura" 2^>nul') do set altura=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).peso" 2^>nul') do set peso=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).tipo_sanguineo" 2^>nul') do set tipo_sanguineo=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Content '%TEMP_FILE%' | ConvertFrom-Json).cor" 2^>nul') do set cor=%%a

if "%nome%"=="" (
    echo Error: Could not process generated data.
    del "%TEMP_FILE%" >nul 2>&1
    pause
    exit /b
)

echo.
echo ========================================
echo         PERSON DATA GENERATED
echo ========================================
echo.
echo [Personal Data]
echo   Name:              %nome%
echo   Age:               %idade%
echo   Gender:            %sexo%
echo   Birth Date:        %data_nasc%
echo   Zodiac Sign:       %signo%
echo.
echo [Documents]
echo   CPF:               %cpf%
echo   RG:                %rg%
echo.
echo [Family]
echo   Mother:            %mae%
echo   Father:            %pai%
echo.
echo [Contact]
echo   Email:             %email%
echo   Password:          %senha%
echo   Landline:          %telefone_fixo%
echo   Mobile:            %celular%
echo.
echo [Address]
echo   ZIP Code:          %cep%
echo   Address:           %endereco%
echo   Number:            %numero%
echo   District:          %bairro%
echo   City:              %cidade%
echo   State:             %estado%
echo.
echo [Other]
echo   Height:            %altura%
echo   Weight:            %peso%
echo   Blood Type:        %tipo_sanguineo%
echo   Color:             %cor%
echo.
echo ========================================
del "%TEMP_FILE%" >nul 2>&1
pause
