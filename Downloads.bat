@echo off
echo Setting up RDP environment...

:: Download installers
curl -s -L -o msg.ps1 https://raw.githubusercontent.com/reductionfear/rdp/main/msg.ps1
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"

:: Clean up desktop shortcuts
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" 2>nul
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" 2>nul

:: Install ClawdBot
echo Installing ClawdBot...
powershell -ExecutionPolicy Bypass -Command "iwr -useb https://molt.bot/install.ps1 | iex"

:: Start session timer in background
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File msg.ps1
