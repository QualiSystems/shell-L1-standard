@ECHO OFF
setlocal
set DRIVER_FOLDER=%~dp0
set DRIVER_NAME="{{cookiecutter.project_slug}}"
set QS_PYTHON="%DRIVER_FOLDER%\..\..\python\2.7.10\python.exe"
ECHO %QS_PYTHON%
%QS_PYTHON% -m virtualenv --system-site-packages "%DRIVER_FOLDER%\"
set DRIVER_PYTHON="%DRIVER_FOLDER%\Scripts\python.exe"
%DRIVER_PYTHON% -m pip install -r "%DRIVER_FOLDER%\requirements.txt" --no-index -f "%DRIVER_FOLDER%\packages"
copy "%DRIVER_FOLDER%\driver_exe_template" "%DRIVER_FOLDER%\..\%DRIVER_NAME%.exe"
endlocal