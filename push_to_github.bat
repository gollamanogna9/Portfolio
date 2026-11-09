@echo off
setlocal enabledelayedexpansion
title Push Portfolio to GitHub

echo ======================================================================
echo           COSMIC PORTFOLIO - GITHUB DEPLOYMENT ASSISTANT
echo ======================================================================
echo Target Repository: https://github.com/gollamanogna9/Portfolio.git
echo.
echo Choose your authentication method:
echo.
echo   [1] Browser Login with GitHub (Recommended - Automatic and Instant)
echo   [2] Paste a Personal Access Token (PAT)
echo.
set /p CHOICE="Enter 1 or 2 (default is 1): "

if "%CHOICE%"=="2" goto TOKEN_FLOW

:BROWSER_FLOW
echo.
echo ----------------------------------------------------------------------
echo Starting GitHub Browser Authentication...
echo A browser window will open, or copy the one-time code shown below.
echo ----------------------------------------------------------------------
echo.
"C:\Users\golla\.gemini\antigravity\scratch\gh\gh.exe" auth login -p https -w -h github.com
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Browser login did not complete. Switching to Token mode...
    goto TOKEN_FLOW
)
echo.
echo Configuring Git credentials with GitHub...
"C:\Users\golla\.gemini\antigravity\scratch\gh\gh.exe" auth setup-git
goto DO_PUSH

:TOKEN_FLOW
echo.
echo ----------------------------------------------------------------------
echo To get a Personal Access Token:
echo 1. Open: https://github.com/settings/tokens/new
echo 2. Check the 'repo' permission and click 'Generate token'
echo ----------------------------------------------------------------------
echo.
set /p TOKEN="Paste your GitHub Personal Access Token (PAT): "
if "%TOKEN%"=="" (
    echo No token entered. Exiting.
    pause
    exit /b 1
)

echo.
echo Pushing repository using your token...
cd /d "C:\Users\golla\.gemini\antigravity\scratch\cosmic-portfolio"
"C:\Users\golla\.gemini\antigravity\scratch\mingit\cmd\git.exe" push https://%TOKEN%@github.com/gollamanogna9/Portfolio.git main -u
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ======================================================================
    echo   SUCCESS! Your portfolio is now live on GitHub:
    echo   https://github.com/gollamanogna9/Portfolio
    echo ======================================================================
) else (
    echo.
    echo [ERROR] Push failed. Please check that the token has 'repo' permissions.
)
pause
exit /b 0

:DO_PUSH
echo.
echo Pushing repository to GitHub...
cd /d "C:\Users\golla\.gemini\antigravity\scratch\cosmic-portfolio"
"C:\Users\golla\.gemini\antigravity\scratch\mingit\cmd\git.exe" push -u origin main
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ======================================================================
    echo   SUCCESS! Your portfolio is now live on GitHub:
    echo   https://github.com/gollamanogna9/Portfolio
    echo ======================================================================
) else (
    echo.
    echo [ERROR] Push encountered an issue.
)
pause
