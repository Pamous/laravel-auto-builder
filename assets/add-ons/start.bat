@echo off
setlocal enabledelayedexpansion
title SET ADDONS VARIABLE
:main
set path_defaut="create_new_project_prompt"
set /p opt="[92mDo you want to add more dependencies? [0m"

if /I "%opt%"=="Y" (
    goto:new
) else if /I "%opt%"=="N" (
    goto:exit
) else (
    echo Invalid Input
    goto:main
)

:new
for /L %%i in (3,-1,1) do (
    echo [92m"Wait for dependecies scrap [94m%%i [92mseconds..."
    timeout /t 1 >nul
)
goto:tailwind

:tailwind
echo.
echo [92m"Installing [94mtailwind"[0m
echo.
start /wait cmd /c npm install -D tailwindcss postcss autoprefixer
start /wait cmd /c npx tailwindcss init -p
echo [94m"tailwind [93minstalled"[0m
goto:alphine

:alphine
echo [92m"Installing [91malphinejs[92m"[0m
echo.
start /wait cmd /c npm install alpinejs
start /wait cmd /c npm install @alpinejs/intersect
echo [94m"alphinejs [93minstalled"[0m
goto:livewire

:livewire
echo [92m"Installing [91mlivewire[92m"[0m
start /wait cmd /c composer require livewire/livewire
php artisan livewire:publish --config
echo [94m"livewire [93minstalled"[0m
goto:sub
:sub
set /p breeze_install=[92mDo you want to install Laravel Breeze? (Y/N) [0m

if /I "%breeze_install%"=="Y" (
    goto:breeze
) else if /I "%breeze_install%"=="N" (
    goto:copy
) else (
    echo Invalid Input. Please enter Y or N.
    goto:sub
)

:breeze
echo [92m"Adding Laravel Breeze"[0m
start /wait cmd /c "composer require laravel/breeze --dev"
php artisan breeze:install
echo [94m"Laravel Breeze [93minstalled"[0m
goto:copy

:copy
echo [93m"Copying files"[0m
copy "..\%path_defaut%\assets\tailwind.config.js" .
copy "..\%path_defaut%\assets\app.css" "resources\css\"
copy "..\%path_defaut%\assets\app.js" "resources\js\"
copy "..\%path_defaut%\assets\start.bat" .
echo [93m"Cleaning up..."[0m
rmdir /s /q "..\%path_defaut%" 2>nul
echo [92m"Cleanup complete."[0m

:exit
set /p a=[92m"Press ENTER to exit..."[0m
exit /b
