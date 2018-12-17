mkdir builddir
cd builddir

cmake -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -G "NMake Makefiles JOM" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DwxBUILD_TESTS=CONSOLE_ONLY ^
    -DwxBUILD_VENDOR="" ^
    -DwxMSVC_VERSION="140" ^
    ..
if errorlevel 1 exit /B 1

cmake --build .
if errorlevel 1 exit /B 1

cmake --build . --target test
if errorlevel 1 exit /B 1

cmake --build . --target install
if errorlevel 1 exit /B 1
