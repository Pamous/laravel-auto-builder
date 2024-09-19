@echo off
title SETTING DEPENDENCIES MISSING

echo [92m"Downlaoding dependecies"[0m
echo.
echo [94m"Downloading composer"[0m
echo.
start /wait cmd /c composer install
echo.
echo [94m"Updating composer"[0m
start /wait cmd /c composer update
echo.
echo [94m"Updating Node Package Manager"[0m
start /wait cmd /c npm update
echo.
echo [94m"Copying enviroment file"[0m
copy .env.example .env
echo.
echo [94m"Generate key"[0m
php artisan key:generate
echo [94mOpening the vs code[0m
code .
for /L %%i in (3,-1,1) do (
    echo [92m"Closing in [94m%%i [92mseconds..."
    timeout /t 1 >nul
)