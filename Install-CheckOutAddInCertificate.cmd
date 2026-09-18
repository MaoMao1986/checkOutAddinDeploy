@echo off
setlocal
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Install-CheckOutAddInCertificate.ps1"
if errorlevel 1 (
  echo.
  echo Certificate installation failed. See the error above.
  pause
  exit /b 1
)
echo.
echo CheckOutAddIn certificate trust is ready for the current Windows user.
pause
