@echo off

:: ANSI Escape Character
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

:: Colors
set "RESET=%ESC%[0m"

set "BLACK=%ESC%[30m"
set "RED=%ESC%[31m"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "BLUE=%ESC%[34m"
set "MAGENTA=%ESC%[35m"
set "CYAN=%ESC%[36m"
set "WHITE=%ESC%[97m"

:: Bright Colors
set "BRED=%ESC%[91m"
set "BGREEN=%ESC%[92m"
set "BYELLOW=%ESC%[93m"
set "BBLUE=%ESC%[94m"
set "BCYAN=%ESC%[96m"

echo.
exit /b