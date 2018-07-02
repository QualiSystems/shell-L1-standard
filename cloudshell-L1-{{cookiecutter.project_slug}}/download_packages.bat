@ECHO OFF
setlocal
set DRIVER_FOLDER=%~dp0
set DRIVER_PYTHON="%DRIVER_FOLDER%\Scripts\python.exe"
set PACKAGES="%DRIVER_FOLDER%\packages"
if not exist %PACKAGES% mkdir %PACKAGES%
set ORIGINAL=%CD%
cd %PACKAGES%
%DRIVER_PYTHON% -m pip download -r "%DRIVER_FOLDER%\requirements.txt"
cd %ORIGINAL%
endlocal


