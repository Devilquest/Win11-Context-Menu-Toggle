@echo off
:: Menu switcher for Windows 11 context menu
:: Option 1 -> Modern menu
:: Option 2 -> Classic menu
:: Comments and variable names are in English

setlocal EnableExtensions

set "KeyGuid=HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
set "KeyInproc=%KeyGuid%\InprocServer32"

echo ==============================================
echo   Context Menu Selector for Windows 11
echo ==============================================
echo   1) Set MODERN Windows 11 context menu
echo   2) Set CLASSIC context menu
echo.

choice /c 12 /n /m "Choose an option [1/2]: "
if errorlevel 2 goto SetClassic
if errorlevel 1 goto SetModern

:SetModern
echo.
echo Setting MODERN context menu...
reg delete "%KeyGuid%" /f >nul 2>&1
if %errorlevel%==0 (
    echo OK: MODERN context menu configured.
) else (
    echo Info: Key not present or already MODERN.
)
goto AskRestart

:SetClassic
echo.
echo Setting CLASSIC context menu...
reg add "%KeyInproc%" /f /ve >nul 2>&1
if %errorlevel%==0 (
    echo OK: CLASSIC context menu configured.
) else (
    echo ERROR: Could not create the required key.
)
goto AskRestart

:AskRestart
echo.
choice /c YN /n /m "Restart Windows Explorer now? [Y/N]: "
if errorlevel 2 goto End
if errorlevel 1 (
    taskkill /f /im explorer.exe >nul 2>&1
    start explorer.exe
    echo Explorer restarted.
)

:End
echo.
echo Done.
pause
endlocal