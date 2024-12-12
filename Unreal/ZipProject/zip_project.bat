@echo off

:: Name of the output ZIP file
set ZIP_NAME=project.zip

:: Path to the .gitignore file
set GITIGNORE_PATH=.gitignore

:: Base directory of the project
set BASE_PATH=.

:: Path to the compression tool (7-Zip is used here as an example)
set ZIP_TOOL_PATH="C:\Program Files\7-Zip\7z.exe"

:: Check if the .gitignore file exists
if not exist "%GITIGNORE_PATH%" (
    echo ERROR: .gitignore not found.
    exit /b 1
)

:: Create a temporary file to store excluded paths
set TEMP_EXCLUDE_FILE=%TEMP%\exclude.txt
echo > "%TEMP_EXCLUDE_FILE%"

:: Read each line from the .gitignore file and add it to the temporary file
for /f "tokens=* delims=" %%A in (%GITIGNORE_PATH%) do (
    echo %%A>>"%TEMP_EXCLUDE_FILE%"
)

:: Compress the files while respecting the .gitignore exclusions
:: 7-Zip will be used to create the ZIP file
%ZIP_TOOL_PATH% a -tzip "%ZIP_NAME%" "%BASE_PATH%" -xr@%TEMP_EXCLUDE_FILE%

:: Clean up the temporary file
del "%TEMP_EXCLUDE_FILE%"

echo ZIP file created: %ZIP_NAME%
