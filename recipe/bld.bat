mkdir builddir
cd builddir

cmake -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DUSE_RELATIVE_PATHS=TRUE ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -G "NMake Makefiles JOM" ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
if errorlevel 1 exit /B 1

nmake
if errorlevel 1 exit /B 1
:: No make check
nmake install
if errorlevel 1 exit /B 1
