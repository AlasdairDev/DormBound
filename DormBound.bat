@echo off
setlocal EnableDelayedExpansion

:: 1. ADMIN ELEVATION
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo  [!] REQUESTING ADMINISTRATIVE PRIVILEGES...
    powershell -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

:: 2. WINDOWS TERMINAL FIX
pushd "%~dp0"
mode con: cols=82 lines=34
title DormBound - %USERNAME%
color 0F

:MENU
cls
color 0F
echo.
echo  ==============================================================================
echo                          DORMBOUND NETWORK OPTIMIZER 2.0
echo  ==============================================================================
echo.
echo     [1] BALANCED MODE   (Best Speed + Low Latency)       ^<- Try this first
echo     [2] STABILITY MODE  (Best for Lag Spikes/Busy Dorms) ^<- Use if [1] lags
echo     [3] RESTORE NORMAL  (Standard Windows Settings)
echo     [4] VIEW PERFORMANCE LOG
echo     [5] EXIT
echo.
echo  ==============================================================================
echo   SYSTEM STATE:
    for /f "tokens=1" %%a in ('netsh interface ipv4 show subinterface "Wi-Fi" ^| findstr "1400 1428 1492 1500"') do (
        set "rawMTU=%%a"
        set /a "payload=!rawMTU! - 28"
    )
    echo    Current Payload: !payload! bytes ^| Status: [Ready]
    netsh wlan show interfaces | findstr /C:"Auto configuration"
echo  ==============================================================================
echo.
set /p choice="  Selection (1-5): "

if "%choice%"=="1" set "targetMTU=1428" & goto SMART_START
if "%choice%"=="2" set "targetMTU=1400" & goto SMART_START
if "%choice%"=="3" goto SET_NORMAL
if "%choice%"=="4" goto VIEW_LOG
if "%choice%"=="5" exit
goto MENU

:SMART_START
echo.
echo  [1/4] ANALYZING DORM JITTER...
set "logFile=%userprofile%\Desktop\PingLog.txt"
set "avgPing=0"
for /f "tokens=4 delims==m" %%p in ('ping google.com -n 4 ^| findstr "Average"') do (
    set "rawPing=%%p"
    set "avgPing=!rawPing: =!"
)
if "!avgPing!"=="" set "avgPing=0"

echo  [2/4] CURRENT LATENCY: !avgPing!ms
echo %date% %time% - Ping: !avgPing!ms (MTU: %targetMTU%) >> "%logFile%"

echo  [3/4] APPLYING REGISTRY PRIORITY...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

echo  [4/4] LOCKING MTU %targetMTU%...
netsh int ip set global taskoffload=disabled >nul
netsh interface ipv4 set subinterface "Wi-Fi" mtu=%targetMTU% store=persistent >nul
netsh wlan set autoconfig enabled=no interface="Wi-Fi" >nul
ipconfig /flushdns >nul

echo.
echo  [SUCCESS] OPTIMIZED FOR !avgPing!MS USING %targetMTU% MTU.
pause
goto MENU

:SET_NORMAL
echo.
color 0A
echo  [!] RESTORING SYSTEM STANDARDS...
netsh wlan set autoconfig enabled=yes interface="Wi-Fi" >nul
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1492 store=persistent >nul
netsh int ip set global taskoffload=enabled >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 20 /f >nul
echo  [SUCCESS] NORMAL MODE ^& UPDATES ACTIVE.
pause
goto MENU

:VIEW_LOG
if exist "%logFile%" start notepad "%logFile%"
goto MENU
