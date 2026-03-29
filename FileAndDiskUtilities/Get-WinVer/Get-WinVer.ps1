# Find the version in the registry key
Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' | select -Property DisplayVersion, LCUVer, CurrentBuild | Format-list

# Find the version in the system info
Get-ComputerInfo  -Property Osname,OsVersion, OsArchitecture | Format-list

