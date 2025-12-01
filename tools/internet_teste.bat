@echo off

setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"

ping 8.8.8.8 -n 6
pause