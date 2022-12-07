Connect-IPPSSession
Get-Compliancesearchaction | where name -like "*content seach name*"
New-ComplianceSearchAction -SearchName "content seach name" -Purge -PurgeType SoftDelete
Get-Compliancesearchaction | where action -eq "purge"