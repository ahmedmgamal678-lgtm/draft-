@echo off
setlocal
cd /d "%~dp0"
title DRAFT & DRIVE - Server
where node >nul 2>nul
if errorlevel 1 (
  echo.
  echo =============================================
  echo Node.js is not installed.
  echo Install Node.js LTS, then double-click start.bat again.
  echo =============================================
  echo.
  pause
  exit /b 1
)
if not exist node_modules (
  echo Installing required packages... Please wait.
  call npm install
  if errorlevel 1 (
    echo.
    echo npm install failed. Check your internet connection and try again.
    pause
    exit /b 1
  )
)
echo.
echo DRAFT ^& DRIVE is starting...
echo Admin password: DRAFT2026
echo Store: http://localhost:3000/
echo Admin: http://localhost:3000/admin.html
echo.
start "DRAFT & DRIVE Store" http://localhost:3000/
start "DRAFT & DRIVE Admin" http://localhost:3000/admin.html
npm start
pause
