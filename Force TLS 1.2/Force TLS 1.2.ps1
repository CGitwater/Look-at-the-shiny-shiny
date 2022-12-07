<####################################################################################
Force TLS 1.2 and tighten up the .NET Framework
####################################################################################>

$ProtocolList = @("SSL 2.0","SSL 3.0","TLS 1.0", "TLS 1.1", "TLS 1.2")
$ProtocolSubKeyList = @("Client", "Server")
$DisabledByDefault = "DisabledByDefault"
$Enabled = "Enabled"
$registryPath = "HKLM:\\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\"
$NetRegistryPath = "HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319"
$NetRegistryPath2 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v4.0.30319"
 
New-ItemProperty -Path $NetRegistryPath -Name "SchUseStrongCrypto" -Value "1" -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $NetRegistryPath2 -Name "SchUseStrongCrypto" -Value "1" -PropertyType DWORD -Force | Out-Null
 
foreach($Protocol in $ProtocolList)
{
foreach($key in $ProtocolSubKeyList)
{
$currentRegPath = $registryPath + $Protocol + "\" + $key
Write-Host "Registry Path: $currentRegPath"
 if(!(Test-Path $currentRegPath))
{
Write-Host "creating the registry"
New-Item -Path $currentRegPath -Force | out-Null
 
}
if($Protocol -eq "TLS 1.2")
{
New-ItemProperty -Path $currentRegPath -Name $DisabledByDefault -Value "0" -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $currentRegPath -Name $Enabled -Value "1" -PropertyType DWORD -Force | Out-Null
}
else
{
New-ItemProperty -Path $currentRegPath -Name $DisabledByDefault -Value "0" -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $currentRegPath -Name $Enabled -Value "1" -PropertyType DWORD -Force | Out-Null
}
}
}
