
$hwnd = @(Get-Process Screen)[0].MainWindowHandle
# Restore window
[Win32.NativeMethods]::ShowWindowAsync($hwnd, 4)


$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Recorders')
Sleep 2
$wshell.SendKeys('q')