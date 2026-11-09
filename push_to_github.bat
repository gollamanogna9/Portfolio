@echo off
title Push Portfolio to GitHub
echo ======================================================================
echo   Pushing Portfolio to https://github.com/gollamanogna9/Portfolio.git
echo ======================================================================
echo.
echo Note: When prompted for password, enter your GitHub Personal Access Token (PAT).
echo (GitHub does not accept account passwords for command-line git push)
echo.
cd /d "%~dp0"
"C:\Users\golla\.gemini\antigravity\scratch\mingit\cmd\git.exe" push -u origin main
echo.
echo ======================================================================
pause
