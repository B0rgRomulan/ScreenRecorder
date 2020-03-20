#
#Write-Host "Screen Recorder"
#Write-Host "File Output directory C:\Recorder\"
#Write-Host "File Name with timestamp screen_rec_yyyy-MM-ddTHH-mm.mp4"
$host.UI.RawUI.WindowTitle = "Recorders"
cd "C:\Recorder\ffmpeg-20191004-e6625ca-win64-static\bin"

$date = Get-Date -Format "dddd dd/MM/yyyy HH:mm:ss"
Write-Output "`n" $date "`n`n`n 1 new Screen Recording File generated - check file timestamp!" | Out-File -FilePath C:\Recorder\RecordingLogs.txt -Append

.\ffmpeg -f gdigrab -framerate 30 -i desktop C:\Recorder\screen_rec_$(get-date -f yyyy-MM-ddTHH-mm).mp4 


