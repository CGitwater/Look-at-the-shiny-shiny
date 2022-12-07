Set-Location "C:\Program Files (x86)\SonicWall\SSL-VPN\NetExtender"
$VPNServer = "<enter IP address"
$VPNDomainName = "<enter domain name>"
##$VPNPassword = <insert password> #if you want to provision the password
## uncomment the next line if you want the VPN username equal to the computer name
#$account = $env:computername
## uncomment the next line if you want the VPN username equal to the UPN of the logged user
#$account = whoami /upn

.\NECLI.exe addprofile -s $VPNServer -d $VPNDomainName
#.\NECLI.exe addprofile -s $VPNServer -u $account -p $VPNPassword -d $VPNDomainName

# Kills NetExtender service, so the profile can populate when end-user starts application
Stop-Process -Name "NEGui" -Force

# Removes new NetExtender folder path.
Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\Create_Profile.bat" -Recurse -Force -Confirm:$false
Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\runinstall.bat" -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue
Remove-Item -Path "C:\MDM\SonicWallNetExtender" -Recurse -Force -Confirm:$false



