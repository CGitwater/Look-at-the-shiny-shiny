#Disable Remove Search, Task View, Widgets or Chat icons

$Path= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$Path_2= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
$key_Search= "SearchboxTaskbarMode"
$key_widgets= "TaskbarDa"
$key_taskview= "ShowTaskViewButton"
$Key_chat= "TaskbarMn"
$KeyFormat= "DWord"
$Value= "0"


if(!(Test-Path $Path)){New-Item -Path $Path -Force}
Set-ItemProperty -Path $Path -Name $Key_Widgets -Value $Value -Type $KeyFormat
Set-ItemProperty -Path $Path_2 -Name $key_Search -Value $Value -Type $KeyFormat
Set-ItemProperty -Path $Path -Name $key_taskview -Value $Value -Type $KeyFormat
Set-ItemProperty -Path $Path -Name $Key_chat -Value $Value -Type $KeyFormat