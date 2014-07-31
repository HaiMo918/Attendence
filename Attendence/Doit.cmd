:: Created by npm, please don't edit manually.
@IF EXIST "%~dp0\node.exe" (
    "%~dp0\node.exe"  "%~dp0\handle_filedata.js" %*>>result.log
) ELSE (
    node  "%~dp0\handle_filedata.js" %*>result.log
)