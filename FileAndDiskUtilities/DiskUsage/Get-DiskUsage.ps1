<#
    .SYNOPSIS
    View disk usage by directory
   
    .DESCRIPTION
    Reports the disk space usage for the directory you specify. 
    By default it recurses directories to show the total size of a directory and its subdirectories.

    .PARAMETER Path 
    The path of the directory.

    .INPUT
    None. You cannot pipe objects.

    .OUTPUTS
    None. Script does not generate outputs.

    .EXAMPLE

    PS> Get-DiskUsage -Path C:\temp

    .NOTES
    None.

    .LINK
    https://learn.microsoft.com/en-us/sysinternals/downloads/du

    .LINK
    Disk Usage
 
  #>

[CmdletBinding()]
param (
    
    [Parameter(Mandatory=$true)]
    [String]
    $Path
)

$Files = Get-ChildItem -Path $Path -File -Recurse -Force
Write-Host 'Files:          ' $Files.Count

$Directories = Get-ChildItem -Path $Path -Directory -Recurse -Force
$TotalDirectories = $Directories.Count + 1
Write-Host 'Directories:    ' $TotalDirectories

$TotalFilesSize = 0
foreach ($File in $Files) {

    $TotalFilesSize += $file.Length
}

Write-Host 'Size:           ' $TotalFilesSize 'bytes'

$FolderSize = 4096

$TotalFoldersSize = ($Directories.Count + 1) * $FolderSize

$TotalSize = $TotalFilesSize + $TotalFoldersSize
Write-Host 'Total on disk:  '$TotalSize 'bytes'