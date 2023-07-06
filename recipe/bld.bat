
cargo bundle-licenses --format yaml --output DENO_THIRDPARTY_LICENSES.yml
if errorlevel 1 exit 1
cargo build --release
if errorlevel 1 exit 1

mkdir %LIBRARY_BIN%
if errorlevel 1 exit 1
COPY target\%HOST%\release\deno.exe %LIBRARY_BIN%\deno.exe
if errorlevel 1 exit 1

mkdir %PREFIX:/=\%\etc\conda\activate.d
if errorlevel 1 exit 1
echo SET "DENO_INSTALL_ROOT=%LIBRARY_PREFIX:/=\%" > "%PREFIX:/=\%\etc\conda\activate.d\deno.bat"

mkdir %PREFIX:/=\%\etc\conda\deactivate.d
if errorlevel 1 exit 1
echo SET "DENO_INSTALL_ROOT=" > "%PREFIX:/=\%\etc\conda\deactivate.d\deno.bat"
