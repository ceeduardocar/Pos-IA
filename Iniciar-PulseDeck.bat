@echo off
setlocal
cd /d "%~dp0"
start "PulseDeck" powershell.exe -NoProfile -ExecutionPolicy Bypass -STA -File "%~dp0PulseDeck.ps1"
endlocal
