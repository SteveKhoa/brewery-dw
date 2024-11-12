@echo off

REM Set the working directory to the script's directory
cd /d %~dp0

echo Started

REM Check if the .env file exists
if not exist env.txt (
    echo env.txt file not found!
    pause
    exit /b 1
)

REM Debugging: Display the contents of the .env file
echo Displaying contents of .env file:
type .env
echo.

REM Set environment variables from .env file and log each iteration
for /f "delims=" %%i in (env.txt) do (
    echo Processing line: %%i
    setlocal enabledelayedexpansion
    set "line=%%i"
    for /f "tokens=1,2 delims==" %%a in ("!line!") do (
        echo Setting %%a=%%b
        @REM set %%a=%%b
    )
    endlocal
)

echo Done loop

REM Display current environment variables (optional for debugging)
@REM set

@REM pause