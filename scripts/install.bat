@echo off

xcopy . "%APPDATA%\Balatro\Mods\Balatro_Expedition33" ^
  /EXCLUDE:scripts\install_exclude.txt ^
  /E /I /F /Y
