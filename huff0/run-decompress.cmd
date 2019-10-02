SET CORPUS=decompress
del /Q fuzz-build.zip
del /Q %CORPUS%\crashers\*.*
del /Q %CORPUS%\suppressions\*.*
SET /a PROCS=%NUMBER_OF_PROCESSORS%/2

go-fuzz-build -o=fuzz-build.zip -func=FuzzDecompress .
go-fuzz -bin=fuzz-build.zip -workdir=%CORPUS% -procs=%PROCS%
