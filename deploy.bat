@echo off
title Flutter Portfolio Deploy
color 0A

echo ========================================
echo      Flutter Portfolio Deployment
echo ========================================
echo.

echo [1/7] Cleaning...
call flutter clean
if errorlevel 1 goto error

echo.
echo [2/7] Getting Packages...
call flutter pub get
if errorlevel 1 goto error

echo.
echo [3/7] Building Web...
call flutter build web --release --base-href "/portfolio/"
if errorlevel 1 goto error

echo.
echo [4/7] Updating docs folder...
if exist docs rmdir /s /q docs
mkdir docs
xcopy build\web docs\ /E /I /Y >nul

echo.
echo [5/7] Git Add...
git add .

echo.
set /p msg=Enter Commit Message:

git commit -m "%msg%"

echo.
echo [6/7] Git Push...
git push origin main
if errorlevel 1 goto error

echo.
echo ========================================
echo      Deployment Finished Successfully
echo ========================================
echo.
echo Wait 1-2 minutes then refresh:
echo https://ahmedehab10.github.io/portfolio/
pause
exit

:error
echo.
echo Deployment Failed!
pause