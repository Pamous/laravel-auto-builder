@echo off
setlocal enabledelayedexpansion
title CREATE LARAVEL PROJECT

set /p opt="[33mDo you like to create new laravel project? [92m(Y/N)[0m "

set path_defaut="create_new_project_prompt"

if /I "%opt%"=="Y" (
    for /L %%i in (3,-1,1) do (
        cls
        echo "[92mSetting up...([94m%%i [92mseconds)[0m"
        timeout /t 1 >nul
    )
    set /p project_name="[94mProject Name: [0m"
    goto:dl
) else if /I "%opt%"=="N" (
    exit
) else (
    echo Invalid Input
    goto:set
)

:dl
cd ../
echo [92mDownload dependecies for [33m%project_name%[0m
echo.
start /wait cmd /c composer create-project laravel/laravel %project_name%
echo [93mCopying files[0m
mkdir %project_name%
copy "%path_defaut%\assets\add-ons\start.bat" %project_name%
echo [92mGoing to [94m%project_name%[0m
cd %project_name%
start start.bat