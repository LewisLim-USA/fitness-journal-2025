cd /d %~dp0
@echo off
setlocal enabledelayedexpansion

:: Get today's date from Windows
for /f "tokens=2 delims==" %%A in ('"wmic os get localdatetime /value"') do set datetime=%%A
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%

:: Make folder like 2025\05
mkdir %year%\%month% >nul 2>&1

:: Set the file path like 2025\05\13.md
set filepath=%year%\%month%\%day%.md

:: Check if it already exists
if exist %filepath% (
    echo File already exists: %filepath%
) else (
    echo Creating %filepath%
    (
        echo # 📅 %year%-%month%-%day%
        echo.
        echo ## 🏋 Exercise
        echo - Pushups:
        echo - Pullups:
        echo - Squats:
        echo - Walk:
        echo.
        echo ## 🍽 Food
        echo - **Breakfast**:
        echo - **Lunch**:
        echo - **Dinner**:
        echo - **Total**:
        echo.
        echo ## 💡 Notes
        echo 
    ) > %filepath%
)

notepad %filepath%
