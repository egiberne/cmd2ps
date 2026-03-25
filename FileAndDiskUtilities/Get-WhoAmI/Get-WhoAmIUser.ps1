# whoami /user
write "USER INFORMATION"
[PSCustomObject]@{UserName="$env:USERDOMAIN\$env:USERNAME";  SID=(Get-LocalUser -Name $env:USERNAME).SID}
