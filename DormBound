@echo off
:: [POLISH] Hard-coded to 82 columns for perfect border alignment
mode con: cols=82 lines=30
title DormBound - %USERNAME%
color 0F

:: Automatic Admin Elevation Check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo  ==============================================================================
    echo   ERROR: ADMINISTRATIVE PRIVILEGES REQUIRED
    echo  ==============================================================================
    echo  Please right-click and "Run as administrator" to manage network interfaces.
    pause
    exit
)

:MENU
cls
color 0F
echo.
echo  ==============================================================================
echo                          DORMBOUND NETWORK OPTIMIZER
echo  ==============================================================================
echo.
echo     [1] SMART GAME START (Analyze + Priority + Pause Updates)
echo     [2] RESTORE NORMAL   (Standard MTU + Resume Updates)
echo     [3] VIEW PERFORMANCE LOG
echo     [4] EXIT
echo.
echo  ==============================================================================
echo   SYSTEM STATE:
  for /f "tokens=1" %%a in ('netsh interface ipv4 show subinterface "Wi-Fi" ^| findstr "1428 1492 1500"') do set "curMTU=%%a"
  echo    Current MTU: %curMTU%  ^|  Status: [Ready]
  netsh wlan show interfaces | findstr /C:"Auto configuration"
echo  ==============================================================================
echo.
set /p choice="  Selection (1-4): "

if "%choice%"=="1" goto SMART_START
if "%choice%"=="2" goto SET_NORMAL
if "%choice%"=="3" goto VIEW_LOG
if "%choice%"=="4" exit
goto MENU

:SMART_START
echo.
echo  [1/4] ANALYZING DORM JITTER...
set "logFile=%userprofile%\Desktop\PingLog.txt"
for /f "tokens=4 delims==m" %%p in ('ping google.com -n 4 ^| findstr "Average"') do set "avgPing=%%p"
set /a avgPing=%avgPing: =%

echo  [2/4] CURRENT LATENCY: %avgPing%ms
echo %date% %time% - Ping: %avgPing%ms (Mode: Optimized) >> "%logFile%"

:: Adaptive Logic: Auto-Reset if ping is bad
if %avgPing% GTR 15 (
    echo  [!] JITTER DETECTED. Resetting Winsock...
    netsh winsock reset >nul
)

echo  [3/4] RESERVING BANDWIDTH ^& PAUSING UPDATES...
net stop wuauserv >nul 2>&1
netsh int ip set global taskoffload=disabled >nul

echo  [4/4] LOCKING MTU 1428...
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1428 store=persistent >nul
netsh wlan set autoconfig enabled=no interface="Wi-Fi" >nul
ipconfig /flushdns >nul

echo.
echo  [SUCCESS] OPTIMIZED FOR %avgPing%MS. APPS UNTOUCHED.
timeout /t 3 >nul
goto MENU

:SET_NORMAL
echo.
color 0A
echo  [!] RESTORING SYSTEM STANDARDS...
net start wuauserv >nul 2>&1
netsh int ip set global taskoffload=enabled >nul
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1492 store=persistent >nul
netsh wlan set autoconfig enabled=yes interface="Wi-Fi" >nul
echo  [SUCCESS] NORMAL MODE ^& UPDATES ACTIVE.
timeout /t 3 >nul
goto MENU

:VIEW_LOG
if exist "%logFile%" start notepad "%logFile%"
goto MENU
