

#Write-Host "Screen and MIC Recorder"
#Write-Host "File Output directory C:\Recorder\"
#Write-Host "File Name with timestamp screen_rec_yyyy-MM-ddTHH-mm.mp4"
$host.UI.RawUI.WindowTitle = "Screen"
cd "C:\Recorder\ffmpeg-20191004-e6625ca-win64-static\bin"

#$confirmation = Read-Host "Start Screen and MIC Recording?: y/n"
#if ($confirmation -eq 'y') {
$Micsssss = Get-PnpDevice | Sort-Object -Property Name | Where FriendlyName -like '*Microph*' | select -expand Name

$date = Get-Date -Format "dddd dd/MM/yyyy HH:mm:ss"
Write-Output "`n" $date "`n`n`n 1 new Screen and Mic Recording File generated - check file timestamp!" | Out-File -FilePath C:\Recorder\RecordingLogs.txt -Append

.\ffmpeg -f gdigrab -framerate 30 -i desktop -f dshow -i audio=$Micsssss C:\Recorder\screen_rec_$(get-date -f yyyy-MM-ddTHH-mm).mp4

#}


#Get-PnpDevice -Class "AudioEndpoint" -Status OK

# Get-PnpDevice | Sort-Object -Property Name | Where-Object{( FriendlyName -like '*Mic*' ) }| ft Name, InstanceId -AutoSize
 
# $Micsssss = Get-PnpDevice | Sort-Object -Property Name | Where FriendlyName -like '*Microph*' | ft Name -AutoSize
