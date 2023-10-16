@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Define the path to the folder containing your MP4 files
SET "sourceFolder=C:\workspace\"

:: Define the output file name and path
SET "outputFile=C:\workspace\output.mp4"

:: Create a text file to list the input files for FFmpeg
SET "concatList=%temp%\concatList.txt"
type nul > !concatList!

:: Loop through the MP4 files and write them to the text file
for %%F in ("%sourceFolder%\*.mp4") do (
    echo file '%%~F'>>!concatList!
)

:: Use FFmpeg to concatenate the files
ffmpeg -f concat -safe 0 -i "!concatList!" -c copy "%outputFile%"

:: Clean up temporary files
del "!concatList!"

ENDLOCAL
