Change Edit Profile.ps1 before applying to intune package

Add network and domain details to

$VPNServer = "<enter IP address"
$VPNDomainName = "<enter domain name>"

Intune Commands and detection rules. 

Install Commmand: powershell -ex bypass -file swinstall.ps1
Uninstall Command: powershell -ex bypass -file swuninstall.ps1

Detection rules:

Path: C:\Program Files (x86)\SonicWall\SSL-VPN\NetExtender\
File or folder: NEGui.exe