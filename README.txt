
#########################################################
##### Screen Recorder with powershell and ffmpeg ########
#########################################################


Requirement:

Download FFMPEG from this direct link to the tested version: 

https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-20191004-e6625ca-win64-static.zip
 
Unzip the contents of the zip file to C:\Recorder generating the following path:

"C:\Recorder\ffmpeg-20191004-e6625ca-win64-static"



Deploy/install:

1 - Create the directory C:\Recorder

2- Unzip the contents of the file Recorder.zip to the root of the "C:\Recorder" directory whilst keeping the file and folder  hierarchy.



Run:

1- For simple desktop screen recording run the GUI script file "SR.ps1" in the C:\Recorder\ directory.

2- For destop + mic recording run the GUI script file "SMR.ps1" in the C:\Recorder\ directory.

PS: Add an exception/rule to your AV/Firewall to the "ffmpeg.exe" file inside the "C:\Recorder\ffmpeg-20191004-e6625ca-win64-static\bin" directory to avoid ffmpeg deletion!! 

