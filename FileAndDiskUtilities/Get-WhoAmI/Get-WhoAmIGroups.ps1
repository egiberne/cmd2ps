# whoami /groups

Get-ADUser -Identity $env:USERNAME -Properties MemberOf | foreach {$_.split(",")[0].replace('CN=','')}