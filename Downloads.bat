@echo off
echo Setting up RDP environment...

:: Download installers
curl -s -L -o C:\Users\Public\Desktop\7zip.exe https://www.7-zip.org/a/7z2501-x64.exe
curl -s -L -o msg.ps1 https://gitlab.com/MR.English2008/pcme_rdp/-/raw/main/msg.ps1
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"

:: Install 7zip silently
C:\Users\Public\Desktop\7zip.exe /S
del C:\Users\Public\Desktop\7zip.exe

:: Clean up desktop shortcuts
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" 2>nul
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" 2>nul

:: Install ClawdBot
echo Installing ClawdBot...
powershell -ExecutionPolicy Bypass -Command "iwr -useb https://molt.bot/install.ps1 | iex"

:: Start session timer in background
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File msg.ps1