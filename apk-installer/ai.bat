@echo off
SET A=E:\Documents\WDJDownload\Apps
cd/d %A%
SET Z="D:\Program Files\乐玩助手\bin\zxlycon.exe"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Setlocal EnableDelayedExpansion
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:main
cls
title 技术组 . APK安装器
set /p env=请输入软件名称: || set env=null
if /I %env%==null ( 
  echo ---------------------------------------------------
  echo 输入无效
  echo ---------------------------------------------------
  pause
  goto main
) else (
  goto installer
)
:installer
echo ---------------------------------------------------
echo 正在安装 %env% ...
echo ---------------------------------------------------
Z install -rtdp %A%\%env%.apk 2> %TEMP%\z_out.txt
type %TEMP%\z_out.txt
find /i "device not found" %TEMP%\z_out.txt >nul
if %ERRORLEVEL% EQU 0 (
echo ---------------------------------------------------
) else (
find /i "can't" %TEMP%\z_out.txt >nul
if %ERRORLEVEL% EQU 1 (
echo ---------------------------------------------------
echo.
echo 你是不是在找. . .
echo ---------------------------------------------------
dir /B *%env%*.apk
echo ---------------------------------------------------
) else (
echo ---------------------------------------------------
echo 没有相关文件
echo ---------------------------------------------------
)
)
pause
goto main
