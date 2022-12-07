Log on to 365 admin 
Select Compliance
click on Content Search
Click New search
Name the search ( make it something easy as you will need this for PowerShell command)
In locations select Exchange Mailboxes ( you can select users if you wanted to purge from a single user or group)
In conditions, add a condition and select subject, 
Enter the subject of the email you are trying to purge from mailboxes 
Run the search (this may take a few minutes to run)
Once completed click on the search and check the results
Open PowerShell with 365 module installed 
Run: Connect-IPPSSession to connect to the compliance centre
Then run : Get-Compliancesearchaction | where name -like "*content seach name*" to select the content search you created earlier
Run New-ComplianceSearchAction -SearchName "content seach name" -Purge -PurgeType SoftDelete to initiate the purge from the mailboxes
You can run: Get-Compliancesearchaction | where action -eq "purge" after to see status 
When the purge has finished Re-run the search to check the purge has completed 