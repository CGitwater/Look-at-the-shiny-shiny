$apps = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name like '%<add Name of software>%'"
 
foreach ($app in $apps) {
 $app.Uninstall()
}