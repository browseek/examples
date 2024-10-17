@echo off

REM Determine architecture
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set ARCH=x64
) else if "%PROCESSOR_ARCHITECTURE%"=="ARM64" (
    set ARCH=arm64
) else (
    echo Unsupported architecture
    exit /b 1
)

REM Install Node.js dependencies
call npm install

REM Install Python dependencies
pip install -r requirements.txt

REM Install browser drivers
call :install_driver chromedriver
call :install_driver geckodriver
call :install_driver edgedriver

echo Installation complete!
exit /b 0

:install_driver
set driver=%~1
set driver_path=drivers\%driver%\windows\%ARCH%
if exist "%driver_path%\install.bat" (
    echo Installing %driver% driver...
    call "%driver_path%\install.bat"
) else (
    echo %driver% driver installation script not found for Windows %ARCH%
)
exit /b 0
