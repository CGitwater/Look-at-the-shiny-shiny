#Uninstall Built in teams chat 

Get-AppxPackage MicrosoftTeams*|Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -online | where-object {$_.PackageName -like "*MicrosoftTeams*"} | Remove-AppxProvisionedPackage -online –Verbose
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications /v ConfigureChatAutoInstall /t REG_DWORD /d 0 /f