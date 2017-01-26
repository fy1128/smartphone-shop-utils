@echo off
:en
tasklist |find "wandoujia2.exe"||goto exist
:exist
tasklist |find "MmQt.exe" || start mmqt
ping -n 15 127.0.0.1>nul
goto en