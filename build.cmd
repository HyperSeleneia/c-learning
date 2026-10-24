@echo off
rem Usage: build.cmd <file-without-.c>   e.g.  build.cmd lesson01\hello
setlocal
if "%~1"=="" (
    echo Usage: build.cmd lesson01\hello
    exit /b 1
)
call "E:\VS2026\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
cl /nologo /W4 /TC "%~1.c" /Fe:"%~1.exe" /Fo:"%~1.obj"
if errorlevel 1 (
    echo.
    echo [FAILED] Read the FIRST error line. Later errors are usually caused by it.
    exit /b 1
)
echo.
echo [OK] Running:
"%~dp0%~1.exe"
