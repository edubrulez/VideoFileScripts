@echo off

:: Define the path to the folder containing your JPEG files
SET "sourceFolder=E:\Construction Pictures\2023-06-13_0700"

:: Define the output file name and path
SET "outputFile=E:\Construction Pictures\2023-06-13_0700\2023-06-13_0700.mp4"

:: Generate a text file with a list of input images
::dir /b /on "%sourceFolder%\*.jpg" > "%temp%\imageList.txt"

:: Create a text file to list the input files for FFmpeg
SET "concatList=%temp%\concatList.txt"
type nul > !concatList!

:: Loop through the MP4 files and write them to the text file
for %%F in ("%sourceFolder%\*.jpg") do (
    echo file '%%~F'>>!concatList!
)
:: Use FFmpeg to convert images to MP4
ffmpeg -f concat -safe 0 -i "!concatList!" -vf "fps=30" "%outputFile%"

:: Clean up temporary files
del "!concatList!"
::ffmpeg -r 30 -f image2 -s 1920x1080 -nostats -i "%sourceFolder%\*.jpg" -vcodec libx264 -crf 25  -pix_fmt yuv420p "%outputFile%"
