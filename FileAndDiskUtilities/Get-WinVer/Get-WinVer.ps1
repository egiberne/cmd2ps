# Find the version in the registry key

Get-ItemProperty 'C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE' | Select -ExpandProperty VersionInfo | Select -Property ProductName, ProductVersion | Format-List