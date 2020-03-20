# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)




# Create a new form
$MyForm                    = New-Object system.Windows.Forms.Form

# Define the size, title and background color
$MyForm.ClientSize         = '500,300'
$MyForm.text               = "Screen Recorder GUI"
$MyForm.BackColor          = "#ffffff"

# Create a Title for our form. We will use a label for it.
$Titel                           = New-Object system.Windows.Forms.Label

# The content of the label
$Titel.text                      = "Start Recording!"

# Make sure the label is sized the height and length of the content
$Titel.AutoSize                  = $true

# Define the minial width and height (not nessary with autosize true)
$Titel.width                     = 25
$Titel.height                    = 10

# Position the element
$Titel.location                  = New-Object System.Drawing.Point(20,20)

# Define the font type and size
$Titel.Font                      = 'Microsoft Sans Serif,13'

# Other elemtents
$Description                     = New-Object system.Windows.Forms.Label
$Description.text                = "Click the button ""Start Rec""!"
$Description.AutoSize            = $false
$Description.width               = 450
$Description.height              = 50
$Description.location            = New-Object System.Drawing.Point(20,50)
$Description.Font                = 'Microsoft Sans Serif,10'

$PrinterStatus                   = New-Object system.Windows.Forms.Label
$PrinterStatus.text              = "Status:"
$PrinterStatus.AutoSize          = $true
$PrinterStatus.location          = New-Object System.Drawing.Point(20,115)
$PrinterStatus.Font              = 'Microsoft Sans Serif,10,style=Bold'

$PrinterFound                    = New-Object system.Windows.Forms.Label
$PrinterFound.text               = "Recording..."
$PrinterFound.AutoSize           = $true
$PrinterFound.visible			 = $false
$PrinterFound.location           = New-Object System.Drawing.Point(75,115)
$PrinterFound.Font               = 'Microsoft Sans Serif,10'

$PrinterFound1                    = New-Object system.Windows.Forms.Label
$PrinterFound1.text               = "Stopped Recording!"
$PrinterFound1.AutoSize           = $true
$PrinterFound1.visible			 = $false
$PrinterFound1.location           = New-Object System.Drawing.Point(75,115)
$PrinterFound1.Font               = 'Microsoft Sans Serif,10'

$AddPrinterBtn                   = New-Object system.Windows.Forms.Button
$AddPrinterBtn.BackColor         = "#ffffff"
$AddPrinterBtn.text              = "Start Rec"
$AddPrinterBtn.width             = 90
$AddPrinterBtn.height            = 30
$AddPrinterBtn.location          = New-Object System.Drawing.Point(260,250)
$AddPrinterBtn.Font              = 'Microsoft Sans Serif,10'
$AddPrinterBtn.ForeColor         = "#000"
$AddPrinterBtn.AddPrinterBtn	 = $AddPrinterBtn
$AddPrinterBtn.Add_Click({
Start-Process -FilePath C:\Recorder\screen_recorder.ps1 -WindowStyle Minimize
$PrinterFound.visible			 = $true

})


$AddPrinterBtn1                   = New-Object system.Windows.Forms.Button
$AddPrinterBtn1.BackColor         = "#ffffff"
$AddPrinterBtn1.text              = "Stop Rec"
$AddPrinterBtn1.width             = 90
$AddPrinterBtn1.height            = 30
$AddPrinterBtn1.location          = New-Object System.Drawing.Point(370,250)
$AddPrinterBtn1.Font              = 'Microsoft Sans Serif,10'
$AddPrinterBtn1.ForeColor         = "#000"
$AddPrinterBtn1.AddPrinterBtn	 = $AddPrinterBtn1
$AddPrinterBtn1.Add_Click({
C:\Recorder\killposh1.ps1
$PrinterFound.visible			 = $false
$PrinterFound1.visible			 = $true

})


#$Kill = Stop-Process -Name "powershell"

$cancelBtn                       = New-Object system.Windows.Forms.Button
$cancelBtn.BackColor             = "#ffffff"
$cancelBtn.text                  = "Exit"
$cancelBtn.width                 = 90
$cancelBtn.height                = 30
$cancelBtn.location              = New-Object System.Drawing.Point(150,250)
$cancelBtn.Font                  = 'Microsoft Sans Serif,10'
$cancelBtn.ForeColor             = "#000"
$cancelBtn.DialogResult          = [System.Windows.Forms.DialogResult]::Cancel
$LocalPrinterForm.CancelButton   = $cancelBtn
$LocalPrinterForm.Controls.Add($cancelBtn)
#$LocalPrinterForm.Add_Click({C:\Recorder\kill.ps1})
#$Kill = Stop-Process -Name "powershell",

# ADD OTHER ELEMENTS ABOVE THIS LINE

# Add the elements to the form
$MyForm.controls.AddRange(@($Titel,$Description,$PrinterStatus,$PrinterFound,$PrinterFound1,$AddPrinterBtn,$AddPrinterBtn1,$cancelBtn))




# THIS SHOULD BE AT THE END OF YOUR SCRIPT FOR NOW
# Display the form
[void]$MyForm.ShowDialog()